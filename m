From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 2/9] gpiolib-of: Rename gpio_hog functions to be generic
Date: Fri, 17 Jul 2015 11:32:43 +0200
Message-ID: <1437125570-28623-3-git-send-email-mpa@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57809 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757356AbbGQJdd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 05:33:33 -0400
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

The gpio hogging functions are currently only used for gpio-hogging. But
these functions are widely generic ones which parse gpio device nodes in
the DT.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 60aebe4d7c26..64950591a764 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -119,17 +119,17 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
 /**
- * of_get_gpio_hog() - Get a GPIO hog descriptor, names and flags for GPIO API
+ * of_parse_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
  * @np:		device node to get GPIO from
  * @name:	GPIO line name
  * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
- *		of_get_gpio_hog()
+ *		of_parse_gpio()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
  *
  * Returns GPIO descriptor to use with Linux GPIO API, or one of the errno
  * value on the error condition.
  */
-static struct gpio_desc *of_get_gpio_hog(struct device_node *np,
+static struct gpio_desc *of_parse_gpio(struct device_node *np,
 				  const char **name,
 				  enum gpio_lookup_flags *lflags,
 				  enum gpiod_flags *dflags)
@@ -199,13 +199,13 @@ static struct gpio_desc *of_get_gpio_hog(struct device_node *np,
 }
 
 /**
- * of_gpiochip_scan_hogs - Scan gpio-controller and apply GPIO hog as requested
+ * of_gpiochip_scan_gpios - Scan gpio-controller for gpio definitions
  * @chip:	gpio chip to act on
  *
  * This is only used by of_gpiochip_add to request/set GPIO initial
  * configuration.
  */
-static void of_gpiochip_scan_hogs(struct gpio_chip *chip)
+static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 {
 	struct gpio_desc *desc = NULL;
 	struct device_node *np;
@@ -217,7 +217,7 @@ static void of_gpiochip_scan_hogs(struct gpio_chip *chip)
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-		desc = of_get_gpio_hog(np, &name, &lflags, &dflags);
+		desc = of_parse_gpio(np, &name, &lflags, &dflags);
 		if (IS_ERR(desc))
 			continue;
 
@@ -436,7 +436,7 @@ void of_gpiochip_add(struct gpio_chip *chip)
 	of_gpiochip_add_pin_range(chip);
 	of_node_get(chip->of_node);
 
-	of_gpiochip_scan_hogs(chip);
+	of_gpiochip_scan_gpios(chip);
 }
 
 void of_gpiochip_remove(struct gpio_chip *chip)
-- 
2.1.4

