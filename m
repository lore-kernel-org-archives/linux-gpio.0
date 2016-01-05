From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] gpio: pch: Optimize pch_gpio_get()
Date: Tue, 5 Jan 2016 14:23:47 +0100
Message-ID: <20160105142347.72fff8f1@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:32938 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751188AbcAENX4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Jan 2016 08:23:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The double negation is costly and can be avoided by shifting the
register value before masking the requested bit.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pch.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-4.4-rc8.orig/drivers/gpio/gpio-pch.c	2016-01-05 14:18:55.444163876 +0100
+++ linux-4.4-rc8/drivers/gpio/gpio-pch.c	2016-01-05 14:19:02.014313389 +0100
@@ -127,7 +127,7 @@ static int pch_gpio_get(struct gpio_chip
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 
-	return !!(ioread32(&chip->reg->pi) & (1 << nr));
+	return (ioread32(&chip->reg->pi) >> nr) & 1;
 }
 
 static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,


-- 
Jean Delvare
SUSE L3 Support
