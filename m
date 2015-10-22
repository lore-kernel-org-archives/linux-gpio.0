From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/6] gpio: refer to gpio device in prints and debugfs
Date: Thu, 22 Oct 2015 10:32:26 +0200
Message-ID: <1445502750-22672-3-git-send-email-linus.walleij@linaro.org>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35237 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756737AbbJVIcy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 04:32:54 -0400
Received: by lfbn126 with SMTP id n126so5100715lfb.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 01:32:52 -0700 (PDT)
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

We use the new struct device inside gpio_chip to related debug
prints and warnings, and we also add it to the debugfs dump.

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 25 ++++++++++++++-----------
 drivers/gpio/gpiolib.h | 12 ++++++------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0ab4f75b7f8e..7861791657b5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -208,7 +208,7 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	if (pos != &gpio_chips && pos->prev != &gpio_chips) {
 		_chip = list_entry(pos->prev, struct gpio_chip, list);
 		if (_chip->base + _chip->ngpio > chip->base) {
-			dev_err(chip->dev,
+			dev_err(&chip->device,
 			       "GPIO integer space overlap, cannot add chip\n");
 			err = -EBUSY;
 		}
@@ -270,7 +270,7 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 
 		gpio = gpio_name_to_desc(gc->names[i]);
 		if (gpio)
-			dev_warn(gc->dev, "Detected name collision for "
+			dev_warn(&gc->device, "Detected name collision for "
 				 "GPIO name '%s'\n",
 				 gc->names[i]);
 	}
@@ -456,7 +456,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (requested)
-		dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
+		dev_crit(&chip->device,
+			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
 	device_del(&chip->device);
 	ida_simple_remove(&gpio_ida, chip->id);
@@ -2534,14 +2535,16 @@ static void gpiolib_seq_stop(struct seq_file *s, void *v)
 static int gpiolib_seq_show(struct seq_file *s, void *v)
 {
 	struct gpio_chip *chip = v;
-	struct device *dev;
-
-	seq_printf(s, "%sGPIOs %d-%d", (char *)s->private,
-			chip->base, chip->base + chip->ngpio - 1);
-	dev = chip->dev;
-	if (dev)
-		seq_printf(s, ", %s/%s", dev->bus ? dev->bus->name : "no-bus",
-			dev_name(dev));
+	struct device *parent;
+
+	seq_printf(s, "%s%s: GPIOs %d-%d", (char *)s->private,
+		   dev_name(&chip->device),
+		   chip->base, chip->base + chip->ngpio - 1);
+	parent = chip->dev;
+	if (parent)
+		seq_printf(s, ", parent: %s/%s",
+			   parent->bus ? parent->bus->name : "no-bus",
+			   dev_name(parent));
 	if (chip->label)
 		seq_printf(s, ", %s", chip->label);
 	if (chip->can_sleep)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 78e634d1c719..be29037e56b9 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -132,17 +132,17 @@ static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 /* With chip prefix */
 
 #define chip_emerg(chip, fmt, ...)					\
-	pr_emerg("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_emerg(&chip->device, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_crit(chip, fmt, ...)					\
-	pr_crit("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_crit(&chip->device, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_err(chip, fmt, ...)					\
-	pr_err("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_err(&chip->device, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_warn(chip, fmt, ...)					\
-	pr_warn("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_warn(&chip->device, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_info(chip, fmt, ...)					\
-	pr_info("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_info(&chip->device, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 #define chip_dbg(chip, fmt, ...)					\
-	pr_debug("GPIO chip %s: " fmt, chip->label, ##__VA_ARGS__)
+	dev_dbg(&chip->device, "(%s): " fmt, chip->label, ##__VA_ARGS__)
 
 #ifdef CONFIG_GPIO_SYSFS
 
-- 
2.4.3

