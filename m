From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 043/182] gpio: msic: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:44 +0100
Message-ID: <1449667124-31787-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34116 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINSt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:49 -0500
Received: by lbbcs9 with SMTP id cs9so29729833lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-msic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index fe9ef2bc981a..fedae58e28f1 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -179,7 +179,7 @@ static int msic_irq_type(struct irq_data *data, unsigned type)
 
 static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct msic_gpio *mg = container_of(chip, struct msic_gpio, chip);
+	struct msic_gpio *mg = gpiochip_get_data(chip);
 	return mg->irq_base + offset;
 }
 
@@ -297,7 +297,7 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
 
 	mutex_init(&mg->buslock);
 
-	retval = gpiochip_add(&mg->chip);
+	retval = gpiochip_add_data(&mg->chip, mg);
 	if (retval) {
 		dev_err(dev, "Adding MSIC gpio chip failed\n");
 		goto err;
-- 
2.4.3

