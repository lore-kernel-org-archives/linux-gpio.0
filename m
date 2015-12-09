From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 047/182] gpio: palmas: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:19:18 +0100
Message-ID: <1449667158-31977-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:34417 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINT3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:19:29 -0500
Received: by lbbcs9 with SMTP id cs9so29740817lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:19:27 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Andrew Chew <achew@nvidia.com>, Stephen Warren <swarren@nvidia.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Andrew Chew <achew@nvidia.com>
Cc: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-palmas.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 5f09ed1700dc..fec4e868afc8 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -35,14 +35,9 @@ struct palmas_device_data {
 	int ngpio;
 };
 
-static inline struct palmas_gpio *to_palmas_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct palmas_gpio, gpio_chip);
-}
-
 static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct palmas_gpio *pg = to_palmas_gpio(gc);
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
 	unsigned int val;
 	int ret;
@@ -74,7 +69,7 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 			int value)
 {
-	struct palmas_gpio *pg = to_palmas_gpio(gc);
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
 	int ret;
 	unsigned int reg;
@@ -96,7 +91,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
-	struct palmas_gpio *pg = to_palmas_gpio(gc);
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
 	int ret;
 	unsigned int reg;
@@ -118,7 +113,7 @@ static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 
 static int palmas_gpio_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct palmas_gpio *pg = to_palmas_gpio(gc);
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
 	int ret;
 	unsigned int reg;
@@ -136,7 +131,7 @@ static int palmas_gpio_input(struct gpio_chip *gc, unsigned offset)
 
 static int palmas_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct palmas_gpio *pg = to_palmas_gpio(gc);
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
 
 	return palmas_irq_get_virq(palmas, PALMAS_GPIO_0_IRQ + offset);
@@ -198,7 +193,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	else
 		palmas_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add(&palmas_gpio->gpio_chip);
+	ret = gpiochip_add_data(&palmas_gpio->gpio_chip, palmas_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

