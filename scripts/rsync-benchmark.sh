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

rsync_cmd() {
  srcdir="$1"
  dstdir="$2"
  native="$3"
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
    if [[ "$DEBUG_CMD" = [yY] ]]; then
      echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
    fi
    /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} native compressed] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
    numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
    speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
    totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
    sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
    bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
    mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
    transfertime=$(awk '{print $6}' ${LOGDIR}/time.txt | sed -e 's|s||g')
    transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
    echo "[rsync ${RSYNC_VER} native compressed] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native compressed] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native compressed] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo
    cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"

    # no-compress
    RSYNCLOGFILENAME="rsyncbench-rsync-native-no-compress-${DT}.log"
    RSYNC_OPTS=$(echo $RSYNC_OPTS | sed -e 's|z||g')
    if [[ "$DEBUG_CMD" = [yY] ]]; then
      echo "$BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file=${LOGDIR}/${RSYNCLOGFILENAME} $srcdir $dstdir"
    fi
    /usr/bin/time -o "${LOGDIR}/time.txt" --format="[rsync ${RSYNC_VER} native no-compress] real: %es user: %Us sys: %Ss cpu: %P maxmem: %M KB cswaits: %w" $BIN ${RSYNC_OPTS}${EXTRAOPTS}${RSYNC_DEBUG} --log-file="${LOGDIR}/${RSYNCLOGFILENAME}" "$srcdir" "$dstdir" > "${LOGDIR}/rsyncbench.log"
    numfiles=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/Number of files:/ {print $0}' | cut -d " " -f6- | sed -e 's|(||g' -e 's|)||g')
    speedup=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $10}')
    totalbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/total size is / {print $7}' | sed -e 's|,||g')
    sentbytes=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $5}' | sed -e 's|,||g')
    bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
    mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
    transfertime=$(awk '{print $6}' ${LOGDIR}/time.txt | sed -e 's|s||g')
    transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
    echo "[rsync ${RSYNC_VER} native no-compress] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native no-compress] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo "[rsync ${RSYNC_VER} native no-compress] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
    echo
    cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"
  else
    for comp in ${COMPLIST[@]}; do
      for hash in ${HASHLIST[@]}; do
        EXTRAOPTS=" --cc $hash --zc ${comp}"
        RSYNCLOGFILENAME="rsyncbench-${hash}-${comp}-${DT}.log"
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
        bytesrate=$(cat ${LOGDIR}/${RSYNCLOGFILENAME} | awk '/sent / {print $10}' | sed -e 's|,||g')
        mbrate=$(echo "scale=4; $bytesrate/1024/1024" | bc)
        transfertime=$(awk '{print $5}' ${LOGDIR}/time.txt | sed -e 's|s||g')
        transferspeed=$(echo "scale=4; ($sentbytes/$transfertime)/1024/1024" | bc)
        echo "[rsync ${RSYNC_VER} $hash-$comp] $numfiles" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        echo "[rsync ${RSYNC_VER} $hash-$comp] total bytes: $totalbytes sent bytes: $sentbytes (${bytesrate} per second)" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        echo "[rsync ${RSYNC_VER} $hash-$comp] transfer speed (MB/s): $transferspeed speedup: $speedup" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        cat "${LOGDIR}/time.txt" | tee -a "${LOGDIR}/${RSYNCLOGFILENAME}"
        echo
        cleanup "$dstdir" "${LOGDIR}/${RSYNCLOGFILENAME}"
      done
    done
  fi
}

help() {
  echo "Usage:"
  echo
  echo "$0 bench sourcedir/ destdir/"
  echo "$0 bench-native sourcedir/ destdir/"
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
  * )
    help
    ;;
esac