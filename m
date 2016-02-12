From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: sirf/atlas7: stop poking around in GPIO internals
Date: Fri, 12 Feb 2016 09:31:13 +0100
Message-ID: <1455265873-21534-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34377 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750816AbcBLIbZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2016 03:31:25 -0500
Received: by mail-lf0-f52.google.com with SMTP id j78so47180562lfb.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2016 00:31:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, Barry Song <Baohua.Song@csr.com>, Barry Song <baohua@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Guoying Zhang <Guoying.Zhang@csr.com>, Wei Chen <Wei.Chen@csr.com>

This code is poking around in the gpio_chip:s internal structures
to achieve some kind of pin to GPIO mappings.

- It is wrong to poke around in these structs and the pinctrl
  maintainer was stupid to let it pass unnoticed, mea culpa.

- The right interface to use is gpiochip_add_pin_range()

- The code appears unused: the pin control part of the driver
  is not adding any ranges, so we're iterating over an empty
  list. Maybe it is poking around in some other pin controllers
  GPIO ranges, and that's just totally wrong, again use
  gpiochip_add_pin_range() and specify the right pin
  controller.

Cc: Barry Song <baohua@kernel.org>
Cc: Guoying Zhang <Guoying.Zhang@csr.com>
Cc: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SiRF maintainers: look at this immediately and explain what is
going on.
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index beb024c31a5d..3d233fc3448a 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -338,7 +338,6 @@ struct atlas7_pinctrl_data {
 #define ATLAS7_GPIO_CTL_DATAIN_MASK		BIT(7)
 
 struct atlas7_gpio_bank {
-	struct pinctrl_dev *pctldev;
 	int id;
 	int irq;
 	void __iomem *base;
@@ -6070,7 +6069,6 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 	}
 
 	for (idx = 0; idx < nbank; idx++) {
-		struct gpio_pin_range *pin_range;
 		struct atlas7_gpio_bank *bank;
 
 		bank = &a7gc->banks[idx];
@@ -6088,22 +6086,6 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 
 		gpiochip_set_chained_irqchip(chip, &atlas7_gpio_irq_chip,
 					bank->irq, atlas7_gpio_handle_irq);
-
-		/* Records gpio_pin_range to a7gc */
-		list_for_each_entry(pin_range, &chip->pin_ranges, node) {
-			struct pinctrl_gpio_range *range;
-
-			range = &pin_range->range;
-			if (range->id == NGPIO_OF_BANK * idx) {
-				bank->gpio_offset = range->id;
-				bank->ngpio = range->npins;
-				bank->gpio_pins = range->pins;
-				bank->pctldev = pin_range->pctldev;
-				break;
-			}
-		}
-
-		BUG_ON(!bank->pctldev);
 	}
 
 	platform_set_drvdata(pdev, a7gc);
-- 
2.4.3

