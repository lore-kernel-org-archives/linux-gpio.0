From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 130/182] ARM: plat-orion: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:36:11 +0100
Message-ID: <1449668171-4014-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33974 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754630AbbLINgP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:36:15 -0500
Received: by lffu14 with SMTP id u14so34390635lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:36:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, arm@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: arm@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC people: please ACK this so I can take it with the rest of
the refactoring through the GPIO tree.
---
 arch/arm/plat-orion/gpio.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 7bd22d8e5b11..f74069386c13 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -154,8 +154,7 @@ err_out:
  */
 static int orion_gpio_request(struct gpio_chip *chip, unsigned pin)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 
 	if (orion_gpio_is_valid(ochip, pin, GPIO_INPUT_OK) ||
 	    orion_gpio_is_valid(ochip, pin, GPIO_OUTPUT_OK))
@@ -166,8 +165,7 @@ static int orion_gpio_request(struct gpio_chip *chip, unsigned pin)
 
 static int orion_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	if (!orion_gpio_is_valid(ochip, pin, GPIO_INPUT_OK))
@@ -182,8 +180,7 @@ static int orion_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 
 static int orion_gpio_get(struct gpio_chip *chip, unsigned pin)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	int val;
 
 	if (readl(GPIO_IO_CONF(ochip)) & (1 << pin)) {
@@ -198,8 +195,7 @@ static int orion_gpio_get(struct gpio_chip *chip, unsigned pin)
 static int
 orion_gpio_direction_output(struct gpio_chip *chip, unsigned pin, int value)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	if (!orion_gpio_is_valid(ochip, pin, GPIO_OUTPUT_OK))
@@ -216,8 +212,7 @@ orion_gpio_direction_output(struct gpio_chip *chip, unsigned pin, int value)
 
 static void orion_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ochip->lock, flags);
@@ -227,8 +222,7 @@ static void orion_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 
 static int orion_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 
 	return irq_create_mapping(ochip->domain,
 				  ochip->secondary_irq_base + pin);
@@ -445,8 +439,8 @@ static void gpio_irq_handler(struct irq_desc *desc)
 
 static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct orion_gpio_chip *ochip =
-		container_of(chip, struct orion_gpio_chip, chip);
+
+	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
 	int i;
 
@@ -567,7 +561,7 @@ void __init orion_gpio_init(struct device_node *np,
 	ochip->mask_offset = mask_offset;
 	ochip->secondary_irq_base = secondary_irq_base;
 
-	gpiochip_add(&ochip->chip);
+	gpiochip_add_data(&ochip->chip, ochip);
 
 	/*
 	 * Mask and clear GPIO interrupts.
-- 
2.4.3

