From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 085/182] gpio: zevio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:29:07 +0100
Message-ID: <1449667747-1522-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35932 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLIN3L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:29:11 -0500
Received: by lfs39 with SMTP id 39so34385915lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:29:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Fabian Vogt <fabian@ritter-vogt.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Fabian Vogt <fabian@ritter-vogt.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zevio.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 65b61dcc6268..cda6d922be98 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -52,9 +52,6 @@
 #define ZEVIO_GPIO_INPUT			0x18
 #define ZEVIO_GPIO_INT_STICKY		0x20
 
-#define to_zevio_gpio(chip) container_of(to_of_mm_gpio_chip(chip), \
-				struct zevio_gpio, chip)
-
 /* Bit number of GPIO in its section */
 #define ZEVIO_GPIO_BIT(gpio) (gpio&7)
 
@@ -80,7 +77,7 @@ static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
 /* Functions for struct gpio_chip */
 static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
 {
-	struct zevio_gpio *controller = to_zevio_gpio(chip);
+	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val, dir;
 
 	spin_lock(&controller->lock);
@@ -96,7 +93,7 @@ static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
 
 static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 {
-	struct zevio_gpio *controller = to_zevio_gpio(chip);
+	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
 
 	spin_lock(&controller->lock);
@@ -112,7 +109,7 @@ static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 
 static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
-	struct zevio_gpio *controller = to_zevio_gpio(chip);
+	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
 
 	spin_lock(&controller->lock);
@@ -129,7 +126,7 @@ static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 static int zevio_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned pin, int value)
 {
-	struct zevio_gpio *controller = to_zevio_gpio(chip);
+	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
 
 	spin_lock(&controller->lock);
@@ -187,7 +184,9 @@ static int zevio_gpio_probe(struct platform_device *pdev)
 	controller->chip.gc = zevio_gpio_chip;
 	controller->chip.gc.parent = &pdev->dev;
 
-	status = of_mm_gpiochip_add(pdev->dev.of_node, &(controller->chip));
+	status = of_mm_gpiochip_add_data(pdev->dev.of_node,
+					 &(controller->chip),
+					 controller);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add gpiochip: %d\n", status);
 		return status;
-- 
2.4.3

