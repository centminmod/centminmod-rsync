# custom rsync RPM for Centmin Mod LEMP stacks

Custom rsync RPMs for CentOS 7 64bit based Centmin Mod LEMP stacks

* rsync 3.2.3 no avx2 and avx2 yum packages with xxHash & zstd support
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