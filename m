From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 060/182] gpio: sta2x11: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:53 +0100
Message-ID: <1449667373-32623-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:32770 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156AbbLINW6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:58 -0500
Received: by lbbkw15 with SMTP id kw15so29881423lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@gnudd.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Alessandro Rubini <rubini@gnudd.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sta2x11.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index 55e47828ddfc..b09ab7562709 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -74,7 +74,7 @@ static inline u32 __bit(int nr)
 
 static void gsta_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 {
-	struct gsta_gpio *chip = container_of(gpio, struct gsta_gpio, gpio);
+	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = __regs(chip, nr);
 	u32 bit = __bit(nr);
 
@@ -86,7 +86,7 @@ static void gsta_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 
 static int gsta_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
-	struct gsta_gpio *chip = container_of(gpio, struct gsta_gpio, gpio);
+	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = __regs(chip, nr);
 	u32 bit = __bit(nr);
 
@@ -96,7 +96,7 @@ static int gsta_gpio_get(struct gpio_chip *gpio, unsigned nr)
 static int gsta_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 				      int val)
 {
-	struct gsta_gpio *chip = container_of(gpio, struct gsta_gpio, gpio);
+	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = __regs(chip, nr);
 	u32 bit = __bit(nr);
 
@@ -111,7 +111,7 @@ static int gsta_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 
 static int gsta_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 {
-	struct gsta_gpio *chip = container_of(gpio, struct gsta_gpio, gpio);
+	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	struct gsta_regs __iomem *regs = __regs(chip, nr);
 	u32 bit = __bit(nr);
 
@@ -121,7 +121,7 @@ static int gsta_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 
 static int gsta_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
-	struct gsta_gpio *chip = container_of(gpio, struct gsta_gpio, gpio);
+	struct gsta_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
 }
 
@@ -409,7 +409,7 @@ static int gsta_probe(struct platform_device *dev)
 		goto err_free_descs;
 	}
 
-	err = gpiochip_add(&chip->gpio);
+	err = gpiochip_add_data(&chip->gpio, chip);
 	if (err < 0) {
 		dev_err(&dev->dev, "sta2x11 gpio: Can't register (%i)\n",
 			-err);
-- 
2.4.3

