From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 015/182] gpio: ath79: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:46 +0100
Message-ID: <1449666886-30451-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:35355 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592AbbLINOv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:51 -0500
Received: by lbpu9 with SMTP id u9so29532915lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alban Bedel <albeu@free.fr>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Alban Bedel <albeu@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index e7e38af11ec9..2c208e1d9350 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -24,12 +24,10 @@ struct ath79_gpio_ctrl {
 	spinlock_t lock;
 };
 
-#define to_ath79_gpio_ctrl(c) container_of(c, struct ath79_gpio_ctrl, chip)
-
 static void ath79_gpio_set_value(struct gpio_chip *chip,
 				unsigned gpio, int value)
 {
-	struct ath79_gpio_ctrl *ctrl = to_ath79_gpio_ctrl(chip);
+	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
 
 	if (value)
 		__raw_writel(BIT(gpio), ctrl->base + AR71XX_GPIO_REG_SET);
@@ -39,7 +37,7 @@ static void ath79_gpio_set_value(struct gpio_chip *chip,
 
 static int ath79_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ath79_gpio_ctrl *ctrl = to_ath79_gpio_ctrl(chip);
+	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
 
 	return (__raw_readl(ctrl->base + AR71XX_GPIO_REG_IN) >> gpio) & 1;
 }
@@ -47,7 +45,7 @@ static int ath79_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 static int ath79_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned offset)
 {
-	struct ath79_gpio_ctrl *ctrl = to_ath79_gpio_ctrl(chip);
+	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctrl->lock, flags);
@@ -64,7 +62,7 @@ static int ath79_gpio_direction_input(struct gpio_chip *chip,
 static int ath79_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
-	struct ath79_gpio_ctrl *ctrl = to_ath79_gpio_ctrl(chip);
+	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctrl->lock, flags);
@@ -85,7 +83,7 @@ static int ath79_gpio_direction_output(struct gpio_chip *chip,
 
 static int ar934x_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct ath79_gpio_ctrl *ctrl = to_ath79_gpio_ctrl(chip);
+	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctrl->lock, flags);
@@ -102,7 +100,7 @@ static int ar934x_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int ar934x_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 					int value)
 {
-	struct ath79_gpio_ctrl *ctrl = to_ath79_gpio_ctrl(chip);
+	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctrl->lock, flags);
@@ -184,7 +182,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		ctrl->chip.direction_output = ar934x_gpio_direction_output;
 	}
 
-	err = gpiochip_add(&ctrl->chip);
+	err = gpiochip_add_data(&ctrl->chip, ctrl);
 	if (err) {
 		dev_err(&pdev->dev,
 			"cannot add AR71xx GPIO chip, error=%d", err);
-- 
2.4.3

