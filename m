From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: gpiolib: Fix error path in gpiod_set_debounce()
Date: Tue,  3 Sep 2013 17:45:08 -0300
Message-ID: <1378241108-3160-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qe0-f50.google.com ([209.85.128.50]:39299 "EHLO
	mail-qe0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760426Ab3ICUpa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2013 16:45:30 -0400
Received: by mail-qe0-f50.google.com with SMTP id a11so140989qen.23
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2013 13:45:29 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: shawn.guo@linaro.org, kernel@pengutronix.de, rogerio.pimentel@freescale.com, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

From: Fabio Estevam <fabio.estevam@freescale.com>

Commit 8fea68f49 (gpio: improve error path in gpiolib) causes the following hang
on a mx6qsabresd board:

ci_hdrc ci_hdrc.1: EHCI Host Controller
ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 2
ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
gpiod_set_debounce: missing set() or set_debounce() operations

We should not return immediately inside the 'if' block to keep the same 
behaviour prior to 8fea68f49. Also, returning immediately fails to release the 
spinlock.

Jumping to the 'fail' label makes the boot to succeed again.

Reported-by: Rogerio Pimentel <rogerio.pimentel@freescale.com>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0eb9cba..cd1dd12 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1783,7 +1783,7 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	if (!chip->set || !chip->set_debounce) {
 		pr_warn("%s: missing set() or set_debounce() operations\n",
 			__func__);
-		return -EIO;
+		goto fail;
 	}
 
 	status = gpio_ensure_requested(desc);
-- 
1.8.1.2

