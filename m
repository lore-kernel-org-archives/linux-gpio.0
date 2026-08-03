Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D634EEEA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796545; cv=none; b=C3wY9s7/v0VmLqvk/s+VaO2a8EYeDV83xgWuiu2MQ5pzyaywDP2+kJMZKSlEIqkjXNLDidTUyLy1f6UHvcuQZyVSAEUNCwnuuIOFyH4pAuKggaB6mnwhMsz/me8VFkGNAGh+FsXYvfmTtw/UqSsL9ja0Uz+pEjDDyNbbFXqf04k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796545; c=relaxed/simple;
	bh=TibBIhEa9/QjTOS77NLs16D+pe446M8Yxm5pEmsQc/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H50lA0qyvOSo+nhc5+oKcSgosxj+BzYTvN79tzaZr07qhpszvGKwZDcGIbYuayiDA7wTurMlQl1WFTRkvNX3fCS4SPmGamz/yPndfpRX9LmivjcHI7mMC972i4r1eRpEBs94pchzcS8IfKCPifM6SKylDboGsiwOTf0AgBSB0bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZQWDFuF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZQWDFuF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485ef63b68so4270115b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796543; x=1786401343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNjLiku9OGDGFHcyr8i3iGPZu1wi19gAKG2Bs0IITD4=;
        b=UZQWDFuFIiUPvczCb1nmGwdgENF2WgasfSUF7f9oI1ctup3tVarC8l3cuvidSd329v
         T2cQBbsOVEJAGWSYiZtiHHbrjIWCrv5OngsvNNiNeJAtXrxGy+zlBac8lgo9vQ3uc5TY
         gtqQAs0525SBBI1YIhKGgeMCc4Vl88hzMdQsquW+03w6r+LgEWlSeYdcXnDzbpBulJfi
         +TUC+uTHr1HTnIJjizXcygyrlGkCdLZyCRkzVt1x8toJm721syu69WplgnS1Urq7VjPE
         LvctHGooNlNBLB3oOoy936HRZDgQTp+2HhiMx3vYzxpI3/W6jODv2+qrX7xmSLXhVgxH
         Jybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796543; x=1786401343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNjLiku9OGDGFHcyr8i3iGPZu1wi19gAKG2Bs0IITD4=;
        b=kvK4zVd+3WBS0kn34WjA1W0CNK3oy9tFPtu0Iw5OV/RXR4VhSz2sS2kFoHFQDpL4RZ
         tGTIXfSkf6VLgGsjnRV+wBakkNSHYtasUAGJji+6XhjDNNDMeGrKAwQBJabizBPAlAQm
         2rAgFMIIDY4arUFQ9qT4vWWU5d3BQq8kJnHZbXYEcaTWMh73cJdjtTNpLahl947PsD5c
         TZGTnlLvT31vO8xSuBqsGTjFC2kKhbIOmdrjk0YvkN4lnBWn0PeHX2Ox6Q0AHZ2vyhrq
         gXKtmwmoWAa2gEZ8/B0+BOrWXBiW2H8o2FUr3yZu6Am1LGrGtFW1nataaPWrKntIhTBN
         118g==
X-Gm-Message-State: AOJu0YzirSf3Goxv9KtkPXpz5PNf7siF3I82koRQWoQu6/T9xWbGc4TY
	+yRATfVbwjIbrT8RIvnRznv0BgVdJI58jF6BC2l5DiRaemvMI0YrYdGSNn4Ckw==
X-Gm-Gg: AR+sD11qsGZl4IjAyLf1ZKnN5A4MktmkCz5UDQGK1FupWXhoBXESxu/JFkZALtWgSpO
	/xMQl7l0xq9oXPYQ8DWdyBbY/1x937LYp40qsdd9uaBcnU2+cGunO6aFRdnHL+6w2VOmGERvV2i
	9viZnYjquULvbfwqKff1vhLrKsfhl9Msqw5c5zk/cJtzI5KlZVZf6z3MTjrCI+6wauSO4/fckIs
	JaqViySL695i9Q0yJnQ5YiwL2Cd9xgWpxpZSS4wsgmmosSBVhc3XIia5jivlaJb0sW86SvgxuiP
	uwrIsDJgghNv9M6XNf4w9nuHF2f3qbgG5+0ui8aNON6f0GG0Kfq5QR6iZ0xD0cJnt5BxJx4y3P3
	hFf5c+djm5wZyvG5WJ5Sc0QAWSr5s5YgdAqNi2VfGv4fID/Ib/anprHB5E90Ji2796wV32NxK7b
	SRLAQBuUR1UD6PanjXplWqjjvz0J3XdDhcqidsed5zad0FE+kgq0AU8zq5ukSeuZfnERVrpRL7X
	sInI3RAZxrQsFx7IgTQsFT2mNPpxr6c6t5KUnyDSwJmuPPN48FDOAOM5Onx0oYlkaKmFKjbonqq
	0rc7nXtVVwEcmbsRsfpDPKh1hZVcBcRKjwsoAg==
X-Received: by 2002:a05:6a00:148d:b0:848:4424:2b83 with SMTP id d2e1a72fcca58-84ee492211bmr10553771b3a.77.1785796543456;
        Mon, 03 Aug 2026 15:35:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/8] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
Date: Mon,  3 Aug 2026 15:35:32 -0700
Message-ID: <20260803223539.86303-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
drivers/gpio/gpio-ppc44x.c. The driver has no architecture-specific
dependencies and follows the same pattern as other PowerPC GPIO
drivers already in drivers/gpio/ (e.g. gpio-mpc8xxx, gpio-mpc5200).

- Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC44X
- Updated ppc44x_defconfig and warp_defconfig to use the new symbol
- Marked the new option as tristate (was bool) since the driver
  supports module build via module_platform_driver()

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/configs/44x/warp_defconfig                    | 2 +-
 arch/powerpc/configs/ppc44x_defconfig                      | 2 +-
 arch/powerpc/platforms/44x/Kconfig                         | 7 -------
 arch/powerpc/platforms/44x/Makefile                        | 2 +-
 drivers/gpio/Kconfig                                       | 7 +++++++
 drivers/gpio/Makefile                                      | 1 +
 .../platforms/44x/gpio.c => drivers/gpio/gpio-ppc44x.c     | 0
 7 files changed, 11 insertions(+), 10 deletions(-)
 rename arch/powerpc/platforms/44x/gpio.c => drivers/gpio/gpio-ppc44x.c (100%)

diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
index 5757625469c4..d6014b9c5708 100644
--- a/arch/powerpc/configs/44x/warp_defconfig
+++ b/arch/powerpc/configs/44x/warp_defconfig
@@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_EBONY is not set
 CONFIG_WARP=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC44X=y
 CONFIG_HZ_1000=y
 CONFIG_CMDLINE="ip=on"
 # CONFIG_PCI is not set
diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
index 0dc537f6aff3..d351551e266f 100644
--- a/arch/powerpc/configs/ppc44x_defconfig
+++ b/arch/powerpc/configs/ppc44x_defconfig
@@ -22,7 +22,7 @@ CONFIG_GLACIER=y
 CONFIG_REDWOOD=y
 CONFIG_EIGER=y
 CONFIG_YOSEMITE=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC44X=y
 CONFIG_MATH_EMULATION=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index fc79f8466933..150813cea945 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -227,13 +227,6 @@ config PPC44x_SIMPLE
 	help
 	  This option enables the simple PowerPC 44x platform support.
 
-config PPC4xx_GPIO
-	bool "PPC4xx GPIO support"
-	depends on 44x
-	select GPIOLIB
-	help
-	  Enable gpiolib support for ppc440 based boards
-
 # 44x specific CPU modules, selected based on the board above.
 config 440EP
 	bool
diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index ca7b1bb442d9..4598d8b89bf4 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -15,4 +15,4 @@ obj-$(CONFIG_FSP2)	+= fsp2.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
 obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
-obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
+
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index af84285ed1bd..15fd5874f4ea 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -593,6 +593,13 @@ config GPIO_POLARFIRE_SOC
 	help
 	  Say yes here to support the GPIO controllers on Microchip FPGAs.
 
+config GPIO_PPC44X
+	tristate "PPC44x GPIO support"
+	depends on 44x
+	select GPIO_GENERIC
+	help
+	  Enable gpiolib support for ppc440 based boards.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index fa14581e3995..dc9e6d643b5b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -147,6 +147,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PPC44X)		+= gpio-ppc44x.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc44x.c
similarity index 100%
rename from arch/powerpc/platforms/44x/gpio.c
rename to drivers/gpio/gpio-ppc44x.c
-- 
2.55.0

