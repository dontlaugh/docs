+++
title = "Packages"
description = "Information about packaging software"
+++

## Debian

https://askubuntu.com/questions/71510/how-do-i-create-a-ppa

[Control files](https://www.debian.org/doc/debian-policy/ch-controlfields.html)
[Required files in debian directory structure](https://www.debian.org/doc/manuals/maint-guide/dreq.en.html)

tools:
* debmake
* build-essential
* devscripts
  * debsign
  * 
* mc (Midnight Commander)
* git

```
DEBEMAIL="your.email.address@example.org"
DEBFULLNAME="Firstname Lastname"
export DEBEMAIL DEBFULLNAME
```

## RPM

https://rpm-packaging-guide.github.io/#preparing-software-for-packaging

https://rpm.org/

## Arch

---

## Makefile

```make
prefix = /usr/local

all: src/hello

src/hello: src/hello.c
        @echo "CFLAGS=$(CFLAGS)" | \
                fold -s -w 70 | \
                sed -e 's/^/# /'
        $(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/hello
        install -D src/hello \
                $(DESTDIR)$(prefix)/bin/hello

clean:
        -rm -f src/hello

distclean: clean

uninstall:
        -rm -f $(DESTDIR)$(prefix)/bin/hello

.PHONY: all install clean distclean uninstall
```

---

## Create Debian chroot



## Input: a source tarball

1. untar
