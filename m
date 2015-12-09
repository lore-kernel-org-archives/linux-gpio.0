From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 073/182] gpio: tz1090-pdc: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:00 +0100
Message-ID: <1449667620-870-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34848 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942AbbLIN1F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:05 -0500
Received: by lfdl133 with SMTP id l133so34016818lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:03 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, James Hogan <james.hogan@imgtec.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tz1090-pdc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pdc.c
index a974397164b2..c182342297ac 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -49,7 +49,6 @@ struct tz1090_pdc_gpio {
 	void __iomem *reg;
 	int irq[GPIO_PDC_NIRQ];
 };
-#define to_pdc(c)	container_of(c, struct tz1090_pdc_gpio, chip)
 
 /* Register accesses into the PDC MMIO area */
 
@@ -70,7 +69,7 @@ static inline unsigned int pdc_read(struct tz1090_pdc_gpio *priv,
 static int tz1090_pdc_gpio_direction_input(struct gpio_chip *chip,
 					   unsigned int offset)
 {
-	struct tz1090_pdc_gpio *priv = to_pdc(chip);
+	struct tz1090_pdc_gpio *priv = gpiochip_get_data(chip);
 	u32 value;
 	int lstat;
 
@@ -87,7 +86,7 @@ static int tz1090_pdc_gpio_direction_output(struct gpio_chip *chip,
 					    unsigned int offset,
 					    int output_value)
 {
-	struct tz1090_pdc_gpio *priv = to_pdc(chip);
+	struct tz1090_pdc_gpio *priv = gpiochip_get_data(chip);
 	u32 value;
 	int lstat;
 
@@ -112,14 +111,14 @@ static int tz1090_pdc_gpio_direction_output(struct gpio_chip *chip,
 
 static int tz1090_pdc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct tz1090_pdc_gpio *priv = to_pdc(chip);
+	struct tz1090_pdc_gpio *priv = gpiochip_get_data(chip);
 	return pdc_read(priv, REG_SOC_GPIO_STATUS) & BIT(offset);
 }
 
 static void tz1090_pdc_gpio_set(struct gpio_chip *chip, unsigned int offset,
 				int output_value)
 {
-	struct tz1090_pdc_gpio *priv = to_pdc(chip);
+	struct tz1090_pdc_gpio *priv = gpiochip_get_data(chip);
 	u32 value;
 	int lstat;
 
@@ -139,7 +138,7 @@ static void tz1090_pdc_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 static int tz1090_pdc_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
-	struct tz1090_pdc_gpio *priv = to_pdc(chip);
+	struct tz1090_pdc_gpio *priv = gpiochip_get_data(chip);
 	unsigned int syswake = offset - GPIO_PDC_IRQ_FIRST;
 	int irq;
 
@@ -207,7 +206,7 @@ static int tz1090_pdc_gpio_probe(struct platform_device *pdev)
 		priv->irq[i] = irq_of_parse_and_map(np, i);
 
 	/* Add the GPIO bank */
-	gpiochip_add(&priv->chip);
+	gpiochip_add_data(&priv->chip, priv);
 
 	return 0;
 }
-- 
2.4.3

