From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: use static container helper
Date: Thu, 27 Aug 2015 14:06:22 +0200
Message-ID: <1440677182-6779-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33435 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752028AbbH0MG2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 08:06:28 -0400
Received: by labns7 with SMTP id ns7so10980683lab.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 05:06:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

There is a helper function to do the container_of() magic for
the tc3589x GPIO, so use it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 31b244cffabb..d1d585ddb9ab 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -102,7 +102,7 @@ static struct gpio_chip template_chip = {
 static int tc3589x_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = container_of(gc, struct tc3589x_gpio, chip);
+	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -130,7 +130,7 @@ static int tc3589x_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 static void tc3589x_gpio_irq_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = container_of(gc, struct tc3589x_gpio, chip);
+	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
 
 	mutex_lock(&tc3589x_gpio->irq_lock);
 }
@@ -138,7 +138,7 @@ static void tc3589x_gpio_irq_lock(struct irq_data *d)
 static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = container_of(gc, struct tc3589x_gpio, chip);
+	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	static const u8 regmap[] = {
 		[REG_IBE]	= TC3589x_GPIOIBE0,
@@ -167,7 +167,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 static void tc3589x_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = container_of(gc, struct tc3589x_gpio, chip);
+	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -178,7 +178,7 @@ static void tc3589x_gpio_irq_mask(struct irq_data *d)
 static void tc3589x_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = container_of(gc, struct tc3589x_gpio, chip);
+	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
-- 
2.4.3

