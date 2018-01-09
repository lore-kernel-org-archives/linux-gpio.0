From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/4] gpio: of: Support regulator nonstandard GPIO properties
Date: Tue,  9 Jan 2018 01:24:51 +0100
Message-ID: <20180109002451.22618-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Before it was clearly established that all GPIO properties in the
device tree shall be named "foo-gpios" (with the deprecated variant
"foo-gpio" for single lines) we unfortunately merged a few bindings
for regulators with random phandle names.

As we want to switch the GPIO regulator driver to using descriptors,
we need devm_gpiod_get() to return something reasonable when looking
up these in the device tree.

Put in a special #ifdef:ed kludge to do this special lookup only
for the regulator case and gets compiled out if we're not enabling
regulators. Supply a whitelist with properties we accept.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This patch is preperatory work for converting fixed and GPIO
regulators to deal only with GPIO descriptors.
---
 drivers/gpio/gpiolib-of.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e0d59e61b52f..9686922310a4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -117,6 +117,41 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 }
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
+/*
+ * Some regulator bindings happened before we managed to establish that GPIO
+ * properties should be named "foo-gpios" so we have this special kludge for
+ * them.
+ */
+static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *con_id,
+						enum of_gpio_flags *of_flags)
+{
+	/* These are the connection IDs we accept as legacy GPIO phandles */
+	const char *whitelist[] = {
+		"wlf,ldoena", /* Arizona */
+		"wlf,ldo1ena", /* WM8994 */
+		"wlf,ldo2ena", /* WM8994 */
+	};
+	struct device_node *np = dev->of_node;
+	struct gpio_desc *desc;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id)
+		return ERR_PTR(-ENOENT);
+
+	for (i = 0; i < ARRAY_SIZE(whitelist); i++)
+		if (!strcmp(con_id, whitelist[i]))
+			break;
+
+	if (i == ARRAY_SIZE(whitelist))
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, con_id, 0, of_flags);
+	return desc;
+}
+
 struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			       unsigned int idx,
 			       enum gpio_lookup_flags *flags)
@@ -126,6 +161,7 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	struct gpio_desc *desc;
 	unsigned int i;
 
+	/* Try GPIO property "foo-gpios" and "foo-gpio" */
 	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
 		if (con_id)
 			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
@@ -140,6 +176,10 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			break;
 	}
 
+	/* Special handling for regulator GPIOs if used */
+	if (IS_ERR(desc))
+		desc = of_find_regulator_gpio(dev, con_id, &of_flags);
+
 	if (IS_ERR(desc))
 		return desc;
 
-- 
2.14.3
