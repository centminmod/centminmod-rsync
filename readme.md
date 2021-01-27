# custom rsync RPM for Centmin Mod LEMP stacks

Custom rsync RPMs for CentOS 7 64bit based Centmin Mod LEMP stacks

* rsync 3.2.3 no avx2 and avx2 yum packages with [xxHash](http://cyan4973.github.io/xxHash/#benchmarks) & [zstd](https://github.com/facebook/zstd) support
* rsync 3.1.3
* rsync 3.1.4 [dev build log](https://git.samba.org/?p=rsync.git;a=shortlog)

# Install & Dependencies

```
yum -y install acl libacl-devel attr libattr-devel libzstd-devel lz4-devel xxhash xxhash-libs xxhash-devel
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

# Compression Level Tests

Testing a specific checksum, compression method and iterate through compression levels specified. Sent bytes reported should be decreasing with each compression level increase.

# rsync native compression levels

for rsync 3.1.2 native with csv format log at `/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvls-051220-152618.csv`

```
./rsync-benchmark.sh bench-lvl-native 6 /home/rsync-test/ /home/rsync-test-dst/     
/usr/bin/rsync -avzi --stats --compress-level=1 --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvl1-051220-152618.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compress lvl 1] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compress lvl 1] total bytes: 773951797 sent bytes: 336106979 (26892887.28 per second)
[rsync 3.1.2 native compress lvl 1] transfer speed (MB/s): 28.9032 speedup: 2.30
[rsync 3.1.2 native compress lvl 1] real: 11.09s user: 11.05s sys: 0.80s cpu: 106% maxmem: 2328 KB cswaits: 12419

/usr/bin/rsync -avzi --stats --compress-level=2 --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvl2-051220-152633.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compress lvl 2] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compress lvl 2] total bytes: 773951797 sent bytes: 332848202 (31704982.29 per second)
[rsync 3.1.2 native compress lvl 2] transfer speed (MB/s): 30.0027 speedup: 2.32
[rsync 3.1.2 native compress lvl 2] real: 10.58s user: 10.91s sys: 0.78s cpu: 110% maxmem: 2324 KB cswaits: 12388

/usr/bin/rsync -avzi --stats --compress-level=3 --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvl3-051220-152647.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compress lvl 3] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compress lvl 3] total bytes: 773951797 sent bytes: 330489500 (28742922.78 per second)
[rsync 3.1.2 native compress lvl 3] transfer speed (MB/s): 29.0755 speedup: 2.34
[rsync 3.1.2 native compress lvl 3] real: 10.84s user: 11.05s sys: 0.82s cpu: 109% maxmem: 2324 KB cswaits: 12358

/usr/bin/rsync -avzi --stats --compress-level=4 --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvl4-051220-152701.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compress lvl 4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compress lvl 4] total bytes: 773951797 sent bytes: 325021461 (26006045.84 per second)
[rsync 3.1.2 native compress lvl 4] transfer speed (MB/s): 25.7232 speedup: 2.38
[rsync 3.1.2 native compress lvl 4] real: 12.05s user: 12.36s sys: 0.79s cpu: 109% maxmem: 2328 KB cswaits: 12283

/usr/bin/rsync -avzi --stats --compress-level=5 --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvl5-051220-152716.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compress lvl 5] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compress lvl 5] total bytes: 773951797 sent bytes: 320904465 (23774709.41 per second)
[rsync 3.1.2 native compress lvl 5] transfer speed (MB/s): 24.1545 speedup: 2.41
[rsync 3.1.2 native compress lvl 5] real: 12.67s user: 12.79s sys: 0.84s cpu: 107% maxmem: 2328 KB cswaits: 12227

/usr/bin/rsync -avzi --stats --compress-level=6 --log-file=/home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvl6-051220-152732.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.1.2 native compress lvl 6] files: 2,848 reg: 2,847, dir: 1
[rsync 3.1.2 native compress lvl 6] total bytes: 773951797 sent bytes: 319193453 (22017073.45 per second)
[rsync 3.1.2 native compress lvl 6] transfer speed (MB/s): 21.9946 speedup: 2.42
[rsync 3.1.2 native compress lvl 6] real: 13.84s user: 14.02s sys: 0.77s cpu: 106% maxmem: 2324 KB cswaits: 12217

csv log: /home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvls-051220-152618.csv
```
```
cat /home/rsync-benchmarks/rsyncbench-rsync-native-compressed-lvls-051220-152618.csv
version,comp-lvl,speed,time,bytes-sent
rsync-3.1.2,1,28.9032,11.09,336106979
rsync-3.1.2,2,30.0027,10.58,332848202
rsync-3.1.2,3,29.0755,10.84,330489500
rsync-3.1.2,4,25.7232,12.05,325021461
rsync-3.1.2,5,24.1545,12.67,320904465
rsync-3.1.2,6,21.9946,13.84,319193453
```

# xxh128 + zstd + fast compression levels

for rsync 3.2.3 xxh128 + zstd. Test for zstd negative level compression for fast compression levels -100 to 6 for rsync 3.2.3 xxh128 + zstd. Rsync zstd has compression levels from -131072 to 22

```
./rsync-benchmark.sh bench-lvl xxh128 zstd 6 /home/rsync-test/ /home/rsync-test-dst/
/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -100 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-100-051220-154002.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--100] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--100] total bytes: 773951797 sent bytes: 502524238 (335052233.33 per second)
[rsync 3.2.3 xxh128-zstd--100] transfer speed (MB/s): 526.6422 speedup: 1.54
[rsync 3.2.3 xxh128-zstd--100] real: 0.91s user: 0.75s sys: 0.65s cpu: 153% maxmem: 3900 KB cswaits: 6256

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -99 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-99-051220-154007.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--99] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--99] total bytes: 773951797 sent bytes: 502453274 (201002954.40 per second)
[rsync 3.2.3 xxh128-zstd--99] transfer speed (MB/s): 193.2164 speedup: 1.54
[rsync 3.2.3 xxh128-zstd--99] real: 2.48s user: 0.77s sys: 0.81s cpu: 64% maxmem: 3900 KB cswaits: 12835

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -98 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-98-051220-154013.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--98] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--98] total bytes: 773951797 sent bytes: 502049349 (200841384.40 per second)
[rsync 3.2.3 xxh128-zstd--98] transfer speed (MB/s): 194.6307 speedup: 1.54
[rsync 3.2.3 xxh128-zstd--98] real: 2.46s user: 0.77s sys: 0.80s cpu: 63% maxmem: 3900 KB cswaits: 12828

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -97 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-97-051220-154018.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--97] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--97] total bytes: 773951797 sent bytes: 500879501 (143123889.43 per second)
[rsync 3.2.3 xxh128-zstd--97] transfer speed (MB/s): 182.3190 speedup: 1.55
[rsync 3.2.3 xxh128-zstd--97] real: 2.62s user: 0.97s sys: 0.92s cpu: 72% maxmem: 3900 KB cswaits: 12720

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -96 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-96-051220-154024.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--96] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--96] total bytes: 773951797 sent bytes: 499563263 (142747821.43 per second)
[rsync 3.2.3 xxh128-zstd--96] transfer speed (MB/s): 192.1051 speedup: 1.55
[rsync 3.2.3 xxh128-zstd--96] real: 2.48s user: 0.75s sys: 0.82s cpu: 63% maxmem: 3900 KB cswaits: 12780

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -95 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-95-051220-154030.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--95] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--95] total bytes: 773951797 sent bytes: 498153689 (199283120.40 per second)
[rsync 3.2.3 xxh128-zstd--95] transfer speed (MB/s): 193.1204 speedup: 1.55
[rsync 3.2.3 xxh128-zstd--95] real: 2.46s user: 0.75s sys: 0.82s cpu: 64% maxmem: 3896 KB cswaits: 12693

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -94 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-94-051220-154036.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--94] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--94] total bytes: 773951797 sent bytes: 496505085 (198623678.80 per second)
[rsync 3.2.3 xxh128-zstd--94] transfer speed (MB/s): 191.7020 speedup: 1.56
[rsync 3.2.3 xxh128-zstd--94] real: 2.47s user: 0.75s sys: 0.83s cpu: 64% maxmem: 3900 KB cswaits: 12839

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -93 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-93-051220-154042.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--93] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--93] total bytes: 773951797 sent bytes: 495571690 (198250320.80 per second)
[rsync 3.2.3 xxh128-zstd--93] transfer speed (MB/s): 186.8039 speedup: 1.56
[rsync 3.2.3 xxh128-zstd--93] real: 2.53s user: 0.85s sys: 0.89s cpu: 68% maxmem: 3900 KB cswaits: 12381

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -92 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-92-051220-154047.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--92] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--92] total bytes: 773951797 sent bytes: 494365618 (141262780.00 per second)
[rsync 3.2.3 xxh128-zstd--92] transfer speed (MB/s): 202.3449 speedup: 1.57
[rsync 3.2.3 xxh128-zstd--92] real: 2.33s user: 0.80s sys: 0.80s cpu: 68% maxmem: 3900 KB cswaits: 12675

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -91 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-91-051220-154053.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--91] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--91] total bytes: 773951797 sent bytes: 493480440 (141009872.00 per second)
[rsync 3.2.3 xxh128-zstd--91] transfer speed (MB/s): 187.4978 speedup: 1.57
[rsync 3.2.3 xxh128-zstd--91] real: 2.51s user: 0.77s sys: 0.86s cpu: 65% maxmem: 3900 KB cswaits: 12668

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -90 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-90-051220-154059.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--90] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--90] total bytes: 773951797 sent bytes: 491820410 (196749808.80 per second)
[rsync 3.2.3 xxh128-zstd--90] transfer speed (MB/s): 189.8933 speedup: 1.57
[rsync 3.2.3 xxh128-zstd--90] real: 2.47s user: 0.77s sys: 0.81s cpu: 64% maxmem: 3900 KB cswaits: 12653

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -89 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-89-051220-154105.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--89] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--89] total bytes: 773951797 sent bytes: 490183797 (196095163.60 per second)
[rsync 3.2.3 xxh128-zstd--89] transfer speed (MB/s): 188.4982 speedup: 1.58
[rsync 3.2.3 xxh128-zstd--89] real: 2.48s user: 0.78s sys: 0.81s cpu: 64% maxmem: 3900 KB cswaits: 12623

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -88 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-88-051220-154110.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--88] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--88] total bytes: 773951797 sent bytes: 489277129 (139808926.00 per second)
[rsync 3.2.3 xxh128-zstd--88] transfer speed (MB/s): 176.0796 speedup: 1.58
[rsync 3.2.3 xxh128-zstd--88] real: 2.65s user: 0.98s sys: 1.01s cpu: 75% maxmem: 3900 KB cswaits: 12298

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -87 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-87-051220-154116.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--87] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--87] total bytes: 773951797 sent bytes: 487990191 (139441229.43 per second)
[rsync 3.2.3 xxh128-zstd--87] transfer speed (MB/s): 189.1803 speedup: 1.59
[rsync 3.2.3 xxh128-zstd--87] real: 2.46s user: 0.82s sys: 0.77s cpu: 64% maxmem: 3900 KB cswaits: 12529

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -86 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-86-051220-154122.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--86] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--86] total bytes: 773951797 sent bytes: 487197617 (139214779.71 per second)
[rsync 3.2.3 xxh128-zstd--86] transfer speed (MB/s): 188.1084 speedup: 1.59
[rsync 3.2.3 xxh128-zstd--86] real: 2.47s user: 0.78s sys: 0.81s cpu: 64% maxmem: 3900 KB cswaits: 12531

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -85 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-85-051220-154128.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--85] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--85] total bytes: 773951797 sent bytes: 486122201 (194470525.20 per second)
[rsync 3.2.3 xxh128-zstd--85] transfer speed (MB/s): 183.2419 speedup: 1.59
[rsync 3.2.3 xxh128-zstd--85] real: 2.53s user: 0.84s sys: 0.82s cpu: 65% maxmem: 3900 KB cswaits: 12562

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -84 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-84-051220-154134.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--84] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--84] total bytes: 773951797 sent bytes: 484780234 (193933738.40 per second)
[rsync 3.2.3 xxh128-zstd--84] transfer speed (MB/s): 200.1395 speedup: 1.60
[rsync 3.2.3 xxh128-zstd--84] real: 2.31s user: 0.81s sys: 0.79s cpu: 69% maxmem: 3900 KB cswaits: 12514

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -83 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-83-051220-154139.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--83] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--83] total bytes: 773951797 sent bytes: 483478631 (138152212.29 per second)
[rsync 3.2.3 xxh128-zstd--83] transfer speed (MB/s): 180.1098 speedup: 1.60
[rsync 3.2.3 xxh128-zstd--83] real: 2.56s user: 0.92s sys: 0.87s cpu: 70% maxmem: 3900 KB cswaits: 12440

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -82 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-82-051220-154145.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--82] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--82] total bytes: 773951797 sent bytes: 482495260 (137871249.14 per second)
[rsync 3.2.3 xxh128-zstd--82] transfer speed (MB/s): 177.6615 speedup: 1.60
[rsync 3.2.3 xxh128-zstd--82] real: 2.59s user: 0.96s sys: 0.95s cpu: 73% maxmem: 3900 KB cswaits: 12392

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -81 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-81-051220-154151.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--81] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--81] total bytes: 773951797 sent bytes: 481526759 (137594534.57 per second)
[rsync 3.2.3 xxh128-zstd--81] transfer speed (MB/s): 184.4255 speedup: 1.61
[rsync 3.2.3 xxh128-zstd--81] real: 2.49s user: 0.78s sys: 0.82s cpu: 64% maxmem: 3900 KB cswaits: 12446

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -80 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-80-051220-154157.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--80] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--80] total bytes: 773951797 sent bytes: 480159728 (192085536.00 per second)
[rsync 3.2.3 xxh128-zstd--80] transfer speed (MB/s): 183.1664 speedup: 1.61
[rsync 3.2.3 xxh128-zstd--80] real: 2.50s user: 0.82s sys: 0.79s cpu: 64% maxmem: 3900 KB cswaits: 12445

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -79 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-79-051220-154203.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--79] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--79] total bytes: 773951797 sent bytes: 478753157 (191522907.60 per second)
[rsync 3.2.3 xxh128-zstd--79] transfer speed (MB/s): 184.1026 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--79] real: 2.48s user: 0.83s sys: 0.77s cpu: 64% maxmem: 3900 KB cswaits: 12400

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -78 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-78-051220-154209.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--78] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--78] total bytes: 773951797 sent bytes: 477288999 (190937244.40 per second)
[rsync 3.2.3 xxh128-zstd--78] transfer speed (MB/s): 181.3459 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--78] real: 2.51s user: 0.79s sys: 0.83s cpu: 64% maxmem: 3900 KB cswaits: 12349

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -77 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-77-051220-154214.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--77] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--77] total bytes: 773951797 sent bytes: 476899601 (136272489.43 per second)
[rsync 3.2.3 xxh128-zstd--77] transfer speed (MB/s): 178.3556 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--77] real: 2.55s user: 0.84s sys: 0.85s cpu: 66% maxmem: 3900 KB cswaits: 12267

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -76 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-76-051220-154220.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--76] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--76] total bytes: 773951797 sent bytes: 476205412 (190503809.60 per second)
[rsync 3.2.3 xxh128-zstd--76] transfer speed (MB/s): 195.7520 speedup: 1.63
[rsync 3.2.3 xxh128-zstd--76] real: 2.32s user: 0.78s sys: 0.83s cpu: 69% maxmem: 3900 KB cswaits: 12374

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -75 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-75-051220-154226.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--75] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--75] total bytes: 773951797 sent bytes: 476060832 (190445977.60 per second)
[rsync 3.2.3 xxh128-zstd--75] transfer speed (MB/s): 183.0673 speedup: 1.63
[rsync 3.2.3 xxh128-zstd--75] real: 2.48s user: 0.85s sys: 0.76s cpu: 65% maxmem: 3896 KB cswaits: 12464

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -74 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-74-051220-154232.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--74] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--74] total bytes: 773951797 sent bytes: 475791488 (190338240.00 per second)
[rsync 3.2.3 xxh128-zstd--74] transfer speed (MB/s): 194.7425 speedup: 1.63
[rsync 3.2.3 xxh128-zstd--74] real: 2.33s user: 0.84s sys: 0.78s cpu: 69% maxmem: 3900 KB cswaits: 12382

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -73 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-73-051220-154237.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--73] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--73] total bytes: 773951797 sent bytes: 476605516 (136188465.14 per second)
[rsync 3.2.3 xxh128-zstd--73] transfer speed (MB/s): 181.0862 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--73] real: 2.51s user: 0.88s sys: 0.83s cpu: 68% maxmem: 3900 KB cswaits: 12393

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -72 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-72-051220-154243.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--72] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--72] total bytes: 773951797 sent bytes: 478019952 (136592589.71 per second)
[rsync 3.2.3 xxh128-zstd--72] transfer speed (MB/s): 172.6800 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--72] real: 2.64s user: 1.05s sys: 0.94s cpu: 75% maxmem: 3900 KB cswaits: 12301

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -71 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-71-051220-154249.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--71] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--71] total bytes: 773951797 sent bytes: 478758547 (136803616.86 per second)
[rsync 3.2.3 xxh128-zstd--71] transfer speed (MB/s): 180.4662 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--71] real: 2.53s user: 0.80s sys: 0.83s cpu: 64% maxmem: 3900 KB cswaits: 12401

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -70 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-70-051220-154255.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--70] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--70] total bytes: 773951797 sent bytes: 476731459 (190714228.40 per second)
[rsync 3.2.3 xxh128-zstd--70] transfer speed (MB/s): 183.3252 speedup: 1.62
[rsync 3.2.3 xxh128-zstd--70] real: 2.48s user: 0.82s sys: 0.79s cpu: 65% maxmem: 3900 KB cswaits: 12448

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -69 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-69-051220-154301.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--69] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--69] total bytes: 773951797 sent bytes: 473662800 (189486764.80 per second)
[rsync 3.2.3 xxh128-zstd--69] transfer speed (MB/s): 180.6880 speedup: 1.63
[rsync 3.2.3 xxh128-zstd--69] real: 2.50s user: 0.85s sys: 0.77s cpu: 65% maxmem: 3900 KB cswaits: 12382

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -68 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-68-051220-154306.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--68] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--68] total bytes: 773951797 sent bytes: 470345777 (134399968.29 per second)
[rsync 3.2.3 xxh128-zstd--68] transfer speed (MB/s): 177.9986 speedup: 1.65
[rsync 3.2.3 xxh128-zstd--68] real: 2.52s user: 0.91s sys: 0.77s cpu: 67% maxmem: 3896 KB cswaits: 12324

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -67 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-67-051220-154312.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--67] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--67] total bytes: 773951797 sent bytes: 467061682 (133461655.43 per second)
[rsync 3.2.3 xxh128-zstd--67] transfer speed (MB/s): 176.7558 speedup: 1.66
[rsync 3.2.3 xxh128-zstd--67] real: 2.52s user: 0.89s sys: 0.79s cpu: 66% maxmem: 3900 KB cswaits: 12319

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -66 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-66-051220-154318.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--66] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--66] total bytes: 773951797 sent bytes: 464067371 (185648593.20 per second)
[rsync 3.2.3 xxh128-zstd--66] transfer speed (MB/s): 186.7380 speedup: 1.67
[rsync 3.2.3 xxh128-zstd--66] real: 2.37s user: 0.88s sys: 0.75s cpu: 69% maxmem: 3904 KB cswaits: 12307

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -65 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-65-051220-154324.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--65] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--65] total bytes: 773951797 sent bytes: 462563095 (185046882.80 per second)
[rsync 3.2.3 xxh128-zstd--65] transfer speed (MB/s): 172.3181 speedup: 1.67
[rsync 3.2.3 xxh128-zstd--65] real: 2.56s user: 0.92s sys: 0.86s cpu: 69% maxmem: 3900 KB cswaits: 12232

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -64 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-64-051220-154330.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--64] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--64] total bytes: 773951797 sent bytes: 461370332 (184569777.60 per second)
[rsync 3.2.3 xxh128-zstd--64] transfer speed (MB/s): 174.6019 speedup: 1.68
[rsync 3.2.3 xxh128-zstd--64] real: 2.52s user: 0.79s sys: 0.85s cpu: 65% maxmem: 3904 KB cswaits: 12261

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -63 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-63-051220-154335.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--63] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--63] total bytes: 773951797 sent bytes: 459643528 (131342182.86 per second)
[rsync 3.2.3 xxh128-zstd--63] transfer speed (MB/s): 168.5962 speedup: 1.68
[rsync 3.2.3 xxh128-zstd--63] real: 2.60s user: 1.01s sys: 0.84s cpu: 71% maxmem: 3904 KB cswaits: 12287

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -62 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-62-051220-154341.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--62] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--62] total bytes: 773951797 sent bytes: 458579559 (131038191.71 per second)
[rsync 3.2.3 xxh128-zstd--62] transfer speed (MB/s): 175.6367 speedup: 1.69
[rsync 3.2.3 xxh128-zstd--62] real: 2.49s user: 0.86s sys: 0.78s cpu: 66% maxmem: 3904 KB cswaits: 12288

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -61 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-61-051220-154347.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--61] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--61] total bytes: 773951797 sent bytes: 457537488 (130740457.14 per second)
[rsync 3.2.3 xxh128-zstd--61] transfer speed (MB/s): 172.4670 speedup: 1.69
[rsync 3.2.3 xxh128-zstd--61] real: 2.53s user: 0.85s sys: 0.79s cpu: 65% maxmem: 3904 KB cswaits: 12302

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -60 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-60-051220-154353.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--60] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--60] total bytes: 773951797 sent bytes: 456119111 (130335206.57 per second)
[rsync 3.2.3 xxh128-zstd--60] transfer speed (MB/s): 162.9172 speedup: 1.70
[rsync 3.2.3 xxh128-zstd--60] real: 2.67s user: 1.10s sys: 0.97s cpu: 77% maxmem: 3924 KB cswaits: 11945

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -59 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-59-051220-154359.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--59] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--59] total bytes: 773951797 sent bytes: 454375186 (181771719.20 per second)
[rsync 3.2.3 xxh128-zstd--59] transfer speed (MB/s): 173.3303 speedup: 1.70
[rsync 3.2.3 xxh128-zstd--59] real: 2.50s user: 0.85s sys: 0.79s cpu: 65% maxmem: 3904 KB cswaits: 12244

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -58 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-58-051220-154405.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--58] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--58] total bytes: 773951797 sent bytes: 451871677 (180770315.60 per second)
[rsync 3.2.3 xxh128-zstd--58] transfer speed (MB/s): 182.6010 speedup: 1.71
[rsync 3.2.3 xxh128-zstd--58] real: 2.36s user: 0.86s sys: 0.79s cpu: 70% maxmem: 3904 KB cswaits: 12262

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -57 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-57-051220-154410.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--57] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--57] total bytes: 773951797 sent bytes: 449243392 (128370715.43 per second)
[rsync 3.2.3 xxh128-zstd--57] transfer speed (MB/s): 161.6724 speedup: 1.72
[rsync 3.2.3 xxh128-zstd--57] real: 2.65s user: 1.05s sys: 0.89s cpu: 73% maxmem: 3904 KB cswaits: 12119

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -56 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-56-051220-154416.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--56] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--56] total bytes: 773951797 sent bytes: 446974550 (127722474.86 per second)
[rsync 3.2.3 xxh128-zstd--56] transfer speed (MB/s): 169.8279 speedup: 1.73
[rsync 3.2.3 xxh128-zstd--56] real: 2.51s user: 0.87s sys: 0.79s cpu: 66% maxmem: 3904 KB cswaits: 12250

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -55 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-55-051220-154422.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--55] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--55] total bytes: 773951797 sent bytes: 444949319 (127143837.43 per second)
[rsync 3.2.3 xxh128-zstd--55] transfer speed (MB/s): 169.0584 speedup: 1.74
[rsync 3.2.3 xxh128-zstd--55] real: 2.51s user: 0.84s sys: 0.82s cpu: 66% maxmem: 3900 KB cswaits: 12201

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -54 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-54-051220-154428.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--54] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--54] total bytes: 773951797 sent bytes: 443448644 (126715073.14 per second)
[rsync 3.2.3 xxh128-zstd--54] transfer speed (MB/s): 165.1974 speedup: 1.75
[rsync 3.2.3 xxh128-zstd--54] real: 2.56s user: 0.92s sys: 0.83s cpu: 68% maxmem: 3904 KB cswaits: 12206

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -53 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-53-051220-154434.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--53] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--53] total bytes: 773951797 sent bytes: 441267106 (176528487.20 per second)
[rsync 3.2.3 xxh128-zstd--53] transfer speed (MB/s): 167.6594 speedup: 1.75
[rsync 3.2.3 xxh128-zstd--53] real: 2.51s user: 0.88s sys: 0.78s cpu: 66% maxmem: 3904 KB cswaits: 12257

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -52 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-52-051220-154440.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--52] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--52] total bytes: 773951797 sent bytes: 438392569 (175378672.40 per second)
[rsync 3.2.3 xxh128-zstd--52] transfer speed (MB/s): 167.2334 speedup: 1.77
[rsync 3.2.3 xxh128-zstd--52] real: 2.50s user: 0.86s sys: 0.81s cpu: 67% maxmem: 3904 KB cswaits: 12149

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -51 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-51-051220-154446.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--51] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--51] total bytes: 773951797 sent bytes: 435415113 (174187690.00 per second)
[rsync 3.2.3 xxh128-zstd--51] transfer speed (MB/s): 164.1281 speedup: 1.78
[rsync 3.2.3 xxh128-zstd--51] real: 2.53s user: 0.91s sys: 0.77s cpu: 66% maxmem: 3900 KB cswaits: 12203

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -50 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-50-051220-154451.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--50] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--50] total bytes: 773951797 sent bytes: 433707259 (123931820.29 per second)
[rsync 3.2.3 xxh128-zstd--50] transfer speed (MB/s): 174.5212 speedup: 1.78
[rsync 3.2.3 xxh128-zstd--50] real: 2.37s user: 0.91s sys: 0.78s cpu: 71% maxmem: 3904 KB cswaits: 12136

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -49 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-49-051220-154457.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--49] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--49] total bytes: 773951797 sent bytes: 432339753 (123541104.29 per second)
[rsync 3.2.3 xxh128-zstd--49] transfer speed (MB/s): 161.6907 speedup: 1.79
[rsync 3.2.3 xxh128-zstd--49] real: 2.55s user: 0.87s sys: 0.82s cpu: 66% maxmem: 3908 KB cswaits: 12185

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -48 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-48-051220-154503.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--48] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--48] total bytes: 773951797 sent bytes: 430679674 (172293514.40 per second)
[rsync 3.2.3 xxh128-zstd--48] transfer speed (MB/s): 162.3431 speedup: 1.80
[rsync 3.2.3 xxh128-zstd--48] real: 2.53s user: 0.91s sys: 0.77s cpu: 66% maxmem: 3900 KB cswaits: 12231

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -47 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-47-051220-154509.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--47] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--47] total bytes: 773951797 sent bytes: 429355974 (171764034.40 per second)
[rsync 3.2.3 xxh128-zstd--47] transfer speed (MB/s): 161.2069 speedup: 1.80
[rsync 3.2.3 xxh128-zstd--47] real: 2.54s user: 0.88s sys: 0.81s cpu: 66% maxmem: 3904 KB cswaits: 12267

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -46 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-46-051220-154515.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--46] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--46] total bytes: 773951797 sent bytes: 427932036 (171194459.20 per second)
[rsync 3.2.3 xxh128-zstd--46] transfer speed (MB/s): 159.4171 speedup: 1.81
[rsync 3.2.3 xxh128-zstd--46] real: 2.56s user: 0.90s sys: 0.79s cpu: 66% maxmem: 3904 KB cswaits: 12299

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -45 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-45-051220-154521.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--45] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--45] total bytes: 773951797 sent bytes: 425884343 (170375382.00 per second)
[rsync 3.2.3 xxh128-zstd--45] transfer speed (MB/s): 151.5503 speedup: 1.82
[rsync 3.2.3 xxh128-zstd--45] real: 2.68s user: 1.10s sys: 0.86s cpu: 73% maxmem: 3904 KB cswaits: 12268

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -44 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-44-051220-154526.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--44] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--44] total bytes: 773951797 sent bytes: 422770844 (120807130.29 per second)
[rsync 3.2.3 xxh128-zstd--44] transfer speed (MB/s): 159.9943 speedup: 1.83
[rsync 3.2.3 xxh128-zstd--44] real: 2.52s user: 0.88s sys: 0.82s cpu: 67% maxmem: 3900 KB cswaits: 12304

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -43 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-43-051220-154532.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--43] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--43] total bytes: 773951797 sent bytes: 419605077 (119902625.43 per second)
[rsync 3.2.3 xxh128-zstd--43] transfer speed (MB/s): 155.7068 speedup: 1.84
[rsync 3.2.3 xxh128-zstd--43] real: 2.57s user: 0.92s sys: 0.81s cpu: 67% maxmem: 3904 KB cswaits: 12342

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -42 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-42-051220-154538.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--42] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--42] total bytes: 773951797 sent bytes: 416224609 (118936777.43 per second)
[rsync 3.2.3 xxh128-zstd--42] transfer speed (MB/s): 166.7826 speedup: 1.86
[rsync 3.2.3 xxh128-zstd--42] real: 2.38s user: 0.89s sys: 0.81s cpu: 71% maxmem: 3908 KB cswaits: 12289

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -41 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-41-051220-154544.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--41] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--41] total bytes: 773951797 sent bytes: 413186825 (165296374.80 per second)
[rsync 3.2.3 xxh128-zstd--41] transfer speed (MB/s): 154.5277 speedup: 1.87
[rsync 3.2.3 xxh128-zstd--41] real: 2.55s user: 0.93s sys: 0.78s cpu: 67% maxmem: 3908 KB cswaits: 12255

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -40 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-40-051220-154550.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--40] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--40] total bytes: 773951797 sent bytes: 411245457 (164519827.60 per second)
[rsync 3.2.3 xxh128-zstd--40] transfer speed (MB/s): 154.4071 speedup: 1.88
[rsync 3.2.3 xxh128-zstd--40] real: 2.54s user: 0.92s sys: 0.78s cpu: 67% maxmem: 3908 KB cswaits: 12353

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -39 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-39-051220-154556.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--39] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--39] total bytes: 773951797 sent bytes: 408902519 (163582652.40 per second)
[rsync 3.2.3 xxh128-zstd--39] transfer speed (MB/s): 152.3280 speedup: 1.89
[rsync 3.2.3 xxh128-zstd--39] real: 2.56s user: 0.93s sys: 0.78s cpu: 67% maxmem: 3908 KB cswaits: 12237

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -38 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-38-051220-154601.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--38] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--38] total bytes: 773951797 sent bytes: 406763185 (116233513.43 per second)
[rsync 3.2.3 xxh128-zstd--38] transfer speed (MB/s): 152.1253 speedup: 1.90
[rsync 3.2.3 xxh128-zstd--38] real: 2.55s user: 0.97s sys: 0.75s cpu: 67% maxmem: 3920 KB cswaits: 12222

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -37 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-37-051220-154607.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--37] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--37] total bytes: 773951797 sent bytes: 404712276 (115647539.43 per second)
[rsync 3.2.3 xxh128-zstd--37] transfer speed (MB/s): 150.7670 speedup: 1.91
[rsync 3.2.3 xxh128-zstd--37] real: 2.56s user: 0.92s sys: 0.81s cpu: 67% maxmem: 3920 KB cswaits: 12238

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -36 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-36-051220-154613.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--36] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--36] total bytes: 773951797 sent bytes: 402538714 (115026521.71 per second)
[rsync 3.2.3 xxh128-zstd--36] transfer speed (MB/s): 142.1817 speedup: 1.92
[rsync 3.2.3 xxh128-zstd--36] real: 2.70s user: 1.16s sys: 0.91s cpu: 76% maxmem: 3920 KB cswaits: 12141

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -35 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-35-051220-154619.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--35] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--35] total bytes: 773951797 sent bytes: 400521259 (114450106.00 per second)
[rsync 3.2.3 xxh128-zstd--35] transfer speed (MB/s): 148.0491 speedup: 1.93
[rsync 3.2.3 xxh128-zstd--35] real: 2.58s user: 0.95s sys: 0.78s cpu: 67% maxmem: 3920 KB cswaits: 12170

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -34 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-34-051220-154625.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--34] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--34] total bytes: 773951797 sent bytes: 397739780 (159117556.80 per second)
[rsync 3.2.3 xxh128-zstd--34] transfer speed (MB/s): 158.7088 speedup: 1.95
[rsync 3.2.3 xxh128-zstd--34] real: 2.39s user: 0.96s sys: 0.76s cpu: 72% maxmem: 3924 KB cswaits: 12230

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -33 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-33-051220-154631.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--33] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--33] total bytes: 773951797 sent bytes: 394291346 (157738183.20 per second)
[rsync 3.2.3 xxh128-zstd--33] transfer speed (MB/s): 145.7463 speedup: 1.96
[rsync 3.2.3 xxh128-zstd--33] real: 2.58s user: 1.03s sys: 0.74s cpu: 68% maxmem: 3924 KB cswaits: 12176

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -32 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-32-051220-154637.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--32] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--32] total bytes: 773951797 sent bytes: 390575206 (156251727.20 per second)
[rsync 3.2.3 xxh128-zstd--32] transfer speed (MB/s): 144.9344 speedup: 1.98
[rsync 3.2.3 xxh128-zstd--32] real: 2.57s user: 0.94s sys: 0.79s cpu: 67% maxmem: 3924 KB cswaits: 12136

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -31 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-31-051220-154643.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--31] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--31] total bytes: 773951797 sent bytes: 388336938 (155356420.00 per second)
[rsync 3.2.3 xxh128-zstd--31] transfer speed (MB/s): 138.7067 speedup: 1.99
[rsync 3.2.3 xxh128-zstd--31] real: 2.67s user: 1.10s sys: 0.85s cpu: 73% maxmem: 3924 KB cswaits: 12040

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -30 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-30-051220-154649.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--30] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--30] total bytes: 773951797 sent bytes: 386620494 (154669842.40 per second)
[rsync 3.2.3 xxh128-zstd--30] transfer speed (MB/s): 142.9108 speedup: 2.00
[rsync 3.2.3 xxh128-zstd--30] real: 2.58s user: 0.98s sys: 0.77s cpu: 67% maxmem: 3924 KB cswaits: 12032

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -29 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-29-051220-154654.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--29] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--29] total bytes: 773951797 sent bytes: 384413549 (109847903.14 per second)
[rsync 3.2.3 xxh128-zstd--29] transfer speed (MB/s): 143.7667 speedup: 2.01
[rsync 3.2.3 xxh128-zstd--29] real: 2.55s user: 0.97s sys: 0.77s cpu: 68% maxmem: 3924 KB cswaits: 12014

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -28 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-28-051220-154700.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--28] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--28] total bytes: 773951797 sent bytes: 382051851 (109173132.29 per second)
[rsync 3.2.3 xxh128-zstd--28] transfer speed (MB/s): 140.6768 speedup: 2.03
[rsync 3.2.3 xxh128-zstd--28] real: 2.59s user: 0.98s sys: 0.76s cpu: 67% maxmem: 3924 KB cswaits: 12000

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -27 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-27-051220-154706.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--27] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--27] total bytes: 773951797 sent bytes: 379451361 (108430135.14 per second)
[rsync 3.2.3 xxh128-zstd--27] transfer speed (MB/s): 139.7193 speedup: 2.04
[rsync 3.2.3 xxh128-zstd--27] real: 2.59s user: 0.99s sys: 0.76s cpu: 67% maxmem: 3924 KB cswaits: 11919

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -26 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-26-051220-154712.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--26] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--26] total bytes: 773951797 sent bytes: 376666143 (150688102.00 per second)
[rsync 3.2.3 xxh128-zstd--26] transfer speed (MB/s): 146.0231 speedup: 2.05
[rsync 3.2.3 xxh128-zstd--26] real: 2.46s user: 1.02s sys: 0.81s cpu: 75% maxmem: 3920 KB cswaits: 11841

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -25 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-25-051220-154718.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--25] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--25] total bytes: 773951797 sent bytes: 374351489 (149762240.40 per second)
[rsync 3.2.3 xxh128-zstd--25] transfer speed (MB/s): 133.7113 speedup: 2.07
[rsync 3.2.3 xxh128-zstd--25] real: 2.67s user: 1.12s sys: 0.85s cpu: 74% maxmem: 3924 KB cswaits: 11851

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -24 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-24-051220-154724.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--24] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--24] total bytes: 773951797 sent bytes: 372285599 (148935884.40 per second)
[rsync 3.2.3 xxh128-zstd--24] transfer speed (MB/s): 137.6120 speedup: 2.08
[rsync 3.2.3 xxh128-zstd--24] real: 2.58s user: 0.98s sys: 0.78s cpu: 68% maxmem: 3924 KB cswaits: 11786

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -23 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-23-051220-154730.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--23] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--23] total bytes: 773951797 sent bytes: 370465323 (148207774.00 per second)
[rsync 3.2.3 xxh128-zstd--23] transfer speed (MB/s): 135.3652 speedup: 2.09
[rsync 3.2.3 xxh128-zstd--23] real: 2.61s user: 1.00s sys: 0.78s cpu: 68% maxmem: 3928 KB cswaits: 11782

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -22 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-22-051220-154736.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--22] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--22] total bytes: 773951797 sent bytes: 368468575 (147409074.80 per second)
[rsync 3.2.3 xxh128-zstd--22] transfer speed (MB/s): 135.6752 speedup: 2.10
[rsync 3.2.3 xxh128-zstd--22] real: 2.59s user: 1.02s sys: 0.75s cpu: 68% maxmem: 3928 KB cswaits: 11721

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -21 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-21-051220-154741.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--21] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--21] total bytes: 773951797 sent bytes: 366791851 (104813132.29 per second)
[rsync 3.2.3 xxh128-zstd--21] transfer speed (MB/s): 128.1318 speedup: 2.11
[rsync 3.2.3 xxh128-zstd--21] real: 2.73s user: 1.23s sys: 0.87s cpu: 76% maxmem: 3928 KB cswaits: 11637

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -20 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-20-051220-154748.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--20] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--20] total bytes: 773951797 sent bytes: 365387281 (146176557.20 per second)
[rsync 3.2.3 xxh128-zstd--20] transfer speed (MB/s): 133.5097 speedup: 2.12
[rsync 3.2.3 xxh128-zstd--20] real: 2.61s user: 1.03s sys: 0.76s cpu: 68% maxmem: 3928 KB cswaits: 11623

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -19 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-19-051220-154753.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--19] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--19] total bytes: 773951797 sent bytes: 364009669 (104018223.14 per second)
[rsync 3.2.3 xxh128-zstd--19] transfer speed (MB/s): 130.0174 speedup: 2.13
[rsync 3.2.3 xxh128-zstd--19] real: 2.67s user: 1.13s sys: 0.79s cpu: 72% maxmem: 3928 KB cswaits: 11695

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -18 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-18-051220-154759.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--18] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--18] total bytes: 773951797 sent bytes: 362301545 (103530187.71 per second)
[rsync 3.2.3 xxh128-zstd--18] transfer speed (MB/s): 134.9678 speedup: 2.14
[rsync 3.2.3 xxh128-zstd--18] real: 2.56s user: 1.19s sys: 0.85s cpu: 80% maxmem: 3928 KB cswaits: 11559

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -17 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-17-051220-154805.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--17] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--17] total bytes: 773951797 sent bytes: 360364658 (102976791.43 per second)
[rsync 3.2.3 xxh128-zstd--17] transfer speed (MB/s): 129.6869 speedup: 2.15
[rsync 3.2.3 xxh128-zstd--17] real: 2.65s user: 1.10s sys: 0.82s cpu: 72% maxmem: 3928 KB cswaits: 11525

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -16 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-16-051220-154811.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--16] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--16] total bytes: 773951797 sent bytes: 357973074 (102293481.71 per second)
[rsync 3.2.3 xxh128-zstd--16] transfer speed (MB/s): 128.8263 speedup: 2.16
[rsync 3.2.3 xxh128-zstd--16] real: 2.65s user: 1.08s sys: 0.80s cpu: 71% maxmem: 3928 KB cswaits: 11369

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -15 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-15-051220-154817.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--15] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--15] total bytes: 773951797 sent bytes: 355878668 (101695080.00 per second)
[rsync 3.2.3 xxh128-zstd--15] transfer speed (MB/s): 130.0353 speedup: 2.17
[rsync 3.2.3 xxh128-zstd--15] real: 2.61s user: 1.05s sys: 0.75s cpu: 69% maxmem: 3928 KB cswaits: 11494

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -14 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-14-051220-154823.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--14] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--14] total bytes: 773951797 sent bytes: 353352063 (100973192.86 per second)
[rsync 3.2.3 xxh128-zstd--14] transfer speed (MB/s): 128.6193 speedup: 2.19
[rsync 3.2.3 xxh128-zstd--14] real: 2.62s user: 1.04s sys: 0.77s cpu: 69% maxmem: 3928 KB cswaits: 11436

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -13 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-13-051220-154829.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--13] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--13] total bytes: 773951797 sent bytes: 350327835 (100109127.71 per second)
[rsync 3.2.3 xxh128-zstd--13] transfer speed (MB/s): 126.5525 speedup: 2.21
[rsync 3.2.3 xxh128-zstd--13] real: 2.64s user: 1.10s sys: 0.71s cpu: 68% maxmem: 3928 KB cswaits: 11324

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -12 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-12-051220-154835.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--12] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--12] total bytes: 773951797 sent bytes: 347623477 (99336454.00 per second)
[rsync 3.2.3 xxh128-zstd--12] transfer speed (MB/s): 126.5341 speedup: 2.23
[rsync 3.2.3 xxh128-zstd--12] real: 2.62s user: 1.02s sys: 0.79s cpu: 69% maxmem: 3924 KB cswaits: 11320

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -11 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-11-051220-154841.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--11] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--11] total bytes: 773951797 sent bytes: 345086348 (98611560.00 per second)
[rsync 3.2.3 xxh128-zstd--11] transfer speed (MB/s): 126.0919 speedup: 2.24
[rsync 3.2.3 xxh128-zstd--11] real: 2.61s user: 1.06s sys: 0.75s cpu: 69% maxmem: 3928 KB cswaits: 11270

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -10 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-10-051220-154847.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--10] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--10] total bytes: 773951797 sent bytes: 342864256 (137167347.20 per second)
[rsync 3.2.3 xxh128-zstd--10] transfer speed (MB/s): 132.3809 speedup: 2.26
[rsync 3.2.3 xxh128-zstd--10] real: 2.47s user: 1.03s sys: 0.78s cpu: 73% maxmem: 3928 KB cswaits: 11279

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -9 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-9-051220-154853.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--9] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--9] total bytes: 773951797 sent bytes: 340324908 (136151608.00 per second)
[rsync 3.2.3 xxh128-zstd--9] transfer speed (MB/s): 122.4751 speedup: 2.27
[rsync 3.2.3 xxh128-zstd--9] real: 2.65s user: 1.10s sys: 0.73s cpu: 69% maxmem: 3928 KB cswaits: 11151

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -8 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-8-051220-154859.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--8] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--8] total bytes: 773951797 sent bytes: 338075130 (135251696.80 per second)
[rsync 3.2.3 xxh128-zstd--8] transfer speed (MB/s): 122.5907 speedup: 2.29
[rsync 3.2.3 xxh128-zstd--8] real: 2.63s user: 1.07s sys: 0.76s cpu: 69% maxmem: 3928 KB cswaits: 11095

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -7 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-7-051220-154905.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--7] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--7] total bytes: 773951797 sent bytes: 335401888 (134182400.00 per second)
[rsync 3.2.3 xxh128-zstd--7] transfer speed (MB/s): 121.6213 speedup: 2.31
[rsync 3.2.3 xxh128-zstd--7] real: 2.63s user: 1.08s sys: 0.76s cpu: 70% maxmem: 3932 KB cswaits: 11082

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -6 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-6-051220-154910.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--6] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--6] total bytes: 773951797 sent bytes: 332796193 (95100087.14 per second)
[rsync 3.2.3 xxh128-zstd--6] transfer speed (MB/s): 113.3497 speedup: 2.33
[rsync 3.2.3 xxh128-zstd--6] real: 2.80s user: 1.31s sys: 0.90s cpu: 79% maxmem: 3932 KB cswaits: 10875

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -5 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-5-051220-154917.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--5] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--5] total bytes: 773951797 sent bytes: 330272064 (132130470.40 per second)
[rsync 3.2.3 xxh128-zstd--5] transfer speed (MB/s): 113.7082 speedup: 2.34
[rsync 3.2.3 xxh128-zstd--5] real: 2.77s user: 1.23s sys: 0.87s cpu: 75% maxmem: 3940 KB cswaits: 10954

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-4-051220-154923.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--4] total bytes: 773951797 sent bytes: 328438754 (131397146.40 per second)
[rsync 3.2.3 xxh128-zstd--4] transfer speed (MB/s): 116.8744 speedup: 2.36
[rsync 3.2.3 xxh128-zstd--4] real: 2.68s user: 1.10s sys: 0.77s cpu: 70% maxmem: 3936 KB cswaits: 10959

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -3 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-3-051220-154929.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--3] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--3] total bytes: 773951797 sent bytes: 325494790 (130219560.80 per second)
[rsync 3.2.3 xxh128-zstd--3] transfer speed (MB/s): 114.9688 speedup: 2.38
[rsync 3.2.3 xxh128-zstd--3] real: 2.70s user: 1.16s sys: 0.74s cpu: 70% maxmem: 3944 KB cswaits: 10794

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -2 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-2-051220-154935.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--2] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--2] total bytes: 773951797 sent bytes: 323523844 (129431182.40 per second)
[rsync 3.2.3 xxh128-zstd--2] transfer speed (MB/s): 120.9946 speedup: 2.39
[rsync 3.2.3 xxh128-zstd--2] real: 2.55s user: 1.18s sys: 0.73s cpu: 75% maxmem: 3944 KB cswaits: 10758

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl -1 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl-1-051220-154940.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd--1] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd--1] total bytes: 773951797 sent bytes: 319706428 (91360154.29 per second)
[rsync 3.2.3 xxh128-zstd--1] transfer speed (MB/s): 111.2758 speedup: 2.42
[rsync 3.2.3 xxh128-zstd--1] real: 2.74s user: 1.20s sys: 0.74s cpu: 71% maxmem: 3948 KB cswaits: 10644

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 0 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl0-051220-154947.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-0] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-0] total bytes: 773951797 sent bytes: 303996691 (121620321.20 per second)
[rsync 3.2.3 xxh128-zstd-0] transfer speed (MB/s): 97.9438 speedup: 2.55
[rsync 3.2.3 xxh128-zstd-0] real: 2.96s user: 1.59s sys: 0.73s cpu: 78% maxmem: 6248 KB cswaits: 8623

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 1 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl1-051220-154953.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-1] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-1] total bytes: 773951797 sent bytes: 310921418 (88850151.43 per second)
[rsync 3.2.3 xxh128-zstd-1] transfer speed (MB/s): 105.8992 speedup: 2.49
[rsync 3.2.3 xxh128-zstd-1] real: 2.80s user: 1.38s sys: 0.72s cpu: 75% maxmem: 3988 KB cswaits: 10258

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 2 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl2-051220-154959.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-2] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-2] total bytes: 773951797 sent bytes: 307790964 (87955736.00 per second)
[rsync 3.2.3 xxh128-zstd-2] transfer speed (MB/s): 102.9938 speedup: 2.51
[rsync 3.2.3 xxh128-zstd-2] real: 2.85s user: 1.39s sys: 0.75s cpu: 75% maxmem: 4708 KB cswaits: 10199

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 3 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl3-051220-155005.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-3] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-3] total bytes: 773951797 sent bytes: 303996691 (86871658.00 per second)
[rsync 3.2.3 xxh128-zstd-3] transfer speed (MB/s): 98.6101 speedup: 2.55
[rsync 3.2.3 xxh128-zstd-3] real: 2.94s user: 1.52s sys: 0.77s cpu: 78% maxmem: 6248 KB cswaits: 9188

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl4-051220-155011.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-4] total bytes: 773951797 sent bytes: 303988206 (86869233.71 per second)
[rsync 3.2.3 xxh128-zstd-4] transfer speed (MB/s): 93.8206 speedup: 2.55
[rsync 3.2.3 xxh128-zstd-4] real: 3.09s user: 1.73s sys: 0.76s cpu: 80% maxmem: 7532 KB cswaits: 8591

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 5 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl5-051220-155018.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-5] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-5] total bytes: 773951797 sent bytes: 301135733 (66931076.67 per second)
[rsync 3.2.3 xxh128-zstd-5] transfer speed (MB/s): 60.4600 speedup: 2.57
[rsync 3.2.3 xxh128-zstd-5] real: 4.75s user: 3.42s sys: 0.76s cpu: 88% maxmem: 8540 KB cswaits: 8391

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc zstd --zl 6 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvl6-051220-155026.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-zstd-6] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-zstd-6] total bytes: 773951797 sent bytes: 299686228 (54498243.64 per second)
[rsync 3.2.3 xxh128-zstd-6] transfer speed (MB/s): 55.9301 speedup: 2.58
[rsync 3.2.3 xxh128-zstd-6] real: 5.11s user: 3.95s sys: 0.80s cpu: 93% maxmem: 9560 KB cswaits: 8355

csv log: /home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvls-051220-154002.csv
```
```
cat /home/rsync-benchmarks/rsyncbench-xxh128-zstd-lvls-051220-154002.csv
version,comp-type,comp-lvl,speed,time,bytes-sent
rsync-3.2.3,zstd,-100,526.6422,0.91,502524238
rsync-3.2.3,zstd,-99,193.2164,2.48,502453274
rsync-3.2.3,zstd,-98,194.6307,2.46,502049349
rsync-3.2.3,zstd,-97,182.3190,2.62,500879501
rsync-3.2.3,zstd,-96,192.1051,2.48,499563263
rsync-3.2.3,zstd,-95,193.1204,2.46,498153689
rsync-3.2.3,zstd,-94,191.7020,2.47,496505085
rsync-3.2.3,zstd,-93,186.8039,2.53,495571690
rsync-3.2.3,zstd,-92,202.3449,2.33,494365618
rsync-3.2.3,zstd,-91,187.4978,2.51,493480440
rsync-3.2.3,zstd,-90,189.8933,2.47,491820410
rsync-3.2.3,zstd,-89,188.4982,2.48,490183797
rsync-3.2.3,zstd,-88,176.0796,2.65,489277129
rsync-3.2.3,zstd,-87,189.1803,2.46,487990191
rsync-3.2.3,zstd,-86,188.1084,2.47,487197617
rsync-3.2.3,zstd,-85,183.2419,2.53,486122201
rsync-3.2.3,zstd,-84,200.1395,2.31,484780234
rsync-3.2.3,zstd,-83,180.1098,2.56,483478631
rsync-3.2.3,zstd,-82,177.6615,2.59,482495260
rsync-3.2.3,zstd,-81,184.4255,2.49,481526759
rsync-3.2.3,zstd,-80,183.1664,2.50,480159728
rsync-3.2.3,zstd,-79,184.1026,2.48,478753157
rsync-3.2.3,zstd,-78,181.3459,2.51,477288999
rsync-3.2.3,zstd,-77,178.3556,2.55,476899601
rsync-3.2.3,zstd,-76,195.7520,2.32,476205412
rsync-3.2.3,zstd,-75,183.0673,2.48,476060832
rsync-3.2.3,zstd,-74,194.7425,2.33,475791488
rsync-3.2.3,zstd,-73,181.0862,2.51,476605516
rsync-3.2.3,zstd,-72,172.6800,2.64,478019952
rsync-3.2.3,zstd,-71,180.4662,2.53,478758547
rsync-3.2.3,zstd,-70,183.3252,2.48,476731459
rsync-3.2.3,zstd,-69,180.6880,2.50,473662800
rsync-3.2.3,zstd,-68,177.9986,2.52,470345777
rsync-3.2.3,zstd,-67,176.7558,2.52,467061682
rsync-3.2.3,zstd,-66,186.7380,2.37,464067371
rsync-3.2.3,zstd,-65,172.3181,2.56,462563095
rsync-3.2.3,zstd,-64,174.6019,2.52,461370332
rsync-3.2.3,zstd,-63,168.5962,2.60,459643528
rsync-3.2.3,zstd,-62,175.6367,2.49,458579559
rsync-3.2.3,zstd,-61,172.4670,2.53,457537488
rsync-3.2.3,zstd,-60,162.9172,2.67,456119111
rsync-3.2.3,zstd,-59,173.3303,2.50,454375186
rsync-3.2.3,zstd,-58,182.6010,2.36,451871677
rsync-3.2.3,zstd,-57,161.6724,2.65,449243392
rsync-3.2.3,zstd,-56,169.8279,2.51,446974550
rsync-3.2.3,zstd,-55,169.0584,2.51,444949319
rsync-3.2.3,zstd,-54,165.1974,2.56,443448644
rsync-3.2.3,zstd,-53,167.6594,2.51,441267106
rsync-3.2.3,zstd,-52,167.2334,2.50,438392569
rsync-3.2.3,zstd,-51,164.1281,2.53,435415113
rsync-3.2.3,zstd,-50,174.5212,2.37,433707259
rsync-3.2.3,zstd,-49,161.6907,2.55,432339753
rsync-3.2.3,zstd,-48,162.3431,2.53,430679674
rsync-3.2.3,zstd,-47,161.2069,2.54,429355974
rsync-3.2.3,zstd,-46,159.4171,2.56,427932036
rsync-3.2.3,zstd,-45,151.5503,2.68,425884343
rsync-3.2.3,zstd,-44,159.9943,2.52,422770844
rsync-3.2.3,zstd,-43,155.7068,2.57,419605077
rsync-3.2.3,zstd,-42,166.7826,2.38,416224609
rsync-3.2.3,zstd,-41,154.5277,2.55,413186825
rsync-3.2.3,zstd,-40,154.4071,2.54,411245457
rsync-3.2.3,zstd,-39,152.3280,2.56,408902519
rsync-3.2.3,zstd,-38,152.1253,2.55,406763185
rsync-3.2.3,zstd,-37,150.7670,2.56,404712276
rsync-3.2.3,zstd,-36,142.1817,2.70,402538714
rsync-3.2.3,zstd,-35,148.0491,2.58,400521259
rsync-3.2.3,zstd,-34,158.7088,2.39,397739780
rsync-3.2.3,zstd,-33,145.7463,2.58,394291346
rsync-3.2.3,zstd,-32,144.9344,2.57,390575206
rsync-3.2.3,zstd,-31,138.7067,2.67,388336938
rsync-3.2.3,zstd,-30,142.9108,2.58,386620494
rsync-3.2.3,zstd,-29,143.7667,2.55,384413549
rsync-3.2.3,zstd,-28,140.6768,2.59,382051851
rsync-3.2.3,zstd,-27,139.7193,2.59,379451361
rsync-3.2.3,zstd,-26,146.0231,2.46,376666143
rsync-3.2.3,zstd,-25,133.7113,2.67,374351489
rsync-3.2.3,zstd,-24,137.6120,2.58,372285599
rsync-3.2.3,zstd,-23,135.3652,2.61,370465323
rsync-3.2.3,zstd,-22,135.6752,2.59,368468575
rsync-3.2.3,zstd,-21,128.1318,2.73,366791851
rsync-3.2.3,zstd,-20,133.5097,2.61,365387281
rsync-3.2.3,zstd,-19,130.0174,2.67,364009669
rsync-3.2.3,zstd,-18,134.9678,2.56,362301545
rsync-3.2.3,zstd,-17,129.6869,2.65,360364658
rsync-3.2.3,zstd,-16,128.8263,2.65,357973074
rsync-3.2.3,zstd,-15,130.0353,2.61,355878668
rsync-3.2.3,zstd,-14,128.6193,2.62,353352063
rsync-3.2.3,zstd,-13,126.5525,2.64,350327835
rsync-3.2.3,zstd,-12,126.5341,2.62,347623477
rsync-3.2.3,zstd,-11,126.0919,2.61,345086348
rsync-3.2.3,zstd,-10,132.3809,2.47,342864256
rsync-3.2.3,zstd,-9,122.4751,2.65,340324908
rsync-3.2.3,zstd,-8,122.5907,2.63,338075130
rsync-3.2.3,zstd,-7,121.6213,2.63,335401888
rsync-3.2.3,zstd,-6,113.3497,2.80,332796193
rsync-3.2.3,zstd,-5,113.7082,2.77,330272064
rsync-3.2.3,zstd,-4,116.8744,2.68,328438754
rsync-3.2.3,zstd,-3,114.9688,2.70,325494790
rsync-3.2.3,zstd,-2,120.9946,2.55,323523844
rsync-3.2.3,zstd,-1,111.2758,2.74,319706428
rsync-3.2.3,zstd,0,97.9438,2.96,303996691
rsync-3.2.3,zstd,1,105.8992,2.80,310921418
rsync-3.2.3,zstd,2,102.9938,2.85,307790964
rsync-3.2.3,zstd,3,98.6101,2.94,303996691
rsync-3.2.3,zstd,4,93.8206,3.09,303988206
rsync-3.2.3,zstd,5,60.4600,4.75,301135733
rsync-3.2.3,zstd,6,55.9301,5.11,299686228
```

# rsync 3.2.3 with xxh128 + lz4 for compression levels 1 to 6

```
./rsync-benchmark.sh bench-lvl xxh128 lz4 6 /home/rsync-test/ /home/rsync-test-dst/    
/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --zl 1 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvl1-051220-160058.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4-1] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4-1] total bytes: 773951797 sent bytes: 385178200 (110066374.86 per second)
[rsync 3.2.3 xxh128-lz4-1] transfer speed (MB/s): 152.4209 speedup: 2.01
[rsync 3.2.3 xxh128-lz4-1] real: 2.41s user: 0.95s sys: 0.79s cpu: 72% maxmem: 2836 KB cswaits: 12410

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --zl 2 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvl2-051220-160104.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4-2] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4-2] total bytes: 773951797 sent bytes: 385178200 (110066374.86 per second)
[rsync 3.2.3 xxh128-lz4-2] transfer speed (MB/s): 141.8280 speedup: 2.01
[rsync 3.2.3 xxh128-lz4-2] real: 2.59s user: 0.93s sys: 0.83s cpu: 68% maxmem: 2836 KB cswaits: 12417

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --zl 3 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvl3-051220-160110.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4-3] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4-3] total bytes: 773951797 sent bytes: 385178200 (110066374.86 per second)
[rsync 3.2.3 xxh128-lz4-3] transfer speed (MB/s): 143.4900 speedup: 2.01
[rsync 3.2.3 xxh128-lz4-3] real: 2.56s user: 0.90s sys: 0.79s cpu: 66% maxmem: 2836 KB cswaits: 12450

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --zl 4 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvl4-051220-160116.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4-4] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4-4] total bytes: 773951797 sent bytes: 385178200 (154092924.80 per second)
[rsync 3.2.3 xxh128-lz4-4] transfer speed (MB/s): 144.0527 speedup: 2.01
[rsync 3.2.3 xxh128-lz4-4] real: 2.55s user: 0.88s sys: 0.80s cpu: 66% maxmem: 2836 KB cswaits: 12419

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --zl 5 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvl5-051220-160122.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4-5] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4-5] total bytes: 773951797 sent bytes: 385178200 (154092924.80 per second)
[rsync 3.2.3 xxh128-lz4-5] transfer speed (MB/s): 142.3777 speedup: 2.01
[rsync 3.2.3 xxh128-lz4-5] real: 2.58s user: 0.91s sys: 0.78s cpu: 65% maxmem: 2832 KB cswaits: 12425

/usr/local/bin/rsync -avzi --stats --cc xxh128 --zc lz4 --zl 6 --debug=NSTR --log-file=/home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvl6-051220-160128.log /home/rsync-test/ /home/rsync-test-dst/
[rsync 3.2.3 xxh128-lz4-6] files: 2,848 reg: 2,847, dir: 1
[rsync 3.2.3 xxh128-lz4-6] total bytes: 773951797 sent bytes: 385178200 (154092924.80 per second)
[rsync 3.2.3 xxh128-lz4-6] transfer speed (MB/s): 143.4900 speedup: 2.01
[rsync 3.2.3 xxh128-lz4-6] real: 2.56s user: 0.92s sys: 0.77s cpu: 66% maxmem: 2836 KB cswaits: 12414

csv log: /home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvls-051220-160058.csv
```
```
cat /home/rsync-benchmarks/rsyncbench-xxh128-lz4-lvls-051220-160058.csv
version,comp-type,comp-lvl,speed,time,bytes-sent
rsync-3.2.3,lz4,1,152.4209,2.41,385178200
rsync-3.2.3,lz4,2,141.8280,2.59,385178200
rsync-3.2.3,lz4,3,143.4900,2.56,385178200
rsync-3.2.3,lz4,4,144.0527,2.55,385178200
rsync-3.2.3,lz4,5,142.3777,2.58,385178200
rsync-3.2.3,lz4,6,143.4900,2.56,385178200
```