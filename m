From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 044/182] gpio: mvebu: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:52 +0100
Message-ID: <1449667132-31834-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35269 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINS5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:57 -0500
Received: by lbpu9 with SMTP id u9so29602944lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:55 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 6acedf4e9b1c..a5eacc1dff09 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -187,8 +187,7 @@ static void __iomem *mvebu_gpioreg_level_mask(struct mvebu_gpio_chip *mvchip)
 
 static void mvebu_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 u;
 
@@ -204,8 +203,7 @@ static void mvebu_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 
 static int mvebu_gpio_get(struct gpio_chip *chip, unsigned pin)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	u32 u;
 
 	if (readl_relaxed(mvebu_gpioreg_io_conf(mvchip)) & (1 << pin)) {
@@ -220,8 +218,7 @@ static int mvebu_gpio_get(struct gpio_chip *chip, unsigned pin)
 
 static void mvebu_gpio_blink(struct gpio_chip *chip, unsigned pin, int value)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 u;
 
@@ -237,8 +234,7 @@ static void mvebu_gpio_blink(struct gpio_chip *chip, unsigned pin, int value)
 
 static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
 	int ret;
 	u32 u;
@@ -261,8 +257,7 @@ static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned pin,
 				       int value)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	unsigned long flags;
 	int ret;
 	u32 u;
@@ -287,8 +282,7 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned pin,
 
 static int mvebu_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	return irq_create_mapping(mvchip->domain, pin);
 }
 
@@ -494,8 +488,7 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 
 static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct mvebu_gpio_chip *mvchip =
-		container_of(chip, struct mvebu_gpio_chip, chip);
+	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
 	int i;
 
@@ -763,7 +756,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		BUG();
 	}
 
-	gpiochip_add(&mvchip->chip);
+	gpiochip_add_data(&mvchip->chip, mvchip);
 
 	/* Some gpio controllers do not provide irq support */
 	if (!of_irq_count(np))
-- 
2.4.3

