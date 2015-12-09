From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 059/182] gpio: spear-spics: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:45 +0100
Message-ID: <1449667365-32576-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:36715 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156AbbLINWt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:49 -0500
Received: by lbblt2 with SMTP id lt2so29984048lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-spear-spics.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index bd436b7f86e1..50fb09080a6b 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -62,8 +62,7 @@ static int spics_get_value(struct gpio_chip *chip, unsigned offset)
 
 static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct spear_spics *spics = container_of(chip, struct spear_spics,
-			chip);
+	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
 
 	/* select chip select from register */
@@ -94,8 +93,7 @@ static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int spics_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct spear_spics *spics = container_of(chip, struct spear_spics,
-			chip);
+	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
 
 	if (!spics->use_count++) {
@@ -110,8 +108,7 @@ static int spics_request(struct gpio_chip *chip, unsigned offset)
 
 static void spics_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct spear_spics *spics = container_of(chip, struct spear_spics,
-			chip);
+	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
 
 	if (!--spics->use_count) {
@@ -168,7 +165,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.owner = THIS_MODULE;
 	spics->last_off = -1;
 
-	ret = gpiochip_add(&spics->chip);
+	ret = gpiochip_add_data(&spics->chip, spics);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpio chip\n");
 		return ret;
-- 
2.4.3

