Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FC4DA9CE;
	Fri, 25 Sep 2026 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352580; cv=none; b=I8Zi5e8oaqZPRPeDs5prO35ScFOyQd1m+JjHFiC2EiUMxE+EAGorCrMLWoEdHcVPvjWA8DJ+0HyKzt12yLjUaxLrMttyUO4Fb033HRq9lt/Xt6pZEN773qKnMZJUOcu4TAbUuf88d5cA764eWG5KDx57+dIL/rDuq8nUmX0UT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352580; c=relaxed/simple;
	bh=fRQpUuq5bKxu0AhR/CrLVDVPvAw69w4u6UmuI+gI26Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+yjng3hnGJ+W6yIb+3FNGKJqJo37gReVpQ1EJIH75ovNNZnQe5ISWi+eu6rwyYRTd6+ArtP7pJbzaKBa3qBM9q016AH3nbA3hD2huZq+qC27J5fWjL/TPoOm6tBxQ1OHgs6ZASo7H9Qn/Yb0+WglJ3yBlGKSnPMaxuFpgFRfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wr0Xd3EW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wr0Xd3EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352575; x=1821888575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fRQpUuq5bKxu0AhR/CrLVDVPvAw69w4u6UmuI+gI26Q=;
  b=Wr0Xd3EW7dZ1zHs9MNFf6SsQwFh+Hq2a5Fi716b+inCB/ZhxCk/Top3d
   MmPetgYD5+QW/0LTwbaDaHw22llfONW8WtIzx1iaHuEX9sI2+U13OyyYc
   /nmvQI1ofPHuxCDCNTbNTehnb9GWmEFblF/1SOaoSF5KvQTAwHGd1c1Wn
   Zt6BzQP/gfP0E7/fBCugygFn5DOtIeoYb+PavNc4Q27c1yntn06G+NWZ0
   0Sv46Q8/WqsF3rbH+nEp7Sa6m0aZIHuvjcNQci7nTuHgbCj/Uz5+iE08n
   BoijXx1Wb2aVcl83PTHFbcaC8AjjVLSGBjMvECtZ1xhpTxEUum3v5XA9O
   g==;
X-CSE-ConnectionGUID: 9aOhdQZuS/uQdSchLRE1KQ==
X-CSE-MsgGUID: CPmBd4RRSimWAqob9Kb85A==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102503632"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102503632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:31 -0700
X-CSE-ConnectionGUID: /gUi2pz5TWuyBMqd3CS09Q==
X-CSE-MsgGUID: zD8tnmH0QgCdbmAkYB0mNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302311903"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 09:09:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A92BB9E; Fri, 25 Sep 2026 18:09:26 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v1 3/5] gpio: Move Intel PCH type of GPIO drivers to the intel subfolder
Date: Fri, 25 Sep 2026 17:57:05 +0200
Message-ID: <20260925160913.1648565-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For better maintenance and development experience, move
Intel PCH type of GPIO drivers to the intel subfolder.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                            |  6 +--
 drivers/gpio/Kconfig                   | 64 -----------------------
 drivers/gpio/Makefile                  |  4 --
 drivers/gpio/intel/Kconfig             | 70 ++++++++++++++++++++++++++
 drivers/gpio/intel/Makefile            |  7 +++
 drivers/gpio/{ => intel}/gpio-ich.c    |  0
 drivers/gpio/{ => intel}/gpio-ml-ioh.c |  0
 drivers/gpio/{ => intel}/gpio-pch.c    |  0
 drivers/gpio/{ => intel}/gpio-sch.c    |  0
 9 files changed, 78 insertions(+), 73 deletions(-)
 rename drivers/gpio/{ => intel}/gpio-ich.c (100%)
 rename drivers/gpio/{ => intel}/gpio-ml-ioh.c (100%)
 rename drivers/gpio/{ => intel}/gpio-pch.c (100%)
 rename drivers/gpio/{ => intel}/gpio-sch.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1943aa049c87..e1e4d64a5960 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12563,7 +12563,7 @@ F:	drivers/scsi/ips.*
 ICH LPC AND GPIO DRIVER
 M:	Peter Tyser <ptyser@xes-inc.com>
 S:	Maintained
-F:	drivers/gpio/gpio-ich.c
+F:	drivers/gpio/intel/gpio-ich.c
 F:	drivers/mfd/lpc_ich.c
 
 ICY I2C DRIVER
@@ -13132,10 +13132,6 @@ L:	linux-gpio@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	drivers/gpio/gpio-graniterapids.c
-F:	drivers/gpio/gpio-ich.c
-F:	drivers/gpio/gpio-ml-ioh.c
-F:	drivers/gpio/gpio-pch.c
-F:	drivers/gpio/gpio-sch.c
 F:	drivers/gpio/gpio-sodaville.c
 F:	drivers/gpio/intel/
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a80f4303bb0e..25d6e66bc4fc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -410,17 +410,6 @@ config GPIO_HLWD
 
 	  If unsure, say N.
 
-config GPIO_ICH
-	tristate "Intel ICH GPIO"
-	depends on (X86 && LPC_ICH) || (COMPILE_TEST && HAS_IOPORT)
-	help
-	  Say yes here to support the GPIO functionality of a number of Intel
-	  ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8
-	  ICH9, ICH10, Series 5/3400 (e.g. Ibex Peak), Series 6/C200 (e.g.
-	  Cougar Point), NM10 (Tiger Point), and 3100 (Whitmore Lake).
-
-	  If unsure, say N.
-
 config GPIO_IMX_SCU
        def_bool y
        depends on IMX_SCU
@@ -1063,33 +1052,6 @@ config GPIO_IT87
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio_it87.
 
-config GPIO_SCH
-	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on (X86 || COMPILE_TEST) && ACPI
-	depends on LPC_SCH
-	select GPIOLIB_IRQCHIP
-	help
-	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
-	  Intel Tunnel Creek processor, Intel Centerton processor or
-	  Intel Quark X1000 SoC.
-
-	  The Intel SCH contains a total of 14 GPIO pins. Ten GPIOs are
-	  powered by the core power rail and are turned off during sleep
-	  modes (S3 and higher). The remaining four GPIOs are powered by
-	  the Intel SCH suspend power supply. These GPIOs remain
-	  active during S3. The suspend-powered GPIOs can be used to wake the
-	  system from the Suspend-to-RAM state.
-
-	  The Intel Tunnel Creek processor has 5 GPIOs powered by the
-	  core power rail and 9 from suspend power supply.
-
-	  The Intel Centerton processor has a total of 30 GPIO pins.
-	  Twenty-one are powered by the core power rail and 9 from the
-	  suspend power supply.
-
-	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
-	  power well and 6 from the suspend power well.
-
 config GPIO_NOVALAKE
 	tristate "Intel Nova Lake GPIO-signaled ACPI events support"
 	depends on (X86 || COMPILE_TEST) && ACPI
@@ -1844,32 +1806,6 @@ config GPIO_MLXBF3
 	  control the desired GPIOs.
 	  This driver can also be built as a module called mlxbf3-gpio.
 
-config GPIO_ML_IOH
-	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
-	depends on X86 || COMPILE_TEST
-	select GENERIC_IRQ_CHIP
-	help
-	  ML7213 is companion chip for Intel Atom E6xx series.
-	  This driver can be used for OKI SEMICONDUCTOR ML7213 IOH (Input/Output
-	  Hub) which is for IVI (In-Vehicle Infotainment) use.
-	  This driver can access the IOH's GPIO device.
-
-config GPIO_PCH
-	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH (ML7223/ML7831) GPIO"
-	depends on X86_32 || MIPS || COMPILE_TEST
-	select GENERIC_IRQ_CHIP
-	help
-	  This driver is for PCH (Platform Controller Hub) GPIO of Intel Topcliff,
-	  which is an IOH (Input/Output Hub) for x86 embedded processor.
-	  This driver can access PCH GPIO device.
-
-	  This driver also can be used for LAPIS Semiconductor IOH (Input/
-	  Output Hub), ML7223 and ML7831.
-	  ML7223 IOH is for MP (Media Phone) use.
-	  ML7831 IOH is for general purpose use.
-	  ML7223/ML7831 is companion chip for Intel Atom E6xx series.
-	  ML7223/ML7831 is completely compatible for Intel EG20T PCH.
-
 config GPIO_PCI_IDIO_16
 	tristate "ACCES PCI-IDIO-16 GPIO support"
 	select REGMAP_MMIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 747df558ba92..819583fc0d0b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -81,7 +81,6 @@ obj-$(CONFIG_GPIO_HISI)                 += gpio-hisi.o
 obj-$(CONFIG_GPIO_HLWD)			+= gpio-hlwd.o
 obj-$(CONFIG_HTC_EGPIO)			+= gpio-htc-egpio.o
 obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
-obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
 obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
 obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
 obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
@@ -116,7 +115,6 @@ obj-$(CONFIG_GPIO_MAX77759)		+= gpio-max77759.o
 obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
-obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MLXBF)		+= gpio-mlxbf.o
 obj-$(CONFIG_GPIO_MLXBF2)		+= gpio-mlxbf2.o
 obj-$(CONFIG_GPIO_MLXBF3)		+= gpio-mlxbf3.o
@@ -141,7 +139,6 @@ obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
 obj-$(CONFIG_GPIO_PCA953X)		+= gpio-pca953x.o
 obj-$(CONFIG_GPIO_PCA9570)		+= gpio-pca9570.o
 obj-$(CONFIG_GPIO_PCF857X)		+= gpio-pcf857x.o
-obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
 obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
@@ -164,7 +161,6 @@ obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
-obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
diff --git a/drivers/gpio/intel/Kconfig b/drivers/gpio/intel/Kconfig
index 64fd3aa84ac2..ad8321ef1705 100644
--- a/drivers/gpio/intel/Kconfig
+++ b/drivers/gpio/intel/Kconfig
@@ -36,4 +36,74 @@ config GPIO_MERRIFIELD
 
 endif
 
+# PCH type of drivers
+
+if PCI
+
+config GPIO_ICH
+	tristate "Intel ICH GPIO"
+	depends on (X86 && LPC_ICH) || (COMPILE_TEST && HAS_IOPORT)
+	help
+	  Say yes here to support the GPIO functionality of a number of Intel
+	  ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8
+	  ICH9, ICH10, Series 5/3400 (e.g. Ibex Peak), Series 6/C200 (e.g.
+	  Cougar Point), NM10 (Tiger Point), and 3100 (Whitmore Lake).
+
+	  If unsure, say N.
+
+config GPIO_ML_IOH
+	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
+	depends on X86 || COMPILE_TEST
+	select GENERIC_IRQ_CHIP
+	help
+	  ML7213 is companion chip for Intel Atom E6xx series.
+	  This driver can be used for OKI SEMICONDUCTOR ML7213 IOH (Input/Output
+	  Hub) which is for IVI (In-Vehicle Infotainment) use.
+	  This driver can access the IOH's GPIO device.
+
+config GPIO_PCH
+	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH (ML7223/ML7831) GPIO"
+	depends on X86_32 || MIPS || COMPILE_TEST
+	select GENERIC_IRQ_CHIP
+	help
+	  This driver is for PCH (Platform Controller Hub) GPIO of Intel Topcliff,
+	  which is an IOH (Input/Output Hub) for x86 embedded processor.
+	  This driver can access PCH GPIO device.
+
+	  This driver also can be used for LAPIS Semiconductor IOH (Input/
+	  Output Hub), ML7223 and ML7831.
+	  ML7223 IOH is for MP (Media Phone) use.
+	  ML7831 IOH is for general purpose use.
+	  ML7223/ML7831 is companion chip for Intel Atom E6xx series.
+	  ML7223/ML7831 is completely compatible for Intel EG20T PCH.
+
+config GPIO_SCH
+	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
+	depends on (X86 || COMPILE_TEST) && ACPI
+	depends on LPC_SCH
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
+	  Intel Tunnel Creek processor, Intel Centerton processor or
+	  Intel Quark X1000 SoC.
+
+	  The Intel SCH contains a total of 14 GPIO pins. Ten GPIOs are
+	  powered by the core power rail and are turned off during sleep
+	  modes (S3 and higher). The remaining four GPIOs are powered by
+	  the Intel SCH suspend power supply. These GPIOs remain
+	  active during S3. The suspend-powered GPIOs can be used to wake the
+	  system from the Suspend-to-RAM state.
+
+	  The Intel Tunnel Creek processor has 5 GPIOs powered by the
+	  core power rail and 9 from suspend power supply.
+
+	  The Intel Centerton processor has a total of 30 GPIO pins.
+	  Twenty-one are powered by the core power rail and 9 from the
+	  suspend power supply.
+
+	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
+	  power well and 6 from the suspend power well.
+
+endif
+
 source "drivers/gpio/intel/pmic/Kconfig"
diff --git a/drivers/gpio/intel/Makefile b/drivers/gpio/intel/Makefile
index acff63df179a..26704fc1fa1a 100644
--- a/drivers/gpio/intel/Makefile
+++ b/drivers/gpio/intel/Makefile
@@ -5,4 +5,11 @@ obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
 
+# PCH type of drivers
+
+obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
+obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
+obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
+obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+
 obj-y				+= pmic/
diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/intel/gpio-ich.c
similarity index 100%
rename from drivers/gpio/gpio-ich.c
rename to drivers/gpio/intel/gpio-ich.c
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/intel/gpio-ml-ioh.c
similarity index 100%
rename from drivers/gpio/gpio-ml-ioh.c
rename to drivers/gpio/intel/gpio-ml-ioh.c
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/intel/gpio-pch.c
similarity index 100%
rename from drivers/gpio/gpio-pch.c
rename to drivers/gpio/intel/gpio-pch.c
diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/intel/gpio-sch.c
similarity index 100%
rename from drivers/gpio/gpio-sch.c
rename to drivers/gpio/intel/gpio-sch.c
-- 
2.50.1

