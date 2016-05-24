From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] gpio: core: Do not call get_direction in atomic context for sleeping gpio
Date: Tue, 24 May 2016 18:48:22 +0530
Message-ID: <1464095903-29145-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:29982 "EHLO
	hkmmgate102.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753075AbcEXNag (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 09:30:36 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

When adding the gpiochip, the GPIO HW drivers' callback get_direction()
get called in atomic context. Some of the GPIO HW drivers can sleep when
accessing the register and hence it can create the sleeping call in
atomic context.

Call get_direction() in non-atomic context from gpiochip_add() if GPIO
HW driver is having sleepable callback i.e. chip->can_sleep = 1.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
This is found when implementing the get_direction() of max77620 on 20160520
linux-next.

 drivers/gpio/gpiolib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d407f904..4d04171 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -636,7 +636,15 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 			 * If we have .get_direction, set up the initial
 			 * direction flag from the hardware.
 			 */
-			int dir = chip->get_direction(chip, i);
+			int dir;
+
+			if (chip->can_sleep)
+				spin_unlock_irqrestore(&gpio_lock, flags);
+
+			dir = chip->get_direction(chip, i);
+
+			if (chip->can_sleep)
+				spin_lock_irqsave(&gpio_lock, flags);
 
 			if (!dir)
 				set_bit(FLAG_IS_OUT, &desc->flags);
-- 
2.1.4

