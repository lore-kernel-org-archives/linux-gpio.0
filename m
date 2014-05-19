From: Anthony Fee <anthony.fee@emutex.com>
Subject: [PATCH v2] gpio: generic: add request function pointer
Date: Mon, 19 May 2014 18:49:14 +0100
Message-ID: <1400521754-4480-1-git-send-email-anthony.fee@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2.digiweb.ie ([83.147.160.14]:44592 "EHLO smtp.digiweb.ie"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752589AbaESRt5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 19 May 2014 13:49:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Anthony Fee <anthony.fee@emutex.com>

gpiolib will require all gpio drivers to expicitly set the request function pointer
in future. To encourage gpio driver developers to adhere to this standard
gpio-generic.c now sets this function pointer.

Signed-off-by: Anthony Fee <anthony.fee@emutex.com>
---
 drivers/gpio/gpio-generic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index b5dff9e..fea8c82 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -388,6 +388,14 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
 	return 0;
 }
 
+static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
+{
+	if (gpio_pin < chip->ngpio)
+		return 0;
+
+	return -EINVAL;
+}
+
 int bgpio_remove(struct bgpio_chip *bgc)
 {
 	return gpiochip_remove(&bgc->gc);
@@ -413,6 +421,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 	bgc->gc.label = dev_name(dev);
 	bgc->gc.base = -1;
 	bgc->gc.ngpio = bgc->bits;
+	bgc->gc.request = bgpio_request;
 
 	ret = bgpio_setup_io(bgc, dat, set, clr);
 	if (ret)
-- 
1.9.0

