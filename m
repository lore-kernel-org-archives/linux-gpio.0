Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB342EBB8D
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 03:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784172891; cv=none; b=jWUMfyPjFeIvVomnVVXujNlTiuSSQ7WWJcD9doZVdcuvGQgAkQf0YPcChmZn/nsm233OVsk9sSBjTj89AuKl4xdGNPMETHvRaOKCN9cHZoQbsG2kaRJ11E3e/r00LjBrn9LzLfZw9MjRNwwvLJ7A/hBjy5m/fwOOWA06b/pZe40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784172891; c=relaxed/simple;
	bh=uL6DnsUWpgn7B+YfWG8Ogf4k53ZHoqesN3uL0+TGuMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRJyYdYQx26OwvfXsRiCL6JK98+r6rySM5QsjUIfBS63d6DNlKjJHiuAr5jSFpmMyfLAcBl2i9fIeLZbRz5GMQXhcRzH5/IKMMvTidn0MMgpxMTzcp7DpolsTL33mpwdxAJKKQnJDGst8vF+MGds7VyUhnrdsvJsHw8heAtcuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUZDYelE; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUZDYelE"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso1220036241.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 20:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784172888; x=1784777688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aPFZACDdANzAMY4UiE8JOHY80meLvkoEm+oGY5HEN8=;
        b=qUZDYelEWx/fU8CMW6ujh+SeWv7dS4p47bc2FHn6mleE0SrV/CoNnUj5qcZWMzy3fe
         LD3B8xyvYaXBz3Qf6VzXh+MDbG9MhkVIbBCq0ChBlff9KGb1JdH/MKENiar3YiHD/9kx
         ikDhHTAodMops6XcKIyJF8tpVZkYVc1iSPm2r6ehVMLjNZl01WNZJC6UXW3oeHlTGy0q
         K7JVRMZozH3Z2TVctviElbQhOHXmuYrx2DA0NObBO6jP5NvoaBeHdB5MDi++X0/q7zBJ
         d7MsEqPvn1V+yw5UBZHoSomwzzChNjw4EP+scBn+XBiDSHpqrhv+oKAUGNnHCTMbwgnC
         AEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172888; x=1784777688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0aPFZACDdANzAMY4UiE8JOHY80meLvkoEm+oGY5HEN8=;
        b=c7+Fihs8WH6Vf70mZ4KdPQuLKhhYkVuWubMyvNDUeeflm1BCt1jLg1nXVVcAHxDAhd
         wT+gvgsScG0StvxT9ciFUETxJWe+jwsMb1d19wtianXAlTdlXf+VFWtwHxPpTKiVfiwY
         D3QRJhE9rzXgP839n1HeH4+TtrQz+NqGs8AoPBZuWOE/StgwG0nvP9idqXbqY8zkPL11
         x7ijxzwOXCcorsUR2TF0a1Ler/oyIKytXMxHxjl37etBu4UKL5L/UEUXxqpPOAzx/y5D
         wYPfXBnja7OS+1qWYT3xidMi4do86Pk3AX8XDBwmF3QRulFS4ANaTbzloxw/0PUIR2Gs
         HXRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYBYdvI2Fm3+DLMFojdLNI1gbNVetfyr4dplXsILloqGiNAnDy8IhqJa0eyUYfkeKl0Z3A42BS9Ciw@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQBXIZod9S/9UAYuX/OGP9LnDvSLYRJHzrPBIfw7qgl9CbPpI
	+BRWy8aq+dVdCjgJaxuhYR16wYkf5/oZRJJZ6aSWZGWbEISH3rbubBYl
X-Gm-Gg: AfdE7ck2NqHAInLRIaAUQKv9xnfcwKgaSblAIMQKzEI3v8IYwToy0LknsI90AU/MlPb
	TKYPtAOTaw8uNesHWo9D4oy1JdQxhMwdo2e//TggJFwW4uCdvBqhskjS2jXW330HsfP8FKY4xBG
	jldKepEYxYyfEaeAhMLbLhntt2sr6tVWAZYrtyqFHM6D33ekzp42tuaPk9X5CdW/Hhi/3Oh7BYJ
	lUOWaUJI0OFAO+puwmGYzkpf3LQqGsGiDMSZaUqmKe48YdzCLgd7yBulDSjG197Bqd+UD065ja4
	syCPJNUy1Q4xEfIt9+T10x9dFIKLA3LHWvAxKzKX/aP/MkS7Y0bl0aDnCagvAQ9VizLIGH9cEfw
	AqbJ163qV2EuwvuvqBYEkvP3dql80ZStpoE9noVUGUXztN6qqDhpilkJj4ynaZdjGZXtAvI5w37
	ZNwOW8oh40dyeR345t9YaArZ1TDtzxjJ8fCWB70Eb2MI4vnbirMWUqjg==
X-Received: by 2002:a05:6102:508a:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-74533b8430bmr13439483137.1.1784172887779;
        Wed, 15 Jul 2026 20:34:47 -0700 (PDT)
Received: from nixos-office ([2607:fb90:ef62:59f1:2621:9a0f:893e:6b06])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6dea737sm13066272137.9.2026.07.15.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:34:46 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: linusw@kernel.org,
	andrea.porta@suse.com
Cc: phil@raspberrypi.com,
	bartosz.golaszewski@oss.qualcomm.com,
	iivanov@suse.de,
	joshua.henderson@microchip.com,
	lee@kernel.org,
	amelie.delaunay@st.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	yrdreddy@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] drm: fix unmet dependencies from missing GPIOLIB
Date: Thu, 16 Jul 2026 04:34:41 +0100
Message-ID: <20260716033441.21330-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 4 options, PINCTRL_PIC32, PINCTRL_PIC32, PINCTRL_IPROC_GPIO, and
PINCTRL_NSP_GPIO all select GPIOLIB_IRQCHIP without ensuring GPIOLIB is
enabled, causing unmet dependencies, such as:

WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
  Depends on [n]: GPIOLIB [=n]
  Selected by [y]:
  - PINCTRL_PIC32 [=y] && PINCTRL [=y] && OF [=y] && (MACH_PIC32 || COMPILE_TEST [=y])

Similar options in this subsystem select GPIOLIB, so let's do the same here.

These unmet dependency bugs were found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 2ba384e6c381 ("pinctrl: pinctrl-pic32: Add PIC32 pin control driver")
Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Fixes: b64333ce769c ("pinctrl: cygnus: add gpio/pinconf driver")
Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/Kconfig     | 2 ++
 drivers/pinctrl/bcm/Kconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2cdd7b2c49b..ddc60562b770 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -486,6 +486,7 @@ config PINCTRL_PIC32
 	depends on MACH_PIC32 || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	help
 	  This is the pin controller and gpio driver for Microchip PIC32
@@ -562,6 +563,7 @@ config PINCTRL_STMFX
 	depends on I2C
 	depends on HAS_IOMEM
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select MFD_STMFX
 	help
diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 206f3f1249cf..19d22e7fd11e 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -121,6 +121,7 @@ source "drivers/pinctrl/bcm/Kconfig.stb"
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
@@ -186,6 +187,7 @@ config PINCTRL_NS
 config PINCTRL_NSP_GPIO
 	bool "Broadcom NSP GPIO (with PINCONF) driver"
 	depends on ARCH_BCM_NSP || COMPILE_TEST
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.54.0

