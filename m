From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: dwapb: Call directly into the gpiochip to read value
Date: Mon, 12 Feb 2018 11:11:25 +0100
Message-ID: <20180212101125.7890-2-linus.walleij@linaro.org>
References: <20180212101125.7890-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:42951 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbeBLKLd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 05:11:33 -0500
Received: by mail-lf0-f67.google.com with SMTP id w10so6903323lfc.9
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 02:11:32 -0800 (PST)
In-Reply-To: <20180212101125.7890-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

We were going out through the (legacy) gpio API to read the value
of a line to set up polarity inversion. This is abusive. Do something
less abusive by looking up the actual struct gpio_chip *
instance and calling .get() directly on it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 677988f21369..b0704a883513 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -9,8 +9,6 @@
  */
 #include <linux/acpi.h>
 #include <linux/gpio/driver.h>
-/* FIXME: for gpio_get_value(), replace this with direct register read */
-#include <linux/gpio.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -153,16 +151,40 @@ static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	return irq_find_mapping(gpio->domain, offset);
 }
 
+static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsigned int offs)
+{
+	struct dwapb_gpio_port *port;
+	int i;
+
+	for (i = 0; i < gpio->nr_ports; i++) {
+		port = &gpio->ports[i];
+		if (port->idx == offs / 32)
+			return port;
+	}
+
+	return NULL;
+}
+
 static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 {
-	u32 v = dwapb_read(gpio, GPIO_INT_POLARITY);
+	struct dwapb_gpio_port *port = dwapb_offs_to_port(gpio, offs);
+	struct gpio_chip *gc;
+	u32 pol;
+	int val;
+
+	if (!port)
+		return;
+	gc = &port->gc;
 
-	if (gpio_get_value(gpio->ports[0].gc.base + offs))
-		v &= ~BIT(offs);
+	pol = dwapb_read(gpio, GPIO_INT_POLARITY);
+	/* Just read the current value right out of the data register */
+	val = gc->get(gc, offs % 32);
+	if (val)
+		pol &= ~BIT(offs);
 	else
-		v |= BIT(offs);
+		pol |= BIT(offs);
 
-	dwapb_write(gpio, GPIO_INT_POLARITY, v);
+	dwapb_write(gpio, GPIO_INT_POLARITY, pol);
 }
 
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
@@ -481,6 +503,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	dirout = gpio->regs + GPIO_SWPORTA_DDR +
 		(pp->idx * GPIO_SWPORT_DDR_STRIDE);
 
+	/* This registers 32 GPIO lines per port */
 	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
 			 NULL, 0);
 	if (err) {
-- 
2.14.3

