Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291811;
	b=RtNLXKzZqcYtjmvcl9zpUdh5TEud6N32SuUELHO7Mmq/SfsBSwxN0o/V+Oq72AYcmUfp
	 dPw+zPQvjm+l2y++6GnUUVNbK7hwqZEANmh/9+8U5+eMQXy0LdALVXmP3YuNalpgT2nBm
	 oaopKPBP4YGpW8rJH11Qi0KRtvkoQg3CPn/LAK/GCxAyqpeL8vunf8r/NxVljv7qAEaEQ
	 EDcgGiRRQvgmNH/H5G6QBlWlZmtRU33WoVe82j0rNC/HmM0Fw4vZZGQ6fobCJZ5q5N6tv
	 G2S+3iglaIc96P2Jg5wAXUWqkxp2hO3UDMd+ZTpFnhf/LB9BNSiPvJtnTYSPnQ/qP+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CwIflxMM1TZJoawnJSW1xqimcnShmAj+KMilWfpRn5Q=;
	b=zdsC4P9qHh7/cyORkHXRhOYJWd6YZHr7c71X4DYDk6aAb1DB+cq7rtMhqerFZxMO0ozS
	 uBdocy32INQd9YXqSn8S7+1xCFOq2QENcNac4WP8x0Uoe/sT3MsXsFmX9mefMIce6x5dP
	 ms2BI9F7wUFVZE4zDZVe46/VOknlSrFwU47kYnB8R217k5wCQTsIFktZOK8eAjOmb2c0Y
	 ert0Csloo7TQTshWMHY1THG2tXjdjI8LE7z5nonya4zfzk87aTYVmbX8gEj18wtgl+Ijc
	 cODabidEdqweIymsCnN7GxM88M7Gf/+4AqSpo3X1blJ1HZdoRIlGZc49AWHEQk646gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M8207q0z;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC05606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M8207q0z
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-49429181ce9so1387198fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291810; x=1793896610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwIflxMM1TZJoawnJSW1xqimcnShmAj+KMilWfpRn5Q=;
        b=M8207q0zW2carcvsN3R5FQrUJcVqLFqHvDJthiRXCGWl4n5y+tW2WIv5YqBvV0dIYL
         NVOwXJ3iANoip8ynT4QgJKZJmCjEPU9mKNcJice5OLPmlUPVFoOH64ASGgxnoszPtKvF
         fdLykc7cxxBw7d0AaREhpNi/mJcjABIWPFbcoPOtPDwaqnyekeiGPxgeqp4JByZ3N+g+
         HBIefqaPePMvTqm21ihVB9MMON5jPmcQRvL2lLRGDmJsmrORDK9LMU8J+HRMkQrvzlN0
         k4pLQnwDd1Je2HVJ/IKsGvsWoCgv3H97T9YULHjCrjii9w9knT/1VcGPMvl3VDo5XWrT
         7fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291810; x=1793896610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwIflxMM1TZJoawnJSW1xqimcnShmAj+KMilWfpRn5Q=;
        b=KuIpBzXUOg5iCkSHCVcsW3IWH8BMAGhraG4OlyvXZEoBmsxXAg4wWyowsHCKx9xFVk
         sPLVNG1/jqeN/ysDYFovHaQDK0m6DV1PL8RKxGnJJViJ0u9Pgdf9jq7WOoXx9dtxjKNN
         l7B61qJ1qxA+tMZlHCiW8ZQgbfMcwV9FYPVGX2ZnJ0vlE2fhzvNH9bjmtYISidzY7Cfi
         HE3Bh3BrvgbPXgtNTx4w3t1pw6DWMNTRpCLfttdHotBTiYzh8BAC4ojhS+sZaGKdO6nH
         nQy0atMyypUsNOv9FT4F50O21hFqt+d8ZlfMapNRaNNWIkZNPLc2tF4HNx5ecnvauE3S
         1Msg==
X-Forwarded-Encrypted: i=1; AKwUvBwKB/IteA9n7/4TeddsscU7pXcmnPl8j6ZpDzq7gihAYQORL+AWjvAY0Ase+DMibVsE9Q4/deDlxm3s@vger.kernel.org
X-Gm-Message-State: AFq9FYLN64E1mdwVf8z1pqLMoSgpg9zT3H3cdXDsaqZgj62UCaj0Cg0c
	WF7joZpss+niRqR5rAsNKrgLAN/IVUuE2iJcaJyQL43mjY8WVNs71/gN
X-Gm-Gg: AYBFou2dMg+ppEPUzeJlSTp3Fh4ig2bwSRfPmBnC758mMrvcWHtHeNyFCTIFjK0oWMA
	YEcte5R5TFIJUEavCkvsTS95enGb2uzjiFhiDpQLHazC+iVNEQlXLM82Gcx6mockvu/EuDlcFxE
	nuAGmvwv8iHauQhrS3B2p+vqX/NmQgiD3aEGnc5cUHgJDr8nIFGckrlIzfYyeG1IrEiuaLO5Hh0
	aUuNK8hvIjTgD1+HXibnrsmh+zEP+RtXSq1VH6jVVMfR9zopCdF7X5dcQnFgrNXXjQ+9Pyj3W9K
	Hz53eslSr9eQHSfouef81ZF40ERNdfFPqk6oYrEKXMPxj1MndZKJWScg8eLQKzzogy8Vp/4KU7m
	m8BEvKg6bMg3Q7sQb0SDK29H0obLM0yVmrJYzXMmnToGWj+oW00B7ywN+7k14oDQbxizsE0TUy4
	EZwDiaoe9FMWjC5hNXKBTk/em/0JKs5brkloI4KxHs+MFVMGKAtOA+/lK49GIQV66314gMZ4DbL
	9cwzdXXCxjlLmvUv755/pRNT3eUgCvtlS1xZuxy11k1bTvP5zzr0M3Mxxn5y8GS/nh1mgvYZ1sf
	18jO1S/vFEo/G8ZbbH3njC2PFcmxSRxsKl7Nheem/2OJxnxN2u55XnSrbPedOol4RXbG
X-Received: by 2002:a05:6870:3353:b0:494:b659:b397 with SMTP id 586e51a60fabf-4a8bb1a0b5cmr4252177fac.6.1793291810165;
        Thu, 29 Oct 2026 09:36:50 -0700 (PDT)
Received: from OLA-2XK3X74.ad.garmin.com ([185.153.204.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a901fe4b34sm271803fac.6.2026.10.29.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:36:49 -0700 (PDT)
From: Payton Fack <facksweng@gmail.com>
To: bartosz.golaszewski@oss.qualcomm.com,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Payton Fack <facksweng@gmail.com>
Subject: [libgpiod][PATCH v2] dbus: add optional D-Bus activation file for gpio-manager
Date: Thu, 29 Oct 2026 11:34:26 -0500
Message-ID: <20261029163426.407719-1-facksweng@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add an io.gpiod1.service D-Bus system-service file whose
SystemdService= points at gpio-manager.service, which lets dbus-daemon
start the manager through systemd on demand when a client sends a
request to io.gpiod1.

On-demand activation is not wanted on every system, so gate it behind
a new dbus-activation feature option. It defaults to disabled and
requires systemd support. When disabled, the activation file is not
installed.

Signed-off-by: Payton Fack <facksweng@gmail.com>
---
On Wed, 28 Oct 2026 at 12:27, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
> This has none of the sandboxing features the original .service file has. :(
>
> It also runs as root, as opposed to the gpio-manager user.

I updated the file so that the dbus service must always use systemd to
start, since dbus service files do not really have the same sandboxing
features.

> > +if opt_dbus_activation.enabled()
> > +  assert(opt_systemd.allowed(),
>
> What about systemd_dep.found()? If we allow systemd but it's not found, the
> config will just ignore this one?

Updated to use systemd_enabled
---
 dbus/data/io.gpiod1.service | 8 ++++++++
 dbus/data/meson.build       | 7 +++++++
 meson.build                 | 6 ++++++
 meson_options.txt           | 3 +++
 4 files changed, 24 insertions(+)
 create mode 100644 dbus/data/io.gpiod1.service

diff --git a/dbus/data/io.gpiod1.service b/dbus/data/io.gpiod1.service
new file mode 100644
index 0000000..893ed74
--- /dev/null
+++ b/dbus/data/io.gpiod1.service
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2026 Garmin Ltd. or its subsidiaries
+
+[D-BUS Service]
+Name=io.gpiod1
+Exec=/bin/false
+User=gpio-manager
+SystemdService=gpio-manager.service
diff --git a/dbus/data/meson.build b/dbus/data/meson.build
index 8af178b..e790a78 100644
--- a/dbus/data/meson.build
+++ b/dbus/data/meson.build
@@ -18,6 +18,13 @@ if opt_systemd.allowed() and systemd_dep.found()
   install_data(gpio_manager_service,
     install_dir: systemd_unit_dir,
   )
+
+  if opt_dbus_activation.allowed()
+    install_data('io.gpiod1.service',
+      install_dir: get_option('datadir') / 'dbus-1' / 'system-services',
+    )
+  endif
+
   install_data('90-gpio.rules',
     install_dir: get_option('libdir') / 'udev' / 'rules.d',
   )
diff --git a/meson.build b/meson.build
index 7045d29..598ee3a 100644
--- a/meson.build
+++ b/meson.build
@@ -55,6 +55,7 @@ opt_bindings_glib       = get_option('bindings-glib')
 opt_dbus                = get_option('dbus')
 opt_introspection       = get_option('introspection')
 opt_systemd             = get_option('systemd')
+opt_dbus_activation     = get_option('dbus-activation')
 
 if opt_bindings_cxx.allowed()
   add_languages('cpp', native: false)
@@ -172,6 +173,11 @@ else
   systemd_enabled = false
 endif
 
+if opt_dbus_activation.enabled()
+  assert(systemd_enabled,
+    'D-Bus activation requires systemd support, which is disabled or was not found')
+endif
+
 if opt_bindings_rust.allowed()
   cargo = find_program('cargo', required: opt_bindings_rust)
 
diff --git a/meson_options.txt b/meson_options.txt
index 64e3c14..1ec7f07 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -34,6 +34,9 @@ option('introspection', type: 'feature',
 option('systemd', type: 'feature',
   description: 'Install systemd unit and udev rules (requires dbus)')
 
+option('dbus-activation', type: 'feature', value: 'disabled',
+  description: 'Install D-Bus activation file for gpio-manager (requires systemd)')
+
 option('systemd-unit-dir', type: 'string', value: '',
   description: 'Directory for systemd system unit files (default: from pkg-config)')
 
-- 
base commit: c2e9287333d7be588b3acaed7bbb1c58d7b551be

Sorry about the thread confusion.

Many Thanks,
Payton
