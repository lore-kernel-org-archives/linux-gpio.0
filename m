From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 3/6] gpiolib-of: Reuse 'line-name' from DT as gpio descriptor name
Date: Tue,  4 Aug 2015 11:23:20 +0200
Message-ID: <1438680203-13432-4-git-send-email-mpa@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:44963 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932395AbbHDJYS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 05:24:18 -0400
In-Reply-To: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

The DT describes gpios with subnodes. These subnodes can contain a
property 'line-name'. This information can be useful in other areas
where we want to identify a GPIO by its name.

This patch stores the line-name in the gpio descriptor.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 41a4945b346e..fbf449a4120b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -184,11 +184,6 @@ static struct gpio_desc *of_parse_gpio(struct device_node *np,
 		*dflags |= GPIOD_OUT_LOW;
 	else if (of_property_read_bool(np, "output-high"))
 		*dflags |= GPIOD_OUT_HIGH;
-	else {
-		pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
-			desc_to_gpio(gg_data.out_gpio), np->name);
-		return ERR_PTR(-EINVAL);
-	}
 
 	if (name && of_property_read_string(np, "line-name", name))
 		*name = np->name;
@@ -214,15 +209,29 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	enum gpiod_flags dflags;
 
 	for_each_child_of_node(chip->of_node, np) {
-		if (!of_property_read_bool(np, "gpio-hog"))
-			continue;
+		struct gpio_desc *name_desc;
 
 		desc = of_parse_gpio(np, &name, &lflags, &dflags);
 		if (IS_ERR(desc))
 			continue;
 
-		if (gpiod_hog(desc, name, lflags, dflags))
-			continue;
+		name_desc = gpio_name_to_desc(name);
+		if (name_desc)
+			pr_warn("GPIO name collision for '%s' detected at GPIO line %d (%s)\n",
+				name, desc_to_gpio(desc), np->name);
+		else
+			desc->name = name;
+
+		if (of_property_read_bool(np, "gpio-hog")) {
+			if (!dflags) {
+				pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
+					desc_to_gpio(desc), np->name);
+				continue;
+			}
+
+			if (gpiod_hog(desc, name, lflags, dflags))
+				continue;
+		}
 	}
 }
 
-- 
2.1.4

