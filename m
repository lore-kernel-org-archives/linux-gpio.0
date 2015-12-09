From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 174/182] serial: sc16is7xx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:50:25 +0100
Message-ID: <1449669025-6929-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33285 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbbLINu3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:50:29 -0500
Received: by lfaz4 with SMTP id z4so34652367lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:50:28 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jiri Slaby <jslaby@suse.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Greg, please ACK this so I can take it through the GPIO tree.
---
 drivers/tty/serial/sc16is7xx.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index cc86c348d809..b1eefcd80d05 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -17,7 +17,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1083,8 +1083,7 @@ static const struct uart_ops sc16is7xx_ops = {
 static int sc16is7xx_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	unsigned int val;
-	struct sc16is7xx_port *s = container_of(chip, struct sc16is7xx_port,
-						gpio);
+	struct sc16is7xx_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[0].port;
 
 	val = sc16is7xx_port_read(port, SC16IS7XX_IOSTATE_REG);
@@ -1094,8 +1093,7 @@ static int sc16is7xx_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void sc16is7xx_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct sc16is7xx_port *s = container_of(chip, struct sc16is7xx_port,
-						gpio);
+	struct sc16is7xx_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[0].port;
 
 	sc16is7xx_port_update(port, SC16IS7XX_IOSTATE_REG, BIT(offset),
@@ -1105,8 +1103,7 @@ static void sc16is7xx_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 static int sc16is7xx_gpio_direction_input(struct gpio_chip *chip,
 					  unsigned offset)
 {
-	struct sc16is7xx_port *s = container_of(chip, struct sc16is7xx_port,
-						gpio);
+	struct sc16is7xx_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[0].port;
 
 	sc16is7xx_port_update(port, SC16IS7XX_IODIR_REG, BIT(offset), 0);
@@ -1117,8 +1114,7 @@ static int sc16is7xx_gpio_direction_input(struct gpio_chip *chip,
 static int sc16is7xx_gpio_direction_output(struct gpio_chip *chip,
 					   unsigned offset, int val)
 {
-	struct sc16is7xx_port *s = container_of(chip, struct sc16is7xx_port,
-						gpio);
+	struct sc16is7xx_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[0].port;
 
 	sc16is7xx_port_update(port, SC16IS7XX_IOSTATE_REG, BIT(offset),
@@ -1189,7 +1185,7 @@ static int sc16is7xx_probe(struct device *dev,
 		s->gpio.base		 = -1;
 		s->gpio.ngpio		 = devtype->nr_gpio;
 		s->gpio.can_sleep	 = 1;
-		ret = gpiochip_add(&s->gpio);
+		ret = gpiochip_add_data(&s->gpio, s);
 		if (ret)
 			goto out_thread;
 	}
-- 
2.4.3

