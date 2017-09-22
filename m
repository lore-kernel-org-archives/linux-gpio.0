From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] gpio: pxa: Use library functions
Date: Fri, 22 Sep 2017 11:22:43 +0200
Message-ID: <20170922092243.7546-4-linus.walleij@linaro.org>
References: <20170922092243.7546-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:50028 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751809AbdIVJW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 05:22:57 -0400
Received: by mail-lf0-f41.google.com with SMTP id r17so557221lff.6
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 02:22:56 -0700 (PDT)
In-Reply-To: <20170922092243.7546-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

These request/free functions are just reimplementations of the
standard helpers in gpiolib. Delete them and replace with the
helpers.

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index da68d6cbc1e4..f480fb896963 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -330,16 +330,6 @@ static int pxa_gpio_of_xlate(struct gpio_chip *gc,
 }
 #endif
 
-static int pxa_gpio_request(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_request(chip->base + offset);
-}
-
-static void pxa_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	pinctrl_gpio_free(chip->base + offset);
-}
-
 static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 			      struct device_node *np, void __iomem *regbase)
 {
@@ -358,8 +348,8 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 	pchip->chip.set = pxa_gpio_set;
 	pchip->chip.to_irq = pxa_gpio_to_irq;
 	pchip->chip.ngpio = ngpio;
-	pchip->chip.request = pxa_gpio_request;
-	pchip->chip.free = pxa_gpio_free;
+	pchip->chip.request = gpiochip_generic_request;
+	pchip->chip.free = gpiochip_generic_free;
 #ifdef CONFIG_OF_GPIO
 	pchip->chip.of_node = np;
 	pchip->chip.of_xlate = pxa_gpio_of_xlate;
-- 
2.13.5

