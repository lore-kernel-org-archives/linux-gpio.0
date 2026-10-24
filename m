Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792845087;
	b=zJAb7Os/L/MHaMeh2rFF35MFUJrohts4qUoyLOzBf/C/Sij759SGOctS/fZkhK3M57V3
	 cyuWnkRcRn4Xdw2kj7ED5WONlkv+okhJF1z9Qda/92vMyGxJe9mdWJqsIflyEgAoaEt+e
	 yUepoQSfmoaueK6kyIhcWqO8JJxJI8/rkRF/R2hEZC21FcxTL2HaaFuSNNlhbZSMoWSTb
	 uVk2l64Vc8ZyDvQLdYNl7x9XkpCOZwUgALA8lmcADZB5s3lleAWx9EsSgkYRCA0qt9cCf
	 BC1P3yYCbBTAyfpwizg7gTGAqVSRP5YPq6Y/1nY0JW2kEpm7diV8oiJYj8lAvtYC4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2agfzSVxmvKyDDGsk/lrN8ke6f+kq8XMYiroN22OZac=;
	b=1O37bHvIp4Kt9GgyTC89uI4P24yJk6JMJm0Wg8seIGLlOCwbM69DxQSZjykQgDvnHd9J
	 BWLNqFyO4I9W3EjyhXWV2dBPXqPckMhWqiHFqYv7hvwMmvWtYxIf04g8qSi1QBUPhLUYb
	 BFfTCny2s3Kdn5LriTgIfun5EhVC0abdNucTMuV0l/W9t7NO02Ny3d6XSTGNb0mmM3Blh
	 QkAONLkFQOHgW7W6Mp2rr6RUH/TMXw5jWtpDRldJwHe1vQKFFwn5RnY4pU5E+JY+S+haB
	 bLXBWiU0UBd0qG+NoMV84lSPrS9w1ILv02YGrnYA89uUjsqtmipyqcr02vwtw5+JDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=UtAhHj+L;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9A606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 12:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=UtAhHj+L
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2529385a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792845085; x=1793449885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2agfzSVxmvKyDDGsk/lrN8ke6f+kq8XMYiroN22OZac=;
        b=UtAhHj+LrSP4gAhPemjShZLri6bRqWBtoApOzVXfKiEWSF8vHHEbTXysRbXE1Bmxmj
         UBSLWpYR3aLNCAFoplLz4kQ8CXTEFVwXeKDn7NMd65rreN9a4iZPK5eolAlaccdxBZ7/
         Iy3pi0Ld3Wf7gxrRAe2BdVKVacLAWnHjSysBcAzF/GyS/hMCpPyr+XZwcF913LrFFxBh
         zH2FGze0kJVasfASWs0/MYsUgH976bc5fJi+hMWsRR0GlQ4PpdVoUJ/PoIUMLS6TQykT
         7+z2LEzLHrejUY0EGXUzbFR7r/ig4n/vwCNQV21ywjJJbuMdmUt9BbDkanAEHBSHLt7z
         04/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792845085; x=1793449885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2agfzSVxmvKyDDGsk/lrN8ke6f+kq8XMYiroN22OZac=;
        b=HNVi6n5iWtWA6XHwHCc1UxZl3nEA0gQJ6WWlT6eviFQ7LmjtIQ0ZbzzhaP1tr+97gY
         nGUeaUPpmNDnaFkQldc5wty12hMceTrlmgqu6zsX250J2FaSbWKs1Z//vOEG1aOgN7gt
         aawdl+Lka3LHq9lNGzeBcxr9IMTDhp3gJMDirJ9cuOi3EgwbFl/7ECtaGxb1fHAHInOb
         T/kdKsrapft5g7jd1siBbbkhVmMas9e1FhMcDyd3IMQvvRpcNLW82PaCNDhAFFya7kpY
         EHPGDzswXddc2rtqdYH8it9jm7cfh3EVI/IjN18jRG6KQADwrs3qPAfi4ZUjZo6aAGWW
         Mz6Q==
X-Gm-Message-State: AFq9FYJ50v25jkFx9zxWl15g/GWg3jewk+Oo75JL+kEtq09Bkhr8xyx3
	4nnd3I+W+XHS7V/rSZk89Jx6/Ano1CNG1ae8/vjasG3AH9VEJ8uk7YVQzBjJRA==
X-Gm-Gg: AYBFou2GU1+lqdQQUbcsRO9TMSIC5WtzTGVeKhbhVUF+5pVLetWyzP6G8R72BfIQI5o
	d8TQOyHin4bAq7l4uOYFnSWlK1JTXHA4BwZeAyZH5U5DOO5/rV5Q2S4ii8UJFVaWEz6NM6GfEBH
	ccOGPgJmURZwr9+bZLIMZql8jAAj04gN7biybCMid0OxIjJvPIl60W4RFoLPJOBw+ePyHakpIFd
	pL17MQ7UOJrqj8yy5dZfVo8hrpdHesZ7kammGn8UqgW1MvwdMCp9Gx7JyL9ljF6B6ju/Qzj6kq0
	Tviq7qrm79aPWZWQ2V8BUtEj1lPMf+IsrcRrn1Avc202bZ4NJo+q3Dvd+wy+IMdIYb+HFvPBJVB
	m8DTZsKFVe9PeYazRNzxU/9oyv7lD3bT5HtGLDjuben1nMaJO5e54QlsXS1Q1Z7C55eJ2HR751Z
	2/vXFR3aiFNNkD1MlW21Kcat+HHcluLFZPesLdWWNPHAfP4CVc+J6DpbE7eET4OUPtDKfcknlXY
	UJ7SplwzVu4pTtNI/U2dDXi93LKcP4BuCZ9ORofkg9B6zkdgsAYv99i6+MpoS4Qxv0dNzEcmNXd
	jgHcPSDVv2sOVFlkv4aVef/7xs7jxzZWHjs=
X-Received: by 2002:a17:907:2d21:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c46bdc10b94mr201597066b.22.1792845085324;
        Sat, 24 Oct 2026 05:31:25 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea0ccsm86658066b.16.2026.10.24.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:31:24 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH libgpiod] build: honor default_library for the installed libraries
Date: Sat, 24 Oct 2026 14:31:24 +0200
Message-Id: <20261024123124.3700266-1-yegorslists@googlemail.com>
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

The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
libgpiodbus) are built with both_libraries(), so the shared variant is
always built, even with -Ddefault_library=static. When the toolchain
or the environment requests a fully static link (e.g. LDFLAGS=-static,
as done by Buildroot for static-only builds), linking the shared
library then fails:

  FAILED: lib/libgpiod.so.3.1.2
  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Use library() instead, which follows default_library, and set
default_library=both in the project's default options, so that a
default build still installs both the shared and static libraries. As
library() returns an object behaving like the shared library when both
are built, the users of these objects (link_with, pkgconfig.generate,
generate_gir, full_path) keep working as before.

With a default build, the only change in the installed files is that
libgpiotools, already declared with library(), is now also installed as
a static library, like the other libraries.

Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 bindings/cxx/meson.build  | 3 +--
 bindings/glib/meson.build | 3 +--
 dbus/lib/meson.build      | 3 +--
 lib/meson.build           | 3 +--
 meson.build               | 1 +
 5 files changed, 5 insertions(+), 8 deletions(-)

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
index 7045d29..7633702 100644
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
-- 
2.34.1

