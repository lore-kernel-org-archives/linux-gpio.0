From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 3/3] pinctrl: cherryview: Convert to use devm_gpiochip_add_data()
Date: Tue, 20 Sep 2016 15:15:23 +0300
Message-ID: <20160920121523.170293-4-mika.westerberg@linux.intel.com>
References: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:16333 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752717AbcITMP3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Sep 2016 08:15:29 -0400
In-Reply-To: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This simplifies the error handling and allows us to drop the whole
chv_pinctrl_remove() function.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index d23be3a2fb35..30389f4ccab4 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1538,7 +1538,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->base = -1;
 	chip->irq_need_valid_mask = true;
 
-	ret = gpiochip_add_data(chip, pctrl);
+	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed to register gpiochip\n");
 		return ret;
@@ -1550,7 +1550,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 					     range->base, range->npins);
 		if (ret) {
 			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-			goto fail;
+			return ret;
 		}
 
 		offset += range->npins;
@@ -1578,17 +1578,12 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add IRQ chip\n");
-		goto fail;
+		return ret;
 	}
 
 	gpiochip_set_chained_irqchip(chip, &chv_gpio_irqchip, irq,
 				     chv_gpio_irq_handler);
 	return 0;
-
-fail:
-	gpiochip_remove(chip);
-
-	return ret;
 }
 
 static int chv_pinctrl_probe(struct platform_device *pdev)
@@ -1656,15 +1651,6 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int chv_pinctrl_remove(struct platform_device *pdev)
-{
-	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pctrl->chip);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int chv_pinctrl_suspend(struct device *dev)
 {
@@ -1761,7 +1747,6 @@ MODULE_DEVICE_TABLE(acpi, chv_pinctrl_acpi_match);
 
 static struct platform_driver chv_pinctrl_driver = {
 	.probe = chv_pinctrl_probe,
-	.remove = chv_pinctrl_remove,
 	.driver = {
 		.name = "cherryview-pinctrl",
 		.pm = &chv_pinctrl_pm_ops,
-- 
2.9.3

