From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/7] misc: ixp4-beeper: use gpiolib strictly
Date: Tue, 10 Sep 2013 14:30:26 +0200
Message-ID: <1378816226-8016-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:50292 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371Ab3IJMaj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2013 08:30:39 -0400
Received: by mail-la0-f46.google.com with SMTP id eh20so6008440lab.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2013 05:30:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Request and free the GPIO line used for the beeper properly.
Then use the gpiolib API to flip the output of the GPIO pin
instead of relying on hacks to poke the register bits.

Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Arnd/Greg: seeking your ACK to take this through the GPIO tree
as part of the attempt at cleaning out custom GPIO implementations.
---
 drivers/input/misc/ixp4xx-beeper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/ixp4xx-beeper.c b/drivers/input/misc/ixp4xx-beeper.c
index f14afd0..fb3bec5 100644
--- a/drivers/input/misc/ixp4xx-beeper.c
+++ b/drivers/input/misc/ixp4xx-beeper.c
@@ -76,11 +76,13 @@ static int ixp4xx_spkr_event(struct input_dev *dev, unsigned int type, unsigned
 
 static irqreturn_t ixp4xx_spkr_interrupt(int irq, void *dev_id)
 {
+	unsigned int pin = (unsigned int) dev_id;
+
 	/* clear interrupt */
 	*IXP4XX_OSST = IXP4XX_OSST_TIMER_2_PEND;
 
 	/* flip the beeper output */
-	*IXP4XX_GPIO_GPOUTR ^= (1 << (unsigned int) dev_id);
+	gpio_set_value(pin, ~gpio_get_value(pin));
 
 	return IRQ_HANDLED;
 }
@@ -108,11 +110,15 @@ static int ixp4xx_spkr_probe(struct platform_device *dev)
 	input_dev->sndbit[0] = BIT_MASK(SND_BELL) | BIT_MASK(SND_TONE);
 	input_dev->event = ixp4xx_spkr_event;
 
+	err = gpio_request(dev->id, "ixp4-beeper");
+	if (err)
+		goto err_free_device;
+
 	err = request_irq(IRQ_IXP4XX_TIMER2, &ixp4xx_spkr_interrupt,
 			  IRQF_NO_SUSPEND, "ixp4xx-beeper",
 			  (void *) dev->id);
 	if (err)
-		goto err_free_device;
+		goto err_free_gpio;
 
 	err = input_register_device(input_dev);
 	if (err)
@@ -124,6 +130,8 @@ static int ixp4xx_spkr_probe(struct platform_device *dev)
 
  err_free_irq:
 	free_irq(IRQ_IXP4XX_TIMER2, (void *)dev->id);
+ err_free_gpio:
+	gpio_free(dev->id);
  err_free_device:
 	input_free_device(input_dev);
 
@@ -142,6 +150,7 @@ static int ixp4xx_spkr_remove(struct platform_device *dev)
 	ixp4xx_spkr_control(pin, 0);
 
 	free_irq(IRQ_IXP4XX_TIMER2, (void *)dev->id);
+	gpio_free(dev->id);
 
 	return 0;
 }
-- 
1.8.3.1

