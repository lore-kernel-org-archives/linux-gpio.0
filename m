From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 3/4] gpio: moxart: get value of output gpio from generic driver
Date: Wed, 29 Apr 2015 18:35:00 +0300
Message-ID: <1430321701-13758-4-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:52598 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753602AbbD2Pfj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 11:35:39 -0400
In-Reply-To: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

Adding a BGPIOF_READ_OUTPUT_REG_SET initialization flag to GPIO
generic MMIO driver makes possible to remove a private get() value
function from the driver.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/gpio/gpio-moxart.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index c3ab46e..abd8676 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -39,17 +39,6 @@ static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pinctrl_free_gpio(offset);
 }
 
-static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	struct bgpio_chip *bgc = to_bgpio_chip(chip);
-	u32 ret = bgc->read_reg(bgc->reg_dir);
-
-	if (ret & BIT(offset))
-		return !!(bgc->read_reg(bgc->reg_set) & BIT(offset));
-	else
-		return !!(bgc->read_reg(bgc->reg_dat) & BIT(offset));
-}
-
 static int moxart_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -68,8 +57,9 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	ret = bgpio_init(bgc, dev, 4, base + GPIO_DATA_IN,
-		    base + GPIO_DATA_OUT, NULL,
-		    base + GPIO_PIN_DIRECTION, NULL, 0);
+			 base + GPIO_DATA_OUT, NULL,
+			 base + GPIO_PIN_DIRECTION, NULL,
+			 BGPIOF_READ_OUTPUT_REG_SET);
 	if (ret) {
 		dev_err(&pdev->dev, "bgpio_init failed\n");
 		return ret;
@@ -78,7 +68,6 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 	bgc->gc.label = "moxart-gpio";
 	bgc->gc.request = moxart_gpio_request;
 	bgc->gc.free = moxart_gpio_free;
-	bgc->gc.get = moxart_gpio_get;
 	bgc->data = bgc->read_reg(bgc->reg_set);
 	bgc->gc.base = 0;
 	bgc->gc.ngpio = 32;
-- 
1.7.10.4

