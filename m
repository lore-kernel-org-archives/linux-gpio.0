From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v11 6/6] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
Date: Fri, 18 Nov 2016 13:22:30 +0800
Message-ID: <1479446550-28677-7-git-send-email-jui.nee.tan@intel.com>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

This driver uses the P2SB hide/unhide mechanism cooperatively
to pass the PCI BAR address to the gpio platform driver.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Changes in V11:
	- Remove duplicated object file lpc_ich-objs in Makefile.
	- Put p2sb.h header file in separate section in lpc_ich-apl.c, as asm stuff
	  is platform specific (suggested by Andy).
	- Rearrange variable declarations in lpc_ich_add_gpio() function
	  (suggested by Andy).
	- Move warn_continue label before if/else statement for the sake of
	  readability (suggested by Andy).
	- Add comment to #endif in lpc_ich_apl.h file.

Changes in V10:
	- No change

Changes in V9:
	- No change

Changes in V8:
	- Rename source file lpc_ich-apl.c to lpc_ich_apl.c (suggested by Mika).

Changes in V7:
	- Add author information and rewrite description of source file 
	  lpc_ich-apl.c and lpc_ich_apl.h.
	- Sort the header files by alphabetical order in lpc_ich-apl.c.
	- Rename header file lpc_ich-apl.h to lpc_ich_apl.h (suggested by Lee).
	- Remove unneeded pdata_size and platform_data from mfd_cell.
	  Also, remove unneeded apl_pinctrl_pdata.
	- Since variable apl_p2sb is only used once, hence switch it out for the
	  PCI_DEVFN macro (suggested by Lee).
	- Define APL_GPIO_COMMUNITY_MAX as total Apollo Lake GPIO communities
	  supported.
	- Set resources in mfd_cell for each GPIO community.
	- Call p2sb_bar() function once instead of four times inside the for loop.
	  And make p2sb_bar() function just to fill in the base address into a
	  scratch "struct resource" and have the loop do the additions to base/end.
	- Remove entire apl_pinctrl_pdata.name memory allocation since it is no
	  longer needed.
	- Return ret at the end of lpc_ich_add_gpio() function.

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

 drivers/mfd/Makefile       |   3 ++
 drivers/mfd/lpc_ich_apl.c  | 121 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/lpc_ich_apl.h  |  28 +++++++++++
 drivers/mfd/lpc_ich_core.c |   5 ++
 4 files changed, 157 insertions(+)
 create mode 100644 drivers/mfd/lpc_ich_apl.c
 create mode 100644 drivers/mfd/lpc_ich_apl.h

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 06a91ea..b7fb703 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -161,6 +161,9 @@ obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
 lpc_ich-objs		:= lpc_ich_core.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
+ifeq ($(CONFIG_X86_INTEL_IVI),y)
+lpc_ich-objs += lpc_ich_apl.o
+endif
 obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
 obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
 obj-$(CONFIG_MFD_JZ4740_ADC)	+= jz4740-adc.o
diff --git a/drivers/mfd/lpc_ich_apl.c b/drivers/mfd/lpc_ich_apl.c
new file mode 100644
index 0000000..aef3c13
--- /dev/null
+++ b/drivers/mfd/lpc_ich_apl.c
@@ -0,0 +1,121 @@
+/*
+ * Intel Apollo Lake In-Vehicle Infotainment (IVI) systems used in cars support
+ *
+ * Copyright (C) 2016 Intel Corporation
+ *
+ * Author: Tan, Jui Nee <jui.nee.tan@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/mfd/lpc_ich.h>
+#include <linux/pci.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include <asm/p2sb.h>
+
+#include "lpc_ich_apl.h"
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
+#define APL_GPIO_COMMUNITY_MAX		4
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
+static struct mfd_cell apl_gpio_devices[] = {
+	{
+		.name = "apl-pinctrl",
+		.id = 0,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = &apl_gpio_io_res[0],
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 1,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = &apl_gpio_io_res[1],
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 2,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = &apl_gpio_io_res[2],
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 3,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = &apl_gpio_io_res[3],
+		.ignore_resource_conflicts = true,
+	},
+};
+
+int lpc_ich_add_gpio(struct pci_dev *dev, enum lpc_chipsets chipset)
+{
+	struct resource base;
+	unsigned int i;
+	int ret;
+
+	if (chipset != LPC_APL)
+		return -ENODEV;
+	/*
+	 * Apollo lake has 4 gpio controllers,
+	 * handle it a bit differently.
+	 */
+
+	ret = p2sb_bar(dev, PCI_DEVFN(PCI_IDSEL_P2SB, 0), &base);
+	if (ret)
+		goto warn_continue;
+
+	for (i = 0; i < APL_GPIO_COMMUNITY_MAX; i++) {
+		struct resource *res = &apl_gpio_io_res[i];
+
+		/* Fill MEM resource */
+		res->start += base.start;
+		res->end += base.start;
+		res->flags = base.flags;
+
+		res++;
+	}
+
+	ret = mfd_add_devices(&dev->dev, 0,
+		apl_gpio_devices, ARRAY_SIZE(apl_gpio_devices),
+			NULL, 0, NULL);
+
+warn_continue:
+	if (ret)
+		dev_warn(&dev->dev,
+			"Failed to add Apollo Lake GPIO: %d\n",
+				ret);
+
+	return ret;
+}
diff --git a/drivers/mfd/lpc_ich_apl.h b/drivers/mfd/lpc_ich_apl.h
new file mode 100644
index 0000000..6721621
--- /dev/null
+++ b/drivers/mfd/lpc_ich_apl.h
@@ -0,0 +1,28 @@
+/*
+ * Intel In-Vehicle Infotainment (IVI) systems used in cars support
+ *
+ * Copyright (C) 2016, Intel Corporation
+ *
+ * Author: Tan, Jui Nee <jui.nee.tan@intel.com>
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
+static inline int lpc_ich_add_gpio(struct pci_dev *dev,
+	enum lpc_chipsets chipset)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_X86_INTEL_IVI */
+
+#endif /* __LPC_ICH_APL_H__ */
diff --git a/drivers/mfd/lpc_ich_core.c b/drivers/mfd/lpc_ich_core.c
index 3bb6334..25c4d99 100644
--- a/drivers/mfd/lpc_ich_core.c
+++ b/drivers/mfd/lpc_ich_core.c
@@ -68,6 +68,8 @@
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
 
+#include "lpc_ich_apl.h"
+
 #define ACPIBASE		0x40
 #define ACPIBASE_GPE_OFF	0x28
 #define ACPIBASE_GPE_END	0x2f
@@ -1030,6 +1032,9 @@ static int lpc_ich_probe(struct pci_dev *dev,
 			cell_added = true;
 	}
 
+	if (!lpc_ich_add_gpio(dev, priv->chipset))
+		cell_added = true;
+
 	/*
 	 * We only care if at least one or none of the cells registered
 	 * successfully.
-- 
1.9.1
