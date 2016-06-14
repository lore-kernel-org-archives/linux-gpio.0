From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/5] gpio: of: remove of_gpiochip_and_xlate() and struct gg_data
Date: Tue, 14 Jun 2016 19:07:06 +0900
Message-ID: <1465898827-2229-5-git-send-email-yamada.masahiro@socionext.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The usage of gpiochip_find(&gg_data, of_gpiochip_and_xlate) is odd.

Usually gpiochip_find() is used to find a gpio_chip.  Here, however,
the return value from gpiochip_find() is just discarded.  Instead,
gpiochip_find(&gg_data, of_gpiochip_and_xlate) is called for the
side-effect of the match function.

The match function, of_gpiochip_find_and_xlate(), fills the given
struct gg_data, but a match function should be simply called to
judge the matching.

This commit fixes this distortion and makes the code more readable.
Remove of_gpiochip_find_and_xlate() and struct gg_data.  Instead,
this adds a very simple helper function of_find_gpiochip_by_node().
Now, of_get_named_gpiod_flags() is implemented more straight-forward.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib-of.c | 81 ++++++++++++++++++++---------------------------
 1 file changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a5a5bc7..d5e19f6 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -27,38 +27,14 @@
 
 #include "gpiolib.h"
 
-/* Private data structure for of_gpiochip_find_and_xlate */
-struct gg_data {
-	enum of_gpio_flags *flags;
-	struct of_phandle_args gpiospec;
-
-	struct gpio_desc *out_gpio;
-};
-
-/* Private function for resolving node pointer to gpio_chip */
-static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
+static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
 {
-	struct gg_data *gg_data = data;
-	int ret;
-
-	if ((gc->of_node != gg_data->gpiospec.np) ||
-	    (gc->of_gpio_n_cells != gg_data->gpiospec.args_count) ||
-	    (!gc->of_xlate))
-		return false;
+	return chip->gpiodev->dev.of_node == data;
+}
 
-	ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
-	if (ret < 0) {
-		/* We've found a gpio chip, but the translation failed.
-		 * Store translation error in out_gpio.
-		 * Return false to keep looking, as more than one gpio chip
-		 * could be registered per of-node.
-		 */
-		gg_data->out_gpio = ERR_PTR(ret);
-		return false;
-	 }
-
-	gg_data->out_gpio = gpiochip_get_desc(gc, ret);
-	return true;
+static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
+{
+	return gpiochip_find(np, of_gpiochip_match_node);
 }
 
 /**
@@ -75,34 +51,47 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
 struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		     const char *propname, int index, enum of_gpio_flags *flags)
 {
-	/* Return -EPROBE_DEFER to support probe() functions to be called
-	 * later when the GPIO actually becomes available
-	 */
-	struct gg_data gg_data = {
-		.flags = flags,
-		.out_gpio = ERR_PTR(-EPROBE_DEFER)
-	};
+	struct of_phandle_args gpiospec;
+	struct gpio_chip *chip;
+	struct gpio_desc *desc;
 	int ret;
 
-	/* .of_xlate might decide to not fill in the flags, so clear it. */
-	if (flags)
-		*flags = 0;
-
 	ret = of_parse_phandle_with_args(np, propname, "#gpio-cells", index,
-					 &gg_data.gpiospec);
+					 &gpiospec);
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%s[%d]'\n",
 			__func__, propname, np->full_name, index);
 		return ERR_PTR(ret);
 	}
 
-	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
+	chip = of_find_gpiochip_by_node(gpiospec.np);
+	if (!chip) {
+		desc = ERR_PTR(-EPROBE_DEFER);
+		goto out;
+	}
+	if (chip->of_gpio_n_cells != gpiospec.args_count) {
+		desc = ERR_PTR(-EINVAL);
+		goto out;
+	}
+
+	ret = chip->of_xlate(chip, &gpiospec, flags);
+	if (ret < 0) {
+		desc = ERR_PTR(ret);
+		goto out;
+	}
+
+	desc = gpiochip_get_desc(chip, ret);
+	if (IS_ERR(desc))
+		goto out;
 
-	of_node_put(gg_data.gpiospec.np);
 	pr_debug("%s: parsed '%s' property of node '%s[%d]' - status (%d)\n",
 		 __func__, propname, np->full_name, index,
-		 PTR_ERR_OR_ZERO(gg_data.out_gpio));
-	return gg_data.out_gpio;
+		 PTR_ERR_OR_ZERO(desc));
+
+out:
+	of_node_put(gpiospec.np);
+
+	return desc;
 }
 
 int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
-- 
1.9.1
