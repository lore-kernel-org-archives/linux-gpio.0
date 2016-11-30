From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: htc-egpio: add .get_direction() support
Date: Wed, 30 Nov 2016 10:09:15 +0100
Message-ID: <1480496955-5727-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34755 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757523AbcK3JJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 04:09:22 -0500
Received: by mail-lf0-f44.google.com with SMTP id o141so141525604lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 01:09:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes is possible to read out the current direction of a
GPIO line on the HTC CPLD GPIO expander.

Suggested-by: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-htc-egpio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 5ab895b41819..27af52850927 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -225,6 +225,15 @@ static int egpio_direction_output(struct gpio_chip *chip,
 	}
 }
 
+static int egpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct egpio_chip *egpio;
+
+	egpio = gpiochip_get_data(chip);
+
+	return !test_bit(offset, &egpio->is_out);
+}
+
 static void egpio_write_cache(struct egpio_info *ei)
 {
 	int               i;
@@ -327,6 +336,7 @@ static int __init egpio_probe(struct platform_device *pdev)
 		chip->set             = egpio_set;
 		chip->direction_input = egpio_direction_input;
 		chip->direction_output = egpio_direction_output;
+		chip->get_direction   = egpio_get_direction;
 		chip->base            = pdata->chip[i].gpio_base;
 		chip->ngpio           = pdata->chip[i].num_gpios;
 
-- 
2.7.4

