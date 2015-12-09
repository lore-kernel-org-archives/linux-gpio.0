From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 056/182] gpio: samsung: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:22 +0100
Message-ID: <1449667342-32435-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33324 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754345AbbLINW1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:27 -0500
Received: by lfaz4 with SMTP id z4so34101041lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Bolle <pebolle@tiscali.nl>, Kukjin Kim <kgene.kim@samsung.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Paul Bolle <pebolle@tiscali.nl>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 7c288ba4dc87..4cb4a314c02b 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -753,7 +753,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 #endif
 
 	/* gpiochip_add() prints own failure message on error. */
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, chip);
 	if (ret >= 0)
 		s3c_gpiolib_track(chip);
 }
@@ -862,7 +862,7 @@ static void __init samsung_gpiolib_add_4bit2_chips(struct samsung_gpio_chip *chi
 
 int samsung_gpiolib_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
-	struct samsung_gpio_chip *samsung_chip = container_of(chip, struct samsung_gpio_chip, chip);
+	struct samsung_gpio_chip *samsung_chip = gpiochip_get_data(chip);
 
 	return samsung_chip->irq_base + offset;
 }
-- 
2.4.3

