From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/4] gpio: ks8695: remove irq_to_gpio function
Date: Mon, 15 Feb 2016 16:46:29 +0100
Message-ID: <1455551208-2825510-3-git-send-email-arnd@arndb.de>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <1455551208-2825510-1-git-send-email-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455551208-2825510-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

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
