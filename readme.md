# custom rsync RPM for Centmin Mod LEMP stacks

Custom rsync RPMs for CentOS 7 64bit based Centmin Mod LEMP stacks

* rsync 3.1.3
* rsync 3.1.4 [dev build log](https://git.samba.org/?p=rsync.git;a=shortlog)

CentOS 7 stock distro rsync version

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

Custom rsync 3.1.3

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