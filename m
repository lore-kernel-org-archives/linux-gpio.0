From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 118/182] pinctrl: mediatek: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:56 +0100
Message-ID: <1449668036-3391-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:34155 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754452AbbLINeA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:34:00 -0500
Received: by lbbcs9 with SMTP id cs9so29988748lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index a71f68362967..57644aa0ad2a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -95,7 +95,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
-	struct mtk_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 
 	reg_addr = mtk_get_port(pctl, offset) + pctl->devdata->dout_offset;
 	bit = BIT(offset & 0xf);
@@ -742,7 +742,7 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	unsigned int bit;
 	unsigned int read_val = 0;
 
-	struct mtk_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 
 	reg_addr =  mtk_get_port(pctl, offset) + pctl->devdata->dir_offset;
 	bit = BIT(offset & 0xf);
@@ -755,7 +755,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
 	unsigned int reg_addr;
 	unsigned int bit;
 	unsigned int read_val = 0;
-	struct mtk_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 
 	if (mtk_gpio_get_direction(chip, offset))
 		reg_addr = mtk_get_port(pctl, offset) +
@@ -772,7 +772,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	const struct mtk_desc_pin *pin;
-	struct mtk_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	int irq;
 
 	pin = pctl->devdata->pins + offset;
@@ -1351,7 +1351,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	pctl->chip->parent = &pdev->dev;
 	pctl->chip->base = -1;
 
-	ret = gpiochip_add(pctl->chip);
+	ret = gpiochip_add_data(pctl->chip, pctl);
 	if (ret) {
 		ret = -EINVAL;
 		goto pctrl_error;
-- 
2.4.3

