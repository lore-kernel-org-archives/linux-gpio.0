From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 122/182] pinctrl: vt8500-wmt: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:34:32 +0100
Message-ID: <1449668072-3579-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:34444 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869AbbLINeg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:34:36 -0500
Received: by lbbcs9 with SMTP id cs9so29999020lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:34:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index e9c1dfd90570..5c261bf5542f 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -488,7 +488,7 @@ static struct pinctrl_desc wmt_desc = {
 
 static int wmt_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct wmt_pinctrl_data *data = dev_get_drvdata(chip->parent);
+	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
 	u32 bit = WMT_BIT_FROM_PIN(offset);
 	u32 reg_dir = data->banks[bank].reg_dir;
@@ -503,7 +503,7 @@ static int wmt_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	struct wmt_pinctrl_data *data = dev_get_drvdata(chip->parent);
+	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
 	u32 bit = WMT_BIT_FROM_PIN(offset);
 	u32 reg_data_in = data->banks[bank].reg_data_in;
@@ -519,7 +519,7 @@ static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 			       int val)
 {
-	struct wmt_pinctrl_data *data = dev_get_drvdata(chip->parent);
+	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
 	u32 bit = WMT_BIT_FROM_PIN(offset);
 	u32 reg_data_out = data->banks[bank].reg_data_out;
@@ -589,7 +589,7 @@ int wmt_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(data->pctl_dev);
 	}
 
-	err = gpiochip_add(&data->gpio_chip);
+	err = gpiochip_add_data(&data->gpio_chip, data);
 	if (err) {
 		dev_err(&pdev->dev, "could not add GPIO chip\n");
 		goto fail_gpio;
-- 
2.4.3

