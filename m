From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RFC, PATCH v1 2/2] pinctrl: intel: Decrease indentation in intel_gpio_set()
Date: Thu, 24 Aug 2017 11:19:34 +0300
Message-ID: <20170824081934.85859-2-andriy.shevchenko@linux.intel.com>
References: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:21751 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752477AbdHXITz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Aug 2017 04:19:55 -0400
In-Reply-To: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Decrease indentation in intel_gpio_set() to make it looking slightly better
and be in align with intel_gpio_get().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index c8675611b768..19e2bd16a301 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -767,22 +767,22 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
+	unsigned long flags;
 	void __iomem *reg;
+	u32 padcfg0;
 
 	reg = intel_get_padcfg(pctrl, offset, PADCFG0);
-	if (reg) {
-		unsigned long flags;
-		u32 padcfg0;
+	if (!reg)
+		return;
 
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
-		padcfg0 = readl(reg);
-		if (value)
-			padcfg0 |= PADCFG0_GPIOTXSTATE;
-		else
-			padcfg0 &= ~PADCFG0_GPIOTXSTATE;
-		writel(padcfg0, reg);
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-	}
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	padcfg0 = readl(reg);
+	if (value)
+		padcfg0 |= PADCFG0_GPIOTXSTATE;
+	else
+		padcfg0 &= ~PADCFG0_GPIOTXSTATE;
+	writel(padcfg0, reg);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-- 
2.14.1

