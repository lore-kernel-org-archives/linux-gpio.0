From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 3/5] gpio: ks8695: remove irq_to_gpio function
Date: Tue, 16 Feb 2016 16:40:36 +0100
Message-ID: <1455637261-2920972-3-git-send-email-arnd@arndb.de>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
 <1455637261-2920972-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:62246 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932067AbcBPPlu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 10:41:50 -0500
In-Reply-To: <1455637261-2920972-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org

The ks8695 gpio driver has its own copy of the irq_to_gpio()
function. This is completely unused in the mainline kernel
after we converted all remaining users several years ago,
so we can remove the definition as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-ks8695.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
index 9f86ed9c753b..179723d02f55 100644
--- a/drivers/gpio/gpio-ks8695.c
+++ b/drivers/gpio/gpio-ks8695.c
@@ -205,18 +205,6 @@ static int ks8695_gpio_to_irq(struct gpio_chip *gc, unsigned int pin)
 	return gpio_irq[pin];
 }
 
-/*
- * Map IRQ number to GPIO line.
- */
-int irq_to_gpio(unsigned int irq)
-{
-	if ((irq < KS8695_IRQ_EXTERN0) || (irq > KS8695_IRQ_EXTERN3))
-		return -EINVAL;
-
-	return (irq - KS8695_IRQ_EXTERN0);
-}
-EXPORT_SYMBOL(irq_to_gpio);
-
 /* GPIOLIB interface */
 
 static struct gpio_chip ks8695_gpio_chip = {
-- 
2.7.0

