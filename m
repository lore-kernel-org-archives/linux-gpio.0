From: Marek Vasut <marex@denx.de>
Subject: [PATCH] gpio: max732x: Add missing dev reference to gpiochip
Date: Tue, 30 Jun 2015 20:04:18 +0200
Message-ID: <1435687458-4671-1-git-send-email-marex@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:45656 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159AbbF3SEd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 14:04:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mans Rullgard <mans@mansr.com>, Olaf Mandel <o.mandel@menlosystems.com>, Semen Protsenko <semen.protsenko@globallogic.com>

In case the gpiochip doesn't have the .dev field set, as is the case
in here, it is not possible to reference this device in DT as a GPIO
controller. A good example of this problem is that gpio-leds can not
be used when connected to this chip, the gpio-leds driver bails out
with -EPROBE_DEFER.

Fix this problem by setting the .dev field of the gpio_chip to the
parent i2c device.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mans Rullgard <mans@mansr.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Cc: Semen Protsenko <semen.protsenko@globallogic.com>
---
 drivers/gpio/gpio-max732x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 0fa4543..aba8337 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -596,6 +596,7 @@ static int max732x_setup_gpio(struct max732x_chip *chip,
 	gc->base = gpio_start;
 	gc->ngpio = port;
 	gc->label = chip->client->name;
+	gc->dev = &chip->client->dev;
 	gc->owner = THIS_MODULE;
 
 	return port;
-- 
2.1.4

