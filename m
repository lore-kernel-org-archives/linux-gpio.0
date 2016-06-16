From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpiolib: avoid uninitialized data in gpio kfifo
Date: Thu, 16 Jun 2016 11:02:41 +0200
Message-ID: <20160616090254.964288-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:58959 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752587AbcFPJBS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jun 2016 05:01:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

gcc reports a theoretical case for returning uninitialized data in
the kfifo when a GPIO interrupt happens and neither
GPIOEVENT_REQUEST_RISING_EDGE nor GPIOEVENT_REQUEST_FALLING_EDGE
are set:

drivers/gpio/gpiolib.c: In function 'lineevent_irq_thread':
drivers/gpio/gpiolib.c:683:87: error: 'ge.id' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This case should not happen, but to be on the safe side, let's
return from the irq handler without adding data to the FIFO
to ensure we can never leak stack data to user space.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8b3db593f356..3466e6198351 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -674,6 +674,8 @@ irqreturn_t lineevent_irq_thread(int irq, void *p)
 	} else if (le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
 		/* Emit high-to-low event */
 		ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
+	} else {
+		return IRQ_NONE;
 	}
 
 	ret = kfifo_put(&le->events, ge);
-- 
2.9.0

