From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 112/182] pinctrl: samsung: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:12 +0100
Message-ID: <1449667992-3104-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36635 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbbLINdQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:16 -0500
Received: by lbblt2 with SMTP id lt2so30164517lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index bb4db2050f19..a4fb8379f521 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -50,11 +50,6 @@ static LIST_HEAD(drvdata_list);
 
 static unsigned int pin_base;
 
-static inline struct samsung_pin_bank *gc_to_pin_bank(struct gpio_chip *gc)
-{
-	return container_of(gc, struct samsung_pin_bank, gpio_chip);
-}
-
 static int samsung_get_group_count(struct pinctrl_dev *pctldev)
 {
 	struct samsung_pinctrl_drv_data *pmx = pinctrl_dev_get_drvdata(pctldev);
@@ -522,7 +517,7 @@ static const struct pinconf_ops samsung_pinconf_ops = {
 /* gpiolib gpio_set callback function */
 static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	const struct samsung_pin_bank_type *type = bank->type;
 	unsigned long flags;
 	void __iomem *reg;
@@ -546,7 +541,7 @@ static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
 	void __iomem *reg;
 	u32 data;
-	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	const struct samsung_pin_bank_type *type = bank->type;
 
 	reg = bank->drvdata->virt_base + bank->pctl_offset;
@@ -571,7 +566,7 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 	u32 data, mask, shift;
 	unsigned long flags;
 
-	bank = gc_to_pin_bank(gc);
+	bank = gpiochip_get_data(gc);
 	type = bank->type;
 	drvdata = bank->drvdata;
 
@@ -619,7 +614,7 @@ static int samsung_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
  */
 static int samsung_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned int virq;
 
 	if (!bank->irq_domain)
@@ -918,7 +913,7 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 		gc->of_node = bank->of_node;
 		gc->label = bank->name;
 
-		ret = gpiochip_add(gc);
+		ret = gpiochip_add_data(gc, bank);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
 							gc->label, ret);
-- 
2.4.3

