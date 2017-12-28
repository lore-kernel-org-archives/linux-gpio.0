From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] pinctrl: baytrail: Enable glitch filter on some systems
Date: Thu, 28 Dec 2017 23:41:28 +0100
Message-ID: <20171228224128.29065-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33526 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750982AbdL1Wlc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Dec 2017 17:41:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On some systems, some PCB traces attached to edge triggered GpioInts
are routed in such a way that they pick up enough interference to
constantly (many times per second) trigger.

Enabling glitch-filtering fixes this. This commit introduces a DMI
list with systems which need this, but maybe we should enable this on
all Bay Trail GPIOs used as edge-triggered interrupts?

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
I wonder if Windows just enables glitch-filtering on all GPIOs? Can
someone perhaps dump the register at physical address 0xFED0C550
(SATAGP0 PINCONF) on a Bay Trail system using GPIO attached volume
buttons while running Windows?
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9c1ca29c60b7..21a60b5dac57 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -14,6 +14,7 @@
  * more details.
  */
 
+#include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -46,6 +47,7 @@
 #define BYT_TRIG_POS		BIT(25)
 #define BYT_TRIG_LVL		BIT(24)
 #define BYT_DEBOUNCE_EN		BIT(20)
+#define BYT_GLITCH_FILTER_EN	BIT(19)
 #define BYT_PULL_STR_SHIFT	9
 #define BYT_PULL_STR_MASK	(3 << BYT_PULL_STR_SHIFT)
 #define BYT_PULL_STR_2K		(0 << BYT_PULL_STR_SHIFT)
@@ -205,6 +207,7 @@ struct byt_gpio {
 	const struct byt_pinctrl_soc_data *soc_data;
 	struct byt_community *communities_copy;
 	struct byt_gpio_pin_context *saved_context;
+	bool enable_glitch_filter;
 };
 
 /* SCORE pins, aka GPIOC_<pin_no> or GPIO_S0_SC[<pin_no>] */
@@ -1580,6 +1583,9 @@ static int byt_irq_type(struct irq_data *d, unsigned int type)
 	value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS | BYT_TRIG_NEG |
 		   BYT_TRIG_LVL);
 
+	if ((type & IRQ_TYPE_EDGE_BOTH) && vg->enable_glitch_filter)
+		value |= BYT_GLITCH_FILTER_EN;
+
 	writel(value, reg);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
@@ -1776,6 +1782,19 @@ static const struct acpi_device_id byt_gpio_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, byt_gpio_acpi_match);
 
+/* Some devices need the glitch filter on edge interrupts to avoid IRQ storms */
+static const struct dmi_system_id enable_glitch_filter_list[] = {
+	{
+		/* GP-electronic T701 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T701"),
+			DMI_MATCH(DMI_BIOS_VERSION, "BYT70A.YNCHENG.WIN.007"),
+		},
+	},
+	{}
+};
+
 static int byt_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct byt_pinctrl_soc_data *soc_data = NULL;
@@ -1816,6 +1835,9 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (dmi_check_system(enable_glitch_filter_list))
+		vg->enable_glitch_filter = true;
+
 	vg->pctl_desc		= byt_pinctrl_desc;
 	vg->pctl_desc.name	= dev_name(&pdev->dev);
 	vg->pctl_desc.pins	= vg->soc_data->pins;
-- 
2.14.3

