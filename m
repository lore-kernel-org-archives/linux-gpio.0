From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 161/182] mfd: asic3: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:47:22 +0100
Message-ID: <1449668842-6166-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:36255 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINr1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:47:27 -0500
Received: by lbblt2 with SMTP id lt2so30405385lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:47:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Parsons <lost.distance@yahoo.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Paul Parsons <lost.distance@yahoo.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee please ACK this so I can take it through the GPIO tree.

I want to try to optimistically merge these changes without any
immutable branches, as I suspect other subsystem maintainers might
not want to pull a branch with 200+ patches into each subsystem,
but let's see what happens.
---
 drivers/mfd/asic3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
index a726f01e3b02..013ba51de819 100644
--- a/drivers/mfd/asic3.c
+++ b/drivers/mfd/asic3.c
@@ -447,7 +447,7 @@ static int asic3_gpio_direction(struct gpio_chip *chip,
 	unsigned long flags;
 	struct asic3 *asic;
 
-	asic = container_of(chip, struct asic3, gpio);
+	asic = gpiochip_get_data(chip);
 	gpio_base = ASIC3_GPIO_TO_BASE(offset);
 
 	if (gpio_base > ASIC3_GPIO_D_BASE) {
@@ -493,7 +493,7 @@ static int asic3_gpio_get(struct gpio_chip *chip,
 	u32 mask = ASIC3_GPIO_TO_MASK(offset);
 	struct asic3 *asic;
 
-	asic = container_of(chip, struct asic3, gpio);
+	asic = gpiochip_get_data(chip);
 	gpio_base = ASIC3_GPIO_TO_BASE(offset);
 
 	if (gpio_base > ASIC3_GPIO_D_BASE) {
@@ -513,7 +513,7 @@ static void asic3_gpio_set(struct gpio_chip *chip,
 	unsigned long flags;
 	struct asic3 *asic;
 
-	asic = container_of(chip, struct asic3, gpio);
+	asic = gpiochip_get_data(chip);
 	gpio_base = ASIC3_GPIO_TO_BASE(offset);
 
 	if (gpio_base > ASIC3_GPIO_D_BASE) {
@@ -542,7 +542,7 @@ static void asic3_gpio_set(struct gpio_chip *chip,
 
 static int asic3_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct asic3 *asic = container_of(chip, struct asic3, gpio);
+	struct asic3 *asic = gpiochip_get_data(chip);
 
 	return asic->irq_base + offset;
 }
@@ -597,7 +597,7 @@ static __init int asic3_gpio_probe(struct platform_device *pdev,
 				     alt_reg[i]);
 	}
 
-	return gpiochip_add(&asic->gpio);
+	return gpiochip_add_data(&asic->gpio, asic);
 }
 
 static int asic3_gpio_remove(struct platform_device *pdev)
-- 
2.4.3

