From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 087/182] gpio: zynq: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:29:22 +0100
Message-ID: <1449667762-1664-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35032 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbbLIN30 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:29:26 -0500
Received: by lbpu9 with SMTP id u9so29779061lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:29:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 8a04e00bef32..3a369a40ade4 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -131,11 +131,6 @@ struct zynq_platform_data {
 static struct irq_chip zynq_gpio_level_irqchip;
 static struct irq_chip zynq_gpio_edge_irqchip;
=20
-static struct zynq_gpio *to_zynq_gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct zynq_gpio, chip);
-}
-
 /**
  * zynq_gpio_get_bank_pin - Get the bank number and pin number within =
that bank
  * for a given pin in the GPIO device
@@ -183,7 +178,7 @@ static int zynq_gpio_get_value(struct gpio_chip *ch=
ip, unsigned int pin)
 {
 	u32 data;
 	unsigned int bank_num, bank_pin_num;
-	struct zynq_gpio *gpio =3D to_zynq_gpio(chip);
+	struct zynq_gpio *gpio =3D gpiochip_get_data(chip);
=20
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
=20
@@ -207,7 +202,7 @@ static void zynq_gpio_set_value(struct gpio_chip *c=
hip, unsigned int pin,
 				int state)
 {
 	unsigned int reg_offset, bank_num, bank_pin_num;
-	struct zynq_gpio *gpio =3D to_zynq_gpio(chip);
+	struct zynq_gpio *gpio =3D gpiochip_get_data(chip);
=20
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
=20
@@ -244,7 +239,7 @@ static int zynq_gpio_dir_in(struct gpio_chip *chip,=
 unsigned int pin)
 {
 	u32 reg;
 	unsigned int bank_num, bank_pin_num;
-	struct zynq_gpio *gpio =3D to_zynq_gpio(chip);
+	struct zynq_gpio *gpio =3D gpiochip_get_data(chip);
=20
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
=20
@@ -277,7 +272,7 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip=
, unsigned int pin,
 {
 	u32 reg;
 	unsigned int bank_num, bank_pin_num;
-	struct zynq_gpio *gpio =3D to_zynq_gpio(chip);
+	struct zynq_gpio *gpio =3D gpiochip_get_data(chip);
=20
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
=20
@@ -308,7 +303,7 @@ static void zynq_gpio_irq_mask(struct irq_data *irq=
_data)
 {
 	unsigned int device_pin_num, bank_num, bank_pin_num;
 	struct zynq_gpio *gpio =3D
-		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
+		gpiochip_get_data(irq_data_get_irq_chip_data(irq_data));
=20
 	device_pin_num =3D irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
@@ -329,7 +324,7 @@ static void zynq_gpio_irq_unmask(struct irq_data *i=
rq_data)
 {
 	unsigned int device_pin_num, bank_num, bank_pin_num;
 	struct zynq_gpio *gpio =3D
-		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
+		gpiochip_get_data(irq_data_get_irq_chip_data(irq_data));
=20
 	device_pin_num =3D irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
@@ -349,7 +344,7 @@ static void zynq_gpio_irq_ack(struct irq_data *irq_=
data)
 {
 	unsigned int device_pin_num, bank_num, bank_pin_num;
 	struct zynq_gpio *gpio =3D
-		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
+		gpiochip_get_data(irq_data_get_irq_chip_data(irq_data));
=20
 	device_pin_num =3D irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
@@ -400,7 +395,7 @@ static int zynq_gpio_set_irq_type(struct irq_data *=
irq_data, unsigned int type)
 	u32 int_type, int_pol, int_any;
 	unsigned int device_pin_num, bank_num, bank_pin_num;
 	struct zynq_gpio *gpio =3D
-		to_zynq_gpio(irq_data_get_irq_chip_data(irq_data));
+		gpiochip_get_data(irq_data_get_irq_chip_data(irq_data));
=20
 	device_pin_num =3D irq_data->hwirq;
 	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
@@ -464,7 +459,7 @@ static int zynq_gpio_set_irq_type(struct irq_data *=
irq_data, unsigned int type)
 static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct zynq_gpio *gpio =3D
-		to_zynq_gpio(irq_data_get_irq_chip_data(data));
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
=20
 	irq_set_irq_wake(gpio->irq, on);
=20
@@ -530,7 +525,7 @@ static void zynq_gpio_irqhandler(struct irq_desc *d=
esc)
 	u32 int_sts, int_enb;
 	unsigned int bank_num;
 	struct zynq_gpio *gpio =3D
-		to_zynq_gpio(irq_desc_get_handler_data(desc));
+		gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
=20
 	chained_irq_enter(irqchip, desc);
@@ -721,7 +716,7 @@ static int zynq_gpio_probe(struct platform_device *=
pdev)
 	}
=20
 	/* report a bug if gpio chip registration fails */
-	ret =3D gpiochip_add(chip);
+	ret =3D gpiochip_add_data(chip, gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add gpio chip\n");
 		goto err_disable_clk;
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
