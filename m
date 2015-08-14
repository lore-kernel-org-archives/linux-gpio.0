From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 4/9] gpio-sysfs: Use gpio descriptor name instead of gpiochip names array
Date: Fri, 14 Aug 2015 16:11:01 +0200
Message-ID: <1439561466-14350-5-git-send-email-mpa@pengutronix.de>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57568 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153AbbHNOLi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Aug 2015 10:11:38 -0400
In-Reply-To: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

The name is now stored in the gpio descriptor as well, for example to
allow to store names from DT. This patch changes the sysfs gpio files
to use the gpio descriptor name.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-sysfs.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b57ed8e55ab5..3e81f28e3aee 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -550,9 +550,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	struct gpiod_data	*data;
 	unsigned long		flags;
 	int			status;
-	const char		*ioname = NULL;
 	struct device		*dev;
-	int			offset;
 
 	/* can't export until sysfs is available ... */
 	if (!gpio_class.p) {
@@ -601,13 +599,9 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		data->direction_can_change = false;
 
-	offset = gpio_chip_hwgpio(desc);
-	if (chip->names && chip->names[offset])
-		ioname = chip->names[offset];
-
 	dev = device_create_with_groups(&gpio_class, chip->dev,
 					MKDEV(0, 0), data, gpio_groups,
-					ioname ? ioname : "gpio%u",
+					desc->name ? desc->name : "gpio%u",
 					desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
-- 
2.4.6

