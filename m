From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 165/182] mfd: sm501: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:47:53 +0100
Message-ID: <1449668873-6354-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35955 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINr5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:47:57 -0500
Received: by lfs39 with SMTP id 39so34754589lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:47:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ben Dooks <ben@fluff.org.uk>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Ben Dooks <ben@fluff.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.
---
 drivers/mfd/sm501.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index c646784c5a7d..65cd0d2a822a 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -879,11 +879,6 @@ static int sm501_register_display(struct sm501_devdata *sm,
 
 #ifdef CONFIG_MFD_SM501_GPIO
 
-static inline struct sm501_gpio_chip *to_sm501_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct sm501_gpio_chip, gpio);
-}
-
 static inline struct sm501_devdata *sm501_gpio_to_dev(struct sm501_gpio *gpio)
 {
 	return container_of(gpio, struct sm501_devdata, gpio);
@@ -892,7 +887,7 @@ static inline struct sm501_devdata *sm501_gpio_to_dev(struct sm501_gpio *gpio)
 static int sm501_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 {
-	struct sm501_gpio_chip *smgpio = to_sm501_gpio(chip);
+	struct sm501_gpio_chip *smgpio = gpiochip_get_data(chip);
 	unsigned long result;
 
 	result = smc501_readl(smgpio->regbase + SM501_GPIO_DATA_LOW);
@@ -923,7 +918,7 @@ static void sm501_gpio_ensure_gpio(struct sm501_gpio_chip *smchip,
 static void sm501_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 {
-	struct sm501_gpio_chip *smchip = to_sm501_gpio(chip);
+	struct sm501_gpio_chip *smchip = gpiochip_get_data(chip);
 	struct sm501_gpio *smgpio = smchip->ourgpio;
 	unsigned long bit = 1 << offset;
 	void __iomem *regs = smchip->regbase;
@@ -948,7 +943,7 @@ static void sm501_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int sm501_gpio_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct sm501_gpio_chip *smchip = to_sm501_gpio(chip);
+	struct sm501_gpio_chip *smchip = gpiochip_get_data(chip);
 	struct sm501_gpio *smgpio = smchip->ourgpio;
 	void __iomem *regs = smchip->regbase;
 	unsigned long bit = 1 << offset;
@@ -974,7 +969,7 @@ static int sm501_gpio_input(struct gpio_chip *chip, unsigned offset)
 static int sm501_gpio_output(struct gpio_chip *chip,
 			     unsigned offset, int value)
 {
-	struct sm501_gpio_chip *smchip = to_sm501_gpio(chip);
+	struct sm501_gpio_chip *smchip = gpiochip_get_data(chip);
 	struct sm501_gpio *smgpio = smchip->ourgpio;
 	unsigned long bit = 1 << offset;
 	void __iomem *regs = smchip->regbase;
@@ -1039,7 +1034,7 @@ static int sm501_gpio_register_chip(struct sm501_devdata *sm,
 	gchip->base   = base;
 	chip->ourgpio = gpio;
 
-	return gpiochip_add(gchip);
+	return gpiochip_add_data(gchip, chip);
 }
 
 static int sm501_register_gpio(struct sm501_devdata *sm)
-- 
2.4.3

