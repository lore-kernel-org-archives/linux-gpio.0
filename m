From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 113/182] pinctrl: sunxi: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:19 +0100
Message-ID: <1449667999-3152-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:33673 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754451AbbLINdX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:23 -0500
Received: by lbbkw15 with SMTP id kw15so30058776lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:22 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index a437e4f8628b..a1b672cbb8e0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -12,7 +12,7 @@
 
 #include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/module.h>
@@ -454,7 +454,7 @@ static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 
 static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct sunxi_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	u32 reg = sunxi_data_reg(offset);
 	u8 index = sunxi_data_offset(offset);
 	u32 set_mux = pctl->desc->irq_read_needs_mux &&
@@ -475,7 +475,7 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
 				unsigned offset, int value)
 {
-	struct sunxi_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	u32 reg = sunxi_data_reg(offset);
 	u8 index = sunxi_data_offset(offset);
 	unsigned long flags;
@@ -522,7 +522,7 @@ static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
 
 static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct sunxi_pinctrl *pctl = dev_get_drvdata(chip->parent);
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	struct sunxi_desc_function *desc;
 	unsigned pinnum = pctl->desc->pin_base + offset;
 	unsigned irqnum;
@@ -962,7 +962,7 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
 	pctl->chip->parent = &pdev->dev;
 	pctl->chip->base = pctl->desc->pin_base;
 
-	ret = gpiochip_add(pctl->chip);
+	ret = gpiochip_add_data(pctl->chip, pctl);
 	if (ret)
 		goto pinctrl_error;
 
-- 
2.4.3

