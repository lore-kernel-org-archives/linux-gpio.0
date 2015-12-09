From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 082/182] gpio: xgene: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:28:08 +0100
Message-ID: <1449667688-1317-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34722 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLIN2O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:28:14 -0500
Received: by lffu14 with SMTP id u14so34233611lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:28:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Feng Kan <fkan@apm.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Feng Kan <fkan@apm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xgene.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index b8ceb71885f6..592e9cdf9c53 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -47,14 +47,9 @@ struct xgene_gpio {
 #endif
 };
 
-static inline struct xgene_gpio *to_xgene_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct xgene_gpio, chip);
-}
-
 static int xgene_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
-	struct xgene_gpio *chip = to_xgene_gpio(gc);
+	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long bank_offset;
 	u32 bit_offset;
 
@@ -65,7 +60,7 @@ static int xgene_gpio_get(struct gpio_chip *gc, unsigned int offset)
 
 static void __xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	struct xgene_gpio *chip = to_xgene_gpio(gc);
+	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long bank_offset;
 	u32 setval, bit_offset;
 
@@ -82,7 +77,7 @@ static void __xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 
 static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	struct xgene_gpio *chip = to_xgene_gpio(gc);
+	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -92,7 +87,7 @@ static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 
 static int xgene_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
-	struct xgene_gpio *chip = to_xgene_gpio(gc);
+	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags, bank_offset;
 	u32 dirval, bit_offset;
 
@@ -113,7 +108,7 @@ static int xgene_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 static int xgene_gpio_dir_out(struct gpio_chip *gc,
 					unsigned int offset, int val)
 {
-	struct xgene_gpio *chip = to_xgene_gpio(gc);
+	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags, bank_offset;
 	u32 dirval, bit_offset;
 
@@ -198,7 +193,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio);
 
-	err = gpiochip_add(&gpio->chip);
+	err = gpiochip_add_data(&gpio->chip, gpio);
 	if (err) {
 		dev_err(&pdev->dev,
 			"failed to register gpiochip.\n");
-- 
2.4.3

