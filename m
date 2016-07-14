From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v6 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
Date: Thu, 14 Jul 2016 16:11:59 +0800
Message-ID: <1468483919-31258-4-git-send-email-jui.nee.tan@intel.com>
References: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

This driver uses the P2SB hide/unhide mechanism cooperatively
to pass the PCI BAR address to the gpio platform driver.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
Changes in V6:
	- Rename CONFIG_X86_INTEL_APL to CONFIG_X86_INTEL_IVI so that it
	  relates to the actual product, as suggested by Mika.
	- Rework Makefile according Andy's comments.
	- Rename lpc_ich_misc() to lpc_ich_add_gpio() so that the name should not
	  be so generic, as suggested by Andy.
	- Call lpc_ich_add_gpio() via priv->chipset.
	- lpc_ich_add_gpio() function will be moved from 
	  .../include/linux/mfd/lpc_ich.h to
	  .../drivers/mfd/lpc_ich-apl.h
	  as this is a part of internal driver interface as suggested by Andy.
	- Move enum lpc_chipsets from 
	  .../drivers/mfd/lpc_ich-core.c to
	  .../include/linux/mfd/lpc_ich.h
	  as lpc_chipsets is also accessed by lpc_ich_add_gpio().
	- Check if kasprintf return value for all 4 gpio controllers before
	  proceed to add platform device by using mfd_add_devices().

Changes in V5:
	- Split lpc-ich driver into two parts (lpc_ich-core and lpc_ich-apl).
	  The file lpc_ich-apl.c introduces gpio platform driver in MFD.
	- Rename Kconfig option CONFIG_X86_INTEL_NON_ACPI to CONFIG_X86_INTEL_APL
	  so that it reflects actual product as suggested by Mika.

Changes in V4:
	- Move Kconfig option CONFIG_X86_INTEL_NON_ACPI from
	  [PATCH 2/3] x86/platform/p2sb: New Primary to Sideband bridge support driver for Intel SOC's
	  to
	  [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
	  since the config is used in latter patch.
	- Select CONFIG_P2SB when CONFIG_LPC_ICH is enabled.
	- Remove #ifdef CONFIG_X86_INTEL_NON_ACPI and use
	  #if defined(CONFIG_X86_INTEL_NON_ACPI) when lpc_ich_misc is called
	  as suggested by Lee Jones.
	- Use single dimensional array instead of 2D array for apl_gpio_io_res
	  structure and use DEFINE_RES_IRQ for its IRQ resource.

Changes in V3:
	- Simplify register addresses calculation and use DEFINE_RES_MEM_NAMED
	  defines for apl_gpio_io_res structure
	- Define magic number for P2SB PCI ID
	- Replace switch-case with if-else since currently we have only one
	  use case
	- Only call mfd_add_devices() once for all gpio communities

Changes in V2:
	- Add new config option CONFIG_X86_INTEL_NON_ACPI and "select PINCTRL"
	  to fix kbuildbot error

 arch/x86/Kconfig            |   9 +++
 drivers/mfd/Kconfig         |   3 +-
 drivers/mfd/Makefile        |   5 +-
 drivers/mfd/lpc_ich-apl.c   | 130 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/lpc_ich-apl.h   |  28 ++++++++++
 drivers/mfd/lpc_ich-core.c  |  81 ++++-----------------------
 include/linux/mfd/lpc_ich.h |  73 +++++++++++++++++++++++++
 7 files changed, 256 insertions(+), 73 deletions(-)
 create mode 100644 drivers/mfd/lpc_ich-apl.c
 create mode 100644 drivers/mfd/lpc_ich-apl.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d305d81..c0b427b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -513,6 +513,15 @@ config X86_INTEL_CE
 	  This option compiles in support for the CE4100 SOC for settop
 	  boxes and media devices.
 
+config X86_INTEL_IVI
+	bool "Intel in-vehicle infotainment (IVI) systems used in cars"
+	select PINCTRL
+	---help---
+	  Select this option to enable MMIO BAR access over the P2SB for
+	  non-ACPI Intel Apollo Lake SoC platforms. This driver uses the P2SB
+	  hide/unhide mechanism cooperatively to pass the PCI BAR address to
+	  the platform driver, currently GPIO.
+
 config X86_INTEL_MID
 	bool "Intel MID platform support"
 	depends on X86_EXTENDED_PLATFORM
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 1bcf601..dc4e543 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -369,8 +369,9 @@ config MFD_INTEL_QUARK_I2C_GPIO
 
 config LPC_ICH
 	tristate "Intel ICH LPC"
-	depends on PCI
+	depends on X86 && PCI
 	select MFD_CORE
+	select P2SB
 	help
 	  The LPC bridge function of the Intel ICH provides support for
 	  many functional units. This driver provides needed support for
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 1dfe5fb..0aa3e1f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -155,8 +155,11 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
-lpc_ich-objs		:= lpc_ich-core.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
+lpc_ich-objs		:= lpc_ich-core.o
+ifeq ($(CONFIG_X86_INTEL_IVI),y)
+lpc_ich-objs += lpc_ich-apl.o
+endif
 obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
 obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
 obj-$(CONFIG_MFD_JZ4740_ADC)	+= jz4740-adc.o
diff --git a/drivers/mfd/lpc_ich-apl.c b/drivers/mfd/lpc_ich-apl.c
new file mode 100644
index 0000000..e4b9688
--- /dev/null
+++ b/drivers/mfd/lpc_ich-apl.c
@@ -0,0 +1,130 @@
+/*
+ * Purpose: Create a platform device to bind with Intel Apollo Lake
+ * Pinctrl GPIO platform driver
+ * Copyright (C) 2016 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/pci.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/lpc_ich.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <asm/p2sb.h>
+
+#include "lpc_ich-apl.h"
+
+/* Offset data for Apollo Lake GPIO communities */
+#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
+#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
+#define APL_GPIO_NORTH_OFFSET		0xc50000
+#define APL_GPIO_WEST_OFFSET		0xc70000
+
+#define APL_GPIO_SOUTHWEST_NPIN		43
+#define APL_GPIO_NORTHWEST_NPIN		77
+#define APL_GPIO_NORTH_NPIN		78
+#define APL_GPIO_WEST_NPIN		47
+
+#define APL_GPIO_IRQ 14
+
+#define PCI_IDSEL_P2SB	0x0d
+
+static struct resource apl_gpio_io_res[] = {
+	DEFINE_RES_MEM_NAMED(APL_GPIO_NORTH_OFFSET,
+		APL_GPIO_NORTH_NPIN * SZ_8, "apl_pinctrl_n"),
+	DEFINE_RES_MEM_NAMED(APL_GPIO_NORTHWEST_OFFSET,
+		APL_GPIO_NORTHWEST_NPIN * SZ_8, "apl_pinctrl_nw"),
+	DEFINE_RES_MEM_NAMED(APL_GPIO_WEST_OFFSET,
+		APL_GPIO_WEST_NPIN * SZ_8, "apl_pinctrl_w"),
+	DEFINE_RES_MEM_NAMED(APL_GPIO_SOUTHWEST_OFFSET,
+		APL_GPIO_SOUTHWEST_NPIN * SZ_8, "apl_pinctrl_sw"),
+	DEFINE_RES_IRQ(APL_GPIO_IRQ),
+};
+
+static struct pinctrl_pin_desc apl_pinctrl_pdata;
+
+static struct mfd_cell apl_gpio_devices[] = {
+	{
+		.name = "apl-pinctrl",
+		.id = 0,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res,
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 1,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res,
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 2,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res,
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 3,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res,
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+};
+
+int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset)
+{
+	unsigned int apl_p2sb = PCI_DEVFN(PCI_IDSEL_P2SB, 0);
+	unsigned int i;
+	int ret;
+
+	if (chipset != LPC_APL)
+		return -ENODEV;
+	/*
+	 * Apollo lake, has not 1, but 4 gpio controllers,
+	 * handle it a bit differently.
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(apl_gpio_io_res)-1; i++) {
+		struct resource *res = &apl_gpio_io_res[i];
+
+		apl_gpio_devices[i].resources = res;
+
+		/* Fill MEM resource */
+		ret = p2sb_bar(dev, apl_p2sb, res++);
+		if (ret)
+			goto warn_continue;
+
+		apl_pinctrl_pdata.name = kasprintf(GFP_KERNEL, "%u",
+			i + 1);
+		if (apl_pinctrl_pdata.name == NULL) {
+			ret = -ENOMEM;
+			goto warn_continue;
+		}
+	}
+
+	ret = mfd_add_devices(&dev->dev, 0,
+		apl_gpio_devices, ARRAY_SIZE(apl_gpio_devices),
+			NULL, 0, NULL);
+
+warn_continue:
+	if (ret)
+		dev_warn(&dev->dev,
+			"Failed to add Apollo Lake GPIO %s: %d\n",
+				apl_pinctrl_pdata.name, ret);
+
+	kfree(apl_pinctrl_pdata.name);
+	return 0;
+}
diff --git a/drivers/mfd/lpc_ich-apl.h b/drivers/mfd/lpc_ich-apl.h
new file mode 100644
index 0000000..db8325d
--- /dev/null
+++ b/drivers/mfd/lpc_ich-apl.h
@@ -0,0 +1,28 @@
+/*
+ * lpc_ich-apl.h - Intel in-vehicle infotainment (IVI) systems used in cars
+ *                 support
+ *
+ * Copyright (C) 2016, Intel Corporation
+ *
+ * Authors: Tan, Jui Nee <jui.nee.tan@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __LPC_ICH_APL_H__
+#define __LPC_ICH_APL_H__
+
+#include <linux/pci.h>
+
+#if IS_ENABLED(CONFIG_X86_INTEL_IVI)
+int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset);
+#else /* CONFIG_X86_INTEL_IVI is not set */
+static inline int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif
diff --git a/drivers/mfd/lpc_ich-core.c b/drivers/mfd/lpc_ich-core.c
index bd3aa45..e09d1e2 100644
--- a/drivers/mfd/lpc_ich-core.c
+++ b/drivers/mfd/lpc_ich-core.c
@@ -69,6 +69,8 @@
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
 
+#include "lpc_ich-apl.h"
+
 #define ACPIBASE		0x40
 #define ACPIBASE_GPE_OFF	0x28
 #define ACPIBASE_GPE_END	0x2f
@@ -147,77 +149,6 @@ static struct mfd_cell lpc_ich_gpio_cell = {
 	.ignore_resource_conflicts = true,
 };
 
-/* chipset related info */
-enum lpc_chipsets {
-	LPC_ICH = 0,	/* ICH */
-	LPC_ICH0,	/* ICH0 */
-	LPC_ICH2,	/* ICH2 */
-	LPC_ICH2M,	/* ICH2-M */
-	LPC_ICH3,	/* ICH3-S */
-	LPC_ICH3M,	/* ICH3-M */
-	LPC_ICH4,	/* ICH4 */
-	LPC_ICH4M,	/* ICH4-M */
-	LPC_CICH,	/* C-ICH */
-	LPC_ICH5,	/* ICH5 & ICH5R */
-	LPC_6300ESB,	/* 6300ESB */
-	LPC_ICH6,	/* ICH6 & ICH6R */
-	LPC_ICH6M,	/* ICH6-M */
-	LPC_ICH6W,	/* ICH6W & ICH6RW */
-	LPC_631XESB,	/* 631xESB/632xESB */
-	LPC_ICH7,	/* ICH7 & ICH7R */
-	LPC_ICH7DH,	/* ICH7DH */
-	LPC_ICH7M,	/* ICH7-M & ICH7-U */
-	LPC_ICH7MDH,	/* ICH7-M DH */
-	LPC_NM10,	/* NM10 */
-	LPC_ICH8,	/* ICH8 & ICH8R */
-	LPC_ICH8DH,	/* ICH8DH */
-	LPC_ICH8DO,	/* ICH8DO */
-	LPC_ICH8M,	/* ICH8M */
-	LPC_ICH8ME,	/* ICH8M-E */
-	LPC_ICH9,	/* ICH9 */
-	LPC_ICH9R,	/* ICH9R */
-	LPC_ICH9DH,	/* ICH9DH */
-	LPC_ICH9DO,	/* ICH9DO */
-	LPC_ICH9M,	/* ICH9M */
-	LPC_ICH9ME,	/* ICH9M-E */
-	LPC_ICH10,	/* ICH10 */
-	LPC_ICH10R,	/* ICH10R */
-	LPC_ICH10D,	/* ICH10D */
-	LPC_ICH10DO,	/* ICH10DO */
-	LPC_PCH,	/* PCH Desktop Full Featured */
-	LPC_PCHM,	/* PCH Mobile Full Featured */
-	LPC_P55,	/* P55 */
-	LPC_PM55,	/* PM55 */
-	LPC_H55,	/* H55 */
-	LPC_QM57,	/* QM57 */
-	LPC_H57,	/* H57 */
-	LPC_HM55,	/* HM55 */
-	LPC_Q57,	/* Q57 */
-	LPC_HM57,	/* HM57 */
-	LPC_PCHMSFF,	/* PCH Mobile SFF Full Featured */
-	LPC_QS57,	/* QS57 */
-	LPC_3400,	/* 3400 */
-	LPC_3420,	/* 3420 */
-	LPC_3450,	/* 3450 */
-	LPC_EP80579,	/* EP80579 */
-	LPC_CPT,	/* Cougar Point */
-	LPC_CPTD,	/* Cougar Point Desktop */
-	LPC_CPTM,	/* Cougar Point Mobile */
-	LPC_PBG,	/* Patsburg */
-	LPC_DH89XXCC,	/* DH89xxCC */
-	LPC_PPT,	/* Panther Point */
-	LPC_LPT,	/* Lynx Point */
-	LPC_LPT_LP,	/* Lynx Point-LP */
-	LPC_WBG,	/* Wellsburg */
-	LPC_AVN,	/* Avoton SoC */
-	LPC_BAYTRAIL,   /* Bay Trail SoC */
-	LPC_COLETO,	/* Coleto Creek */
-	LPC_WPT_LP,	/* Wildcat Point-LP */
-	LPC_BRASWELL,	/* Braswell SoC */
-	LPC_LEWISBURG,	/* Lewisburg */
-	LPC_9S,		/* 9 Series */
-};
-
 static struct lpc_ich_info lpc_chipset_info[] = {
 	[LPC_ICH] = {
 		.name = "ICH",
@@ -531,6 +462,10 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 		.name = "9 Series",
 		.iTCO_version = 2,
 	},
+	[LPC_APL]  = {
+		.name = "Apollo Lake SoC",
+		.iTCO_version = 5,
+	},
 };
 
 /*
@@ -679,6 +614,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
 	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
 	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
+	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
 	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
@@ -1093,6 +1029,9 @@ static int lpc_ich_probe(struct pci_dev *dev,
 			cell_added = true;
 	}
 
+	if (!lpc_ich_add_gpio(dev, priv->chipset))
+		cell_added = true;
+
 	/*
 	 * We only care if at least one or none of the cells registered
 	 * successfully.
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 2b300b4..03c2ca3 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -34,6 +34,7 @@ enum {
 	ICH_V10CORP_GPIO,
 	ICH_V10CONS_GPIO,
 	AVOTON_GPIO,
+	APL_GPIO,
 };
 
 struct lpc_ich_info {
@@ -43,4 +44,76 @@ struct lpc_ich_info {
 	u8 use_gpio;
 };
 
+/* chipset related info */
+enum lpc_chipsets {
+	LPC_ICH = 0,	/* ICH */
+	LPC_ICH0,	/* ICH0 */
+	LPC_ICH2,	/* ICH2 */
+	LPC_ICH2M,	/* ICH2-M */
+	LPC_ICH3,	/* ICH3-S */
+	LPC_ICH3M,	/* ICH3-M */
+	LPC_ICH4,	/* ICH4 */
+	LPC_ICH4M,	/* ICH4-M */
+	LPC_CICH,	/* C-ICH */
+	LPC_ICH5,	/* ICH5 & ICH5R */
+	LPC_6300ESB,	/* 6300ESB */
+	LPC_ICH6,	/* ICH6 & ICH6R */
+	LPC_ICH6M,	/* ICH6-M */
+	LPC_ICH6W,	/* ICH6W & ICH6RW */
+	LPC_631XESB,	/* 631xESB/632xESB */
+	LPC_ICH7,	/* ICH7 & ICH7R */
+	LPC_ICH7DH,	/* ICH7DH */
+	LPC_ICH7M,	/* ICH7-M & ICH7-U */
+	LPC_ICH7MDH,	/* ICH7-M DH */
+	LPC_NM10,	/* NM10 */
+	LPC_ICH8,	/* ICH8 & ICH8R */
+	LPC_ICH8DH,	/* ICH8DH */
+	LPC_ICH8DO,	/* ICH8DO */
+	LPC_ICH8M,	/* ICH8M */
+	LPC_ICH8ME,	/* ICH8M-E */
+	LPC_ICH9,	/* ICH9 */
+	LPC_ICH9R,	/* ICH9R */
+	LPC_ICH9DH,	/* ICH9DH */
+	LPC_ICH9DO,	/* ICH9DO */
+	LPC_ICH9M,	/* ICH9M */
+	LPC_ICH9ME,	/* ICH9M-E */
+	LPC_ICH10,	/* ICH10 */
+	LPC_ICH10R,	/* ICH10R */
+	LPC_ICH10D,	/* ICH10D */
+	LPC_ICH10DO,	/* ICH10DO */
+	LPC_PCH,	/* PCH Desktop Full Featured */
+	LPC_PCHM,	/* PCH Mobile Full Featured */
+	LPC_P55,	/* P55 */
+	LPC_PM55,	/* PM55 */
+	LPC_H55,	/* H55 */
+	LPC_QM57,	/* QM57 */
+	LPC_H57,	/* H57 */
+	LPC_HM55,	/* HM55 */
+	LPC_Q57,	/* Q57 */
+	LPC_HM57,	/* HM57 */
+	LPC_PCHMSFF,	/* PCH Mobile SFF Full Featured */
+	LPC_QS57,	/* QS57 */
+	LPC_3400,	/* 3400 */
+	LPC_3420,	/* 3420 */
+	LPC_3450,	/* 3450 */
+	LPC_EP80579,	/* EP80579 */
+	LPC_CPT,	/* Cougar Point */
+	LPC_CPTD,	/* Cougar Point Desktop */
+	LPC_CPTM,	/* Cougar Point Mobile */
+	LPC_PBG,	/* Patsburg */
+	LPC_DH89XXCC,	/* DH89xxCC */
+	LPC_PPT,	/* Panther Point */
+	LPC_LPT,	/* Lynx Point */
+	LPC_LPT_LP,	/* Lynx Point-LP */
+	LPC_WBG,	/* Wellsburg */
+	LPC_AVN,	/* Avoton SoC */
+	LPC_BAYTRAIL,   /* Bay Trail SoC */
+	LPC_COLETO,	/* Coleto Creek */
+	LPC_WPT_LP,	/* Wildcat Point-LP */
+	LPC_BRASWELL,	/* Braswell SoC */
+	LPC_LEWISBURG,	/* Lewisburg */
+	LPC_9S,		/* 9 Series */
+	LPC_APL,	/* Apollo Lake SoC */
+};
+
 #endif
-- 
1.9.1
