Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260816;
	b=w9u+zl2Nt9VL++TSmk6WZuUnLrfAkmIoMLQLO8Q3LAyj0+hNcb0haEZmHlC8+MHfb3nh
	 TJvCgXmUdPP/MfBaQpFU4cfQLF+qN2Ac8QKGW+D6fXApMzbsCVUoeKl3Cp2ajhPNrpRyX
	 xht2b8sJ2FSHjew3LEeo6Vvz8zrAQiFx0DcDz20ot8L6lQJyIPoikQYhOrV72W2tbYTDk
	 qZeirv2a0EQBSW0VZTKM/2d+gjEh1H8VWxvAIf7LUchpgc2aTxwjNUCArZiP5nEbHhWBd
	 Hi8UIXkbQtN3zzSiuFGoICcYWFX8/s24uvdFdJy0ClntgXggqxhbUVJi+Jwh2nKph6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YDvbL8G6kVjdbipLv991s5Vb92Qsp8zVMru+ISrdQ5A=;
	b=vTrBpZifUy5Dhf6SxmFPQ7c6c1czVv6Zs9xn2a5kYpA+9WisF9An6Oa/qt+Y5nGtZpNX
	 nd8yUE4Qaw7wg/XkgG4xCkijqzTKJhWhSlrgk96jkOfSSmG8WAbLIX6I9Ch/xRcx1NU/0
	 voNgleatygGFjkJU+W8mfKfdrdqUUuKHuSNQDcCsCfLrk5J3Si0/1xQUOEBdQooJ+XIoq
	 LYrrChkZA3ZFtjka+bcg/Qye0kPmD9lE/qW0JVt9Oc4lOAB66TpLXlgxGzzhoBY6+kfZf
	 DVCy8qjKojU1F5HLq8GcddmlJ10n3JtaEKpqXh3kM+BXhLSovJUXy9bRDiY0vjqlb4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=PtMowBXb;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2C606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F2C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=PtMowBXb
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so2776017a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793260814; x=1793865614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDvbL8G6kVjdbipLv991s5Vb92Qsp8zVMru+ISrdQ5A=;
        b=PtMowBXbVBDmo0CZ4zmiTIMIT21H1vN326z52MHh6mk9ebgc9WBkXxr7S0CmhpDVRw
         WV4ql32ffBguCRrX8/oolO+H8NmhsRqeZOSQTlAa1V7OKpydNtmjzRffjgr0Q7VhPhf/
         mUnEVMOB09HA0OE90mnhyot1H20H/AGAlkHXSr/p8CiZTPjce8T9Q2nuOD2sqtwX2QyO
         0T7k1UITf1vLPz/J/QtnEBlLw/+i2wq+ah92GglhQPWxiZ1geJxueY7HoQdWGp4TyifR
         I5QybueFXsQ83qONt399LoUY+ysZ5gNbtQg57B/yliFcLoGZAuNEZCdlzZ2ZkN3KjtOr
         kMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260814; x=1793865614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDvbL8G6kVjdbipLv991s5Vb92Qsp8zVMru+ISrdQ5A=;
        b=SjRnu97Y6Hbbp3tXd2SxmsET3T9HxWaxcw8WwEX7Udy3S0kEwF6KpdAz4bD9YQ6zVS
         0bl369msA7jFVI7tAwrZNTRUuvKOLyxidDTwvc+dRZR4B5xkHVqN1Rz1akWecoSwHvWs
         O2JAacEjSYVUuYqWzKPgtHiTT16K/mamDLSR69GiUyTpz0nWOnmEvUZE1zFTqNYK2GKM
         enTeo+JaqPWK0Ty2g2SDnfJdLQQ6OKh9ZUi97Xs/i1WECFYMz3RAPSbi1qQRewPKpeMi
         7gcd3J9z/DSI1lEb7a3L74vB+84fjiEKSsMPFAuMeC9YN1q43iCH/i4IwKx6pzVfdIXj
         u6gA==
X-Gm-Message-State: AFq9FYIzR4lwRipFReja9psTA1hjtxINVV+L6+A4PpWrSDyZQRwQlqyc
	QFIy11ecK9ckbov34BGMNOyaVipRVjQadF39N69us1IWyOA2H1QYFbUvGN1Sog==
X-Gm-Gg: AYBFou08oJNgBry9kmolKeNC66CoJS0RprZQ/0T/ZOdbjhImq+2Ja5SzSpg849OtiT2
	uWPOf/rRAaOmSi3liL8dRTdEtJW5NLRvbtBgWOlAQQFkAWGmga7ark8vYgcB9JmLDuIghOj/efD
	59N7FVmvPJ4qZp6sj8PuBMnHxu4NRYLYMt//Fg4KYPXBIB5i9wV58KBXyrCdNiHoQ9ot9Hfqi0v
	OPmtz0jg6ATrb5o+an7f7BkhxWodSwpVma0CNxmQMjVIl2EtGmaO5ce4PpFax4fqBb1BOKHHLPn
	Sp0yh9VxL+hrhk0MSqO6YyknH67ED36AeggRTRavrQLQP5ktScnhYyWT7pvdOlVQecP0YFW9z4/
	hRleKUkgd38bZsKjhOscRhjVyUo5v2HLR9toKuxedzRCz2Yb1QPkWez3kuPBG8jWpGtLc44Bs6o
	343qTEIAWjDmcGBdIrmI1c0cjO0zqfOYXUKSFxoWGjn/X3fuaxtxlEIWEvlIHE6cyd9czcp4PT7
	0ehSuhxAVipNKHsHbVmJflTlX0Ki0jREddKHVLjCHRx68YACeEVWClmvDtSKvtukQdM2nYZ8ey8
	dakHfcbe/+wVZyfMimFSBk8ob86tEh7cCjIwjgh44CJp89cRyS8RIt6kE/og6mFUOESmEY57fIB
	q4mGAbXSSoSds2P47v2jjY7ShI0um/w==
X-Received: by 2002:a05:6402:5003:b0:6b4:7938:2cab with SMTP id 4fb4d7f45d1cf-6b49cb7d35amr3051867a12.32.1793260813998;
        Thu, 29 Oct 2026 01:00:13 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964488e8sm2373990a12.31.2026.10.29.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:00:13 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH libgpiod v2] build: honor default_library for the installed libraries
Date: Thu, 29 Oct 2026 09:00:13 +0100
Message-Id: <20261029080013.519442-1-yegorslists@googlemail.com>
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
Changes v1 -> v2:
- disable introspection with default_library=static, as meson does
  not pass internal static libraries to g-ir-scanner (Bartosz)

 bindings/cxx/meson.build  | 3 +--
 bindings/glib/meson.build | 3 +--
 dbus/lib/meson.build      | 3 +--
 lib/meson.build           | 3 +--
 meson.build               | 6 ++++++
 5 files changed, 10 insertions(+), 8 deletions(-)

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
-- 
2.34.1

