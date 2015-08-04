From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] pinctrl: baytrail: Serialize all register access
Date: Tue,  4 Aug 2015 15:03:14 +0300
Message-ID: <1438689794-14355-2-git-send-email-mika.westerberg@linux.intel.com>
References: <1438689794-14355-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438689794-14355-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

There is a hardware issue in Intel Baytrail where concurrent GPIO register
access might result reads of 0xffffffff and writes might get dropped
completely.

Prevent this from happening by taking the serializing lock in all places
where it is possible that more than one thread might be accessing the
hardware concurrently.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4b82381c9a57..f80a1bee6981 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -196,6 +196,9 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 	struct byt_gpio *vg = to_byt_gpio(chip);
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_CONF0_REG);
 	u32 value, gpio_mux;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vg->lock, flags);
 
 	/*
 	 * In most cases, func pin mux 000 means GPIO function.
@@ -209,18 +212,16 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 	value = readl(reg) & BYT_PIN_MUX;
 	gpio_mux = byt_get_gpio_mux(vg, offset);
 	if (WARN_ON(gpio_mux != value)) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&vg->lock, flags);
 		value = readl(reg) & ~BYT_PIN_MUX;
 		value |= gpio_mux;
 		writel(value, reg);
-		spin_unlock_irqrestore(&vg->lock, flags);
 
 		dev_warn(&vg->pdev->dev,
 			 "pin %u forcibly re-configured as GPIO\n", offset);
 	}
 
+	spin_unlock_irqrestore(&vg->lock, flags);
+
 	pm_runtime_get(&vg->pdev->dev);
 
 	return 0;
@@ -272,7 +273,15 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
-	return readl(reg) & BYT_LEVEL;
+	struct byt_gpio *vg = to_byt_gpio(chip);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&vg->lock, flags);
+	val = readl(reg);
+	spin_unlock_irqrestore(&vg->lock, flags);
+
+	return val & BYT_LEVEL;
 }
 
 static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
@@ -445,8 +454,10 @@ static void byt_irq_ack(struct irq_data *d)
 	unsigned offset = irqd_to_hwirq(d);
 	void __iomem *reg;
 
+	spin_lock(&vg->lock);
 	reg = byt_gpio_reg(&vg->chip, offset, BYT_INT_STAT_REG);
 	writel(BIT(offset % 32), reg);
+	spin_unlock(&vg->lock);
 }
 
 static void byt_irq_unmask(struct irq_data *d)
-- 
2.4.6
