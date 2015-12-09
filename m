From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 034/182] gpio: max732x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:17:29 +0100
Message-ID: <1449667049-31361-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34036 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753598AbbLINRf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:17:35 -0500
Received: by lffu14 with SMTP id u14so34023749lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:17:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicholas Krause <xerofoify@gmail.com>, Marek Vasut <marex@denx.de>, Semen Protsenko <semen.protsenko@globallogic.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Nicholas Krause <xerofoify@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Semen Protsenko <semen.protsenko@globallogic.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-max732x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index a1094984b666..e6d0c8d71c2a 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -158,11 +158,6 @@ struct max732x_chip {
 #endif
 };
 
-static inline struct max732x_chip *to_max732x(struct gpio_chip *gc)
-{
-	return container_of(gc, struct max732x_chip, gpio_chip);
-}
-
 static int max732x_writeb(struct max732x_chip *chip, int group_a, uint8_t val)
 {
 	struct i2c_client *client;
@@ -201,7 +196,7 @@ static inline int is_group_a(struct max732x_chip *chip, unsigned off)
 
 static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 	uint8_t reg_val;
 	int ret;
 
@@ -215,7 +210,7 @@ static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
 				  int val)
 {
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 	uint8_t reg_out;
 	int ret;
 
@@ -259,7 +254,7 @@ static void max732x_gpio_set_multiple(struct gpio_chip *gc,
 
 static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 	unsigned int mask = 1u << off;
 
 	if ((mask & chip->dir_input) == 0) {
@@ -281,7 +276,7 @@ static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 static int max732x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 	unsigned int mask = 1u << off;
 
 	if ((mask & chip->dir_output) == 0) {
@@ -356,7 +351,7 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 static void max732x_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask_cur &= ~(1 << d->hwirq);
 }
@@ -364,7 +359,7 @@ static void max732x_irq_mask(struct irq_data *d)
 static void max732x_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask_cur |= 1 << d->hwirq;
 }
@@ -372,7 +367,7 @@ static void max732x_irq_unmask(struct irq_data *d)
 static void max732x_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->irq_lock);
 	chip->irq_mask_cur = chip->irq_mask;
@@ -381,7 +376,7 @@ static void max732x_irq_bus_lock(struct irq_data *d)
 static void max732x_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 	uint16_t new_irqs;
 	uint16_t level;
 
@@ -400,7 +395,7 @@ static void max732x_irq_bus_sync_unlock(struct irq_data *d)
 static int max732x_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct max732x_chip *chip = to_max732x(gc);
+	struct max732x_chip *chip = gpiochip_get_data(gc);
 	uint16_t off = d->hwirq;
 	uint16_t mask = 1 << off;
 
@@ -694,7 +689,7 @@ static int max732x_probe(struct i2c_client *client,
 			goto out_failed;
 	}
 
-	ret = gpiochip_add(&chip->gpio_chip);
+	ret = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (ret)
 		goto out_failed;
 
-- 
2.4.3

