From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 3/9] gpiolib: Use GPIO name from names array for gpio descriptor
Date: Fri, 14 Aug 2015 16:11:00 +0200
Message-ID: <1439561466-14350-4-git-send-email-mpa@pengutronix.de>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:52849 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755192AbbHNOMD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Aug 2015 10:12:03 -0400
In-Reply-To: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

This patch adds GPIO names to the GPIO descriptors when initializing the
gpiochip. It also introduces a check whether any of the new names will
conflict with an existing GPIO name.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eed3751fe14f..3908503bebfe 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -250,6 +250,38 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	return err;
 }
 
+/*
+ * Takes the names from gc->names and checks if they are all unique. If they
+ * are, they are assigned to their gpio descriptors.
+ *
+ * Returns -EEXIST if one of the names is already used for a different GPIO.
+ */
+static int gpiochip_set_desc_names(struct gpio_chip *gc)
+{
+	int i;
+
+	if (!gc->names)
+		return 0;
+
+	/* First check all names if they are unique */
+	for (i = 0; i != gc->ngpio; ++i) {
+		struct gpio_desc *gpio;
+
+		gpio = gpio_name_to_desc(gc->names[i]);
+		if (gpio) {
+			dev_err(gc->dev, "Detected name collision for GPIO name '%s'\n",
+				gc->names[i]);
+			return -EEXIST;
+		}
+	}
+
+	/* Then add all names to the GPIO descriptors */
+	for (i = 0; i != gc->ngpio; ++i)
+		gc->desc[i].name = gc->names[i];
+
+	return 0;
+}
+
 /**
  * gpiochip_add() - register a gpio_chip
  * @chip: the chip to register, with chip->base initialized
@@ -319,6 +351,10 @@ int gpiochip_add(struct gpio_chip *chip)
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
 
+	status = gpiochip_set_desc_names(chip);
+	if (status)
+		goto err_remove_from_list;
+
 	of_gpiochip_add(chip);
 	acpi_gpiochip_add(chip);
 
@@ -336,6 +372,7 @@ err_remove_chip:
 	acpi_gpiochip_remove(chip);
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
+err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&chip->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
-- 
2.4.6

