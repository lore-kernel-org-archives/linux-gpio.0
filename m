From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: intel: Set pin direction properly
Date: Mon,  2 Jan 2017 14:07:22 +0200
Message-ID: <20170102120722.178343-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:46622 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932557AbdABMH4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Jan 2017 07:07:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There are two bits in the PADCFG0 register to configure direction, one per
TX/RX buffers.

For now we wrongly assume that the GPIO is always requested before it is being
used, which is not true when the GPIO is used through irqchip. In this case the
GPIO is never requested and we never enable RX buffer for it.

Fix this by setting both bits accordingly.

Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 1e139672f1af..6df35dcb29ae 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -353,6 +353,21 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	return 0;
 }
 
+static void __intel_gpio_set_direction(void __iomem *padcfg0, bool input)
+{
+	u32 value;
+
+	value = readl(padcfg0);
+	if (input) {
+		value &= ~PADCFG0_GPIORXDIS;
+		value |= PADCFG0_GPIOTXDIS;
+	} else {
+		value &= ~PADCFG0_GPIOTXDIS;
+		value |= PADCFG0_GPIORXDIS;
+	}
+	writel(value, padcfg0);
+}
+
 static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 				     struct pinctrl_gpio_range *range,
 				     unsigned pin)
@@ -375,11 +390,11 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	/* Disable SCI/SMI/NMI generation */
 	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
 	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
-	/* Disable TX buffer and enable RX (this will be input) */
-	value &= ~PADCFG0_GPIORXDIS;
-	value |= PADCFG0_GPIOTXDIS;
 	writel(value, padcfg0);
 
+	/* Disable TX buffer and enable RX (this will be input) */
+	__intel_gpio_set_direction(padcfg0, true);
+
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -392,18 +407,11 @@ static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *padcfg0;
 	unsigned long flags;
-	u32 value;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
-
-	value = readl(padcfg0);
-	if (input)
-		value |= PADCFG0_GPIOTXDIS;
-	else
-		value &= ~PADCFG0_GPIOTXDIS;
-	writel(value, padcfg0);
+	__intel_gpio_set_direction(padcfg0, input);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-- 
2.11.0

