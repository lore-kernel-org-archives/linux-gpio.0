Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263975;
	b=Gzcp0Hrg1Uedt3QIO4Lm6TTbssaCweKPxzK6hm0jxY8bFN+1vbV8ox8eiUYiP174dHV0
	 /DsY92t9/2C2JfvcnygtBB6O50J0gbNq/cEJdovDG3yxdyGw/oVipsliLPH/pXXBkob7b
	 mP1EKdtJrUuvmHovvakQePDZMp1t8KzhkXGQHGqV6W9ud2y/lzZiqa4p8YVdF4NmUrU2k
	 02q/e7vYh0XwFbCj7usPS+teUrdaOtuR1J5YvIXiSFybc9oeNsEq1CNuRAc9wkf1ODKqu
	 8qudvkcjYlo7Vx/n2sA4b4I+3qBfZ/9hqSACukhY155PNSunJV7ziwLwtxejrqlXGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YDvbL8G6kVjdbipLv991s5Vb92Qsp8zVMru+ISrdQ5A=;
	b=yCuzL52xeMmfniNXSXWO32Z0u+T9LqBNRRFZvPS0H2WC1bJo7Hamu8QlpMbdcAAMGrJs
	 4OUxWcIVuxW/aCkoaFsvCDLdXpsJ/qJv+GptjX1wghjauxPNAmLLy7OJD79eBartvMYIr
	 RSyQQkLq57v0eB/X+hwWJDVh2mpngF2TSuiXxiNgu++2j2+M9if1VoJ/PmEywmg0AwKod
	 gRNTDSGleqrjEyoqnd09vWwCLwSIxHy8aG2VV5QOznHY5ntSmh3ajI8tB68U/Ntpc9u8P
	 ae94z5Ea3RUyKaUjVt81iA+SkLsiapfoba9jhsid/uOzKTcWBfSZHDHmzUEUvT6zSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=swo6kYn6;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA98606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=swo6kYn6
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c315869241fso288844366b.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793263973; x=1793868773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDvbL8G6kVjdbipLv991s5Vb92Qsp8zVMru+ISrdQ5A=;
        b=swo6kYn6/irOO9IHV+nIH42Bl2JV11OE+sJ96EAmlpoZFQCSc+nWOXAarGbPctqvWz
         llyQvLey6PeHBwgdnr8VEVK0ES8vzqqfCkYZu1SegY0w5OEjpg6CX0UnH5AMk1bhVlR4
         UKkkpE/CG60FRTZsR+qijreehgH++7SqgavP9XcxFdAjwOLLD1hXGs6DcWLxgUvbworl
         QWu7qxY66tMsRpdIbG3dqfQZDuWt0q5qUhzr5crgxVrpgw/a9sX3jmv1JH8nfpOtZciv
         zkuv5/UllyAH+CIjLzyKpG3Sl/7OW2w7dBvzk6vSVYTU3gHNQSQvnSCEmNzrbZIaeSYX
         jkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263973; x=1793868773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDvbL8G6kVjdbipLv991s5Vb92Qsp8zVMru+ISrdQ5A=;
        b=N3QMI0uTpsxO+1+ru7quauY7jgf3ypQG4Uqm7YDI4j0jDVDuz9uf6IgdJ3QoxiCGZD
         O9YLuQM+YCFD6UhfGcj6OcswCrhVP/xCr7sjun72NyS3bh/dsKqpFdpu9pIjryv6Gf93
         btnA4ehVMOjB0OD0qW/bv/wC7I+yqDA6kgpgueMeVFtI24v6iV3cV5Jqh8roYNHgMogO
         s1Yly2PLqiqJixI39U33HZQRExn1F06r50ByQCEW2rMIXTheclZQ+C+f+IJumYo/UGq3
         uqU6FZuZWSpbbloC7R9ecJ4T4Ji5elkWHBr7p2f1tx1CA2YuJGqhODD7uxRHpKNgkFF0
         0exQ==
X-Gm-Message-State: AFq9FYL97qzhhHB4Xfk3FsMiUQHABu/cJMZV2P1JSrTH260kEG6Z2puy
	s0nagCEBqlgU1DPEo3VPgTqPQKn5QBDbAwPFcOxIW4EwPcRw/06fwqRyX++Wzw==
X-Gm-Gg: AYBFou2EgfXNHO45UPM3BmWAqxGaS4go+ih4L1eojY7E1NUs735gVfkcJFuJT4pFgUe
	gdTbblIAKUr8B9SKLMqZGwT018bo4dCs48B8v/q84p9XS7h0DrsBKuqN+3bP4AqK+/9OVQl9u9q
	4CiHnLJN1D7K9Bu9v5KvkLalU+r6r+iknduntgYeTZy3kawJf9D+IDKQ6uQoXrYBuOliFtha3ib
	zoQL/pLwS8rn4vcQ23GEnUBNr0hzuRjfoRgFqwKA9v4wAvd8uu3ufnS3htrx7MjEJ5S0XlxLVyb
	SZLR2TzztZOZ8CzG9+t1De1AriJmyMZsWG02GzUlboBXs75EQTiC9POt4smDxsDiKj4bh5a1VOR
	m7RHUnNEvFLu5dqxFHRW2zcl7ENz8YZ5HwNUHGA478vudqefbHaIT5bIe3F3YBvA+/gJ/IcI+qO
	9ZXX0HazSXnCwbpi5ixO2bqorqkrZLPNcxQ8zkWb2VYuP7UfbCRn8cD7PMPCSBllS/uK1Abtdq+
	AryFgGMH8RUZpjAOWBZNFq+a9vTgBd3Ptn2Ba1SuA++OrOkSo38gVYvv2kYi6izCK6/ILTx1Mvt
	iYxNvRj+yhxDwOM8btPVTQEVxWJnF2HAz6lOEZTTraTglxi8FLUlBpgfUDoUiNvIWHF9DeceTkk
	aVpPVDmih+GMfnL0qbOchctm0M5/fgA==
X-Received: by 2002:a17:907:6d27:b0:c46:cc9e:a14d with SMTP id a640c23a62f3a-c49be015baemr411833666b.49.1793263973256;
        Thu, 29 Oct 2026 01:52:53 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7ac041sm702512066b.82.2026.10.29.01.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:52:52 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH libgpiod v2] build: honor default_library for the installed libraries
Date: Thu, 29 Oct 2026 09:52:52 +0100
Message-Id: <20261029085252.534152-1-yegorslists@googlemail.com>
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

