From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/4] pinctrl: baytrail: Clear interrupt triggering from pins that are in GPIO mode
Date: Mon, 23 Feb 2015 14:53:11 +0200
Message-ID: <1424695993-43707-3-git-send-email-mika.westerberg@linux.intel.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

If the pin is already configured as GPIO and it has any of the triggering
flags set, we may get spurious interrupts depending on the state of the
pin.

Prevent this by clearing the triggering flags on such pins. However, if the
pin is also configured as "direct IRQ" we leave the flags as is. Otherwise
it will prevent interrupts that are routed directly to IO-APIC.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 36 +++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index e44f2fd6753f..d264b099182d 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -158,6 +158,19 @@ static void __iomem *byt_gpio_reg(struct gpio_chip *chip, unsigned offset,
 	return vg->reg_base + reg_offset + reg;
 }
 
+static void byt_gpio_clear_triggering(struct byt_gpio *vg, unsigned offset)
+{
+	void __iomem *reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&vg->lock, flags);
+	value = readl(reg);
+	value &= ~(BYT_TRIG_POS | BYT_TRIG_NEG | BYT_TRIG_LVL);
+	writel(value, reg);
+	spin_unlock_irqrestore(&vg->lock, flags);
+}
+
 static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned offset)
 {
 	/* SCORE pin 92-93 */
@@ -211,14 +224,8 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 static void byt_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct byt_gpio *vg = to_byt_gpio(chip);
-	void __iomem *reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
-	u32 value;
-
-	/* clear interrupt triggering */
-	value = readl(reg);
-	value &= ~(BYT_TRIG_POS | BYT_TRIG_NEG | BYT_TRIG_LVL);
-	writel(value, reg);
 
+	byt_gpio_clear_triggering(vg, offset);
 	pm_runtime_put(&vg->pdev->dev);
 }
 
@@ -481,6 +488,21 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 {
 	void __iomem *reg;
 	u32 base, value;
+	int i;
+
+	/*
+	 * Clear interrupt triggers for all pins that are GPIOs and
+	 * do not use direct IRQ mode. This will prevent spurious
+	 * interrupts from misconfigured pins.
+	 */
+	for (i = 0; i < vg->chip.ngpio; i++) {
+		value = readl(byt_gpio_reg(&vg->chip, i, BYT_CONF0_REG));
+		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
+		    !(value & BYT_DIRECT_IRQ_EN)) {
+			byt_gpio_clear_triggering(vg, i);
+			dev_dbg(&vg->pdev->dev, "disabling GPIO %d\n", i);
+		}
+	}
 
 	/* clear interrupt status trigger registers */
 	for (base = 0; base < vg->chip.ngpio; base += 32) {
-- 
2.1.4
