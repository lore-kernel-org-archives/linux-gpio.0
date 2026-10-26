Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052823;
	b=JDnPPOP+y3xSAzTUXq59+Zn2N1p/pGDaqQExmk5gDr1oH3+dePcCVKMDwc9YKUz6ySCv
	 HToyGgcAOMZIQQ+3TvJq76tKysasjTGoCH44y+up9YyK7I3AIjzJWMPhd4SFdK7xqazWe
	 7fnkCOzmntCV46orJZhSqVgdEe53xWFV+69I7p2DygJwSyZQ48F1W0A1aLJtpB4N0+iuX
	 lh2o/y7CT6tD8XtqBOG2EUJe+o91TFUb1XCQDn/JxA5LjlR8Q+h7RYIo0Z7m+C0pl29Fu
	 0TflL4uW2iBUAdz11S0KYMx0fID0eLXhR0ytVJb6AcWxckBcy1+LeDgS7FyyCe92NEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ySxii0clrW98U7JAzBny/UuWlfCvko3zztIpHiutavg=;
	b=33ZdPE0ETJI3C6Ovl4qBhoGJAguN6h35q7E13i+xctSirTNgknEjVz/o9TWtIrSGI7Nt
	 SR2WPqjNQsKYLdQR5Fr32J5Mx/27Epo8B5DsPJus/yo0VkcCNSIsN/rWncD1krxVMAVTa
	 bDedFI3TvtifCoS/hWufp0db1Go8fRNoexVhj8sndCF+Emhv8EBMVBKammX/TrTOjUQ/B
	 7/DxVNPt/VenfS1YynMmpOlZIkB/xracBwoBGYKoIMUhnUqUiK39kJUcxeci7jqRxGChG
	 zqks+fKKpapOAg/4FkjlL2yCCpcyIktH693pg6wkPLI4pwUIv/V3b+GlHMbRC+bP8rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Vot4/Tng";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11D606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 22:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B11D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vot4/Tng
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843cf077f10so3907835a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793052821; x=1793657621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySxii0clrW98U7JAzBny/UuWlfCvko3zztIpHiutavg=;
        b=Vot4/Tng62TcB9Q0u8vF/FAQumY3JOGfHJVbvagnjxeKK3a92n3iLOeMrQ4eDdj/jW
         o8EGGUCMhNAtHQT1ISEjBkLUuwJv9logm5f/HmY1nHGBORP0R5B9e77dAdxxDgwz1ihA
         Nt8wuoVkQvThvwWmY/pbxeXgU0t9I0dLnNjt/XFOPTQcwQdqjWnubrybMwmKM+NXwMBQ
         CY1ymWTYKPghD7+ltH8GITq1YmxTxl3hWJb3CBJY1xoIfopLGwfBNY6jC26YPBHBKjuR
         pw2quc6LhhrbNS2HsY6DA7QmBZV1ATjjc47vmJtm5zFxPdUyB8tLUremD1MOJ7TPdjwX
         ni4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052821; x=1793657621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySxii0clrW98U7JAzBny/UuWlfCvko3zztIpHiutavg=;
        b=SOzjS1/Cwj32Xmd6IYuv44zX4k1laWqIEcRn860NrqBlK5kCIoDHasYj1lNy+svBvA
         uBgFAvXA1/Z9wDF9vAayGhMXxiSUake/zvJfRXc5Lb01J7Dyg2h41H+byY7jRbwB3gTT
         I68Jq6dqs5y3maanlJdYL7GQeoHTGMzHRDaQOVT31sw6QLLqwJIk4BBjwncE+FIp0qFG
         E8KdTws45XMvV59U/9uF6fvuekzUeQnS9n7563SUjolLUvwjmLHcTYgpsDw44LRDPA6o
         k6vyS+xz8z/DWxRERhlHqaiWP9Mx6b0PtXZJyCnYztXFKCqRHG1r7A97RgJQUU6nC7hB
         DHMw==
X-Forwarded-Encrypted: i=1; AKwUvBxpa4GNuhQQjSXljgYhLbOhk4evCkL1y40miicSZkhGAAaXcNPy0Pvvmdj9AOW2RiWHOnONFzKIlLow@vger.kernel.org
X-Gm-Message-State: AFq9FYJdJBu6AOKS8E/mqpfTRPgguJQpiwrhnyD7lscjf2ftO/FS8cs8
	Xp1lT7hWc0EphUzMFpvd0FnjAdkpopwv34YMsLNpO0XhrLPDn6Pm7VDy
X-Gm-Gg: AYBFou2sr95V14CY28SnDItK8EuJjLtwS/qo35SVkeAtU7WoWAgbJounKI3VUMuYBh4
	x8M4zVMeUPaDaoNbm+i5RlD1AZzS3w7oj80OmnZnVG0Vp4RdTnMj6Q1zDuSPR6/2IqChk8Z9RRg
	mCwIWMZv4Nlb+2TcDiVOwwtFJwI5yCHaeDX6q3q8FwlQYMc7MFsDH74l6cCTnpIrapFhSm81F9U
	uQKmONYOiKR9UcI87lcnOAIR00Bcy6LpkXm/mL0FI2HI51jxd9toYq8Ys3xmP5bi1xrOHwIYTT7
	Lgkw5rV5od2B0IQx2ubPeC5sQyfAiHliHg7tG044lSzd6mkPDLi+IYUehKPol3Tq5COMwuTQGOJ
	9zyM4i84wx/Iql5M5NitnPI2qvvuExPx74wVwHEnDOf39c3XWFWqe+xaw9QCXborEKh86jEdU+l
	OS2sHO5RxxM3dEmBRF9G/7nBZFGETZS3kam/cwj970zeA77MIrzcf5WpOieSMor4fxWlLewipWx
	dWTgq9qR4DYnDpyg0CZU08ELvEWohIcYL7XRkCyw/rGv8cPdPWNzRSt0YREboztPZZAFFaHFA==
X-Received: by 2002:a05:6808:4f5e:b0:539:e1c7:c05d with SMTP id 5614622812f47-55c0033567bmr5605028b6e.49.1793052821424;
        Mon, 26 Oct 2026 15:13:41 -0700 (PDT)
Received: from OLA-2XK3X74.ad.garmin.com ([185.153.204.24])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042de7b0sm6169576b6e.13.2026.10.26.15.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:13:40 -0700 (PDT)
From: Payton Fack <facksweng@gmail.com>
To: bartosz.golaszewski@oss.qualcomm.com,
	linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Payton Fack <facksweng@gmail.com>
Subject: [libgpiod][PATCH v1] dbus: add optional D-Bus activation file for gpio-manager
Date: Mon, 26 Oct 2026 17:13:23 -0500
Message-ID: <20261026221323.2235111-1-facksweng@gmail.com>
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
 dbus/data/io.gpiod1.service.in |  8 ++++++++
 dbus/data/meson.build          | 13 +++++++++++++
 meson.build                    |  6 ++++++
 meson_options.txt              |  3 +++
 4 files changed, 30 insertions(+)
 create mode 100644 dbus/data/io.gpiod1.service.in

diff --git a/dbus/data/io.gpiod1.service.in b/dbus/data/io.gpiod1.service.in
new file mode 100644
index 0000000..62afbdf
--- /dev/null
+++ b/dbus/data/io.gpiod1.service.in
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2026 Garmin Ltd. or its subsidiaries
+
+[D-BUS Service]
+Name=io.gpiod1
+Exec=@prefix@/bin/gpio-manager
+User=root
+SystemdService=gpio-manager.service
diff --git a/dbus/data/meson.build b/dbus/data/meson.build
index 8af178b..e5eb283 100644
--- a/dbus/data/meson.build
+++ b/dbus/data/meson.build
@@ -18,6 +18,19 @@ if opt_systemd.allowed() and systemd_dep.found()
   install_data(gpio_manager_service,
     install_dir: systemd_unit_dir,
   )
+
+  if opt_dbus_activation.allowed()
+    dbus_service = configure_file(
+      input: 'io.gpiod1.service.in',
+      output: 'io.gpiod1.service',
+      configuration: service_conf,
+    )
+
+    install_data(dbus_service,
+      install_dir: get_option('datadir') / 'dbus-1' / 'system-services',
+    )
+  endif
+
   install_data('90-gpio.rules',
     install_dir: get_option('libdir') / 'udev' / 'rules.d',
   )
diff --git a/meson.build b/meson.build
index 7045d29..759c365 100644
--- a/meson.build
+++ b/meson.build
@@ -55,6 +55,7 @@ opt_bindings_glib       = get_option('bindings-glib')
 opt_dbus                = get_option('dbus')
 opt_introspection       = get_option('introspection')
 opt_systemd             = get_option('systemd')
+opt_dbus_activation     = get_option('dbus-activation')
 
 if opt_bindings_cxx.allowed()
   add_languages('cpp', native: false)
@@ -85,6 +86,11 @@ if opt_systemd.enabled()
     'systemd support requires -Ddbus=enabled')
 endif
 
+if opt_dbus_activation.enabled()
+  assert(opt_systemd.allowed(),
+    'D-Bus activation requires -Dsystemd=enabled')
+endif
+
 libgpiod_inc = include_directories('include')
 
 libedit_dep = dependency('libedit', version: '>= 3.1', required: opt_gpioset_interactive)
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
base-commit: c2e9287333d7be588b3acaed7bbb1c58d7b551be

Many Thanks,
Payton
