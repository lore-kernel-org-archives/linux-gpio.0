From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
Date: Tue,  7 Jun 2016 14:55:53 +0800
Message-ID: <1465282553-28396-4-git-send-email-jui.nee.tan@intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:2063 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753592AbcFGG4t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 7 Jun 2016 02:56:49 -0400
In-Reply-To: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

This driver uses the P2SB hide/unhide mechanism cooperatively
to pass the PCI BAR address to the gpio platform driver.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
 drivers/mfd/Kconfig   |   3 +-
 drivers/mfd/lpc_ich.c | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index eea61e3..54e595c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -359,8 +359,9 @@ config MFD_INTEL_QUARK_I2C_GPIO
 
 config LPC_ICH
 	tristate "Intel ICH LPC"
-	depends on PCI
+	depends on X86 && PCI
 	select MFD_CORE
+	select P2SB if X86_INTEL_NON_ACPI
 	help
 	  The LPC bridge function of the Intel ICH provides support for
 	  many functional units. This driver provides needed support for
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index bd3aa45..54076ee 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -68,6 +68,10 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/types.h>
+
+#include <asm/p2sb.h>
 
 #define ACPIBASE		0x40
 #define ACPIBASE_GPE_OFF	0x28
@@ -94,6 +98,21 @@
 #define wdt_mem_res(i) wdt_res(ICH_RES_MEM_OFF, i)
 #define wdt_res(b, i) (&wdt_ich_res[(b) + (i)])
 
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
 struct lpc_ich_priv {
 	int chipset;
 
@@ -133,6 +152,76 @@ static struct resource gpio_ich_res[] = {
 	},
 };
 
+#ifdef CONFIG_X86_INTEL_NON_ACPI
+static struct resource apl_gpio_io_res[4][2] = {
+	{
+		DEFINE_RES_MEM_NAMED(APL_GPIO_NORTH_OFFSET,
+			APL_GPIO_NORTH_NPIN * SZ_8, "apl_pinctrl_n"),
+		{
+		},
+	},
+	{
+		DEFINE_RES_MEM_NAMED(APL_GPIO_NORTHWEST_OFFSET,
+			APL_GPIO_NORTHWEST_NPIN * SZ_8, "apl_pinctrl_nw"),
+		{
+		},
+	},
+	{
+		DEFINE_RES_MEM_NAMED(APL_GPIO_WEST_OFFSET,
+			APL_GPIO_WEST_NPIN * SZ_8, "apl_pinctrl_w"),
+		{
+		},
+	},
+	{
+		DEFINE_RES_MEM_NAMED(APL_GPIO_SOUTHWEST_OFFSET,
+			APL_GPIO_SOUTHWEST_NPIN * SZ_8, "apl_pinctrl_sw"),
+		{
+		},
+	},
+};
+
+static struct pinctrl_pin_desc apl_pinctrl_pdata;
+
+static struct mfd_cell apl_gpio_devices[] = {
+	{
+		.name = "apl-pinctrl",
+		.id = 0,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res[1],
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 1,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res[1],
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 2,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res[1],
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "apl-pinctrl",
+		.id = 3,
+		.num_resources = ARRAY_SIZE(apl_gpio_io_res),
+		.resources = apl_gpio_io_res[1],
+		.pdata_size = sizeof(apl_pinctrl_pdata),
+		.platform_data = &apl_pinctrl_pdata,
+		.ignore_resource_conflicts = true,
+	},
+};
+#endif /* CONFIG_X86_INTEL_NON_ACPI */
+
 static struct mfd_cell lpc_ich_wdt_cell = {
 	.name = "iTCO_wdt",
 	.num_resources = ARRAY_SIZE(wdt_ich_res),
@@ -216,6 +305,7 @@ enum lpc_chipsets {
 	LPC_BRASWELL,	/* Braswell SoC */
 	LPC_LEWISBURG,	/* Lewisburg */
 	LPC_9S,		/* 9 Series */
+	LPC_APL,	/* Apollo Lake SoC */
 };
 
 static struct lpc_ich_info lpc_chipset_info[] = {
@@ -531,6 +621,10 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 		.name = "9 Series",
 		.iTCO_version = 2,
 	},
+	[LPC_APL]  = {
+		.name = "Apollo Lake SoC",
+		.iTCO_version = 5,
+	},
 };
 
 /*
@@ -679,6 +773,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
 	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
 	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
+	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
 	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
@@ -1050,6 +1145,61 @@ wdt_done:
 	return ret;
 }
 
+#ifdef CONFIG_X86_INTEL_NON_ACPI
+static int lpc_ich_misc(struct pci_dev *dev, enum lpc_chipsets chipset)
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
+	for (i = 0; i < ARRAY_SIZE(apl_gpio_io_res); i++) {
+		struct resource *res = apl_gpio_io_res[i];
+
+		apl_gpio_devices[i].resources = res;
+
+		/* Fill MEM resource */
+		ret = p2sb_bar(dev, apl_p2sb, res++);
+		if (ret)
+			goto warn_continue;
+
+		/* Fill IRQ resource */
+		res->start = APL_GPIO_IRQ;
+		res->end = res->start;
+		res->flags = IORESOURCE_IRQ;
+
+		apl_pinctrl_pdata.name = kasprintf(GFP_KERNEL, "%u",
+			i + 1);
+	}
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
+#else
+static inline int lpc_ich_misc(struct pci_dev *dev, enum lpc_chipsets chipset)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_X86_INTEL_NON_ACPI */
+
 static int lpc_ich_probe(struct pci_dev *dev,
 				const struct pci_device_id *id)
 {
@@ -1093,6 +1243,9 @@ static int lpc_ich_probe(struct pci_dev *dev,
 			cell_added = true;
 	}
 
+	if (!lpc_ich_misc(dev, priv->chipset))
+		cell_added = true;
+
 	/*
 	 * We only care if at least one or none of the cells registered
 	 * successfully.
-- 
1.9.1

