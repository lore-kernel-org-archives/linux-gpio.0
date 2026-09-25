Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FC44D0CF1;
	Fri, 25 Sep 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352585; cv=none; b=Bwvc0rXtJQcxv57X+O9WlJJfnkoD/uozqUrV5NE8OJjTqYvnryDw+U2/eUtH9aB/C1HhpLrqe2rbk0x6aILl8yCqjbbO5kSL4tJiTakqfInMqS4/risKfhPCDiGmNaX/U39TL+eeshIqllRnPTLl+uaAJBc7T/+uddX2AqnViMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352585; c=relaxed/simple;
	bh=+V0A6VK6H6a9Qj6akZvP5O63YKi7bW4Z9sXgZ1Ina64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlhvmuxUEHNPVS1H5dcTUaQwXehQdX0+PWFwoDRGMnunnbqDB6X1+O/KswRx4WnrDBxSfjMwbYw5LY/QVwIoKx5hHyt4DGyv7IyAbwQdU2dYk6Tqf09HYy4XiIfn/63vI1Ro+6RDO+weu+Y4zz60gcUbaNkU2en36+ZSkdmgTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMHcUvoe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMHcUvoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352581; x=1821888581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+V0A6VK6H6a9Qj6akZvP5O63YKi7bW4Z9sXgZ1Ina64=;
  b=fMHcUvoe13dKNUS91g/OM+PToiyupWUlCXuR50+5wYwdFdQ09x8WYQuD
   H/ZEJkf1gXVNEUpRwVn9NMR+agnZXdISwTO3H0XVMWPH3F7XhLH2sh+Bj
   yqBk/Z4JvKgvmzyZGseLpPdY6zDlIalLoeQDo1toebaCK+tgMsmvsqYUH
   7h9qZ5gGz/9hlrmznTpAlRxWttOx06nskCYp64j4XNM13g4hgQ9/a/Sjh
   XiJCnepQZMwDv1eDg90VyuBLwvvZsLzqy0XdAWIpTx+hku37IOV9le80h
   RehymYaZHuotCYAd3wa/bHKyxYY3+avp5Oo8tpreUYQEFsAb9KjGe/aP/
   w==;
X-CSE-ConnectionGUID: czMmGJ+9SSOmBjUOBoXhEQ==
X-CSE-MsgGUID: ZDHwRnsRTqmQVZJ4NJt5Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102503614"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102503614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:31 -0700
X-CSE-ConnectionGUID: zmRMQqNXSCCC6g66gETcNg==
X-CSE-MsgGUID: ZA/ZycOSTwGjKeCugSihow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302311899"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 09:09:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A428A9D; Fri, 25 Sep 2026 18:09:26 +0200 (CEST)
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
Subject: [PATCH v1 2/5] gpio: Move Intel PMIC GPIO drivers to the dedicated subfolder
Date: Fri, 25 Sep 2026 17:57:04 +0200
Message-ID: <20260925160913.1648565-3-andriy.shevchenko@linux.intel.com>
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
Intel PMIC GPIO drivers to the dedicated subfolder.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                                   |  4 +--
 drivers/gpio/Kconfig                          | 26 ----------------
 drivers/gpio/Makefile                         |  2 --
 drivers/gpio/intel/Kconfig                    |  2 ++
 drivers/gpio/intel/Makefile                   |  2 ++
 drivers/gpio/intel/pmic/Kconfig               | 30 +++++++++++++++++++
 drivers/gpio/intel/pmic/Makefile              |  5 ++++
 .../gpio/{ => intel/pmic}/gpio-crystalcove.c  |  0
 drivers/gpio/{ => intel/pmic}/gpio-wcove.c    |  0
 9 files changed, 41 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpio/intel/pmic/Kconfig
 create mode 100644 drivers/gpio/intel/pmic/Makefile
 rename drivers/gpio/{ => intel/pmic}/gpio-crystalcove.c (100%)
 rename drivers/gpio/{ => intel/pmic}/gpio-wcove.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51e27580be9f..1943aa049c87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13394,7 +13394,7 @@ INTEL PMIC GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
-F:	drivers/gpio/gpio-*cove.c
+F:	drivers/gpio/intel/pmic/
 
 INTEL PMIC MULTIFUNCTION DEVICE DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
@@ -29374,7 +29374,7 @@ WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/gpio/gpio-wcove.c
+F:	drivers/gpio/intel/pmic/gpio-wcove.c
 
 WHWAVE RTC DRIVER
 M:	Dianlong Li <long17.cool@163.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e04f6d761153..a80f4303bb0e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1407,19 +1407,6 @@ config GPIO_CROS_EC
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio-cros-ec.
 
-config GPIO_CRYSTAL_COVE
-	tristate "GPIO support for Crystal Cove PMIC"
-	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC
-	select GPIOLIB_IRQCHIP
-	help
-	  Support for GPIO pins on Crystal Cove PMIC.
-
-	  Say Yes if you have a Intel SoC-based tablet with Crystal Cove PMIC
-	  inside.
-
-	  This driver can also be built as a module. If so, the module will be
-	  called gpio-crystalcove.
-
 config GPIO_CS5535
 	tristate "AMD CS5535/CS5536 GPIO support"
 	depends on X86 || MIPS || COMPILE_TEST
@@ -1759,19 +1746,6 @@ config GPIO_TWL6040
 	  Say yes here to access the GPO signals of twl6040
 	  audio chip from Texas Instruments.
 
-config GPIO_WHISKEY_COVE
-	tristate "GPIO support for Whiskey Cove PMIC"
-	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC_BXTWC
-	select GPIOLIB_IRQCHIP
-	help
-	  Support for GPIO pins on Whiskey Cove PMIC.
-
-	  Say Yes if you have an Intel SoC-based tablet with Whiskey Cove PMIC
-	  inside.
-
-	  This driver can also be built as a module. If so, the module will be
-	  called gpio-wcove.
-
 config GPIO_WM831X
 	tristate "WM831x GPIOs"
 	depends on MFD_WM831X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a4f1ec80b794..747df558ba92 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -57,7 +57,6 @@ obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_CROS_EC)		+= gpio-cros-ec.o
-obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
 obj-$(CONFIG_GPIO_CS5535)		+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
@@ -209,7 +208,6 @@ obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
 obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
-obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
 obj-$(CONFIG_GPIO_WM831X)		+= gpio-wm831x.o
 obj-$(CONFIG_GPIO_WM8350)		+= gpio-wm8350.o
diff --git a/drivers/gpio/intel/Kconfig b/drivers/gpio/intel/Kconfig
index 4d1a37a6c5e8..64fd3aa84ac2 100644
--- a/drivers/gpio/intel/Kconfig
+++ b/drivers/gpio/intel/Kconfig
@@ -35,3 +35,5 @@ config GPIO_MERRIFIELD
 	  Say Y here to support Intel Merrifield GPIO.
 
 endif
+
+source "drivers/gpio/intel/pmic/Kconfig"
diff --git a/drivers/gpio/intel/Makefile b/drivers/gpio/intel/Makefile
index c8c8aea69c29..acff63df179a 100644
--- a/drivers/gpio/intel/Makefile
+++ b/drivers/gpio/intel/Makefile
@@ -4,3 +4,5 @@
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
+
+obj-y				+= pmic/
diff --git a/drivers/gpio/intel/pmic/Kconfig b/drivers/gpio/intel/pmic/Kconfig
new file mode 100644
index 000000000000..fe21314697a3
--- /dev/null
+++ b/drivers/gpio/intel/pmic/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Intel PMIC GPIO drivers
+#
+
+config GPIO_CRYSTAL_COVE
+	tristate "GPIO support for Crystal Cove PMIC"
+	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Support for GPIO pins on Crystal Cove PMIC.
+
+	  Say Yes if you have a Intel SoC-based tablet with Crystal Cove PMIC
+	  inside.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-crystalcove.
+
+config GPIO_WHISKEY_COVE
+	tristate "GPIO support for Whiskey Cove PMIC"
+	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC_BXTWC
+	select GPIOLIB_IRQCHIP
+	help
+	  Support for GPIO pins on Whiskey Cove PMIC.
+
+	  Say Yes if you have an Intel SoC-based tablet with Whiskey Cove PMIC
+	  inside.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-wcove.
diff --git a/drivers/gpio/intel/pmic/Makefile b/drivers/gpio/intel/pmic/Makefile
new file mode 100644
index 000000000000..2a95d7735153
--- /dev/null
+++ b/drivers/gpio/intel/pmic/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# Intel PMIC GPIO drivers
+
+obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
+obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/intel/pmic/gpio-crystalcove.c
similarity index 100%
rename from drivers/gpio/gpio-crystalcove.c
rename to drivers/gpio/intel/pmic/gpio-crystalcove.c
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/intel/pmic/gpio-wcove.c
similarity index 100%
rename from drivers/gpio/gpio-wcove.c
rename to drivers/gpio/intel/pmic/gpio-wcove.c
-- 
2.50.1

