From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 097/182] pinctrl: abx500: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:14 +0100
Message-ID: <1449667874-2245-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36075 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754518AbbLINbS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:18 -0500
Received: by lfs39 with SMTP id 39so34427815lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 434d5de0177b..085e60106ec2 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -109,19 +109,10 @@ struct abx500_pinctrl {
 	int irq_cluster_size;
 };
 
-/**
- * to_abx500_pinctrl() - get the pointer to abx500_pinctrl
- * @chip:	Member of the structure abx500_pinctrl
- */
-static inline struct abx500_pinctrl *to_abx500_pinctrl(struct gpio_chip *chip)
-{
-	return container_of(chip, struct abx500_pinctrl, chip);
-}
-
 static int abx500_gpio_get_bit(struct gpio_chip *chip, u8 reg,
 			       unsigned offset, bool *bit)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	u8 pos = offset % 8;
 	u8 val;
 	int ret;
@@ -143,7 +134,7 @@ static int abx500_gpio_get_bit(struct gpio_chip *chip, u8 reg,
 static int abx500_gpio_set_bits(struct gpio_chip *chip, u8 reg,
 				unsigned offset, int val)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	u8 pos = offset % 8;
 	int ret;
 
@@ -164,7 +155,7 @@ static int abx500_gpio_set_bits(struct gpio_chip *chip, u8 reg,
  */
 static int abx500_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	bool bit;
 	bool is_out;
 	u8 gpio_offset = offset - 1;
@@ -192,7 +183,7 @@ out:
 
 static void abx500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	int ret;
 
 	ret = abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
@@ -272,7 +263,7 @@ out:
 
 static bool abx500_pullud_supported(struct gpio_chip *chip, unsigned gpio)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	struct pullud *pullud = pct->soc->pullud;
 
 	return (pullud &&
@@ -284,7 +275,7 @@ static int abx500_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset,
 					int val)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	unsigned gpio;
 	int ret;
 
@@ -332,7 +323,7 @@ static int abx500_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int abx500_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	/* The AB8500 GPIO numbers are off by one */
 	int gpio = offset + 1;
 	int hwirq;
@@ -634,7 +625,7 @@ static void abx500_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	unsigned i;
 	unsigned gpio = chip->base;
-	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
+	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
 	struct pinctrl_dev *pctldev = pct->pctldev;
 
 	for (i = 0; i < chip->ngpio; i++, gpio++) {
@@ -1211,7 +1202,7 @@ static int abx500_gpio_probe(struct platform_device *pdev)
 	pct->irq_cluster = pct->soc->gpio_irq_cluster;
 	pct->irq_cluster_size = pct->soc->ngpio_irq_cluster;
 
-	ret = gpiochip_add(&pct->chip);
+	ret = gpiochip_add_data(&pct->chip, pct);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
 		return ret;
-- 
2.4.3

