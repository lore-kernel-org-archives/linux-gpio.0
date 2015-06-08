From: Daniel Lockyer <thisisdaniellockyer@gmail.com>
Subject: [PATCH] GPIO: Fix checkpatch.pl issues
Date: Mon, 8 Jun 2015 20:03:05 +0100
Message-ID: <20150608190305.GA11525@eve.soton.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35658 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752408AbbFHTDH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 15:03:07 -0400
Received: by wiga1 with SMTP id a1so96450826wig.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2015 12:03:06 -0700 (PDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org

Fixed issues include indenting and spacing. Nothing particularly
notable.

Signed-off-by: Daniel Lockyer <thisisdaniellockyer@gmail.com>
---
 drivers/gpio/gpio-altera.c      |  3 ++-
 drivers/gpio/gpio-crystalcove.c |  3 +--
 drivers/gpio/gpio-f7188x.c      |  4 ++--
 drivers/gpio/gpio-it8761e.c     |  2 +-
 drivers/gpio/gpiolib.c          | 19 ++++++++-----------
 5 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 449fb46..0f3d336 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -107,7 +107,8 @@ static int altera_gpio_irq_set_type(struct irq_data *d,
 	return -EINVAL;
 }
 
-static unsigned int altera_gpio_irq_startup(struct irq_data *d) {
+static unsigned int altera_gpio_irq_startup(struct irq_data *d)
+{
 	altera_gpio_irq_unmask(d);
 
 	return 0;
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 91a7ffe..326f27b 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -94,9 +94,8 @@ static inline int to_reg(int gpio, enum ctrl_register reg_type)
 {
 	int reg;
 
-	if (gpio == 94) {
+	if (gpio == 94)
 		return GPIOPANELCTL;
-	}
 
 	if (reg_type == CTRL_IN) {
 		if (gpio < 8)
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index dbda843..5e3c4fa 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -172,7 +172,7 @@ static struct f7188x_gpio_bank f71869a_gpio_bank[] = {
 };
 
 static struct f7188x_gpio_bank f71882_gpio_bank[] = {
-	F7188X_GPIO_BANK(0 , 8, 0xF0),
+	F7188X_GPIO_BANK(0, 8, 0xF0),
 	F7188X_GPIO_BANK(10, 8, 0xE0),
 	F7188X_GPIO_BANK(20, 8, 0xD0),
 	F7188X_GPIO_BANK(30, 4, 0xC0),
@@ -180,7 +180,7 @@ static struct f7188x_gpio_bank f71882_gpio_bank[] = {
 };
 
 static struct f7188x_gpio_bank f71889_gpio_bank[] = {
-	F7188X_GPIO_BANK(0 , 7, 0xF0),
+	F7188X_GPIO_BANK(0, 7, 0xF0),
 	F7188X_GPIO_BANK(10, 7, 0xE0),
 	F7188X_GPIO_BANK(20, 8, 0xD0),
 	F7188X_GPIO_BANK(30, 8, 0xC0),
diff --git a/drivers/gpio/gpio-it8761e.c b/drivers/gpio/gpio-it8761e.c
index dadfc24..30a8f24 100644
--- a/drivers/gpio/gpio-it8761e.c
+++ b/drivers/gpio/gpio-it8761e.c
@@ -123,7 +123,7 @@ static void it8761e_gpio_set(struct gpio_chip *gc,
 
 	curr_vals = inb(reg);
 	if (val)
-		outb(curr_vals | (1 << bit) , reg);
+		outb(curr_vals | (1 << bit), reg);
 	else
 		outb(curr_vals & ~(1 << bit), reg);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6bc612b..f2cab60 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1300,9 +1300,8 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
 				continue;
 			}
 			/* set outputs if the corresponding mask bit is set */
-			if (__test_and_clear_bit(i, mask)) {
-				chip->set(chip, i, test_bit(i, bits));
-			}
+			if (__test_and_clear_bit(i, mask))
+				chip->set(chip, i, test_bit(i, bits));}
 		}
 	}
 }
@@ -1320,9 +1319,9 @@ static void gpiod_set_array_priv(bool raw, bool can_sleep,
 		unsigned long bits[BITS_TO_LONGS(chip->ngpio)];
 		int count = 0;
 
-		if (!can_sleep) {
+		if (!can_sleep)
 			WARN_ON(chip->can_sleep);
-		}
+
 		memset(mask, 0, sizeof(mask));
 		do {
 			struct gpio_desc *desc = desc_array[i];
@@ -1337,24 +1336,22 @@ static void gpiod_set_array_priv(bool raw, bool can_sleep,
 			 * open drain and open source outputs are set individually
 			 */
 			if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
-				_gpio_set_open_drain_value(desc,value);
+				_gpio_set_open_drain_value(desc, value);
 			} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
 				_gpio_set_open_source_value(desc, value);
 			} else {
 				__set_bit(hwgpio, mask);
-				if (value) {
+				if (value)
 					__set_bit(hwgpio, bits);
-				} else {
+				else
 					__clear_bit(hwgpio, bits);
-				}
 				count++;
 			}
 			i++;
 		} while ((i < array_size) && (desc_array[i]->chip == chip));
 		/* push collected bits to outputs */
-		if (count != 0) {
+		if (count != 0)
 			gpio_chip_set_multiple(chip, mask, bits);
-		}
 	}
 }
 
-- 
2.4.2

