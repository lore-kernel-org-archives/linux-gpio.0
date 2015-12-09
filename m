From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 123/182] ARM: scoop: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:34:40 +0100
Message-ID: <1449668080-3626-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:33300 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869AbbLINep (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:34:45 -0500
Received: by lbbkw15 with SMTP id kw15so30082191lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:34:43 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org, Richard Purdie <rpurdie@rpsys.net>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: arm@kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC people: please ACK this so I can take it with the rest of
the refactoring through the GPIO tree.
---
 arch/arm/common/scoop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/common/scoop.c b/arch/arm/common/scoop.c
index 45f4c21e393c..20ff61b2d179 100644
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@ -69,7 +69,7 @@ static void __scoop_gpio_set(struct scoop_dev *sdev,
 
 static void scoop_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct scoop_dev *sdev = container_of(chip, struct scoop_dev, gpio);
+	struct scoop_dev *sdev = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&sdev->scoop_lock, flags);
@@ -81,7 +81,7 @@ static void scoop_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int scoop_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct scoop_dev *sdev = container_of(chip, struct scoop_dev, gpio);
+	struct scoop_dev *sdev = gpiochip_get_data(chip);
 
 	/* XXX: I'm unsure, but it seems so */
 	return ioread16(sdev->base + SCOOP_GPRR) & (1 << (offset + 1));
@@ -90,7 +90,7 @@ static int scoop_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int scoop_gpio_direction_input(struct gpio_chip *chip,
 			unsigned offset)
 {
-	struct scoop_dev *sdev = container_of(chip, struct scoop_dev, gpio);
+	struct scoop_dev *sdev = gpiochip_get_data(chip);
 	unsigned long flags;
 	unsigned short gpcr;
 
@@ -108,7 +108,7 @@ static int scoop_gpio_direction_input(struct gpio_chip *chip,
 static int scoop_gpio_direction_output(struct gpio_chip *chip,
 			unsigned offset, int value)
 {
-	struct scoop_dev *sdev = container_of(chip, struct scoop_dev, gpio);
+	struct scoop_dev *sdev = gpiochip_get_data(chip);
 	unsigned long flags;
 	unsigned short gpcr;
 
@@ -224,7 +224,7 @@ static int scoop_probe(struct platform_device *pdev)
 		devptr->gpio.direction_input = scoop_gpio_direction_input;
 		devptr->gpio.direction_output = scoop_gpio_direction_output;
 
-		ret = gpiochip_add(&devptr->gpio);
+		ret = gpiochip_add_data(&devptr->gpio, devptr);
 		if (ret)
 			goto err_gpio;
 	}
-- 
2.4.3

