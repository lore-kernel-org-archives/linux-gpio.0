From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] pinctrl: baytrail: Do not add all GPIOs to IRQ domain
Date: Wed, 11 Jan 2017 15:49:00 +0200
Message-ID: <20170111134900.31026-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:24713 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966737AbdAKNtG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 08:49:06 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, "Robert R . Howell" <rhowell@uwyo.edu>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

When DIRECT_IRQ_EN is set, the pin is routed directly to the IO-APIC bypassing
the GPIO driver completely. However, the mask register is still used to
determine if the pin is supposed to generate IRQ or not.

So with commit 3ae02c14d964 the IRQ core masks all IRQs (because of
handle_bad_irq()) the pin connected to the touchscreen gets masked as well and
hence no interrupts.

To make this all work as expected we do not add those GPIOs to the IRQ domain
that can actually propagate interrupts.

Fixes: 3ae02c14d964 ("pinctrl: intel: set default handler to be handle_bad_irq()")
Reported-by: Robert R. Howell <rhowell@uwyo.edu>
Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
In v3:
- drop upstreamed patch
- fix commit message (Mika)
- add Suggested-by tag
 drivers/pinctrl/intel/pinctrl-baytrail.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 000eb79ecf07..e696a01365cb 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1623,6 +1623,8 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 
 static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 {
+	struct gpio_chip *gc = &vg->chip;
+	struct device *dev = &vg->pdev->dev;
 	void __iomem *reg;
 	u32 base, value;
 	int i;
@@ -1644,10 +1646,12 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 		}
 
 		value = readl(reg);
-		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
-		    !(value & BYT_DIRECT_IRQ_EN)) {
+		if (value & BYT_DIRECT_IRQ_EN) {
+			clear_bit(i, gc->irq_valid_mask);
+			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
+		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
-			dev_dbg(&vg->pdev->dev, "disabling GPIO %d\n", i);
+			dev_dbg(dev, "disabling GPIO %d\n", i);
 		}
 	}
 
@@ -1686,6 +1690,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	gc->can_sleep	= false;
 	gc->parent	= &vg->pdev->dev;
 	gc->ngpio	= vg->soc_data->npins;
+	gc->irq_need_valid_mask	= true;
 
 #ifdef CONFIG_PM_SLEEP
 	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
-- 
2.11.0

