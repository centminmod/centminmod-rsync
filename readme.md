# custom rsync RPM for Centmin Mod LEMP stacks

Custom rsync RPMs for CentOS 7 64bit based Centmin Mod LEMP stacks

* rsync 3.2.3 no avx2 and avx2 yum packages with [xxHash](http://cyan4973.github.io/xxHash/#benchmarks) & [zstd](https://github.com/facebook/zstd) support
* rsync 3.1.3
* rsync 3.1.4 [dev build log](https://git.samba.org/?p=rsync.git;a=shortlog)

# Install & Dependencies

```
yum -y install acl libacl-devel attr libattr-devel xxhash-devel libzstd-devel lz4-devel
```

non-avx2 install

```
yum localinstall rsync-custom-noavx2-3.2.3-1.el7.x86_64.rpm
```

avx2 install

```
yum localinstall rsync-custom-avx2-3.2.3-1.el7.x86_64.rpm
```

# CentOS 7 stock distro rsync version

```
rsync --version
rsync  version 3.1.2  protocol version 31
Copyright (C) 1996-2015 by Andrew Tridgell, Wayne Davison, and others.
Web site: http://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, symlinks, IPv6, batchfiles, inplace,
    append, ACLs, xattrs, iconv, symtimes, prealloc

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.
```
```
rpm -qa --changelog rsync | head -n20
* Wed Mar 27 2019 Michal Ruprich <mruprich@redhat.com> - 3.1.2-6.1
- Resolves: #1693108 - remove-source-files fails with symlinks

* Mon Aug 20 2018 Michal Ruprich <mruprich@redhat.com> - 3.1.2-6
- Related: #1615799 - reverting changes made in RHEL-7.6

* Mon Aug 20 2018 Michal Ruprich <mruprich@redhat.com> - 3.1.2-5
- Resolves: #1615799 - Rsync built-in testsuite fails with selinux enabled

* Wed Oct 18 2017 Michal Ruprich - 3.1.2-4
- Related: #1432899 - removing dependencies on perl
- using the bundled zlib.h(#1491582)
- turning on upstream tests

* Wed Aug 30 2017 Michal Ruprich - 3.1.2-1
- Resolves: #1432899 - Rebase rsync to version >= 3.1.0
- rebase to 3.1.2

* Tue Jan 24 2017 Michal Ruprich - 3.0.9-18
- Resolves: #1324754 -  rsyncd unit enters failed state on exit
```

# Custom rsync 3.2.3

### no avx2 support

```
rsync --version
rsync  version 3.2.3  protocol version 31
Copyright (C) 1996-2020 by Andrew Tridgell, Wayne Davison, and others.
Web site: https://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, hardlink-specials, symlinks, IPv6, atimes,
    batchfiles, inplace, append, ACLs, xattrs, optional protect-args, iconv,
    symtimes, prealloc, stop-at, no crtimes
Optimizations:
    SIMD, asm, openssl-crypto
Checksum list:
    xxh128 xxh3 xxh64 (xxhash) md5 md4 none
Compress list:
    zstd lz4 zlibx zlib none

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.
```
```
yum -q info rsync-custom-noavx2-3.2.3
Installed Packages
Name        : rsync-custom-noavx2
Arch        : x86_64
Version     : 3.2.3
Release     : 1.el7
Size        : 877 k
Repo        : installed
From repo   : /rsync-custom-noavx2-3.2.3-1.el7.x86_64
Summary     : rsync 3.2.3 (noavx2) for centminmod.com LEMP stack
URL         : https://centminmod.com
License     : unknown
Description : rsync 3.2.3 (noavx2) for centminmod.com LEMP stacks
```
```
rpm -qlp rsync-custom-noavx2-3.2.3-1.el7.x86_64.rpm      
/usr/local/bin/rsync
/usr/local/bin/rsync-ssl
/usr/local/share/man/man1/rsync-ssl.1
/usr/local/share/man/man1/rsync.1
/usr/local/share/man/man5/rsyncd.conf.5
```
```
rpm -qa --changelog rsync-custom-noavx2
* Wed Dec 02 2020 George Liu <centminmod.com> 3.2.3
- rsync 3.2.3 (noavx2) for centminmod.com LEMP stack
```

### avx2 support

```
rsync --version
rsync  version 3.2.3  protocol version 31
Copyright (C) 1996-2020 by Andrew Tridgell, Wayne Davison, and others.
Web site: https://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, hardlink-specials, symlinks, IPv6, atimes,
    batchfiles, inplace, append, ACLs, xattrs, optional protect-args, iconv,
    symtimes, prealloc, stop-at, no crtimes
Optimizations:
    SIMD, asm, openssl-crypto
Checksum list:
    xxh128 xxh3 xxh64 (xxhash) md5 md4 none
Compress list:
    zstd lz4 zlibx zlib none

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the G
```
```
yum -q info rsync-custom-avx2-3.2.3
Installed Packages
Name        : rsync-custom-avx2
Arch        : x86_64
Version     : 3.2.3
Release     : 1.el7
Size        : 893 k
Repo        : installed
From repo   : /rsync-custom-avx2-3.2.3-1.el7.x86_64
Summary     : rsync 3.2.3 (avx2) for centminmod.com LEMP stack
URL         : https://centminmod.com
License     : unknown
Description : rsync 3.2.3 (avx2) for centminmod.com LEMP stacks
```
```
rpm -qlp rsync-custom-avx2-3.2.3-1.el7.x86_64.rpm  
/usr/local/bin/rsync
/usr/local/bin/rsync-ssl
/usr/local/share/man/man1/rsync-ssl.1
/usr/local/share/man/man1/rsync.1
/usr/local/share/man/man5/rsyncd.conf.5
```
```
rpm -qa --changelog rsync-custom-avx2
* Wed Dec 02 2020 George Liu <centminmod.com> 3.2.3
- rsync 3.2.3 (avx2) for centminmod.com LEMP stack
```

# Custom rsync 3.1.3

```
/usr/local/bin/rsync --version
rsync  version 3.1.3  protocol version 31
Copyright (C) 1996-2018 by Andrew Tridgell, Wayne Davison, and others.
Web site: http://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, symlinks, IPv6, batchfiles, inplace,
    append, ACLs, xattrs, iconv, symtimes, prealloc

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.
```
```
yum -q info rsync-custom
Installed Packages
Name        : rsync-custom
Arch        : x86_64
Version     : 3.1.3
Release     : 1.el7
Size        : 794 k
Repo        : installed
From repo   : /rsync-3.1.3-1.el7.x86_64
Summary     : rsync 3.1.3 for centminmod.com LEMP stack
URL         : https://centminmod.com
License     : unknown
Description : rsync 3.1.3 for centminmod.com LEMP stacks
```

Custom rsync 3.1.4

```
/usr/local/bin/rsync --version
rsync  version 3.1.4dev  protocol version 31
Copyright (C) 1996-2019 by Andrew Tridgell, Wayne Davison, and others.
Web site: http://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, symlinks, IPv6, batchfiles, inplace,
    append, ACLs, xattrs, iconv, symtimes, prealloc

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.
```
```
yum -q info rsync-custom
Installed Packages
Name        : rsync-custom
Arch        : x86_64
Version     : 3.1.4
Release     : 1.el7
Size        : 799 k
Repo        : installed
From repo   : /rsync-custom-3.1.4-1.el7.x86_64
Summary     : rsync 3.1.4 for centminmod.com LEMP stack
URL         : https://centminmod.com
License     : unknown
Description : rsync 3.1.4 for centminmod.com LEMP stacks
```

Custom RPM files

```
rpm -ql rsync-custom
/usr/local/bin/rsync
/usr/local/share/man/man1/rsync.1
/usr/local/share/man/man5/rsyncd.conf.5
```

# Rsync Benchmarks Part 1

Benchmark comparison for rsync 3.1.2 native CentOS 7 binary versus rsync 3.2.3 built RPM binary on avx2 system with Intel Core i7 4790K Haswell cpu for 6x compressed log file rync on same system disk. Looks like rsync 3.2.3 no flags defaults to xxhash + zstd and is ~29.87% faster than rsync 3.1.2 without -z flag and ~94.03% faster than rsync 3.1.2 with -z flag - making rsync 3.2.3 a good candidate if you're rsync transferring a mix of compressed and uncompressed files together.

* default CentOS 7 rsync 3.1.2 with -z compress = 6.095s (sent 263,545,200 bytes)
* default CentOS 7 rsync 3.1.2 without -z compress = 0.519s (sent 263,459,568 bytes)
* rsync 3.2.3 no flags default with -z compress = 0.364s (sent 263,454,894 bytes)
* md5 + zstd with -z compress = 0.670s (sent 263,454,894 bytes)
* md5 + zlibx with -z compress = 1.184s (sent 263,505,130 bytes)
* md5 + zlib with -z compress = 1.184s (sent 263,505,130 bytes)
* md5 + lz4 with -z compress = 0.583s (sent 264,571,081 bytes)
* xxhash + zstd with -z compress = 0.365s (sent 263,454,846 bytes)
* xxhash + zlibx with -z compress = 0.890s (sent 263,505,082 bytes)
* xxhash + zlib with -z compress = 0.889s (sent 263,505,082 bytes)
* xxhash + lz4 with -z compress = 0.322s (sent 264,571,033 bytes)

```
time /usr/bin/rsync -avzi zcat-test/ zcat-test-dst/
time /usr/bin/rsync -avi zcat-test/ zcat-test-dst/
time /usr/local/bin/rsync -avzi zcat-test/ zcat-test-dst/
time rsync -avzi --cc md5 --zc zstd zcat-test/ zcat-test-dst/
time rsync -avzi --cc md5 --zc zlibx zcat-test/ zcat-test-dst/
time rsync -avzi --cc md5 --zc zlib zcat-test/ zcat-test-dst/
time rsync -avzi --cc md5 --zc lz4 zcat-test/ zcat-test-dst/
time rsync -avzi --cc xxhash --zc zstd zcat-test/ zcat-test-dst/
time rsync -avzi --cc xxhash --zc zlibx zcat-test/ zcat-test-dst/
time rsync -avzi --cc xxhash --zc zlib zcat-test/ zcat-test-dst/ 
time rsync -avzi --cc xxhash --zc lz4 zcat-test/ zcat-test-dst/
```
```
ls -lah zcat-test
total 252M
drwxr-xr-x   2 root root 4.0K Dec  2 09:36 .
drwxr-xr-x. 62 root root 4.0K Dec  2 10:43 ..
-rw-r--r--   1 root root  41M Apr 23  2019 access_log_20180428-234724.log.gz
-rw-r--r--   1 root root  44M Apr 23  2019 access_log_20180428-234724.log.zst
-rw-r--r--   1 root root  41M Apr 23  2019 access_log_20180429-005239.log.gz
-rw-r--r--   1 root root  44M Apr 23  2019 access_log_20180429-005239.log.zst
-rw-r--r--   1 root root  41M Apr 23  2019 access_log_20180429-012648.log.gz
-rw-r--r--   1 root root  44M Apr 23  2019 access_log_20180429-012648.log.zst
```

# Rsync Benchmarks Part 2

Rsync transfer `/home/rsync-test/` to `/home/rsync-test-dst` with 2,850 files totaling 746MB in size of which 6x files are already compressed log files from Part 1 benchmarks and other files are files copied over from Centmin Mod log directory at `/root/centminlogs`


```
ls -lah /home/rsync-test/ | wc -l
2850

du -sh /home/rsync-test/   
746M    /home/rsync-test/
```

rsync version|transfer speed (MB/s)|cpu %|memory (KB)
---|---|---|---|
rsync 3.1.2 compressed|21.1393|108|2320
rsync 3.1.2 no compress|243.7495|101|1992
rsync 3.2.3 xxh128 + lz4|153.0560|70|2832
rsync 3.2.3 xxh3 + lz4|143.4815|66|2828
rsync 3.2.3 xxh64 + lz4|135.0414|75|2820
rsync 3.2.3 xxhash + lz4|141.8196|65|2824
rsync 3.2.3 md5 + lz4|106.7833|105|2832
rsync 3.2.3 xxh128 + zstd|96.6379|91|6248
rsync 3.2.3 xxh3 + zstd|101.0077|84|6240
rsync 3.2.3 xxh64 + zstd|103.1644|82|6228
rsync 3.2.3 xxhash + zstd|97.6067|78|6224
rsync 3.2.3 md5 + zstd|75.6955|105|6236
rsync 3.2.3 xxh128 + zlib|177.1436|85|3048
rsync 3.2.3 xxh3 + zlib|177.5642|85|3044
rsync 3.2.3 xxh64 + zlib|177.5642|85|3032
rsync 3.2.3 xxhash + zlib|176.7146|85|3036
rsync 3.2.3 md5 + zlib|153.5736|107|3044
rsync 3.2.3 xxh128 + none|311.6292|50|2744
rsync 3.2.3 xxh3 + none|312.9404|50|2744
rsync 3.2.3 xxh64 + none|311.6200|51|2744
rsync 3.2.3 xxhash + none|303.9257|56|2744
rsync 3.2.3 md5 + none|243.7495|97|2744

## native Rsync 3.1.2

```
./rsync-benchmark.sh bench-native /home/rsync-test/ /home/rsync-test-dst/       
/usr/bin/rsync -avzi --stats --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-041220-152245.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compressed] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compressed] total bytes: 773951797 sent bytes: 319193453 (22017073.45 per second)
[rsync 3.1.2 native compressed] transfer speed (MB/s): 21.1393 speedup: 2.42
[rsync 3.1.2 native compressed] real: 14.40s user: 14.78s sys: 0.86s cpu: 108% maxmem: 2320 KB cswaits: 12206

/usr/bin/rsync -avi --stats --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-no-compress-041220-152245.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native no-compress] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native no-compress] total bytes: 773951797 sent bytes: 774437612 (221283349.71 per second)
[rsync 3.1.2 native no-compress] transfer speed (MB/s): 243.7495 speedup: 1.00
[rsync 3.1.2 native no-compress] real: 3.03s user: 2.21s sys: 0.88s cpu: 101% maxmem: 1992 KB cswaits: 22366
```

## Rsync 3.2.3

```
./rsync-benchmark.sh bench /home/rsync-test/ /home/rsync-test-dst/              
/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4] total bytes: 773951797 sent bytes: 385178200 (110066374.86 per second)
[rsync 3.2.3 xxh128-lz4] transfer speed (MB/s): 153.0560 speedup: 2.01
[rsync 3.2.3 xxh128-lz4] real: 2.40s user: 0.93s sys: 0.77s cpu: 70% maxmem: 2832 KB cswaits: 12403

/usr/local/bin/rsync -avzi --stats --cc xxh3 --zc lz4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh3-lz4-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh3-lz4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh3-lz4] total bytes: 773951797 sent bytes: 385155424 (110059867.43 per second)
[rsync 3.2.3 xxh3-lz4] transfer speed (MB/s): 143.4815 speedup: 2.01
[rsync 3.2.3 xxh3-lz4] real: 2.56s user: 0.89s sys: 0.80s cpu: 66% maxmem: 2828 KB cswaits: 12426

/usr/local/bin/rsync -avzi --stats --cc xxh64 --zc lz4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh64-lz4-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh64-lz4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh64-lz4] total bytes: 773951797 sent bytes: 385155424 (110059867.43 per second)
[rsync 3.2.3 xxh64-lz4] transfer speed (MB/s): 135.0414 speedup: 2.01
[rsync 3.2.3 xxh64-lz4] real: 2.72s user: 1.10s sys: 0.93s cpu: 75% maxmem: 2820 KB cswaits: 12296

/usr/local/bin/rsync -avzi --stats --cc xxhash --zc lz4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxhash-lz4-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxhash-lz4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxhash-lz4] total bytes: 773951797 sent bytes: 385155424 (110059867.43 per second)
[rsync 3.2.3 xxhash-lz4] transfer speed (MB/s): 141.8196 speedup: 2.01
[rsync 3.2.3 xxhash-lz4] real: 2.59s user: 0.92s sys: 0.79s cpu: 65% maxmem: 2824 KB cswaits: 12424

/usr/local/bin/rsync -avzi --stats --cc md5 --zc lz4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-md5-lz4-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 md5-lz4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 md5-lz4] total bytes: 773951797 sent bytes: 385178200 (110066374.86 per second)
[rsync 3.2.3 md5-lz4] transfer speed (MB/s): 106.7833 speedup: 2.01
[rsync 3.2.3 md5-lz4] real: 3.44s user: 2.80s sys: 0.84s cpu: 105% maxmem: 2832 KB cswaits: 10194

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd] total bytes: 773951797 sent bytes: 303996691 (86871658.00 per second)
[rsync 3.2.3 xxh128-zstd] transfer speed (MB/s): 96.6379 speedup: 2.55
[rsync 3.2.3 xxh128-zstd] real: 3.00s user: 1.84s sys: 0.91s cpu: 91% maxmem: 6248 KB cswaits: 9046

/usr/local/bin/rsync -avzi --stats --cc xxh3 --zc zstd --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh3-zstd-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh3-zstd] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh3-zstd] total bytes: 773951797 sent bytes: 303973911 (86865149.43 per second)
[rsync 3.2.3 xxh3-zstd] transfer speed (MB/s): 101.0077 speedup: 2.55
[rsync 3.2.3 xxh3-zstd] real: 2.87s user: 1.63s sys: 0.79s cpu: 84% maxmem: 6240 KB cswaits: 8751

/usr/local/bin/rsync -avzi --stats --cc xxh64 --zc zstd --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh64-zstd-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh64-zstd] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh64-zstd] total bytes: 773951797 sent bytes: 303973911 (86865149.43 per second)
[rsync 3.2.3 xxh64-zstd] transfer speed (MB/s): 103.1644 speedup: 2.55
[rsync 3.2.3 xxh64-zstd] real: 2.81s user: 1.59s sys: 0.73s cpu: 82% maxmem: 6228 KB cswaits: 8799

/usr/local/bin/rsync -avzi --stats --cc xxhash --zc zstd --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxhash-zstd-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxhash-zstd] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxhash-zstd] total bytes: 773951797 sent bytes: 303973911 (86865149.43 per second)
[rsync 3.2.3 xxhash-zstd] transfer speed (MB/s): 97.6067 speedup: 2.55
[rsync 3.2.3 xxhash-zstd] real: 2.97s user: 1.58s sys: 0.74s cpu: 78% maxmem: 6224 KB cswaits: 8719

/usr/local/bin/rsync -avzi --stats --cc md5 --zc zstd --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-md5-zstd-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 md5-zstd] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 md5-zstd] total bytes: 773951797 sent bytes: 303996691 (86871658.00 per second)
[rsync 3.2.3 md5-zstd] transfer speed (MB/s): 75.6955 speedup: 2.55
[rsync 3.2.3 md5-zstd] real: 3.83s user: 3.29s sys: 0.76s cpu: 105% maxmem: 6236 KB cswaits: 9081

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zlib --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zlib-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zlib] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zlib] total bytes: 773951797 sent bytes: 774571584 (172139043.56 per second)
[rsync 3.2.3 xxh128-zlib] transfer speed (MB/s): 177.1436 speedup: 1.00
[rsync 3.2.3 xxh128-zlib] real: 4.17s user: 2.59s sys: 1.00s cpu: 85% maxmem: 3048 KB cswaits: 20070

/usr/local/bin/rsync -avzi --stats --cc xxh3 --zc zlib --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh3-zlib-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh3-zlib] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh3-zlib] total bytes: 773951797 sent bytes: 774548804 (172133981.33 per second)
[rsync 3.2.3 xxh3-zlib] transfer speed (MB/s): 177.5642 speedup: 1.00
[rsync 3.2.3 xxh3-zlib] real: 4.16s user: 2.52s sys: 1.03s cpu: 85% maxmem: 3044 KB cswaits: 20129

/usr/local/bin/rsync -avzi --stats --cc xxh64 --zc zlib --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh64-zlib-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh64-zlib] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh64-zlib] total bytes: 773951797 sent bytes: 774548804 (172133981.33 per second)
[rsync 3.2.3 xxh64-zlib] transfer speed (MB/s): 177.5642 speedup: 1.00
[rsync 3.2.3 xxh64-zlib] real: 4.16s user: 2.54s sys: 0.98s cpu: 85% maxmem: 3032 KB cswaits: 20105

/usr/local/bin/rsync -avzi --stats --cc xxhash --zc zlib --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxhash-zlib-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxhash-zlib] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxhash-zlib] total bytes: 773951797 sent bytes: 774548804 (172133981.33 per second)
[rsync 3.2.3 xxhash-zlib] transfer speed (MB/s): 176.7146 speedup: 1.00
[rsync 3.2.3 xxhash-zlib] real: 4.18s user: 2.59s sys: 0.98s cpu: 85% maxmem: 3036 KB cswaits: 20162

/usr/local/bin/rsync -avzi --stats --cc md5 --zc zlib --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-md5-zlib-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 md5-zlib] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 md5-zlib] total bytes: 773951797 sent bytes: 774571584 (172139043.56 per second)
[rsync 3.2.3 md5-zlib] transfer speed (MB/s): 153.5736 speedup: 1.00
[rsync 3.2.3 md5-zlib] real: 4.81s user: 4.22s sys: 0.94s cpu: 107% maxmem: 3044 KB cswaits: 20064

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc none --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-none-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-none] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-none] total bytes: 773951797 sent bytes: 774437623 (309796694.00 per second)
[rsync 3.2.3 xxh128-none] transfer speed (MB/s): 311.6292 speedup: 1.00
[rsync 3.2.3 xxh128-none] real: 2.37s user: 0.26s sys: 0.93s cpu: 50% maxmem: 2744 KB cswaits: 28768

/usr/local/bin/rsync -avzi --stats --cc xxh3 --zc none --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh3-none-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh3-none] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh3-none] total bytes: 773951797 sent bytes: 774414847 (309787583.60 per second)
[rsync 3.2.3 xxh3-none] transfer speed (MB/s): 312.9404 speedup: 1.00
[rsync 3.2.3 xxh3-none] real: 2.36s user: 0.25s sys: 0.95s cpu: 50% maxmem: 2744 KB cswaits: 28780

/usr/local/bin/rsync -avzi --stats --cc xxh64 --zc none --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh64-none-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh64-none] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh64-none] total bytes: 773951797 sent bytes: 774414847 (221276845.43 per second)
[rsync 3.2.3 xxh64-none] transfer speed (MB/s): 311.6200 speedup: 1.00
[rsync 3.2.3 xxh64-none] real: 2.37s user: 0.26s sys: 0.96s cpu: 51% maxmem: 2744 KB cswaits: 28625

/usr/local/bin/rsync -avzi --stats --cc xxhash --zc none --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxhash-none-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxhash-none] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxhash-none] total bytes: 773951797 sent bytes: 774414847 (309787583.60 per second)
[rsync 3.2.3 xxhash-none] transfer speed (MB/s): 303.9257 speedup: 1.00
[rsync 3.2.3 xxhash-none] real: 2.43s user: 0.34s sys: 1.03s cpu: 56% maxmem: 2744 KB cswaits: 27531

/usr/local/bin/rsync -avzi --stats --cc md5 --zc none --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-md5-none-041220-152607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 md5-none] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 md5-none] total bytes: 773951797 sent bytes: 774437623 (221283352.86 per second)
[rsync 3.2.3 md5-none] transfer speed (MB/s): 243.7495 speedup: 1.00
[rsync 3.2.3 md5-none] real: 3.03s user: 2.01s sys: 0.93s cpu: 97% maxmem: 2744 KB cswaits: 22452
```