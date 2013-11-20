From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: intel-mid: lock IRQs when starting them
Date: Wed, 20 Nov 2013 15:27:35 +0100
Message-ID: <1384957655-23215-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:51492 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751974Ab3KTO1n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2013 09:27:43 -0500
Received: by mail-wg0-f47.google.com with SMTP id y10so9002850wgg.26
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2013 06:27:42 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Cc: David Cohen <david.a.cohen@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-intel-mid.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index be803af658ac..49de7d13915f 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -235,11 +235,31 @@ static void intel_mid_irq_mask(struct irq_data *d)
 {
 }
 
+static unsigned int intel_mid_irq_startup(struct irq_data *d)
+{
+	struct intel_mid_gpio *priv = irq_data_get_irq_chip_data(d);
+
+	if (gpio_lock_as_irq(&priv->chip, irqd_to_hwirq(d)))
+		dev_err(priv->chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			irqd_to_hwirq(d));
+	return 0;
+}
+
+static void intel_mid_irq_shutdown(struct irq_data *d)
+{
+	struct intel_mid_gpio *priv = irq_data_get_irq_chip_data(d);
+
+	gpio_unlock_as_irq(&priv->chip, irqd_to_hwirq(d));
+}
+
 static struct irq_chip intel_mid_irqchip = {
 	.name		= "INTEL_MID-GPIO",
 	.irq_mask	= intel_mid_irq_mask,
 	.irq_unmask	= intel_mid_irq_unmask,
 	.irq_set_type	= intel_mid_irq_type,
+	.irq_startup	= intel_mid_irq_startup,
+	.irq_shutdown	= intel_mid_irq_shutdown,
 };
 
 static const struct intel_mid_gpio_ddata gpio_lincroft = {
@@ -418,6 +438,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 
 	priv->reg_base = pcim_iomap_table(pdev)[0];
 	priv->chip.label = dev_name(&pdev->dev);
+	priv->chip.dev = &pdev->dev;
 	priv->chip.request = intel_gpio_request;
 	priv->chip.direction_input = intel_gpio_direction_input;
 	priv->chip.direction_output = intel_gpio_direction_output;
-- 
1.8.3.1

