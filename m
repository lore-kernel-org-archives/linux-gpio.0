From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 9/9] gpiolib-of: Use dev_warn instead of pr_warn
Date: Fri, 14 Aug 2015 16:11:06 +0200
Message-ID: <1439561466-14350-10-git-send-email-mpa@pengutronix.de>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:55700 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754651AbbHNOLm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Aug 2015 10:11:42 -0400
In-Reply-To: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

chip->dev should be initialized at this point so we can use dev_* here
instead of pr_warn.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1911b692f735..48a7579dd62d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -227,8 +227,8 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 
 		if (of_property_read_bool(np, "gpio-hog")) {
 			if (!dflags) {
-				pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
-					desc_to_gpio(desc), np->name);
+				dev_warn(chip->dev, "GPIO line %d (%s): no hogging state specified, bailing out\n",
+					 desc_to_gpio(desc), np->name);
 				continue;
 			}
 
-- 
2.4.6

