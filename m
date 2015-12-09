From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 084/182] gpio: xlp: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:28:59 +0100
Message-ID: <1449667739-1455-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34868 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLIN3E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:29:04 -0500
Received: by lfdl133 with SMTP id l133so34054281lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:29:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kamlakant Patel <kamlakant.patel@broadcom.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xlp.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 3f31aac2ba3c..aa5813d2deb1 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -100,11 +100,6 @@ struct xlp_gpio_priv {
 	spinlock_t lock;
 };
 
-static struct xlp_gpio_priv *gpio_chip_to_xlp_priv(struct gpio_chip *gc)
-{
-	return container_of(gc, struct xlp_gpio_priv, chip);
-}
-
 static int xlp_gpio_get_reg(void __iomem *addr, unsigned gpio)
 {
 	u32 pos, regset;
@@ -133,7 +128,7 @@ static void xlp_gpio_set_reg(void __iomem *addr, unsigned gpio, int state)
 static void xlp_gpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
@@ -145,7 +140,7 @@ static void xlp_gpio_irq_disable(struct irq_data *d)
 static void xlp_gpio_irq_mask_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
@@ -158,7 +153,7 @@ static void xlp_gpio_irq_mask_ack(struct irq_data *d)
 static void xlp_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
@@ -170,7 +165,7 @@ static void xlp_gpio_irq_unmask(struct irq_data *d)
 static int xlp_gpio_set_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 	int pol, irq_type;
 
 	switch (type) {
@@ -235,7 +230,7 @@ static void xlp_gpio_generic_handler(struct irq_desc *desc)
 
 static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
 {
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
 	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x1);
@@ -245,7 +240,7 @@ static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
 
 static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
 {
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
 	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x0);
@@ -255,7 +250,7 @@ static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
 
 static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 {
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
 	BUG_ON(gpio >= gc->ngpio);
 	return xlp_gpio_get_reg(priv->gpio_paddrv, gpio);
@@ -263,7 +258,7 @@ static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 
 static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
 {
-	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
 	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_paddrv, gpio, state);
@@ -388,7 +383,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	err = gpiochip_add(gc);
+	err = gpiochip_add_data(gc, priv);
 	if (err < 0)
 		goto out_free_desc;
 
-- 
2.4.3

