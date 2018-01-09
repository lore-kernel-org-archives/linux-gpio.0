From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] gpio: of: Add special quirk to parse regulator flags
Date: Tue,  9 Jan 2018 01:32:40 +0100
Message-ID: <20180109003240.22924-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34284 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752907AbeAIAep (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jan 2018 19:34:45 -0500
Received: by mail-lf0-f66.google.com with SMTP id h140so14038814lfg.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jan 2018 16:34:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

While most GPIOs are indicated to be active low or open drain using
their twocell flags, we have legacy regulator bindings to take into
account.

Add a quirk respecting the special boolean active-high and open
drain flags when parsing regulator nodes for GPIOs.

This makes it possible to get rid of duplicated inversion semantics
handling in the regulator core and any regulator drivers parsing
and handling this separately.

Unfortunately the old regulator inversion semantics are specified
such that the presence or absence of "enable-active-high" solely
controls the semantics, so we cannot deprecate this in favor
of the phandle-provided inversion flag, instead any such phandle
inversion flag provided in the second cell of a GPIO handle must be
actively ignored, so we print a warning to contain the situation
and make things easy for the users.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 9686922310a4..37bd3e8f2b0b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -56,6 +56,42 @@ static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
 	return gpiochip_get_desc(chip, ret);
 }
 
+static void of_gpio_flags_quirks(struct device_node *np,
+				 enum of_gpio_flags *flags)
+{
+	/*
+	 * Some GPIO fixed regulator quirks.
+	 * Note that active low is the default.
+	 */
+	if (IS_ENABLED(CONFIG_REGULATOR) &&
+	    (of_device_is_compatible(np, "reg-fixed-voltage") ||
+	     of_device_is_compatible(np, "regulator-gpio"))) {
+		/*
+		 * The regulator GPIO handles are specified such that the
+		 * presence or absence of "enable-active-high" solely controls
+		 * the polarity of the GPIO line. Any phandle flags must
+		 * be actively ignored.
+		 */
+		if (*flags & OF_GPIO_ACTIVE_LOW) {
+			pr_warn("%s GPIO handle specifies active low - ignored\n",
+				of_node_full_name(np));
+			*flags &= ~OF_GPIO_ACTIVE_LOW;
+		}
+		if (!of_property_read_bool(np, "enable-active-high"))
+			*flags |= OF_GPIO_ACTIVE_LOW;
+	}
+	/*
+	 * Legacy open drain handling for fixed voltage regulators.
+	 */
+	if (IS_ENABLED(CONFIG_REGULATOR) &&
+	    of_device_is_compatible(np, "reg-fixed-voltage") &&
+	    of_property_read_bool(np, "gpio-open-drain")) {
+		*flags |= (OF_GPIO_SINGLE_ENDED | OF_GPIO_OPEN_DRAIN);
+		pr_info("%s uses legacy open drain flag - update the DTS if you can\n",
+			of_node_full_name(np));
+	}
+}
+
 /**
  * of_get_named_gpiod_flags() - Get a GPIO descriptor and flags for GPIO API
  * @np:		device node to get GPIO from
@@ -93,6 +129,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 	if (IS_ERR(desc))
 		goto out;
 
+	of_gpio_flags_quirks(np, flags);
+
 	pr_debug("%s: parsed '%s' property of node '%pOF[%d]' - status (%d)\n",
 		 __func__, propname, np, index,
 		 PTR_ERR_OR_ZERO(desc));
-- 
2.14.3

