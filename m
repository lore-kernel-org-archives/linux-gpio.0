From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 077/182] gpio: viperboard: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:30 +0100
Message-ID: <1449667650-1062-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:32924 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbbLIN1f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:35 -0500
Received: by lbbkw15 with SMTP id kw15so29960102lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <poeschel@lemonage.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Lars Poeschel <poeschel@lemonage.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-viperboard.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 26e7edb74f42..023496d62b87 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -88,8 +88,7 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
 		unsigned offset)
 {
 	int ret, answer, error = 0;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpioa);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpioa_msg *gamsg = (struct vprbrd_gpioa_msg *)vb->buf;
 
@@ -139,8 +138,7 @@ static void vprbrd_gpioa_set(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
 	int ret;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpioa);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpioa_msg *gamsg = (struct vprbrd_gpioa_msg *)vb->buf;
 
@@ -181,8 +179,7 @@ static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
 			unsigned offset)
 {
 	int ret;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpioa);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpioa_msg *gamsg = (struct vprbrd_gpioa_msg *)vb->buf;
 
@@ -219,8 +216,7 @@ static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
 			unsigned offset, int value)
 {
 	int ret;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpioa);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpioa_msg *gamsg = (struct vprbrd_gpioa_msg *)vb->buf;
 
@@ -287,8 +283,7 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
 {
 	int ret;
 	u16 val;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpiob);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
 
@@ -319,8 +314,7 @@ static void vprbrd_gpiob_set(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
 	int ret;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpiob);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
 
@@ -353,8 +347,7 @@ static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
 			unsigned offset)
 {
 	int ret;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpiob);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 
 	gpio->gpiob_out &= ~(1 << offset);
@@ -375,8 +368,7 @@ static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
 			unsigned offset, int value)
 {
 	int ret;
-	struct vprbrd_gpio *gpio =
-			container_of(chip, struct vprbrd_gpio, gpiob);
+	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 
 	gpio->gpiob_out |= (1 << offset);
@@ -418,7 +410,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpioa.get = vprbrd_gpioa_get;
 	vb_gpio->gpioa.direction_input = vprbrd_gpioa_direction_input;
 	vb_gpio->gpioa.direction_output = vprbrd_gpioa_direction_output;
-	ret = gpiochip_add(&vb_gpio->gpioa);
+	ret = gpiochip_add_data(&vb_gpio->gpioa, vb_gpio);
 	if (ret < 0) {
 		dev_err(vb_gpio->gpioa.parent, "could not add gpio a");
 		goto err_gpioa;
@@ -435,7 +427,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpiob.get = vprbrd_gpiob_get;
 	vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
 	vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;
-	ret = gpiochip_add(&vb_gpio->gpiob);
+	ret = gpiochip_add_data(&vb_gpio->gpiob, vb_gpio);
 	if (ret < 0) {
 		dev_err(vb_gpio->gpiob.parent, "could not add gpio b");
 		goto err_gpiob;
-- 
2.4.3

