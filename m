From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 173/182] serial: max310x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:50:16 +0100
Message-ID: <1449669016-6882-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:33684 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbbLINuV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:50:21 -0500
Received: by lbbkw15 with SMTP id kw15so30350515lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:50:20 -0800 (PST)
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
 drivers/tty/serial/max310x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index 3f98165b479c..3f6e0ab725fe 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -17,7 +17,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -1036,7 +1036,7 @@ static SIMPLE_DEV_PM_OPS(max310x_pm_ops, max310x_suspend, max310x_resume);
 static int max310x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	unsigned int val;
-	struct max310x_port *s = container_of(chip, struct max310x_port, gpio);
+	struct max310x_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[offset / 4].port;
 
 	val = max310x_port_read(port, MAX310X_GPIODATA_REG);
@@ -1046,7 +1046,7 @@ static int max310x_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void max310x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct max310x_port *s = container_of(chip, struct max310x_port, gpio);
+	struct max310x_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[offset / 4].port;
 
 	max310x_port_update(port, MAX310X_GPIODATA_REG, 1 << (offset % 4),
@@ -1055,7 +1055,7 @@ static void max310x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int max310x_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct max310x_port *s = container_of(chip, struct max310x_port, gpio);
+	struct max310x_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[offset / 4].port;
 
 	max310x_port_update(port, MAX310X_GPIOCFG_REG, 1 << (offset % 4), 0);
@@ -1066,7 +1066,7 @@ static int max310x_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int max310x_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int value)
 {
-	struct max310x_port *s = container_of(chip, struct max310x_port, gpio);
+	struct max310x_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[offset / 4].port;
 
 	max310x_port_update(port, MAX310X_GPIODATA_REG, 1 << (offset % 4),
@@ -1183,7 +1183,7 @@ static int max310x_probe(struct device *dev, struct max310x_devtype *devtype,
 	s->gpio.base		= -1;
 	s->gpio.ngpio		= devtype->nr * 4;
 	s->gpio.can_sleep	= 1;
-	ret = gpiochip_add(&s->gpio);
+	ret = gpiochip_add_data(&s->gpio, s);
 	if (ret)
 		goto out_uart;
 #endif
-- 
2.4.3

