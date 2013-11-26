From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: intel-mid: lock IRQs when starting them
Date: Tue, 26 Nov 2013 11:20:36 +0100
Message-ID: <1385461236-5101-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:41212 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754832Ab3KZKUs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 05:20:48 -0500
Received: by mail-lb0-f181.google.com with SMTP id q8so4155086lbi.40
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 02:20:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Acked-by: David Cohen <david.a.cohen@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Explicitly call the - empty - mask/unmask functions from the
  startup/shutdown hooks. These are currently empty, but maybe
  they will not be that forever, so better be safe than sorry.
---
 drivers/gpio/gpio-intel-mid.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index be803af658ac..039de0e6cf16 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -235,11 +235,33 @@ static void intel_mid_irq_mask(struct irq_data *d)
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
+	intel_mid_irq_unmask(d);
+	return 0;
+}
+
+static void intel_mid_irq_shutdown(struct irq_data *d)
+{
+	struct intel_mid_gpio *priv = irq_data_get_irq_chip_data(d);
+
+	intel_mid_irq_mask(d);
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
@@ -418,6 +440,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 
 	priv->reg_base = pcim_iomap_table(pdev)[0];
 	priv->chip.label = dev_name(&pdev->dev);
+	priv->chip.dev = &pdev->dev;
 	priv->chip.request = intel_gpio_request;
 	priv->chip.direction_input = intel_gpio_direction_input;
 	priv->chip.direction_output = intel_gpio_direction_output;
-- 
1.8.3.1

