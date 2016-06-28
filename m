From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
Date: Tue, 28 Jun 2016 15:56:48 +0800
Message-ID: <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
References: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

This driver uses the P2SB hide/unhide mechanism cooperatively
to pass the PCI BAR address to the gpio platform driver.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
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

 arch/x86/Kconfig            |   9 ++++
 drivers/mfd/Kconfig         |   3 +-
 drivers/mfd/Makefile        |   2 +-
 drivers/mfd/lpc_ich-apl.c   | 126 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/lpc_ich-core.c  |  11 ++++
 include/linux/mfd/lpc_ich.h |   7 +++
 6 files changed, 156 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mfd/lpc_ich-apl.c

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d305d81..e1865c7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -498,6 +498,15 @@ config X86_GOLDFISH
 	 for Android development. Unless you are building for the Android
 	 Goldfish emulator say N here.
 
+config X86_INTEL_APL
+	bool "Non-ACPI support for Intel Apollo Lake platforms"
+	select PINCTRL
+	---help---
+	  Select this option to enable MMIO BAR access over the P2SB for
+	  non-ACPI Intel Apollo Lake SoC platforms. This driver uses the P2SB
+	  hide/unhide mechanism cooperatively to pass the PCI BAR address to
+	  the platform driver, currently GPIO.
+
 config X86_INTEL_CE
 	bool "CE4100 TV platform"
 	depends on PCI
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
index 1dfe5fb..7572c1f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -155,7 +155,7 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
-lpc_ich-objs		:= lpc_ich-core.o
+lpc_ich-objs		:= lpc_ich-core.o lpc_ich-apl.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
 obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
 obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
diff --git a/drivers/mfd/lpc_ich-apl.c b/drivers/mfd/lpc_ich-apl.c
new file mode 100644
index 0000000..544e83a
--- /dev/null
+++ b/drivers/mfd/lpc_ich-apl.c
@@ -0,0 +1,126 @@
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
+#include <linux/mfd/core.h>
+#include <linux/mfd/lpc_ich.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <asm/p2sb.h>
+
+#if defined(CONFIG_X86_INTEL_APL)
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
+int lpc_ich_misc(struct pci_dev *dev)
+{
+	unsigned int apl_p2sb = PCI_DEVFN(PCI_IDSEL_P2SB, 0);
+	unsigned int i;
+	int ret;
+
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
+	}
+
+	if (apl_pinctrl_pdata.name)
+		ret = mfd_add_devices(&dev->dev, apl_gpio_devices->id,
+			apl_gpio_devices, ARRAY_SIZE(apl_gpio_devices),
+				NULL, 0, NULL);
+	else
+		ret = -ENOMEM;
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
+#endif
diff --git a/drivers/mfd/lpc_ich-core.c b/drivers/mfd/lpc_ich-core.c
index bd3aa45..1e957d4 100644
--- a/drivers/mfd/lpc_ich-core.c
+++ b/drivers/mfd/lpc_ich-core.c
@@ -216,6 +216,7 @@ enum lpc_chipsets {
 	LPC_BRASWELL,	/* Braswell SoC */
 	LPC_LEWISBURG,	/* Lewisburg */
 	LPC_9S,		/* 9 Series */
+	LPC_APL,	/* Apollo Lake SoC */
 };
 
 static struct lpc_ich_info lpc_chipset_info[] = {
@@ -531,6 +532,10 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 		.name = "9 Series",
 		.iTCO_version = 2,
 	},
+	[LPC_APL]  = {
+		.name = "Apollo Lake SoC",
+		.iTCO_version = 5,
+	},
 };
 
 /*
@@ -679,6 +684,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
 	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
 	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
+	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
 	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
@@ -1093,6 +1099,11 @@ static int lpc_ich_probe(struct pci_dev *dev,
 			cell_added = true;
 	}
 
+	if (priv->chipset == LPC_APL) {
+		ret = lpc_ich_misc(dev);
+		if (!ret)
+			cell_added = true;
+	}
 	/*
 	 * We only care if at least one or none of the cells registered
 	 * successfully.
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 2b300b4..c5d0adc 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -43,4 +43,11 @@ struct lpc_ich_info {
 	u8 use_gpio;
 };
 
+#if defined(CONFIG_X86_INTEL_APL)
+int lpc_ich_misc(struct pci_dev *dev);
+#else
+static inline int lpc_ich_misc(struct pci_dev *dev)
+{ return -ENODEV; }
+#endif
+
 #endif
-- 
1.9.1
