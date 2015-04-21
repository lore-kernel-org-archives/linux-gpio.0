From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 03/23] gpio: sysfs: drop redundant lock-as-irq
Date: Tue, 21 Apr 2015 17:42:11 +0200
Message-ID: <1429630951-27082-4-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35016 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755732AbbDUPnO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 11:43:14 -0400
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Drop redundant lock-as-irq in gpio_setup_irq, which has already been
handled when requesting and releasing the irq (i.e. in the irq chip
irq_request_resources and irq_release_resources callbacks).

Note that we would be leaking the irq in the gpiochip_lock_as_irq error
path if the (second) explicit call ever failed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index af3bc7a8033b..d87f595a02ce 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -161,7 +161,6 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 	desc->flags &= ~GPIO_TRIGGER_MASK;
 
 	if (!gpio_flags) {
-		gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
 		ret = 0;
 		goto free_id;
 	}
@@ -200,12 +199,6 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 	if (ret < 0)
 		goto free_id;
 
-	ret = gpiochip_lock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
-	if (ret < 0) {
-		gpiod_warn(desc, "failed to flag the GPIO for IRQ\n");
-		goto free_id;
-	}
-
 	desc->flags |= gpio_flags;
 	return 0;
 
-- 
2.0.5

