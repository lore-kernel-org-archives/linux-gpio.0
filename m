From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/6 v3] gpio: refer to gpio device in prints and debugfs
Date: Mon,  8 Feb 2016 15:32:40 +0100
Message-ID: <1454941960-25461-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:33629 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606AbcBHOct (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2016 09:32:49 -0500
Received: by mail-lb0-f177.google.com with SMTP id x4so84991433lbm.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Feb 2016 06:32:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

We use the new struct device inside gpio_chip to related debug
prints and warnings, and we also add it to the debugfs dump.

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c |  6 +++---
 drivers/gpio/gpiolib.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3a073ab5e863..4b94e31a50af 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -304,8 +304,8 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 
 		gpio = gpio_name_to_desc(gc->names[i]);
 		if (gpio)
-			dev_warn(gc->parent, "Detected name collision for "
-				 "GPIO name '%s'\n",
+			dev_warn(&gc->gpiodev->dev,
+				 "Detected name collision for GPIO name '%s'\n",
 				 gc->names[i]);
 	}
 
@@ -528,7 +528,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (requested)
-		dev_crit(chip->parent,
+		dev_crit(&chip->gpiodev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
 	/* FIXME: need to be moved to gpio_device and held there */
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index feea2c823e47..3f329c922f5b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -174,17 +174,17 @@ static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 /* With chip prefix */
 
 #define chip_emerg(chip, fmt, ...)					\
-	pr_emerg("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_emerg(&chip->gpiodev->dev, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_crit(chip, fmt, ...)					\
-	pr_crit("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_crit(&chip->gpiodev->dev, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_err(chip, fmt, ...)					\
-	pr_err("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_err(&chip->gpiodev->dev, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_warn(chip, fmt, ...)					\
-	pr_warn("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_warn(&chip->gpiodev->dev, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_info(chip, fmt, ...)					\
-	pr_info("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_info(&chip->gpiodev->dev, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_dbg(chip, fmt, ...)					\
-	pr_debug("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_dbg(&chip->gpiodev->dev, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 
 #ifdef CONFIG_GPIO_SYSFS
 
-- 
2.4.3

