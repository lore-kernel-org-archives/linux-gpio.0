From: Javier Arteaga <javier@emutex.com>
Subject: [PATCH] pinctrl: intel: Implement intel_gpio_get_direction callback
Date: Tue,  6 Mar 2018 13:42:13 +0000
Message-ID: <20180306134213.16898-1-javier@emutex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Arteaga <javier@emutex.com>
List-Id: linux-gpio@vger.kernel.org

Allows querying GPIO direction from the pad config register.
If the pad is not in GPIO mode, return an error.

Signed-off-by: Javier Arteaga <javier@emutex.com>
---
This is needed by the drivers for the UP Squared board, an APL-based
platform. (For now, these drivers are out-of-tree.)

An earlier version of this patch was reviewed some time ago by Andy
Shevchenko outside of the mailing lists:
<https://github.com/emutex/ubilinux-kernel/commit/708a776f2ffd1b1c>

 drivers/pinctrl/intel/pinctrl-intel.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 96e73e30204e..1e24a6b8a64e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -788,6 +788,24 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
+static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
+	void __iomem *reg;
+	u32 padcfg0;
+
+	reg = intel_get_padcfg(pctrl, offset, PADCFG0);
+	if (!reg)
+		return -EINVAL;
+
+	padcfg0 = readl(reg);
+
+	if (padcfg0 & PADCFG0_PMODE_MASK)
+		return -EINVAL;
+
+	return !!(padcfg0 & PADCFG0_GPIOTXDIS);
+}
+
 static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	return pinctrl_gpio_direction_input(chip->base + offset);
@@ -804,6 +822,7 @@ static const struct gpio_chip intel_gpio_chip = {
 	.owner = THIS_MODULE,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
+	.get_direction = intel_gpio_get_direction,
 	.direction_input = intel_gpio_direction_input,
 	.direction_output = intel_gpio_direction_output,
 	.get = intel_gpio_get,
-- 
2.16.2
