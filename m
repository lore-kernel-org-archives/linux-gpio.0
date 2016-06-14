From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/5] gpio: of: factor out common code to a new helper function
Date: Tue, 14 Jun 2016 19:07:07 +0900
Message-ID: <1465898827-2229-6-git-send-email-yamada.masahiro@socionext.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:55837 "EHLO
	conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326AbcFNKGg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 06:06:36 -0400
In-Reply-To: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

The conversion from a DT spec to struct gpio_desc is common between
of_get_named_gpiod_flags() and of_parse_own_gpio().  Factor out the
common code to a new helper, of_xlate_and_get_gpiod_flags().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib-of.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d5e19f6..75e7b39 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -37,6 +37,22 @@ static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
 	return gpiochip_find(np, of_gpiochip_match_node);
 }
 
+static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
+					struct of_phandle_args *gpiospec,
+					enum of_gpio_flags *flags)
+{
+	int ret;
+
+	if (chip->of_gpio_n_cells != gpiospec->args_count)
+		return ERR_PTR(-EINVAL);
+
+	ret = chip->of_xlate(chip, gpiospec, flags);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return gpiochip_get_desc(chip, ret);
+}
+
 /**
  * of_get_named_gpiod_flags() - Get a GPIO descriptor and flags for GPIO API
  * @np:		device node to get GPIO from
@@ -69,18 +85,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		desc = ERR_PTR(-EPROBE_DEFER);
 		goto out;
 	}
-	if (chip->of_gpio_n_cells != gpiospec.args_count) {
-		desc = ERR_PTR(-EINVAL);
-		goto out;
-	}
-
-	ret = chip->of_xlate(chip, &gpiospec, flags);
-	if (ret < 0) {
-		desc = ERR_PTR(ret);
-		goto out;
-	}
 
-	desc = gpiochip_get_desc(chip, ret);
+	desc = of_xlate_and_get_gpiod_flags(chip, &gpiospec, flags);
 	if (IS_ERR(desc))
 		goto out;
 
@@ -145,9 +151,6 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (tmp != chip->of_gpio_n_cells)
-		return ERR_PTR(-EINVAL);
-
 	gpiospec.np = chip_np;
 	gpiospec.args_count = tmp;
 
@@ -155,11 +158,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = chip->of_xlate(chip, &gpiospec, &xlate_flags);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	desc = gpiochip_get_desc(chip, ret);
+	desc = of_xlate_and_get_gpiod_flags(chip, &gpiospec, &xlate_flags);
 	if (IS_ERR(desc))
 		return desc;
 
-- 
1.9.1

