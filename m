Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288863;
	b=UChLqXREgk0pzxpNCA/ZLKb3frkcqmrVdDqUQYtoyz3MNwDNWwUaXVfuHPcqFMzjZX2Z
	 HFDrNBEGOQboVv4RRBTKuOk6Rgpq0m3zK1XtAcvWFYXdsRYZaXHUBEo3Iv26MpGODY8iv
	 ebooyzujyOgDI4JTk5VTK+VbiM6vwdp1jokXqtE43NSlOvMkdqd2ZKxdX02UudTgbbxIQ
	 kxZLbBInXqdgR15ISdYavUSmte2HvmxbiTW93ccSrpqG0LZX0i3Emg3+Tv4BQ65HKJGyI
	 AY38P41E3FG1WPScqX3XK2Ck5KbK2dVDGNZbthuJ0OIVJwynAIzZcSbpaf+nMekW7fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ivd58+s+qqW6KYMPGk/B3ewjwml9rycBwVB2BE9xC5o=;
	b=UcW03ZQWYyiXnAj8EA4lzOQCD8R7j8uVsjUBHo/WJkTPrQ7EWuqP5L2BvJcY9HunyVGm
	 ypfHERB7hTJ+JEqrB4M7OxCtPIUDZpLiRngzPlvNPrFVh0yB3y1Sa3DWvXE52fz0udoR7
	 mY6F7XPukL4QkeIm+aJ/VSHuWQEYrs/5n3BWBdyG9vCGy7wVPTaL5b1T8x63OsQs2sPg6
	 hkvmMFIctPoHO4h74jrQHDMnuJJjGz14MYUxqqNlaZuZw7PPuljjt0TN/AEp7Ls4lYlGC
	 qMSIkW+Bud5vN2B7ixBGHKmS/yDC91BFLR+C0phkeSt9emUCoov4YpGOYazzOdgnSFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hzDvgbpO;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1549B606A32D
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 15:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1549B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hzDvgbpO
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-713e6ecf595so677590eaf.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793288862; x=1793893662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ivd58+s+qqW6KYMPGk/B3ewjwml9rycBwVB2BE9xC5o=;
        b=hzDvgbpO9+eE0ro42+anwtAf8ktN8Om+l7Sewq2n9SJ4Oq3kMus53AduRq16wjQgUQ
         Y7JJzZ1PZfy/5rHtpX48QOEGJqLoktPgi2SZij4WayANlL4gUJXTm4/QwjkWkh+nhKjq
         PM0JKJYX3X4sfmYI0fMoVbZCONnVjdlB0hNpBObF7OxeYKl4R/0YeYx6oYGfG6wWKwG1
         h8QFvUkqAUjkuhAjqqTHJIyvlFGa/56SjQuCmMJ2+KrXBhYKkQaBX+u4p4XQs8PtnAJ5
         7MbWxFe64A8jQOpp1xBqkb3+K2Do0IT631ZhSuylQSR1jgDgD6f9qdBwbhdH51OVNhRz
         tTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288862; x=1793893662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ivd58+s+qqW6KYMPGk/B3ewjwml9rycBwVB2BE9xC5o=;
        b=PWxjG0eUduOhLCqI7ZWd8dtzsqDz1h7qRXe5/ixfw2uCqnOi1Sc0tSLvWHWMGF1ysr
         s7ou4bxWjZ8Hq5fc4h8AVJhEO16X9eI0OddrdHkyFdpRyhyvp4ilZNAmSQCGZsqsBn+a
         tFzC56R2rwBhfH7V29Q5QeKxf0ZZ7BlgWBYBR9zTdcywHYy6Dz+Gd8/VsD9b00kfPw9V
         p+fGHyOMxIcG8vAHVeLv2m5IawxfNOm/URalRIjGXdd2Hk/4kB6kIQHm/G+kmZ5stzM2
         y6/2dkUxkNLoWRs6b3z2yOMdMTuyTKD+/wbXS3mY0fhDMEebrqz+44BCA6b4gq9VEiNE
         Rjrw==
X-Forwarded-Encrypted: i=1; AKwUvBzArSdUIuiDRVv5oGjU7p0PgRk9pi8e5Uxvu8IsYGfQgqE7fF52zKBF3PuVeZ33NAhkNNjr4FLijuLf@vger.kernel.org
X-Gm-Message-State: AFq9FYLnnPFcBBi4HPJN1uA1AZrF++2y6aI0K02h0gUU7KyL3Lenhf+X
	ru8J3NUsEg6H6sG5CnCLSd5UeFnBJMcQBlLs/yklaX1pp5BtZMFH13wD
X-Gm-Gg: AYBFou1r5gaffDCleEkYhufnuFVIcRSHmelknTik1kocKsokgdG7GbZR0Wsqjrp3/RW
	3EatBl8HUDuDCqL1z1GCaq+OQzd/xoUur4LJgQ+qwzqEbBWFApO391c2tKoQw+6TBM338aaL0Xm
	hwUfPl5FsTqBT+Dc5uwsNN+xBIeGJHUMSZH1gUqkl5M5uSIr8Kvyiuc1FXkUtxRiA/XUvvoxtTe
	BHJmAyQFXRYX5vZcf0KMpCE9Zp506nXbEEvq9B5vH/kjcdCnEdXzVrYng40lxES9oYbbEttmmwy
	B1Aft6NzaI0UgKS3ABiPnD70mJucDqGxB2W5Qd0diUYGKXANiZfYsg1ubvpc1GtEABFxK9oZ/he
	gGD0DcYH5P7SU5ZvhYGLT9h7sxrQEm6Md9K36AcZO7KLg6i7ediFmmGFmPrQSlteiQxQ9/TQa/w
	AI3pGEfiDmr/5JJAePBqpKe48R2r47+fJX2XltE4RJHbqRWsuEH+5HCuiy1ryDaOuGje6UfDQh+
	uLrOGvj7v+GPc0lfIpLtPwHS1CGfjyYMqC4+XP3JgAfX8aFQvIxYqFJOmxn1ZBM7hgSo1+wMXZX
	G5D/JnGxsoFSfDejNGGVnmNLote6ckbkW5kKFfYIdTIgu9Y=
X-Received: by 2002:a05:6820:350d:10b0:6e0:8fc2:8499 with SMTP id 006d021491bc7-714dddf5054mr999962eaf.30.1793288861935;
        Thu, 29 Oct 2026 08:47:41 -0700 (PDT)
Received: from OLA-2XK3X74.ad.garmin.com ([185.153.204.24])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71429d864c9sm4220381eaf.2.2026.10.29.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:47:41 -0700 (PDT)
From: Payton Fack <facksweng@gmail.com>
To: bartosz.golaszewski@oss.qualcomm.com,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Payton Fack <facksweng@gmail.com>
Subject: [libgpiod][PATCH v2] dbus: add optional D-Bus activation file for gpio-manager
Date: Thu, 29 Oct 2026 10:46:23 -0500
Message-ID: <20261029154623.387575-1-facksweng@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAMRc=Mc_K1B=5S3YsAiRc6s0My4rAb0ktLk26XawijnVEOGvow@mail.gmail.com>
References: <CAMRc=Mc_K1B=5S3YsAiRc6s0My4rAb0ktLk26XawijnVEOGvow@mail.gmail.com>
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

Many Thanks,
Payton
