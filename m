From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH] pinctrl/amd: save pin registers over suspend/resume
Date: Mon, 11 Sep 2017 14:11:56 +0800
Message-ID: <20170911061156.31872-1-drake@endlessm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:36699 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750748AbdIKGMI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2017 02:12:08 -0400
Received: by mail-pf0-f170.google.com with SMTP id e199so12617359pfh.3
        for <linux-gpio@vger.kernel.org>; Sun, 10 Sep 2017 23:12:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Nehal-bakulchandra.Shah@amd.com, Shyam-sundar.S-k@amd.com, linux@endlessm.com

The touchpad in the Asus laptop models X505BA/BP and X542BA/BP is
unresponsive after suspend/resume. The following error appears during
resume:

  i2c_hid i2c-ELAN1300:00: failed to reset device.

The problem here is that i2c_hid does not notice the interrupt being
generated at this point, because the GPIO is no longer configured
for interrupts.

Fix this by saving pinctrl-amd pin registers during suspend and
restoring them at resume time.

Based on code from pinctrl-intel.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 75 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 38af1ec2df0c..3f6b34febbf1 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -36,6 +36,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
+#include "core.h"
 #include "pinctrl-utils.h"
 #include "pinctrl-amd.h"
 
@@ -725,6 +726,69 @@ static const struct pinconf_ops amd_pinconf_ops = {
 	.pin_config_group_set = amd_pinconf_group_set,
 };
 
+#ifdef CONFIG_PM_SLEEP
+static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
+{
+	const struct pin_desc *pd = pin_desc_get(gpio_dev->pctrl, pin);
+
+	if (!pd)
+		return false;
+
+	/*
+	 * Only restore the pin if it is actually in use by the kernel (or
+	 * by userspace).
+	 */
+	if (pd->mux_owner || pd->gpio_owner ||
+	    gpiochip_line_is_irq(&gpio_dev->gc, pin))
+		return true;
+
+	return false;
+}
+
+int amd_gpio_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct amd_gpio *gpio_dev = platform_get_drvdata(pdev);
+	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	int i;
+
+	for (i = 0; i < desc->npins; i++) {
+		int pin = desc->pins[i].number;
+
+		if (!amd_gpio_should_save(gpio_dev, pin))
+			continue;
+
+		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin*4);
+	}
+
+	return 0;
+}
+
+int amd_gpio_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct amd_gpio *gpio_dev = platform_get_drvdata(pdev);
+	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	int i;
+
+	for (i = 0; i < desc->npins; i++) {
+		int pin = desc->pins[i].number;
+
+		if (!amd_gpio_should_save(gpio_dev, pin))
+			continue;
+
+		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin*4);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops amd_gpio_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(amd_gpio_suspend,
+				     amd_gpio_resume)
+};
+#endif
+
 static struct pinctrl_desc amd_pinctrl_desc = {
 	.pins	= kerncz_pins,
 	.npins = ARRAY_SIZE(kerncz_pins),
@@ -764,6 +828,14 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return irq_base;
 	}
 
+#ifdef CONFIG_PM_SLEEP
+	gpio_dev->saved_regs = devm_kcalloc(&pdev->dev, amd_pinctrl_desc.npins,
+					    sizeof(*gpio_dev->saved_regs),
+					    GFP_KERNEL);
+	if (!gpio_dev->saved_regs)
+		return -ENOMEM;
+#endif
+
 	gpio_dev->pdev = pdev;
 	gpio_dev->gc.direction_input	= amd_gpio_direction_input;
 	gpio_dev->gc.direction_output	= amd_gpio_direction_output;
@@ -853,6 +925,9 @@ static struct platform_driver amd_gpio_driver = {
 	.driver		= {
 		.name	= "amd_gpio",
 		.acpi_match_table = ACPI_PTR(amd_gpio_acpi_match),
+#ifdef CONFIG_PM_SLEEP
+		.pm	= &amd_gpio_pm_ops,
+#endif
 	},
 	.probe		= amd_gpio_probe,
 	.remove		= amd_gpio_remove,
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 5b1cb965c767..8fa453a59da5 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -97,6 +97,7 @@ struct amd_gpio {
 	unsigned int            hwbank_num;
 	struct resource         *res;
 	struct platform_device  *pdev;
+	u32			*saved_regs;
 };
 
 /*  KERNCZ configuration*/
-- 
2.11.0

