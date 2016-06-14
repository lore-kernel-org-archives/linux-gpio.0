From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] gpio: of: drop needless gpio_chip look-up in of_parse_own_gpio()
Date: Tue, 14 Jun 2016 19:07:04 +0900
Message-ID: <1465898827-2229-3-git-send-email-yamada.masahiro@socionext.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:55828 "EHLO
	conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618AbcFNKGg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 06:06:36 -0400
In-Reply-To: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

This function is doing more complicated than needed.  The caller of
this function, of_gpiochip_scan_gpios() already knows the pointer to
the gpio_chip.  It can pass it to of_parse_own_gpio() instead of
looking up the gpio_chip by gpiochip_find().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib-of.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 99fc40e..27b1729 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -122,6 +122,7 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
 /**
  * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
  * @np:		device node to get GPIO from
+ * @chip:	GPIO chip whose hog is parsed
  * @name:	GPIO line name
  * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
  *		of_parse_own_gpio()
@@ -131,19 +132,19 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
  * value on the error condition.
  */
 static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
+					   struct gpio_chip *chip,
 					   const char **name,
 					   enum gpio_lookup_flags *lflags,
 					   enum gpiod_flags *dflags)
 {
 	struct device_node *chip_np;
 	enum of_gpio_flags xlate_flags;
-	struct gg_data gg_data = {
-		.flags = &xlate_flags,
-	};
+	struct of_phandle_args gpiospec;
+	struct gpio_desc *desc;
 	u32 tmp;
 	int ret;
 
-	chip_np = np->parent;
+	chip_np = chip->of_node;
 	if (!chip_np)
 		return ERR_PTR(-EINVAL);
 
@@ -155,23 +156,23 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (tmp > MAX_PHANDLE_ARGS)
+	if (tmp > MAX_PHANDLE_ARGS || tmp != chip->of_gpio_n_cells)
 		return ERR_PTR(-EINVAL);
 
-	gg_data.gpiospec.args_count = tmp;
-	gg_data.gpiospec.np = chip_np;
-	ret = of_property_read_u32_array(np, "gpios", gg_data.gpiospec.args,
-					 tmp);
+	gpiospec.np = chip_np;
+	gpiospec.args_count = tmp;
+
+	ret = of_property_read_u32_array(np, "gpios", gpiospec.args, tmp);
 	if (ret)
 		return ERR_PTR(ret);
 
-	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
-	if (!gg_data.out_gpio) {
-		if (np->parent == np)
-			return ERR_PTR(-ENXIO);
-		else
-			return ERR_PTR(-EINVAL);
-	}
+	ret = chip->of_xlate(chip, &gpiospec, &xlate_flags);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	desc = gpiochip_get_desc(chip, ret);
+	if (IS_ERR(desc))
+		return desc;
 
 	if (xlate_flags & OF_GPIO_ACTIVE_LOW)
 		*lflags |= GPIO_ACTIVE_LOW;
@@ -184,14 +185,14 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 		*dflags |= GPIOD_OUT_HIGH;
 	else {
 		pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
-			desc_to_gpio(gg_data.out_gpio), np->name);
+			desc_to_gpio(desc), np->name);
 		return ERR_PTR(-EINVAL);
 	}
 
 	if (name && of_property_read_string(np, "line-name", name))
 		*name = np->name;
 
-	return gg_data.out_gpio;
+	return desc;
 }
 
 /**
@@ -260,7 +261,7 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-		desc = of_parse_own_gpio(np, &name, &lflags, &dflags);
+		desc = of_parse_own_gpio(np, chip, &name, &lflags, &dflags);
 		if (IS_ERR(desc))
 			continue;
 
-- 
1.9.1

