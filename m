From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: merrifield: Protect irq_ack() and gpio_set() by lock
Date: Mon, 11 Jul 2016 13:06:26 +0300
Message-ID: <1468231586-104167-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:2025 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030337AbcGKKGb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 06:06:31 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is a potential race when two threads do the writes to the same register
in parallel.

Prevent out of order in such case by protecting I/O access by spin lock.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 11066f6..45b5127 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -105,7 +105,11 @@ static int mrfld_gpio_get(struct gpio_chip *chip, unsigned int offset)
 static void mrfld_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   int value)
 {
+	struct mrfld_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *gpsr, *gpcr;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
 
 	if (value) {
 		gpsr = gpio_reg(chip, offset, GPSR);
@@ -114,6 +118,8 @@ static void mrfld_gpio_set(struct gpio_chip *chip, unsigned int offset,
 		gpcr = gpio_reg(chip, offset, GPCR);
 		writel(BIT(offset % 32), gpcr);
 	}
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static int mrfld_gpio_direction_input(struct gpio_chip *chip,
@@ -160,8 +166,13 @@ static void mrfld_irq_ack(struct irq_data *d)
 	struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
 	u32 gpio = irqd_to_hwirq(d);
 	void __iomem *gisr = gpio_reg(&priv->chip, gpio, GISR);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
 
 	writel(BIT(gpio % 32), gisr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static void mrfld_irq_unmask_mask(struct irq_data *d, bool unmask)
-- 
2.8.1

