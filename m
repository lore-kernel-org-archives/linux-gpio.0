Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5324D0CD6;
	Fri, 25 Sep 2026 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352588; cv=none; b=mbacamQWU5GoUuX6FefRRj8UR0LLE2CJVH2Zb7vpCOpJm1T/+A/3FNw6gnYgVvRkIZ6ja/pvbyR0CQARC2GNr1wquP++KyPwX8F6uS9PYLmpstbZg9DcMU/P5qQOze53QSsH6LCXKyrFS+B6mprRWdbS1XlZG4/aS+1775mUQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352588; c=relaxed/simple;
	bh=bC9sZHR4wYGX872/LOOTOCEMOHDbKWzzTWF5dwNr/J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fE7OOnss9yml6RjfHGV7wV115RRZ+KZ9iE63aBGdAj338eF1dDsqRXTHsl1FGJE95yppI1OPOXqNx8RnYUZNZG3Tn5DiZWfAB60pJ6wpSTXyu81h/vYYbS+GKDEwGScWMU1wA8eDBA5AwAtoia07qRE/7nks3g9Li9UvpSaN43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQQoiFYO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQQoiFYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352585; x=1821888585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bC9sZHR4wYGX872/LOOTOCEMOHDbKWzzTWF5dwNr/J4=;
  b=JQQoiFYOLKEzZmZcfWbWIau2RPQemskDws6+ZVce8AckKuoqC428o3tI
   CArT/rKy9tTbXm5QqAVr1pnhf2TfLlxERTlAsKAwJyQEAkafYWV/cIR/8
   4MjDXxFZsU9nGC/WjSYPzLdogRJnyKlmPV1FsI2j+C+I3xjvM/q+lq9oT
   RI4LZbenCspVIylza1gY5QLRvcfW0ybDe+DMZm8fg/4IIZXA7yDTHau4T
   l7DpWEhdA/0r5JmcuGEf/nj27CBYKxKjOYAsz9DA6K5XBKFWUICZ4nzD3
   vdcTrKJqqS6i0xKGG0TlIIO/BOzi7wz2TYJKbqKIVXqE5i2G/TpJZGPJl
   Q==;
X-CSE-ConnectionGUID: P4ZW8ibUS7ynEXu1n3vDTg==
X-CSE-MsgGUID: 2JHKMYn6RsafYGAe/7mm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102503639"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102503639"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:36 -0700
X-CSE-ConnectionGUID: 2yUzoeNjSWmzYz3AAojJfA==
X-CSE-MsgGUID: XWiQK/w7Rpq/+CQshwRoig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302311915"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 09:09:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B2F4CA2; Fri, 25 Sep 2026 18:09:26 +0200 (CEST)
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
Subject: [PATCH v1 5/5] gpio: Move Intel vGPIO driver to the intel subfolder
Date: Fri, 25 Sep 2026 17:57:07 +0200
Message-ID: <20260925160913.1648565-6-andriy.shevchenko@linux.intel.com>
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
Intel vGPIO driver to the intel subfolder.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                                   |  1 -
 drivers/gpio/Kconfig                          | 18 ------------------
 drivers/gpio/Makefile                         |  1 -
 drivers/gpio/intel/Kconfig                    | 18 ++++++++++++++++++
 drivers/gpio/intel/Makefile                   |  2 ++
 drivers/gpio/{ => intel}/gpio-graniterapids.c |  0
 6 files changed, 20 insertions(+), 20 deletions(-)
 rename drivers/gpio/{ => intel}/gpio-graniterapids.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b3f9f20f8264..fdd451ada851 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13131,7 +13131,6 @@ M:	Andy Shevchenko <andy@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
-F:	drivers/gpio/gpio-graniterapids.c
 F:	drivers/gpio/intel/
 
 INTEL GPIO GPE DRIVER
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0353226cb2d7..4b092786ec3b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -362,24 +362,6 @@ config GPIO_GENERIC_PLATFORM
 	help
 	  Say yes here to support basic platform_device memory-mapped GPIO controllers.
 
-config GPIO_GRANITERAPIDS
-	tristate "Intel Granite Rapids-D vGPIO support"
-	depends on X86 || COMPILE_TEST
-	select GPIOLIB_IRQCHIP
-	help
-	  Select this to enable virtual GPIO support on platforms with the
-	  following SoCs:
-
-	  - Intel Granite Rapids-D
-
-	  The driver enables basic GPIO functionality and implements interrupt
-	  support. The virtual GPIO driver controls GPIO lines via a firmware
-	  interface. The physical GPIO pins reside on device that is external
-	  from the main SoC package, such as a BMC or a CPLD.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called gpio-graniterapids.
-
 config GPIO_GRGPIO
 	tristate "Aeroflex Gaisler GRGPIO support"
 	depends on OF || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ba01904588d9..8e24a6f7d193 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -74,7 +74,6 @@ obj-$(CONFIG_GPIO_FTGPIO010)		+= gpio-ftgpio010.o
 obj-$(CONFIG_GPIO_FXL6408)		+= gpio-fxl6408.o
 obj-$(CONFIG_GPIO_GE_FPGA)		+= gpio-ge.o
 obj-$(CONFIG_GPIO_GPIO_MM)		+= gpio-gpio-mm.o
-obj-$(CONFIG_GPIO_GRANITERAPIDS)	+= gpio-graniterapids.o
 obj-$(CONFIG_GPIO_GRGPIO)		+= gpio-grgpio.o
 obj-$(CONFIG_GPIO_GW_PLD)		+= gpio-gw-pld.o
 obj-$(CONFIG_GPIO_HISI)                 += gpio-hisi.o
diff --git a/drivers/gpio/intel/Kconfig b/drivers/gpio/intel/Kconfig
index 54fc93b362c6..39e71c7dd71a 100644
--- a/drivers/gpio/intel/Kconfig
+++ b/drivers/gpio/intel/Kconfig
@@ -5,6 +5,24 @@
 
 if HAS_IOMEM
 
+config GPIO_GRANITERAPIDS
+	tristate "Intel Granite Rapids-D vGPIO support"
+	depends on X86 || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	help
+	  Select this to enable virtual GPIO support on platforms with the
+	  following SoCs:
+
+	  - Intel Granite Rapids-D
+
+	  The driver enables basic GPIO functionality and implements interrupt
+	  support. The virtual GPIO driver controls GPIO lines via a firmware
+	  interface. The physical GPIO pins reside on device that is external
+	  from the main SoC package, such as a BMC or a CPLD.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-graniterapids.
+
 config GPIO_TANGIER
 	tristate
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/intel/Makefile b/drivers/gpio/intel/Makefile
index cb373d25b56e..f4b24e7e7b02 100644
--- a/drivers/gpio/intel/Makefile
+++ b/drivers/gpio/intel/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Intel GPIO drivers
 
+obj-$(CONFIG_GPIO_GRANITERAPIDS)	+= gpio-graniterapids.o
+
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/intel/gpio-graniterapids.c
similarity index 100%
rename from drivers/gpio/gpio-graniterapids.c
rename to drivers/gpio/intel/gpio-graniterapids.c
-- 
2.50.1

