Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244753D4133
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207804; cv=none; b=ACvji3iiqkSfYQOP2jHK3FSaC90+gpQfE1L6L4oUU6uS7Mguhhldb1ErZHw5sgXLqJUOmKxzHt0KqMKaOFx6CBKdIY1aNklFjm6HsfVBPGxrM6zf/oS1SGQarZ1i6B9DTUx3OSbySk9JSaYkZN76/db1e8vJduCZ6uBgXjeHxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207804; c=relaxed/simple;
	bh=6wkFPBXc/Ybynl188MXThwc4w9qGywX8R74jVYEfRtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jzRm8fUacFfgtKj1imhHUUrd9UmcSxifPtimvgghWdlUL9XdL1rHhI1O/tC9MIyeGz61j4ClRgCGqCLUFIegm0MzNGoNRXa2Fwb+Akak+Os5xE4u2H3jueFHmm7QvAljDxMULrZWgHd/tu7bUAV/JJ6Mh1j6a3VuSQM5J85SDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgREnDA8; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgREnDA8"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-667bae10ba3so3230297d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784207802; x=1784812602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2a5kM1Xg87jSGZ+dwHQ6dzG81fRtGvs6eB4pycqhVU=;
        b=HgREnDA8WhRKuJgtiSWdLfCe58mCWnU8soSGRmCUFek6GeWLL1fG6iB8E5Ivbi1AHG
         1/CgOcMjOxxkVrjivfD3xiep2iKVahHUb2Rz24EOdXUYC54GTb+ES60/qpXJxo413eI1
         GddqvYDou4cpQxYXSGILbspjIUifrIZb1ZWGUv7lhpbtuDYZY3X/jZPFO5RloeL3lZOx
         x0FPUODiM5Oh+XwbbhWAOhlu/S/TcSjGRrRRantyA0sxdfo5875/VaFvKLhp4uo70ELG
         uIWiyNjpQsYCT2ca5umcEm8MxqwqJ8t2k6QoP82bSrPtRzAWiZ0dNWP3EUUJ74x8uQec
         IiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784207802; x=1784812602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2a5kM1Xg87jSGZ+dwHQ6dzG81fRtGvs6eB4pycqhVU=;
        b=EHZMNPy1sdKxwRL+apbwwhCyIJnPd8bmHHmQzXrclqHkiwAwJ7dmBWivJWAAEooeaZ
         ksxq1VAFgi9Hg1CKY65wJ5hqSy0eqFbcjp/xrcs5BLNdQ47nH9OlCxsfoPR9mBu3oeWI
         6uyolHuz2kaYrRILzoA020u7GPCmGz9/QT1286VmS1+UODkdNyFOzy9G2Lc3pJN+g2OD
         G0oMGJCLHUYf7b17E5A52Tt0+O6DL0qJ2HvISrGGQFoaxTr9a4YIEbmDtLIrnCvizD+m
         JE4nMJriTtNS1HHjcuSp3axojc7afTYs9MZpXbwoNKleH/WBI0JasSM6Cn9OtB56Lhy1
         a07w==
X-Forwarded-Encrypted: i=1; AHgh+Roky/2X9oscP5y2/mhMiix3vSmsmj8RftmfR12FyGIdrHWnmhmI3L9clJg2xb8+D8ovpbUILWePLX7d@vger.kernel.org
X-Gm-Message-State: AOJu0YznsWUqwzH1Ujm6IPI/IqFhSYnyf0Kg3WM7iYtJbRwkoCtKfkNz
	EdIrOhWomQXNXFN+hIvu629ezW3I7aDZayjbCRazj53FntoAuW+ov1LO
X-Gm-Gg: AfdE7ckW+/7XLD/u8Vrik3P5lldXMjQTq8UhP+ocfHnfbthk6TEGnjpxZt+/JjSfs/Y
	5PVnSDLsJo5EXlmSrw8RgUgl6iRxc3Gl4pchBLqt+EcduYe3jLthQd4A1dDGsdIEZFfSZRM9XZO
	jY3N6NHC8paiHtIbrYuFR4AVmDW9l6d5LkL+P+X7vz44l2YSrADMYVdZUd/5QSR0mKSd1CIJMWm
	EMnqVr36x/OFo4RnG+l+W9De2+kQ1YA1KzD+wnrT1vppnNehlZkDoa/AkYcD9AzDyej/G4JE9jP
	4ptOl2U8bJxWagIBYVZUpdW83ubBa3LPRt18FM7gktzDdA4iHNavPrFgy77Gx+V2f6XeYXn/Eb0
	lj/CQBgW6Ey5oa7nQVcuMfL2MRXcV/e0INr8Z2wmeYrRwWQe5gLT5ffea+V03++UU+GX1ETlcE1
	wuOm0UaWGkGzKaRVDAFs+9O5OuEI3RdRQnufooo29/pCTsyqg4W/tsRTIFpPg=
X-Received: by 2002:a53:acc6:0:20b0:667:b42a:7d81 with SMTP id 956f58d0204a3-667d7cd4c81mr12841124d50.106.1784207801920;
        Thu, 16 Jul 2026 06:16:41 -0700 (PDT)
Received: from nixos-office.attlocal.net ([2600:1700:566e:ba00:a781:6ac9:7067:ceb8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fe48dfesm3281658d50.16.2026.07.16.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:16:40 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: fix unmet dependencies from missing GPIOLIB
Date: Thu, 16 Jul 2026 14:16:26 +0100
Message-ID: <20260716131626.103199-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 4 options, PINCTRL_PIC32, PINCTRL_STMFX, PINCTRL_IPROC_GPIO, and
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
Changes from v1:
- fix copy-paste mistake in commit message
Link: https://lore.kernel.org/all/20260716033441.21330-1-julianbraha@gmail.com/

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

