From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 036/182] gpio: mc33880: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:46 +0100
Message-ID: <1449667066-31455-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35757 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752853AbbLINRu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:50 -0500
Received: by lbpu9 with SMTP id u9so29583806lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mc33880.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index b46b9e522e8c..0f0df7956264 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -71,7 +71,7 @@ static int __mc33880_set(struct mc33880 *mc, unsigned offset, int value)
 
 static void mc33880_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct mc33880 *mc = container_of(chip, struct mc33880, chip);
+	struct mc33880 *mc = gpiochip_get_data(chip);
 
 	mutex_lock(&mc->lock);
 
@@ -135,7 +135,7 @@ static int mc33880_probe(struct spi_device *spi)
 		goto exit_destroy;
 	}
 
-	ret = gpiochip_add(&mc->chip);
+	ret = gpiochip_add_data(&mc->chip, mc);
 	if (ret)
 		goto exit_destroy;
 
-- 
2.4.3

