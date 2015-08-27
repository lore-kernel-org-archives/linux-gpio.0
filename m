From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5] gpio: zynq: use container_of() to get state container
Date: Thu, 27 Aug 2015 16:56:57 +0200
Message-ID: <1440687417-17227-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35114 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753292AbbH0O5E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 10:57:04 -0400
Received: by lbcbn3 with SMTP id bn3so13055511lbc.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 07:57:02 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Harini Katakam <harini.katakam@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>, Ezra Savard <ezra.savard@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The state container of the Zynq GPIO driver is sometimes
extracted from the gpio_chip exploiting the fact that offsetof()
the struct gpio_chip inside the struct zynq_gpio is 0, so
the container_of() is in practice a noop. However if a member
is added to struct zynq_gpio in front of struct gpio_chip,
things will break. Using proper container_of() avoids this
problem.

Semantically this is a noop, the compiler will optimize it away,
but syntactically it makes me happier.

Also replace some explicit container_of() calls with the helper
function.

Cc: Harini Katakam <harini.katakam@xilinx.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Ezra Savard <ezra.savard@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 27348e7cb705..9ccb76451881 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -130,6 +130,12 @@ struct zynq_platform_data {
 
 static struct irq_chip zynq_gpio_level_irqchip;
 static struct irq_chip zynq_gpio_edge_irqchip;
+
+static struct zynq_gpio *to_zynq_gpio(struct gpio_chip *gc)
+{
+	return container_of(chip, struct zynq_gpio, chip);
+}
+
 /**
  * zynq_gpio_get_bank_pin - Get the bank number and pin number within that bank
  * for a given pin in the GPIO device
@@ -177,7 +183,7 @@ static int zynq_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
 {
 	u32 data;
 	unsigned int bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = container_of(chip, struct zynq_gpio, chip);
+	struct zynq_gpio *gpio = to_zynq_gpio(chip);
 
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
 
@@ -201,7 +207,7 @@ static void zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
 				int state)
 {
 	unsigned int reg_offset, bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = container_of(chip, struct zynq_gpio, chip);
+	struct zynq_gpio *gpio = to_zynq_gpio(chip);
 
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
 
@@ -238,7 +244,7 @@ static int zynq_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 {
 	u32 reg;
 	unsigned int bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = container_of(chip, struct zynq_gpio, chip);
+	struct zynq_gpio *gpio = to_zynq_gpio(chip);
 
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
 
@@ -271,7 +277,7 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
 {
 	u32 reg;
 	unsigned int bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = container_of(chip, struct zynq_gpio, chip);
+	struct zynq_gpio *gpio = to_zynq_gpio(chip);
 
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
 
@@ -301,7 +307,8 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
 static void zynq_gpio_irq_mask(struct irq_data *irq_data)
 {
 	unsigned int device_pin_num, bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(irq_data);
+	struct zynq_gpio *gpio =
+		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
 
 	device_pin_num = irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio);
@@ -321,7 +328,8 @@ static void zynq_gpio_irq_mask(struct irq_data *irq_data)
 static void zynq_gpio_irq_unmask(struct irq_data *irq_data)
 {
 	unsigned int device_pin_num, bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(irq_data);
+	struct zynq_gpio *gpio =
+		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
 
 	device_pin_num = irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio);
@@ -340,7 +348,8 @@ static void zynq_gpio_irq_unmask(struct irq_data *irq_data)
 static void zynq_gpio_irq_ack(struct irq_data *irq_data)
 {
 	unsigned int device_pin_num, bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(irq_data);
+	struct zynq_gpio *gpio =
+		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
 
 	device_pin_num = irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio);
@@ -390,7 +399,8 @@ static int zynq_gpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 {
 	u32 int_type, int_pol, int_any;
 	unsigned int device_pin_num, bank_num, bank_pin_num;
-	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(irq_data);
+	struct zynq_gpio *gpio =
+		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
 
 	device_pin_num = irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio);
@@ -453,7 +463,8 @@ static int zynq_gpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 
 static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
 {
-	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(data);
+	struct zynq_gpio *gpio =
+		to_zynq_gpio(irq_data_get_irq_chip_data(data));
 
 	irq_set_irq_wake(gpio->irq, on);
 
@@ -518,7 +529,8 @@ static void zynq_gpio_irqhandler(unsigned int irq, struct irq_desc *desc)
 {
 	u32 int_sts, int_enb;
 	unsigned int bank_num;
-	struct zynq_gpio *gpio = irq_desc_get_handler_data(desc);
+	struct zynq_gpio *gpio =
+		to_zynq_gpio(irq_desc_get_handler_data(desc));
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(irqchip, desc);
-- 
2.4.3

