From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 052/182] gpio: pxa: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:21:52 +0100
Message-ID: <1449667312-32244-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35645 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754444AbbLINV5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:21:57 -0500
Received: by lbpu9 with SMTP id u9so29653688lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:21:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <zonque@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <zonque@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index bce99182578b..1f574a9f88fe 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -153,7 +153,8 @@ static struct pxa_gpio_id pxa1928_id = {
 
 static inline void __iomem *gpio_chip_base(struct gpio_chip *c)
 {
-	return container_of(c, struct pxa_gpio_chip, chip)->regbase;
+	struct pxa_gpio_chip *p = gpiochip_get_data(c);
+	return p->regbase;
 }
 
 static inline struct pxa_gpio_chip *gpio_to_pxachip(unsigned gpio)
@@ -334,7 +335,7 @@ static int pxa_init_gpio_chip(int gpio_end,
 
 		/* number of GPIOs on last bank may be less than 32 */
 		c->ngpio = (gpio + 31 > gpio_end) ? (gpio_end - gpio + 1) : 32;
-		gpiochip_add(c);
+		gpiochip_add_data(c, &chips[i]);
 	}
 	pxa_gpio_chips = chips;
 	return 0;
-- 
2.4.3

