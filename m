From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: baytrail: Rectify debounce support
Date: Tue, 10 Jan 2017 16:03:19 +0200
Message-ID: <20170110140319.26185-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:63766 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752086AbdAJODX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 09:03:23 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cristina Ciocan <cristina.ciocan@intel.com>

The commit 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
implements debounce for Baytrail pin control, but seems wasn't tested properly.

Rectify implementation here.

Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
Cc: Cristina Ciocan <cristina.ciocan@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 71bbeb9321ba..079015385fd8 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1092,6 +1092,7 @@ static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
+	void __iomem *db_reg = byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG);
 	unsigned long flags;
 	u32 conf, pull, val, debounce;
 	u16 arg = 0;
@@ -1128,7 +1129,7 @@ static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
 			return -EINVAL;
 
 		raw_spin_lock_irqsave(&vg->lock, flags);
-		debounce = readl(byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG));
+		debounce = readl(db_reg);
 		raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 		switch (debounce & BYT_DEBOUNCE_PULSE_MASK) {
@@ -1176,6 +1177,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 	unsigned int param, arg;
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
+	void __iomem *db_reg = byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG);
 	unsigned long flags;
 	u32 conf, val, debounce;
 	int i, ret = 0;
@@ -1238,36 +1240,40 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 
 			break;
 		case PIN_CONFIG_INPUT_DEBOUNCE:
-			debounce = readl(byt_gpio_reg(vg, offset,
-						      BYT_DEBOUNCE_REG));
-			conf &= ~BYT_DEBOUNCE_PULSE_MASK;
+			debounce = readl(db_reg);
+			debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 
 			switch (arg) {
+			case 0:
+				conf &= BYT_DEBOUNCE_EN;
+				break;
 			case 375:
-				conf |= BYT_DEBOUNCE_PULSE_375US;
+				debounce |= BYT_DEBOUNCE_PULSE_375US;
 				break;
 			case 750:
-				conf |= BYT_DEBOUNCE_PULSE_750US;
+				debounce |= BYT_DEBOUNCE_PULSE_750US;
 				break;
 			case 1500:
-				conf |= BYT_DEBOUNCE_PULSE_1500US;
+				debounce |= BYT_DEBOUNCE_PULSE_1500US;
 				break;
 			case 3000:
-				conf |= BYT_DEBOUNCE_PULSE_3MS;
+				debounce |= BYT_DEBOUNCE_PULSE_3MS;
 				break;
 			case 6000:
-				conf |= BYT_DEBOUNCE_PULSE_6MS;
+				debounce |= BYT_DEBOUNCE_PULSE_6MS;
 				break;
 			case 12000:
-				conf |= BYT_DEBOUNCE_PULSE_12MS;
+				debounce |= BYT_DEBOUNCE_PULSE_12MS;
 				break;
 			case 24000:
-				conf |= BYT_DEBOUNCE_PULSE_24MS;
+				debounce |= BYT_DEBOUNCE_PULSE_24MS;
 				break;
 			default:
 				ret = -EINVAL;
 			}
 
+			if (!ret)
+				writel(debounce, db_reg);
 			break;
 		default:
 			ret = -ENOTSUPP;
-- 
2.11.0

