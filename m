Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360187;
	b=W8mVztiMVsV5jl7SO+z00lfDZr1Fs1bqj1jhKYf0fdJwLGE1TS/hbnhS3ewhssUU529e
	 sQysT8Cb/DKefGwijrn3nSHxejVAXuOAQQAxZp6VH/GsT2nNQC+syxyUDW3/HBPLVVvDp
	 3ePNK4JeK/7hMiqfNveAwwnmHKmhDbalETGGFWmnkAhE9BREwjtwCcwiqA0IInndC9tEg
	 CPmvf/fwWYP9rqmuypUccpIghA381C9LJPjpyxF352rO9QzxL+YsfJi7Ck7GKqODfMlfk
	 w6+stAoylt1/OLQuEpt/fFAFqKdreCPTxWtIUgY73KmNiRGQF7h2l5Hb7YBgD9cVkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TxJ3rrWwCBf4mESTzPnieLzM7IFD8MPiDYpGVT65dNo=;
	b=glsFe+YDaF3tmyOiIABaUumOzRq+2CDKYx5N8pxMx1pnFWa51XmMQ2OBFHJzsij3ogRg
	 nfirgE/mr3bzWrV1a71NOKhVHYgV/VUnugVyw6CluMF85jCRJXxqYjsyN/OvYCfdmL3m6
	 6p0DuoX0Q8qHFJWjHcs9ePVs5zIfHNQ+Q+kYJdtrqnQq12mvTVs3e1hQbqsQnxP7lEBQM
	 gOBSRZeX14aTMnKHWgrbCw5CDbt3KaYfRz9ujq8ETh2yhyKXuRqqNEr7rGD24YpF2+FMj
	 UEALCslu8/WNPN3KmAIzP1c42IB8F4BLG43lPE0WsdIAspS86+SoKvAIUUDlM0a4DJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=cZWMZ6MO;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704FA606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=cZWMZ6MO
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso93553166b.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793360186; x=1793964986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxJ3rrWwCBf4mESTzPnieLzM7IFD8MPiDYpGVT65dNo=;
        b=cZWMZ6MO7RYGRYQSbj/+mT8fvKkGy+0gbIgwSCXyNSaNAED88GzvyxBheBmBALzBJu
         wlh1l3aO6JGq7aAJ6sNEDz6/F0/i8MbLQVLPxY0CuUZd2b2Mw2kjyFAn7ZcYw0qqfqjo
         yeqegC0jHWIcWTfQgInQDsQLPrnUx1ntqoHf3rhX1h9pwzT66nwm2vHRQCjDPblkxdjF
         AcskdYCK56QneGxSvbBz2SMcqQ0RQuhwPozF13GtGQLku51ecKk2ajDBq9OPDADXw6ZX
         Cl00+NsohbAoMWs+tDCUh6vZhptkNpTgPGkuI1YjnHkiJA3NMitFyupvMKBLXtHlZ//h
         bneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360186; x=1793964986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxJ3rrWwCBf4mESTzPnieLzM7IFD8MPiDYpGVT65dNo=;
        b=E3k4ljlylmOO7n5YcGhslVDswR1Y0xPy/MTgun3hstubkk/DjT8Hfzvrxb1JYlChsF
         +NvuRtlH8WPOfj29T66E9tmA+RFJkefqHZ9X9fFmIqoabbzSckDQlywE8VK7px+Z1FV8
         Q0cCOkW2sywwgB4vS/kzlaW5wEK5xH+hdQEG+vvPrY2f+lqVFsfAyYRRxoExwsTm+0nw
         9qQaL6uYVk5ONe6TK69NqKXpM/pFG30yGAuL5lq8aNGkcuNVA579GToQvehZnc3AkRsh
         EkxyTJ9JB52qNtZddeUbseM4EaupGF6sNvURjUf4U+4gcDHWJ5N+ni6TQf8QTn5LQJWA
         Jkkw==
X-Gm-Message-State: AFq9FYLAC2GFwzeKSK/u9RN7IY9gCy0BlMVvOf9y77yjP5jadgdOGvgJ
	yykJHiAgBcfnQCtLOqr1/5Rp5em800ZDk8ZLuWn3lz+7l2Q9JxNruQS2hIG4WA==
X-Gm-Gg: AYBFou1hNQwalF0gquCk61N8HcAnh8Bzyi7EhMg97sg69FV4OgWspaeDfUpapNop4Hm
	pVC5cnQRDysuPAUCWpClMPgMhyccF6ncvWtcQxR1HV0KwTP4aEzbtzPr57Y69wY8EttOZ+Lu0XE
	mXQxdrFOeDhGZUnfFK1lzaC+jZSj33oPRg0+YL6KFuR+1+ysPRUEESPsgpXwjMQI6+Bsyb3Gkrc
	NEaRLoyTPE0w4v5sQJMXq3mcX5NNO60S6aedRDjJaJXzn+KYETaH25SxH3//RE8mDtiI5DQn366
	HQcR2qw0XP0xa2K4isUB4MMeJWq+dobXnV9eN0VD8hWeYP1XGqSMZ6zRIS3hJW/IeOi/JTbmEra
	QwaJLh+ElmLpl3L3RfQLyK9pVThf+z1zVBjgvqKQwvUap6TI6JGkzfpyXu7ARB3S9kn/xjK7/IB
	I/Dg8WdiIU9WlRaXRDbReFgBkjOzB+BMDEGWfMQ40eNyN701MCcR36I6+ao36qPWdBg90h8BisJ
	hVPNxeZjIPMk0U8nv7OB/xNf/2iMeQXNoi5uVUpRd47Ho1Bg4qkz0lI4XxaxcJKUzIYyuWh9U7T
	K/ljeiXPD1/p1iX3NlPSvJNk94hrZBaDZet8JAMWSR/Di8CDZmlWp+ZZ2MUKrmC3+rTuMhemoMn
	aaw==
X-Received: by 2002:a17:907:160f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c4ca7ac0de2mr182839666b.42.1793360185602;
        Fri, 30 Oct 2026 04:36:25 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc19167sm56815966b.10.2026.10.30.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:36:25 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH libgpiod v3] build: honor default_library for the installed libraries
Date: Fri, 30 Oct 2026 12:36:20 +0100
Message-Id: <20261030113620.1091481-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yegor Yefremov <yegorslists@googlemail.com>

The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib,
libgpiodbus and libgpiosim) are built with both_libraries(), so the
shared variant is always built, even with -Ddefault_library=static.
When the toolchain or the environment requests a fully static link
(e.g. LDFLAGS=-static, as done by Buildroot for static-only builds),
linking the shared library then fails:

  FAILED: lib/libgpiod.so.3.1.2
  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Use library() instead, which follows default_library, and set
default_library=both in the project's default options, so that a
default build still installs both the shared and static libraries. As
library() returns an object behaving like the shared library when both
are built, the users of these objects (link_with, pkgconfig.generate,
generate_gir, full_path) keep working as before.

The Rust bindings always link against the static libgpiosim. With
default_library=shared, build a static archive from the objects of the
shared libgpiosim for them, which is neither installed nor built by
default.

With default_library=static, generate_gir() would get the static
libgpiod-glib, but meson's gnome module does not pass internal static
libraries to g-ir-scanner, so linking libgpiod-glib.a then fails with
undefined references to libgpiod. A typelib for a static-only library
would also be useless, as it has no shared library to load at runtime.
Disable introspection when only static libraries are built, and error
out if it was explicitly enabled.

With a default build, the only change in the installed files is that
libgpiotools, already declared with library(), is now also installed as
a static library, like the other libraries.

Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v2 -> v3:
- also convert libgpiosim, which is installed too and still built the
  shared library with default_library=static; keep providing a static
  libgpiosim for the Rust bindings with default_library=shared

Changes v1 -> v2:
- disable introspection with default_library=static, as meson does
  not pass internal static libraries to g-ir-scanner (Bartosz)

 bindings/cxx/meson.build  |  3 +--
 bindings/glib/meson.build |  3 +--
 dbus/lib/meson.build      |  3 +--
 lib/meson.build           |  3 +--
 meson.build               |  6 ++++++
 tests/gpiosim/meson.build | 17 ++++++++++++++---
 6 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
index 92625b5..a23c70a 100644
--- a/bindings/cxx/meson.build
+++ b/bindings/cxx/meson.build
@@ -3,7 +3,7 @@
 
 cxx_inc = include_directories('.', '../../include')
 
-libgpiodcxx_both = both_libraries('gpiodcxx',
+libgpiodcxx_lib = library('gpiodcxx',
   sources: [
     'chip.cpp',
     'chip-info.cpp',
@@ -29,7 +29,6 @@ libgpiodcxx_both = both_libraries('gpiodcxx',
   soversion: libgpiodcxx_soversion,
   install: true,
 )
-libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
 
 install_headers('gpiod.hpp')
 
diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
index 0ccd8e8..17e071c 100644
--- a/bindings/glib/meson.build
+++ b/bindings/glib/meson.build
@@ -61,7 +61,7 @@ glib_public_headers = files(
 
 glib_inc = include_directories('.', '../../include')
 
-libgpiod_glib_both = both_libraries('gpiod-glib',
+libgpiod_glib_lib = library('gpiod-glib',
   sources: glib_sources + [gen_enum_c, gen_enum_h],
   include_directories: glib_inc,
   c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'] + profiling_c_args,
@@ -71,7 +71,6 @@ libgpiod_glib_both = both_libraries('gpiod-glib',
   soversion: libgpiod_glib_soversion,
   install: true,
 )
-libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
 
 install_headers('gpiod-glib.h')
 
diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
index 9acf5e1..12cff4a 100644
--- a/dbus/lib/meson.build
+++ b/dbus/lib/meson.build
@@ -14,7 +14,7 @@ generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
 
 dbus_lib_inc = include_directories('.', '../../include')
 
-libgpiodbus_both = both_libraries('gpiodbus',
+libgpiodbus_lib = library('gpiodbus',
   sources: ['gpiodbus.h', generated_dbus],
   include_directories: dbus_lib_inc,
   c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
@@ -22,7 +22,6 @@ libgpiodbus_both = both_libraries('gpiodbus',
   soversion: 1,
   install: true,
 )
-libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
 
 install_data('io.gpiod1.xml',
   install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
diff --git a/lib/meson.build b/lib/meson.build
index ea1d92c..fb09b71 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
 
-libgpiod_both = both_libraries('gpiod',
+libgpiod_lib = library('gpiod',
   sources: [
     'chip.c',
     'chip-info.c',
@@ -22,7 +22,6 @@ libgpiod_both = both_libraries('gpiod',
   soversion: libgpiod_soversion,
   install: true,
 )
-libgpiod_lib = libgpiod_both.get_shared_lib()
 
 pkgconfig = import('pkgconfig')
 pkgconfig.generate(libgpiod_lib,
diff --git a/meson.build b/meson.build
index b70098b..c92179c 100644
--- a/meson.build
+++ b/meson.build
@@ -6,6 +6,7 @@ project('libgpiod', 'c',
   license: 'LGPL-2.1-or-later',
   default_options: [
     'c_std=gnu89',
+    'default_library=both',
     'cpp_std=gnu++17',
     'warning_level=2',
   ],
@@ -79,6 +80,11 @@ if opt_introspection.enabled()
     'introspection requires -Dbindings-glib=enabled')
 endif
 
+# Introspection requires the shared library.
+opt_introspection = opt_introspection.require(
+  get_option('default_library') != 'static',
+  error_message: 'introspection requires -Ddefault_library=shared or both')
+
 # systemd requires D-Bus.
 if opt_systemd.enabled()
   assert(opt_dbus.allowed(),
diff --git a/tests/gpiosim/meson.build b/tests/gpiosim/meson.build
index 078a241..6f6b78b 100644
--- a/tests/gpiosim/meson.build
+++ b/tests/gpiosim/meson.build
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
 
-libgpiosim_both = both_libraries('gpiosim',
+libgpiosim_lib = library('gpiosim',
   sources: ['gpiosim.c'],
   c_args: ['-fvisibility=hidden'],
   dependencies: [libkmod_dep, mount_dep, threads_dep],
@@ -9,8 +9,19 @@ libgpiosim_both = both_libraries('gpiosim',
   soversion: libgpiosim_soversion,
   install: true,
 )
-libgpiosim_lib = libgpiosim_both.get_shared_lib()
-libgpiosim_static = libgpiosim_both.get_static_lib()
+
+# The Rust bindings always link against the static libgpiosim.
+if get_option('default_library') == 'both'
+  libgpiosim_static = libgpiosim_lib.get_static_lib()
+elif get_option('default_library') == 'static'
+  libgpiosim_static = libgpiosim_lib
+else
+  libgpiosim_static = static_library('gpiosim',
+    objects: libgpiosim_lib.extract_all_objects(recursive: false),
+    build_by_default: false,
+  )
+endif
+
 libgpiosim_inc = include_directories('.')
 
 executable('gpiosim-selftest',
-- 
2.55.0

