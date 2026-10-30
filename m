Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357199;
	b=dVp/nZQTmLDd4vfUSz2JrjlgSyzhKRnOL5rdG9IVQVlhdoN5xCLVkMDC5uItMX/0ZAMA
	 ACaFXGxehW9GE2/C9wEkaS8cvmvZdbCvtrfQ3sfLk8c98laFVt2AdQj12QIYb9NFPABmP
	 M92dmXnp0sT7hn+5glkj5Xd/HByORoPUehI8aMO3eM2loQF6pv0f99RVa6CLzv9hFsXP3
	 jCCren9QySVN2lQQkJoKhOT40APT22k548U37+8S/n8q5S3r8n6+g2Ry74NVbrww3sWh8
	 3nNwrRESUu4wZ5pSyONEysv0dFqifnA5bH2eVsF1Geo3oxm1V5x3ktdZfc7KtWH8uBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TxJ3rrWwCBf4mESTzPnieLzM7IFD8MPiDYpGVT65dNo=;
	b=HEvL2NQF7p9RwJgz0H7nrkzJ2Qvg8F7Wwzc5RB/zH7fWXCLQFPaJYUBQeUUE07xwtWc5
	 YlS4Bg8TntiBtPeq517VrvWw25zn0vXkPs0xFCu/jjjWPRZT+XfOS2gQS9vZTVWABiKAg
	 /ET6+CDNvaBd60CQGtlvTNsCCKEhx3+Y+gFhHz79KZGS9n7RUVn5zyqyfd0qz8ZldQ+1S
	 OdCH2wW8GlzdrjPy+6bSIHj+WNaSsr5FVM85FjwmqQ2iy41ivOtzIjBSZue2dROHtlM39
	 ZFEB9zzl+Za3aef6U1A5B4Ec4Z18UxU2bRPmJkZj3RItBGGhhis416J/7osOn4dOFMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zw4Anzgm;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83713606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 10:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83713606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zw4Anzgm
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c43fbcb4393so79818766b.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793357197; x=1793961997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxJ3rrWwCBf4mESTzPnieLzM7IFD8MPiDYpGVT65dNo=;
        b=zw4AnzgmgxnV2LkYfgGv3ZID0GsmZRAB9S+IcHAcqvKkFoI87U5pj2uKaWlqe5U4mJ
         HBFpyEKG+29WYANzruygnGv6/jwcR5RbfoI6/H1pvyuyr2oc1tGLVxBQbC9QuSFed/+/
         gKGzNz/089SlUoXdo9iphzqENwaZNkKG3B0HNmF+toPHpalbvHWPJ/uXbytLWAEm19d2
         OVunQwd8dAko1MomEsZX9hSZmpPV616BYBMLDFd6eIqCMWN7m1H2vBJj1CUgoCun7FKG
         w4uZHM6L/gK8jePvCqetQZI131NON2URiT3gGpxspMjJ+SRZ1nd9mxRkAyIo56z27JRA
         HBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357197; x=1793961997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxJ3rrWwCBf4mESTzPnieLzM7IFD8MPiDYpGVT65dNo=;
        b=G+hgNC9SAdJbJNLFIN6wnVxVr7NnktBW06JkjU1BbWA+IqeikNRfdqznwF2QdRtPBz
         qbNqLGuuGSBDMhFkGZCTe37TG28tHMI4QbtfYYMec3lzl5xgf1r2HNlZjQBJPYBs6sUY
         eDrji2R/6Bd5655dohiVg2TNBfLsdZCKpWWbATHdgUbBbmnLIof43JOw4ymHg7SCW1Au
         a8ZlX9XsBv9jdg9upxhutpa6F3nMVSCWOngHReTx/IBlKwiEI6abeqYUA3jCWE5TETqQ
         4aabaielv2xUdKEL0qBYX37i2uBPE3eYQInUw3JfyKb9ueK1zk3Fd83iPpRJfsaoBDU6
         hh8w==
X-Gm-Message-State: AFq9FYLxykM6cGEo1Fjo0GYWVROJMWgrFMFMjTJd+rpO3AwxTZO+CAlA
	GenWtLGT6a+CMbCx40prJvw6L+hw+XlToUL3y4er6irNEV4E/Bc9ciwGPmrbqQ==
X-Gm-Gg: AYBFou2HrVcbaUqbhCaMvt1FfWHX2SktH42TiD1UwhGwWmTEvquC8Zwy4+9dcDKu3KV
	BKLup0LDzPpHfkSfO6XWT/8wb7O6TFVq8gc4aO3DuqyLEWhp64cew6osk/pQKqV4n8H7BiO+VP1
	x9brImGijThN0Jw43YpiLMyZ+EFl5V+x23GnJpzUXaAoXgzwoFMOkzCHntMhLU2BLrb7Zj1HdpQ
	wFZhPzVxhL45O3WfC4OQluBxd+F78E3OOI/vO6SN8Diq2OT7UhA8Ms4JnAfLmpnSFpQD1aUn0oM
	sVSN7xMTSTiGkyf32yj3ax5GlHAYQi5y1ggVfiMKqFGcXBq2Qq1SSuO5DEX1/9L4F3A9D4Ha5Yh
	51vFQAZKoHCo1DNDvq52XyZ84yRE4aJTH204r20nda3dMvHPVm0aDFzDE2YeEX4RNwNvwdY2X0V
	qCyu0sTuuwoyuUcGtaOoJd6WZ19XsLL7iagGHtDagkzn2sHswcyOh25ULsUXyX/YlwSzbUVH49E
	ENWr8kkN2imJY2lT1kNQTXeDuGrJTB3ctw5444hCFfmaFzdr58z1HcLLkcvgv7el+I7NevX16Qc
	l1YF2t8O4ehVsa/Dav7UCUtTmBsllMi/MWMadTWuo/9HCPb+EuGEPYx6sTObz/7j8b3qucsgB97
	qll8=
X-Received: by 2002:a17:907:e84a:b0:c49:901c:d9f with SMTP id a640c23a62f3a-c4ca7ad1408mr186303366b.49.1793357196832;
        Fri, 30 Oct 2026 03:46:36 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4d6e1sm49973366b.62.2026.10.30.03.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:46:36 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH libgpiod v3] build: honor default_library for the installed libraries
Date: Fri, 30 Oct 2026 11:46:31 +0100
Message-Id: <20261030104631.1044556-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024123124.3700266-1-yegorslists@googlemail.com>
References: <20261024123124.3700266-1-yegorslists@googlemail.com>
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

