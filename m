From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 1/1] gpio: mvebu: use BIT macro instead of bit shifting
Date: Fri, 17 Mar 2017 18:44:06 +0100
Message-ID: <20170317174406.13431-1-ralph.sennhauser@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33945 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751133AbdCQRoR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2017 13:44:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Use the BIT macro instead of explicitly shifting bits for some added
clarity.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---

Hi Linus,

To use the BIT macro for the pwm-fan addition it would be nice to have the
rest converted before hand. This patch takes care of that.

Ralph


 drivers/gpio/gpio-mvebu.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 029f43c..fae4db6 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -45,6 +45,7 @@
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/bitops.h>
 
 /*
  * GPIO unit register offsets.
@@ -191,9 +192,9 @@ static void mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 	spin_lock_irqsave(&mvchip->lock, flags);
 	u = readl_relaxed(mvebu_gpioreg_out(mvchip));
 	if (value)
-		u |= 1 << pin;
+		u |= BIT(pin);
 	else
-		u &= ~(1 << pin);
+		u &= ~BIT(pin);
 	writel_relaxed(u, mvebu_gpioreg_out(mvchip));
 	spin_unlock_irqrestore(&mvchip->lock, flags);
 }
@@ -203,7 +204,7 @@ static int mvebu_gpio_get(struct gpio_chip *chip, unsigned int pin)
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	u32 u;
 
-	if (readl_relaxed(mvebu_gpioreg_io_conf(mvchip)) & (1 << pin)) {
+	if (readl_relaxed(mvebu_gpioreg_io_conf(mvchip)) & BIT(pin)) {
 		u = readl_relaxed(mvebu_gpioreg_data_in(mvchip)) ^
 			readl_relaxed(mvebu_gpioreg_in_pol(mvchip));
 	} else {
@@ -223,9 +224,9 @@ static void mvebu_gpio_blink(struct gpio_chip *chip, unsigned int pin,
 	spin_lock_irqsave(&mvchip->lock, flags);
 	u = readl_relaxed(mvebu_gpioreg_blink(mvchip));
 	if (value)
-		u |= 1 << pin;
+		u |= BIT(pin);
 	else
-		u &= ~(1 << pin);
+		u &= ~BIT(pin);
 	writel_relaxed(u, mvebu_gpioreg_blink(mvchip));
 	spin_unlock_irqrestore(&mvchip->lock, flags);
 }
@@ -247,7 +248,7 @@ static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
 
 	spin_lock_irqsave(&mvchip->lock, flags);
 	u = readl_relaxed(mvebu_gpioreg_io_conf(mvchip));
-	u |= 1 << pin;
+	u |= BIT(pin);
 	writel_relaxed(u, mvebu_gpioreg_io_conf(mvchip));
 	spin_unlock_irqrestore(&mvchip->lock, flags);
 
@@ -275,7 +276,7 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 
 	spin_lock_irqsave(&mvchip->lock, flags);
 	u = readl_relaxed(mvebu_gpioreg_io_conf(mvchip));
-	u &= ~(1 << pin);
+	u &= ~BIT(pin);
 	writel_relaxed(u, mvebu_gpioreg_io_conf(mvchip));
 	spin_unlock_irqrestore(&mvchip->lock, flags);
 
@@ -392,7 +393,7 @@ static int mvebu_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	pin = d->hwirq;
 
-	u = readl_relaxed(mvebu_gpioreg_io_conf(mvchip)) & (1 << pin);
+	u = readl_relaxed(mvebu_gpioreg_io_conf(mvchip)) & BIT(pin);
 	if (!u)
 		return -EINVAL;
 
@@ -412,13 +413,13 @@ static int mvebu_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_LEVEL_HIGH:
 		u = readl_relaxed(mvebu_gpioreg_in_pol(mvchip));
-		u &= ~(1 << pin);
+		u &= ~BIT(pin);
 		writel_relaxed(u, mvebu_gpioreg_in_pol(mvchip));
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
 		u = readl_relaxed(mvebu_gpioreg_in_pol(mvchip));
-		u |= 1 << pin;
+		u |= BIT(pin);
 		writel_relaxed(u, mvebu_gpioreg_in_pol(mvchip));
 		break;
 	case IRQ_TYPE_EDGE_BOTH: {
@@ -431,10 +432,10 @@ static int mvebu_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		 * set initial polarity based on current input level
 		 */
 		u = readl_relaxed(mvebu_gpioreg_in_pol(mvchip));
-		if (v & (1 << pin))
-			u |= 1 << pin;		/* falling */
+		if (v & BIT(pin))
+			u |= BIT(pin);		/* falling */
 		else
-			u &= ~(1 << pin);	/* rising */
+			u &= ~BIT(pin);		/* rising */
 		writel_relaxed(u, mvebu_gpioreg_in_pol(mvchip));
 		break;
 	}
@@ -464,7 +465,7 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 
 		irq = irq_find_mapping(mvchip->domain, i);
 
-		if (!(cause & (1 << i)))
+		if (!(cause & BIT(i)))
 			continue;
 
 		type = irq_get_trigger_type(irq);
@@ -473,7 +474,7 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 			u32 polarity;
 
 			polarity = readl_relaxed(mvebu_gpioreg_in_pol(mvchip));
-			polarity ^= 1 << i;
+			polarity ^= BIT(i);
 			writel_relaxed(polarity, mvebu_gpioreg_in_pol(mvchip));
 		}
 
@@ -510,7 +511,7 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		if (!label)
 			continue;
 
-		msk = 1 << i;
+		msk = BIT(i);
 		is_out = !(io_conf & msk);
 
 		seq_printf(s, " gpio-%-3d (%-20.20s)", chip->base + i, label);
-- 
2.10.2

