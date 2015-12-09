From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 091/182] pinctrl: baytrail: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:30:28 +0100
Message-ID: <1449667828-1881-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33324 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754356AbbLINad (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:30:33 -0500
Received: by lbbkw15 with SMTP id kw15so30010582lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:30:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index bb92f8ae6b33..9d2fcc869f30 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 #include <linux/bitops.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
@@ -147,12 +147,10 @@ struct byt_gpio {
 	struct byt_gpio_pin_context	*saved_context;
 };
 
-#define to_byt_gpio(c)	container_of(c, struct byt_gpio, chip)
-
 static void __iomem *byt_gpio_reg(struct gpio_chip *chip, unsigned offset,
 				 int reg)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	u32 reg_offset;
 
 	if (reg == BYT_INT_STAT_REG)
@@ -193,7 +191,7 @@ static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned offset)
 
 static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_CONF0_REG);
 	u32 value, gpio_mux;
 	unsigned long flags;
@@ -229,7 +227,7 @@ static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void byt_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 
 	byt_gpio_clear_triggering(vg, offset);
 	pm_runtime_put(&vg->pdev->dev);
@@ -237,7 +235,7 @@ static void byt_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static int byt_irq_type(struct irq_data *d, unsigned type)
 {
-	struct byt_gpio *vg = to_byt_gpio(irq_data_get_irq_chip_data(d));
+	struct byt_gpio *vg = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	u32 offset = irqd_to_hwirq(d);
 	u32 value;
 	unsigned long flags;
@@ -273,7 +271,7 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
 
@@ -286,7 +284,7 @@ static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 old_val;
@@ -305,7 +303,7 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 value;
@@ -324,7 +322,7 @@ static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int byt_gpio_direction_output(struct gpio_chip *chip,
 				     unsigned gpio, int value)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	void __iomem *conf_reg = byt_gpio_reg(chip, gpio, BYT_CONF0_REG);
 	void __iomem *reg = byt_gpio_reg(chip, gpio, BYT_VAL_REG);
 	unsigned long flags;
@@ -356,7 +354,7 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 
 static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct byt_gpio *vg = to_byt_gpio(chip);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	int i;
 	u32 conf0, val, offs;
 
@@ -428,7 +426,7 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 static void byt_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct byt_gpio *vg = to_byt_gpio(irq_desc_get_handler_data(desc));
+	struct byt_gpio *vg = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, pin;
 	void __iomem *reg;
@@ -450,7 +448,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 static void byt_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = to_byt_gpio(gc);
+	struct byt_gpio *vg = gpiochip_get_data(gc);
 	unsigned offset = irqd_to_hwirq(d);
 	void __iomem *reg;
 
@@ -463,7 +461,7 @@ static void byt_irq_ack(struct irq_data *d)
 static void byt_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = to_byt_gpio(gc);
+	struct byt_gpio *vg = gpiochip_get_data(gc);
 	unsigned offset = irqd_to_hwirq(d);
 	unsigned long flags;
 	void __iomem *reg;
@@ -498,7 +496,7 @@ static void byt_irq_unmask(struct irq_data *d)
 static void byt_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = to_byt_gpio(gc);
+	struct byt_gpio *vg = gpiochip_get_data(gc);
 
 	byt_gpio_clear_triggering(vg, irqd_to_hwirq(d));
 }
@@ -605,7 +603,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
 				       sizeof(*vg->saved_context), GFP_KERNEL);
 #endif
 
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, vg);
 	if (ret) {
 		dev_err(&pdev->dev, "failed adding byt-gpio chip\n");
 		return ret;
-- 
2.4.3

