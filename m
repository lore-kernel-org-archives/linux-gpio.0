From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: merrifield: Add support for hardware debouncer
Date: Thu,  1 Dec 2016 17:45:51 +0200
Message-ID: <20161201154551.179948-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:44862 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756341AbcLAPrZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Dec 2016 10:47:25 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

By default all pins are configured to use a glitch filter. Writing 1 to the
certain bit of the specific register might be useful in case someone needs to
bypass the glitch filter completely for a given GPIO pin.

This patch adds support for that in the Intel Merrifield GPIO driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 82cdcdc..d7cbbc0 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -161,6 +161,27 @@ static int mrfld_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
+static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				   unsigned int debounce)
+{
+	struct mrfld_gpio *priv = gpiochip_get_data(chip);
+	void __iomem *gfbr = gpio_reg(chip, offset, GFBR);
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	if (debounce)
+		value = readl(gfbr) & ~BIT(offset % 32);
+	else
+		value = readl(gfbr) | BIT(offset % 32);
+	writel(value, gfbr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
 static void mrfld_irq_ack(struct irq_data *d)
 {
 	struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
@@ -384,6 +405,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	priv->chip.direction_output = mrfld_gpio_direction_output;
 	priv->chip.get = mrfld_gpio_get;
 	priv->chip.set = mrfld_gpio_set;
+	priv->chip.set_debounce = mrfld_gpio_set_debounce;
 	priv->chip.base = gpio_base;
 	priv->chip.ngpio = MRFLD_NGPIO;
 	priv->chip.can_sleep = false;
-- 
2.10.2

