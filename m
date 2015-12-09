From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 100/182] pinctrl: as3722: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:37 +0100
Message-ID: <1449667897-2450-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35096 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754327AbbLINbm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:42 -0500
Received: by lbpu9 with SMTP id u9so29817824lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Mallikarjun Kasoju <mkasoju@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 89479bea6262..e844fdc6d3a8 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -436,14 +436,9 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static inline struct as3722_pctrl_info *to_as_pci(struct gpio_chip *chip)
-{
-	return container_of(chip, struct as3722_pctrl_info, gpio_chip);
-}
-
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct as3722_pctrl_info *as_pci = to_as_pci(chip);
+	struct as3722_pctrl_info *as_pci = gpiochip_get_data(chip);
 	struct as3722 *as3722 = as_pci->as3722;
 	int ret;
 	u32 reg;
@@ -491,7 +486,7 @@ static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
-	struct as3722_pctrl_info *as_pci = to_as_pci(chip);
+	struct as3722_pctrl_info *as_pci = gpiochip_get_data(chip);
 	struct as3722 *as3722 = as_pci->as3722;
 	int en_invert;
 	u32 val;
@@ -531,7 +526,7 @@ static int as3722_gpio_direction_output(struct gpio_chip *chip,
 
 static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct as3722_pctrl_info *as_pci = to_as_pci(chip);
+	struct as3722_pctrl_info *as_pci = gpiochip_get_data(chip);
 
 	return as3722_irq_get_virq(as_pci->as3722, offset);
 }
@@ -584,7 +579,7 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->gpio_chip = as3722_gpio_chip;
 	as_pci->gpio_chip.parent = &pdev->dev;
 	as_pci->gpio_chip.of_node = pdev->dev.parent->of_node;
-	ret = gpiochip_add(&as_pci->gpio_chip);
+	ret = gpiochip_add_data(&as_pci->gpio_chip, as_pci);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register gpiochip, %d\n", ret);
 		goto fail_chip_add;
-- 
2.4.3

