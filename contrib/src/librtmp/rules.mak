# librtmp

LIBRTMP_VERSION := git
LIBRTMP_GITURL = git://git.ffmpeg.org/rtmpdump

.sum-librtmp: librtmp-$(LIBRTMP_VERSION).tar.xz
	touch $@

DEPS_librtmp = gnutls $(DEPS_gnutls)

$(TARBALLS)/librtmp-$(LIBRTMP_VERSION).tar.xz:
	$(call download_git,$(LIBRTMP_GITURL))

librtmp: librtmp-$(LIBRTMP_VERSION).tar.xz .sum-librtmp
	$(UNPACK)
	$(MOVE)

.librtmp: librtmp
	cd $< && cd librtmp && $(MAKE) install CC="$(CC)" XCFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" CRYPTO=GNUTLS prefix="$(PREFIX)" SHARED=no
	touch $@

