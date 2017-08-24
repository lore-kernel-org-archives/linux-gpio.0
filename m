From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: intel: Read back TX buffer state
Date: Thu, 24 Aug 2017 11:19:33 +0300
Message-ID: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:30126 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752463AbdHXITx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Aug 2017 04:19:53 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Bourque, Francis" <francis.bourque@intel.com>

In the same way as it's done in pinctrl-cherryview.c we would provide
a readback TX buffer state.

Fixes: 17fab473693 ("pinctrl: intel: Set pin direction properly")
Reported-by: "Bourque, Francis" <francis.bourque@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 6dc1096d3d34..c8675611b768 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -751,12 +751,17 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	void __iomem *reg;
+	u32 padcfg0;
 
 	reg = intel_get_padcfg(pctrl, offset, PADCFG0);
 	if (!reg)
 		return -EINVAL;
 
-	return !!(readl(reg) & PADCFG0_GPIORXSTATE);
+	padcfg0 = readl(reg);
+	if (!(padcfg0 & PADCFG0_GPIOTXDIS))
+		return !!(padcfg0 & PADCFG0_GPIOTXSTATE);
+
+	return !!(padcfg0 & PADCFG0_GPIORXSTATE);
 }
 
 static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.14.1

