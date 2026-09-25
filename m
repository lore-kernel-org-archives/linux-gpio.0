Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C443DEA1;
	Fri, 25 Sep 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352585; cv=none; b=BFPjKxHYZSextOigB58gjAvF4uD/KNb2kmBc0UufLv7Ue9bWmVTjQMKwFTaKBsHWCcl/77t9B2bGVC2/8CMXSE/qMnpXUUoKD6pn098NZHhs9BsN20dC5XqZFnQro8LZgJuxgBY/YkdCLzkkOfW68sOH7SWLhQcGS4kfr1PP/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352585; c=relaxed/simple;
	bh=ZID7JRwZZ/vpRd3juSgnBKcQBzAgcNffKDMYQ6Myfrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+8JxprV6cKVddNTRg0K2t97OXzKJnQC5A+lalofwwJ3acWWGf2nuUqY6sCzp2I2tqssFulC54yu/sMkutbusO/1HiFsrq5AJHCXuxq/PSH17OI1gJ6r2g3wsaBt81VtdH4NTMc4RnJ1Cl2Ln8C+Igbsy8i0CeFMN+sreaJ5sWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW9Z7bWZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW9Z7bWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352581; x=1821888581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZID7JRwZZ/vpRd3juSgnBKcQBzAgcNffKDMYQ6Myfrg=;
  b=bW9Z7bWZlZYDe4HpiAdUpF87rxWyYwgmWxXZr+gtnAoOnJXDzM9dwZRh
   /yvLZIY0BNKvEYFe5zFKH/YHwJgTTsqf86srpj7TfqHXmwx5uem9EfeAr
   4751uo8NTZFxcTOwegEDS8bRHX0dJUQKn4BA0eSz077VzjIwS7eYj01LW
   2Kys4bfJR8nNqhUgPf6jtdsjcfXDvJBPgMcvP8cdcYk8CnT8tD2/KhQlv
   G0I7ckazx35lL2X3yZ+vrpoYlfaHnRDyPF++jpYcUogG+aplP+o6ad54n
   KxcKxyf3XDFkmksJzfqKIiBknA4exqbugxxcgPg9gjHgRlVb5pOjaXzA9
   Q==;
X-CSE-ConnectionGUID: qDK3zLNGR/awl8m/4rd8lg==
X-CSE-MsgGUID: w1yz0sE6TqGTAYIUWQVxyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102503624"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102503624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:31 -0700
X-CSE-ConnectionGUID: 8aDdRiecQDmZbkbxuZChrw==
X-CSE-MsgGUID: QJUfVz3tRU+3O8aZWeoo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302311902"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 09:09:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9EF7A9B; Fri, 25 Sep 2026 18:09:26 +0200 (CEST)
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
Subject: [PATCH v1 1/5] gpio: Move Intel GPIO drivers to the dedicated subfolder
Date: Fri, 25 Sep 2026 17:57:03 +0200
Message-ID: <20260925160913.1648565-2-andriy.shevchenko@linux.intel.com>
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

For better maintenance and development experience, move Intel GPIO
drivers to the dedicated subfolder. This starts with Intel MID
and Elkhart Lake ones that share the same core part.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                                 |  9 ++---
 drivers/gpio/Kconfig                        | 31 ++---------------
 drivers/gpio/Makefile                       |  5 ++-
 drivers/gpio/intel/Kconfig                  | 37 +++++++++++++++++++++
 drivers/gpio/intel/Makefile                 |  6 ++++
 drivers/gpio/{ => intel}/gpio-elkhartlake.c |  0
 drivers/gpio/{ => intel}/gpio-merrifield.c  |  0
 drivers/gpio/{ => intel}/gpio-tangier.c     |  0
 drivers/gpio/{ => intel}/gpio-tangier.h     |  0
 9 files changed, 50 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpio/intel/Kconfig
 create mode 100644 drivers/gpio/intel/Makefile
 rename drivers/gpio/{ => intel}/gpio-elkhartlake.c (100%)
 rename drivers/gpio/{ => intel}/gpio-merrifield.c (100%)
 rename drivers/gpio/{ => intel}/gpio-tangier.c (100%)
 rename drivers/gpio/{ => intel}/gpio-tangier.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..51e27580be9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13131,16 +13131,13 @@ M:	Andy Shevchenko <andy@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
-F:	drivers/gpio/gpio-elkhartlake.c
 F:	drivers/gpio/gpio-graniterapids.c
 F:	drivers/gpio/gpio-ich.c
-F:	drivers/gpio/gpio-merrifield.c
 F:	drivers/gpio/gpio-ml-ioh.c
 F:	drivers/gpio/gpio-pch.c
 F:	drivers/gpio/gpio-sch.c
 F:	drivers/gpio/gpio-sodaville.c
-F:	drivers/gpio/gpio-tangier.c
-F:	drivers/gpio/gpio-tangier.h
+F:	drivers/gpio/intel/
 
 INTEL GPIO GPE DRIVER
 M:	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
@@ -13361,8 +13358,8 @@ F:	arch/x86/pci/intel_mid.c
 F:	arch/x86/platform/intel-mid/
 F:	drivers/dma/hsu/
 F:	drivers/extcon/extcon-intel-mrfld.c
-F:	drivers/gpio/gpio-merrifield.c
-F:	drivers/gpio/gpio-tangier.*
+F:	drivers/gpio/intel/gpio-merrifield.c
+F:	drivers/gpio/intel/gpio-tangier.*
 F:	drivers/iio/adc/intel_mrfld_adc.c
 F:	drivers/mfd/intel_soc_pmic_mrfld.c
 F:	drivers/pinctrl/intel/pinctrl-merrifield.c
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..e04f6d761153 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -129,6 +129,8 @@ config GPIO_SWNODE_UNDEFINED
 
 # put drivers in the right section, in alphabetical order
 
+source "drivers/gpio/intel/Kconfig"
+
 # This symbol is selected by both I2C and SPI expanders
 config GPIO_MAX730X
 	tristate
@@ -756,17 +758,6 @@ config GPIO_SYSCON
 	help
 	  Say yes here to support GPIO functionality though SYSCON driver.
 
-config GPIO_TANGIER
-	tristate
-	select GPIOLIB_IRQCHIP
-	help
-	  GPIO support for Intel Tangier and compatible platforms.
-	  Currently supported:
-	   - Elkhart Lake
-	   - Merrifield
-
-	  If built as a module its name will be gpio-tangier.
-
 config GPIO_TB10X
 	bool "Abilis Systems TB10x GPIO controller"
 	depends on ARC_PLAT_TB10X || COMPILE_TEST
@@ -1477,17 +1468,6 @@ config HTC_EGPIO
 	  several HTC phones.  It provides basic support for input
 	  pins, output pins, and IRQs.
 
-config GPIO_ELKHARTLAKE
-	tristate "Intel Elkhart Lake PSE GPIO support"
-	depends on INTEL_EHL_PSE_IO
-	select GPIO_TANGIER
-	help
-	  Select this option to enable GPIO support for Intel Elkhart Lake
-	  PSE GPIO IP.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called gpio-elkhartlake.
-
 config GPIO_JANZ_TTL
 	tristate "Janz VMOD-TTL Digital IO Module"
 	depends on MFD_JANZ_CMODIO
@@ -1862,13 +1842,6 @@ config GPIO_BT8XX
 
 	  If unsure, say N.
 
-config GPIO_MERRIFIELD
-	tristate "Intel Merrifield GPIO support"
-	depends on X86_INTEL_MID
-	select GPIO_TANGIER
-	help
-	  Say Y here to support Intel Merrifield GPIO.
-
 config GPIO_MLXBF
 	tristate "Mellanox BlueField SoC GPIO"
 	depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMPILE_TEST)
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..a4f1ec80b794 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -22,6 +22,8 @@ obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 # directly supported by gpio-generic
 gpio-generic-$(CONFIG_GPIO_GENERIC)	+= gpio-mmio.o
 
+obj-y				+= intel/
+
 obj-$(CONFIG_GPIO_104_DIO_48E)		+= gpio-104-dio-48e.o
 obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
@@ -64,7 +66,6 @@ obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DS4520)		+= gpio-ds4520.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
-obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
 obj-$(CONFIG_GPIO_EN7523)		+= gpio-en7523.o
 obj-$(CONFIG_GPIO_EP93XX)		+= gpio-ep93xx.o
@@ -116,7 +117,6 @@ obj-$(CONFIG_GPIO_MAX77759)		+= gpio-max77759.o
 obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
-obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
 obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MLXBF)		+= gpio-mlxbf.o
 obj-$(CONFIG_GPIO_MLXBF2)		+= gpio-mlxbf2.o
@@ -179,7 +179,6 @@ obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
 obj-$(CONFIG_GPIO_STP_XWAY)		+= gpio-stp-xway.o
 obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
-obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
diff --git a/drivers/gpio/intel/Kconfig b/drivers/gpio/intel/Kconfig
new file mode 100644
index 000000000000..4d1a37a6c5e8
--- /dev/null
+++ b/drivers/gpio/intel/Kconfig
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Intel GPIO drivers
+#
+
+if HAS_IOMEM
+
+config GPIO_TANGIER
+	tristate
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO support for Intel Tangier and compatible platforms.
+	  Currently supported:
+	   - Elkhart Lake
+	   - Merrifield
+
+	  If built as a module its name will be gpio-tangier.
+
+config GPIO_ELKHARTLAKE
+	tristate "Intel Elkhart Lake PSE GPIO support"
+	depends on INTEL_EHL_PSE_IO
+	select GPIO_TANGIER
+	help
+	  Select this option to enable GPIO support for Intel Elkhart Lake
+	  PSE GPIO IP.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-elkhartlake.
+
+config GPIO_MERRIFIELD
+	tristate "Intel Merrifield GPIO support"
+	depends on X86_INTEL_MID
+	select GPIO_TANGIER
+	help
+	  Say Y here to support Intel Merrifield GPIO.
+
+endif
diff --git a/drivers/gpio/intel/Makefile b/drivers/gpio/intel/Makefile
new file mode 100644
index 000000000000..c8c8aea69c29
--- /dev/null
+++ b/drivers/gpio/intel/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+# Intel GPIO drivers
+
+obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
+obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
+obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/intel/gpio-elkhartlake.c
similarity index 100%
rename from drivers/gpio/gpio-elkhartlake.c
rename to drivers/gpio/intel/gpio-elkhartlake.c
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/intel/gpio-merrifield.c
similarity index 100%
rename from drivers/gpio/gpio-merrifield.c
rename to drivers/gpio/intel/gpio-merrifield.c
diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/intel/gpio-tangier.c
similarity index 100%
rename from drivers/gpio/gpio-tangier.c
rename to drivers/gpio/intel/gpio-tangier.c
diff --git a/drivers/gpio/gpio-tangier.h b/drivers/gpio/intel/gpio-tangier.h
similarity index 100%
rename from drivers/gpio/gpio-tangier.h
rename to drivers/gpio/intel/gpio-tangier.h
-- 
2.50.1

