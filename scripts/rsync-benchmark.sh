#!/bin/bash
########################################
# benchmark rsync 3.2.3 vs 3.1.2 system
########################################
HASHLIST=(xxh128 xxh3 xxh64 xxhash md5)
COMPLIST=(lz4 zstd zlib none)
SLEEP=3
RSYNCBINLIST=(/usr/local/bin/rsync /usr/bin/rsync)
RSYNC_NEWBIN='/usr/local/bin/rsync'
RSYNC_BIN='/usr/bin/rsync'
RSYNC_OPTS='-avzi --stats'
RSYNC_VERBOSE='y'
DEBUG='n'
DEBUG_CMD='y'
SHORTTEST='y'

COMPLEVEL='9'
ZSTD_COMPLEVEL='22'
ZSTD_FASTCOMPLEVEL='10'
ZSTD_ULTRACOMPLEVEL='22'
LZFOURCOMPLEVEL='9'
XZCOMPLEVEL='9'

LOGDIR='/home/rsync-benchmarks'
DT=$(date +"%d%m%y-%H%M%S")
########################################
if [ ! -d "$LOGDIR" ]; then
  mkdir -p "$LOGDIR"
fi

if [[ "$SHORTTEST" = [yY] ]]; then
  HASHLIST=(xxh128)
  COMPLIST=(zstd)
fi

if [[ "$RSYNC_VERBOSE" = [yY] ]]; then
  RSYNC_DEBUG=' --debug=NSTR'
else
  RSYNC_DEBUG=
fi

cleanup_log() {
  if [[ "$DEBUG" = [yY] ]]; then
    echo "rm -f ${LOGDIR}/rsyncbench.log"
    echo "rm -f ${LOGDIR}/time.txt"
    # echo "rm -f $1"
  fi
    rm -f "${LOGDIR}/rsyncbench.log"
    rm -f "${LOGDIR}/time.txt"
    # rm -f "$1"
}

cleanup() {
  cleanup_dstdir=${1:-/home/rsync-test-dst/}
  if [[ "$DEBUG" = [yY] ]]; then
    echo "rm -f ${cleanup_dstdir}*"
    echo "sync && echo 3 > /proc/sys/vm/drop_caches"
    echo "sleep $SLEEP"
  fi
  rm -f ${cleanup_dstdir}*
  sync && echo 3 > /proc/sys/vm/drop_caches
  sleep "$SLEEP"
  cleanup_log "$2"
}

rsync_leveltest() {
  checksum="$1"
  comp_type="$2"
  comp_level="$3"
  srcdir="$4"
  dstdir="$5"
  native="$6"
  if [[ "$srcdir" = 'native' ]]; then
    comp_level="$1"
    srcdir="$2"
    dstdir="$3"
    native="$4"
    BIN="$RSYNC_BIN"
    RSYNC_DEBUG=
    RSYNC_VER=$($BIN --version 2>&1 | awk 'NR==1 {print $3}')
  else
    BIN="$RSYNC_NEWBIN"
    RSYNC_VER=$($BIN --version 2>&1 | awk 'NR==1 {print $3}')
  fi
  if [[ "$comp_type" = 'zstd' ]]; then
    comp_start=-100
  else
    comp_start=1
  fi
  DT_CSV=$(date +"%d%m%y-%H%M%S")
  for i in $(seq $comp_start $comp_level) ; do
    DT=$(date +"%d%m%y-%H%M%S")
    if [[ "$native" = 'native' ]]; then
      EXTRAOPTS=" --compress-level=${i}"
      RSYNCLOGFILENAME="rsyncbench-rsync-native-compressed-lvl${i}-${DT}.log"
      RSYNCLOGFILENAME_CSV="rsyncbench-rsync-native-compressed-lvls-${DT_CSV}.csv"
      if [ ! -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
        touch "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
        echo "version,comp-type,comp-lvl,speed,time,bytes-sent,megabytes-sent" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
      fi
      if [[ "$DEBUG_CMD" = [yY] ]]; then
        echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
      fi
      /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} native compress lvl ${i}] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
      numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
      speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
      totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
      sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
      sentmegabytes=$(echo "scale=4; $sentbytes/1024/1024" |bc)
      bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
      mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
      transfertime=$(awk '{print $8}' ${LOGDIR}/time.txt | sed -e 's|s||g')
      transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
      echo "[rsync ${RSYNC_VER} native compress lvl ${i}] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      echo "[rsync ${RSYNC_VER} native compress lvl ${i}] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      echo "[rsync ${RSYNC_VER} native compress lvl ${i}] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      echo "rsync-${RSYNC_VER},zlib,${i},${transferspeed},${transfertime},${sentbytes},$sentmegabytes" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
      echo
      cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"
    else
      EXTRAOPTS=" --cc $checksum --zc ${comp_type} --zl ${i}"
      RSYNCLOGFILENAME="rsyncbench-${checksum}-${comp_type}-lvl${i}-${DT}.log"
      RSYNCLOGFILENAME_CSV="rsyncbench-${checksum}-${comp_type}-lvls-${DT_CSV}.csv"
      if [ ! -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
        touch "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
        echo "version,comp-type,comp-lvl,speed,time,bytes-sent,megabytes-sent" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
      fi
      if [[ "$DEBUG_CMD" = [yY] ]]; then
        echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
      fi
      /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} $checksum-$comp_type-${i}] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
      # totalbytes=$(cat ${LOGDIR}/rsyncbench.log | awk '/total size is / {print $4}' | sed -e 's|,||g')
      # sentbytes=$(cat ${LOGDIR}/rsyncbench.log | awk '/sent / {print $2}' | sed -e 's|,||g')
      # bytesrate=$(cat ${LOGDIR}/rsyncbench.log | awk '/sent / {print $7}' | sed -e 's|,||g')
      numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
      speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
      totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
      sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
      sentmegabytes=$(echo "scale=4; $sentbytes/1024/1024" |bc)
      bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
      mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
      transfertime=$(awk '{print $5}' ${LOGDIR}/time.txt | sed -e 's|s||g')
      transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
      echo "[rsync ${RSYNC_VER} $checksum-$comp_type-${i}] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      echo "[rsync ${RSYNC_VER} $checksum-$comp_type-${i}] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      echo "[rsync ${RSYNC_VER} $checksum-$comp_type-${i}] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
      echo "rsync-${RSYNC_VER},${comp_type},${i},${transferspeed},${transfertime},${sentbytes},$sentmegabytes" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
      echo
      cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"
    fi
  done
  if [ -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
    echo "csv log: ${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
  fi
}

rsync_cmd() {
  srcdir="$1"
  dstdir="$2"
  native="$3"
  DT_CSV=$(date +"%d%m%y-%H%M%S")
  if [[ "$native" = 'native' ]]; then
    BIN="$RSYNC_BIN"
    RSYNC_DEBUG=
    RSYNC_VER=$($BIN --version 2>&1 | awk 'NR==1 {print $3}')
  else
    BIN="$RSYNC_NEWBIN"
    RSYNC_VER=$($BIN --version 2>&1 | awk 'NR==1 {print $3}')
  fi
  if [[ "$native" = 'native' ]]; then
    EXTRAOPTS=
    RSYNCLOGFILENAME="rsyncbench-rsync-native-compressed-${DT}.log"
    RSYNCLOGFILENAME_CSV="rsyncbench-rsync-native-${DT_CSV}.csv"
    if [ ! -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
      touch "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
      echo "version,speed,time,bytes-sent,megabytes-sent" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
    fi
    if [[ "$DEBUG_CMD" = [yY] ]]; then
      echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
    fi
    /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} native compressed] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
    numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
    speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
    totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
    sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
    sentmegabytes=$(echo "scale=4; $sentbytes/1024/1024" |bc)
    bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
    mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
    transfertime=$(awk '{print $6}' ${LOGDIR}/time.txt | sed -e 's|s||g')
    transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
    echo "[rsync ${RSYNC_VER} native compressed] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native compressed] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native compressed] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "rsync-${RSYNC_VER}-compress,${transferspeed},${transfertime},${sentbytes},$sentmegabytes" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
    echo
    cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"

    # no-compress
    RSYNCLOGFILENAME="rsyncbench-rsync-native-no-compress-${DT}.log"
    # RSYNCLOGFILENAME_CSV="rsyncbench-rsync-native-no-compress-${DT_CSV}.csv"
    RSYNC_OPTS=$(echo $RSYNC_OPTS | sed -e 's|z||g')
    # if [ ! -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
    #   touch "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
    #   echo "version,speed,time,bytes-sent,megabytes-sent" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
    # fi
    if [[ "$DEBUG_CMD" = [yY] ]]; then
      echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
    fi
    /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} native no-compress] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
    numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
    speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
    totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
    sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
    sentmegabytes=$(echo "scale=4; $sentbytes/1024/1024" |bc)
    bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
    mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
    transfertime=$(awk '{print $6}' ${LOGDIR}/time.txt | sed -e 's|s||g')
    transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
    echo "[rsync ${RSYNC_VER} native no-compress] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native no-compress] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native no-compress] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "rsync-${RSYNC_VER}-no-compress,${transferspeed},${transfertime},${sentbytes},$sentmegabytes" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
    echo
    cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"
  else
    DT_CSV=$(date +"%d%m%y-%H%M%S")
    for comp in ${COMPLIST[@]}; do
      for hash in ${HASHLIST[@]}; do
        DT=$(date +"%d%m%y-%H%M%S")
        EXTRAOPTS=" --cc $hash --zc ${comp}"
        RSYNCLOGFILENAME="rsyncbench-${hash}-${comp}-${DT}.log"
        RSYNCLOGFILENAME_CSV="rsyncbench-checksum-comp-list-${DT_CSV}.csv"
        if [ ! -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
          touch "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
          echo "version,speed,time,bytes-sent,megabytes-sent" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
        fi
        if [[ "$DEBUG_CMD" = [yY] ]]; then
          echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
        fi
        /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} $hash-$comp] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
        # totalbytes=$(cat ${LOGDIR}/rsyncbench.log | awk '/total size is / {print $4}' | sed -e 's|,||g')
        # sentbytes=$(cat ${LOGDIR}/rsyncbench.log | awk '/sent / {print $2}' | sed -e 's|,||g')
        # bytesrate=$(cat ${LOGDIR}/rsyncbench.log | awk '/sent / {print $7}' | sed -e 's|,||g')
        numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
        speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
        totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
        sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
        sentmegabytes=$(echo "scale=4; $sentbytes/1024/1024" |bc)
        bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
        mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
        transfertime=$(awk '{print $5}' ${LOGDIR}/time.txt | sed -e 's|s||g')
        transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
        echo "[rsync ${RSYNC_VER} $hash-$comp] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        echo "[rsync ${RSYNC_VER} $hash-$comp] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        echo "[rsync ${RSYNC_VER} $hash-$comp] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        echo "rsync-${RSYNC_VER}-${hash}-${comp},${transferspeed},${transfertime},${sentbytes},$sentmegabytes" >> "${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
        echo
        cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"
      done
    done
  fi
  if [ -f "${LOGDIR}/${RSYNCLOGFILENAME_CSV}" ]; then
    echo "csv log: ${LOGDIR}/${RSYNCLOGFILENAME_CSV}"
  fi
}

help() {
  echo "Usage:"
  echo
  echo "$0 bench sourcedir/ destdir/"
  echo "$0 bench-native sourcedir/ destdir/"
  echo "$0 bench-lvl checksum comptype complevel sourcedir/ destdir/"
  echo "$0 bench-lvl-native complevel sourcedir/ destdir/"
}

trap cleanup_log SIGHUP SIGINT SIGTERM SIGTSTP

case "$1" in
  bench )
    if [[ -d "$2" && -d "$3" ]]; then
      rsync_cmd "$2" "$3"
    else
      help
    fi
    ;;
  bench-native )
    if [[ -d "$2" && -d "$3" ]]; then
      rsync_cmd "$2" "$3" native
    else
      help
    fi
    ;;
  bench-lvl )
    if [[ "$2" && "$3" && "$4" && -d "$5" && -d "$6" ]]; then
      rsync_leveltest "$2" "$3" "$4" "$5" "$6"
    else
      help
    fi
    ;;
  bench-lvl-native )
    if [[ "$2" && -d "$3" && -d "$4" ]]; then
      rsync_leveltest "$2" "$3" "$4" native
    else
      help
    fi
    ;;
  * )
    help
    ;;
esac