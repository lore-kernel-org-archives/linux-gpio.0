From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 2/2] pinctrl: meson: rework pinmux ops
Date: Thu, 12 Oct 2017 14:40:26 +0200
Message-ID: <20171012124026.2111-3-jbrunet@baylibre.com>
References: <20171012124026.2111-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012124026.2111-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This change prepare the introduction of new meson SoC. This new SoC will
share the same gpio/pinconf registers but the pinmux part will be
different. While the format of the data associated with each pinmux group
will change, the way to handle pinmuxing will be similar.

To deal with this new situation, the meson_pmx_struture is kept but the
data associated to it is now generic. This allows to reuse the basic
functions which would otherwise be copy/pasted in each pinmux driver
(such as getting the name a count of groups and functions) Only the
functions actually using this specific data is taken out of the common
code and is handling the SoC pinmuxing

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/Kconfig              |   7 ++
 drivers/pinctrl/meson/Makefile             |   1 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |   3 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  |   3 +
 drivers/pinctrl/meson/pinctrl-meson.c      |  96 ++-----------------------
 drivers/pinctrl/meson/pinctrl-meson.h      |  31 +++------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 108 +++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h |  48 +++++++++++++
 drivers/pinctrl/meson/pinctrl-meson8.c     |   3 +
 drivers/pinctrl/meson/pinctrl-meson8b.c    |   3 +
 10 files changed, 194 insertions(+), 109 deletions(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8-pmx.h

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 2795a31eb04a..1a51778759ea 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -14,21 +14,28 @@ if PINCTRL_MESON
 config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
 	depends on ARM
+	select PINCTRL_MESON8_PMX
 	default y
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
 	depends on ARM
+	select PINCTRL_MESON8_PMX
 	default y
 
 config PINCTRL_MESON_GXBB
 	bool "Meson gxbb SoC pinctrl driver"
 	depends on ARM64
+	select PINCTRL_MESON8_PMX
 	default y
 
 config PINCTRL_MESON_GXL
 	bool "Meson gxl SoC pinctrl driver"
 	depends on ARM64
+	select PINCTRL_MESON8_PMX
 	default y
 
+config PINCTRL_MESON8_PMX
+	bool
+
 endif
diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
index dc3b73f8039a..cbd47bb74549 100644
--- a/drivers/pinctrl/meson/Makefile
+++ b/drivers/pinctrl/meson/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_PINCTRL_MESON) += pinctrl-meson.o
+obj-$(CONFIG_PINCTRL_MESON8_PMX) += pinctrl-meson8-pmx.o
 obj-$(CONFIG_PINCTRL_MESON8) += pinctrl-meson8.o
 obj-$(CONFIG_PINCTRL_MESON8B) += pinctrl-meson8b.o
 obj-$(CONFIG_PINCTRL_MESON_GXBB) += pinctrl-meson-gxbb.o
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index a87bdb17414b..9079020259c5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
 #include "pinctrl-meson.h"
+#include "pinctrl-meson8-pmx.h"
 
 static const struct pinctrl_pin_desc meson_gxbb_periphs_pins[] = {
 	MESON_PIN(GPIOZ_0),
@@ -834,6 +835,7 @@ static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson_gxbb_periphs_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxbb_periphs_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxbb_periphs_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
@@ -846,6 +848,7 @@ static struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson_gxbb_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 088ac94f76b0..b3786cde963d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/meson-gxl-gpio.h>
 #include "pinctrl-meson.h"
+#include "pinctrl-meson8-pmx.h"
 
 static const struct pinctrl_pin_desc meson_gxl_periphs_pins[] = {
 	MESON_PIN(GPIOZ_0),
@@ -819,6 +820,7 @@ static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson_gxl_periphs_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxl_periphs_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxl_periphs_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
@@ -831,6 +833,7 @@ static struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson_gxl_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 525e8b17d471..29a458da78db 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -31,10 +31,6 @@
  * In some cases the register ranges for pull enable and pull
  * direction are the same and thus there are only 3 register ranges.
  *
- * Every pinmux group can be enabled by a specific bit in the first
- * register range; when all groups for a given pin are disabled the
- * pin acts as a GPIO.
- *
  * For the pull and GPIO configuration every bank uses a contiguous
  * set of bits in the register sets described above; the same register
  * can be shared by more banks with different offsets.
@@ -148,94 +144,24 @@ static const struct pinctrl_ops meson_pctrl_ops = {
 	.pin_dbg_show		= meson_pin_dbg_show,
 };
 
-/**
- * meson_pmx_disable_other_groups() - disable other groups using a given pin
- *
- * @pc:		meson pin controller device
- * @pin:	number of the pin
- * @sel_group:	index of the selected group, or -1 if none
- *
- * The function disables all pinmux groups using a pin except the
- * selected one. If @sel_group is -1 all groups are disabled, leaving
- * the pin in GPIO mode.
- */
-static void meson_pmx_disable_other_groups(struct meson_pinctrl *pc,
-					   unsigned int pin, int sel_group)
-{
-	struct meson_pmx_group *group;
-	int i, j;
-
-	for (i = 0; i < pc->data->num_groups; i++) {
-		group = &pc->data->groups[i];
-		if (group->is_gpio || i == sel_group)
-			continue;
-
-		for (j = 0; j < group->num_pins; j++) {
-			if (group->pins[j] == pin) {
-				/* We have found a group using the pin */
-				regmap_update_bits(pc->reg_mux,
-						   group->reg * 4,
-						   BIT(group->bit), 0);
-			}
-		}
-	}
-}
-
-static int meson_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned func_num,
-			     unsigned group_num)
-{
-	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
-	struct meson_pmx_func *func = &pc->data->funcs[func_num];
-	struct meson_pmx_group *group = &pc->data->groups[group_num];
-	int i, ret = 0;
-
-	dev_dbg(pc->dev, "enable function %s, group %s\n", func->name,
-		group->name);
-
-	/*
-	 * Disable groups using the same pin.
-	 * The selected group is not disabled to avoid glitches.
-	 */
-	for (i = 0; i < group->num_pins; i++)
-		meson_pmx_disable_other_groups(pc, group->pins[i], group_num);
-
-	/* Function 0 (GPIO) doesn't need any additional setting */
-	if (func_num)
-		ret = regmap_update_bits(pc->reg_mux, group->reg * 4,
-					 BIT(group->bit), BIT(group->bit));
-
-	return ret;
-}
-
-static int meson_pmx_request_gpio(struct pinctrl_dev *pcdev,
-				  struct pinctrl_gpio_range *range,
-				  unsigned offset)
-{
-	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
-
-	meson_pmx_disable_other_groups(pc, offset, -1);
-
-	return 0;
-}
-
-static int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev)
+int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 
 	return pc->data->num_funcs;
 }
 
-static const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
-					   unsigned selector)
+const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
+				    unsigned selector)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 
 	return pc->data->funcs[selector].name;
 }
 
-static int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
-				const char * const **groups,
-				unsigned * const num_groups)
+int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
+			 const char * const **groups,
+			 unsigned * const num_groups)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 
@@ -245,14 +171,6 @@ static int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
-static const struct pinmux_ops meson_pmx_ops = {
-	.set_mux = meson_pmx_set_mux,
-	.get_functions_count = meson_pmx_get_funcs_count,
-	.get_function_name = meson_pmx_get_func_name,
-	.get_function_groups = meson_pmx_get_groups,
-	.gpio_request_enable = meson_pmx_request_gpio,
-};
-
 static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *configs, unsigned num_configs)
 {
@@ -609,7 +527,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->desc.name		= "pinctrl-meson";
 	pc->desc.owner		= THIS_MODULE;
 	pc->desc.pctlops	= &meson_pctrl_ops;
-	pc->desc.pmxops		= &meson_pmx_ops;
+	pc->desc.pmxops		= pc->data->pmx_ops;
 	pc->desc.confops	= &meson_pinconf_ops;
 	pc->desc.pins		= pc->data->pins;
 	pc->desc.npins		= pc->data->num_pins;
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 284157d43612..183b6e471635 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -32,9 +32,7 @@ struct meson_pmx_group {
 	const char *name;
 	const unsigned int *pins;
 	unsigned int num_pins;
-	bool is_gpio;
-	unsigned int reg;
-	unsigned int bit;
+	const void *data;
 };
 
 /**
@@ -109,6 +107,7 @@ struct meson_pinctrl_data {
 	unsigned int num_funcs;
 	struct meson_bank *banks;
 	unsigned int num_banks;
+	const struct pinmux_ops *pmx_ops;
 };
 
 struct meson_pinctrl {
@@ -124,23 +123,6 @@ struct meson_pinctrl {
 	struct device_node *of_node;
 };
 
-#define GROUP(grp, r, b)						\
-	{								\
-		.name = #grp,						\
-		.pins = grp ## _pins,					\
-		.num_pins = ARRAY_SIZE(grp ## _pins),			\
-		.reg = r,						\
-		.bit = b,						\
-	 }
-
-#define GPIO_GROUP(gpio)						\
-	{								\
-		.name = #gpio,						\
-		.pins = (const unsigned int[]){ gpio },			\
-		.num_pins = 1,						\
-		.is_gpio = true,					\
-	 }
-
 #define FUNCTION(fn)							\
 	{								\
 		.name = #fn,						\
@@ -166,5 +148,14 @@ struct meson_pinctrl {
 
 #define MESON_PIN(x) PINCTRL_PIN(x, #x)
 
+/* Common pmx functions */
+int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev);
+const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
+				    unsigned selector);
+int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
+			 unsigned selector,
+			 const char * const **groups,
+			 unsigned * const num_groups);
+
 /* Common probe function */
 int meson_pinctrl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
new file mode 100644
index 000000000000..b93b058c8a07
--- /dev/null
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -0,0 +1,108 @@
+/*
+ * First generation of pinmux driver for Amlogic Meson SoCs
+ *
+ * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
+ * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+/* For this first generation of pinctrl driver every pinmux group can be
+ * enabled by a specific bit in the first register range. When all groups for
+ * a given pin are disabled the pin acts as a GPIO.
+ */
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "pinctrl-meson.h"
+#include "pinctrl-meson8-pmx.h"
+
+/**
+ * meson8_pmx_disable_other_groups() - disable other groups using a given pin
+ *
+ * @pc:		meson pin controller device
+ * @pin:	number of the pin
+ * @sel_group:	index of the selected group, or -1 if none
+ *
+ * The function disables all pinmux groups using a pin except the
+ * selected one. If @sel_group is -1 all groups are disabled, leaving
+ * the pin in GPIO mode.
+ */
+static void meson8_pmx_disable_other_groups(struct meson_pinctrl *pc,
+					    unsigned int pin, int sel_group)
+{
+	struct meson_pmx_group *group;
+	struct meson8_pmx_data *pmx_data;
+	int i, j;
+
+	for (i = 0; i < pc->data->num_groups; i++) {
+		group = &pc->data->groups[i];
+		pmx_data = (struct meson8_pmx_data *)group->data;
+		if (pmx_data->is_gpio || i == sel_group)
+			continue;
+
+		for (j = 0; j < group->num_pins; j++) {
+			if (group->pins[j] == pin) {
+				/* We have found a group using the pin */
+				regmap_update_bits(pc->reg_mux,
+						   pmx_data->reg * 4,
+						   BIT(pmx_data->bit), 0);
+			}
+		}
+	}
+}
+
+static int meson8_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned func_num,
+			      unsigned group_num)
+{
+	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
+	struct meson_pmx_func *func = &pc->data->funcs[func_num];
+	struct meson_pmx_group *group = &pc->data->groups[group_num];
+	struct meson8_pmx_data *pmx_data =
+		(struct meson8_pmx_data *)group->data;
+	int i, ret = 0;
+
+	dev_dbg(pc->dev, "enable function %s, group %s\n", func->name,
+		group->name);
+
+	/*
+	 * Disable groups using the same pin.
+	 * The selected group is not disabled to avoid glitches.
+	 */
+	for (i = 0; i < group->num_pins; i++)
+		meson8_pmx_disable_other_groups(pc, group->pins[i], group_num);
+
+	/* Function 0 (GPIO) doesn't need any additional setting */
+	if (func_num)
+		ret = regmap_update_bits(pc->reg_mux, pmx_data->reg * 4,
+					 BIT(pmx_data->bit),
+					 BIT(pmx_data->bit));
+
+	return ret;
+}
+
+static int meson8_pmx_request_gpio(struct pinctrl_dev *pcdev,
+				   struct pinctrl_gpio_range *range,
+				   unsigned offset)
+{
+	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
+
+	meson8_pmx_disable_other_groups(pc, offset, -1);
+
+	return 0;
+}
+
+const struct pinmux_ops meson8_pmx_ops = {
+	.set_mux = meson8_pmx_set_mux,
+	.get_functions_count = meson_pmx_get_funcs_count,
+	.get_function_name = meson_pmx_get_func_name,
+	.get_function_groups = meson_pmx_get_groups,
+	.gpio_request_enable = meson8_pmx_request_gpio,
+};
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
new file mode 100644
index 000000000000..47293c28f913
--- /dev/null
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
@@ -0,0 +1,48 @@
+/*
+ * First generation of pinmux driver for Amlogic Meson SoCs
+ *
+ * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
+ * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+struct meson8_pmx_data {
+	bool is_gpio;
+	unsigned int reg;
+	unsigned int bit;
+};
+
+#define PMX_DATA(r, b, g)						\
+	{								\
+		.reg = r,						\
+		.bit = b,						\
+		.is_gpio = g,						\
+	}
+
+#define GROUP(grp, r, b)						\
+	{								\
+		.name = #grp,						\
+		.pins = grp ## _pins,					\
+		.num_pins = ARRAY_SIZE(grp ## _pins),			\
+		.data = (const struct meson8_pmx_data[]){		\
+			PMX_DATA(r, b, false),				\
+		},							\
+	 }
+
+#define GPIO_GROUP(gpio)						\
+	{								\
+		.name = #gpio,						\
+		.pins = (const unsigned int[]){ gpio },			\
+		.num_pins = 1,						\
+		.data = (const struct meson8_pmx_data[]){		\
+			PMX_DATA(0, 0, true),				\
+		},							\
+	}
+
+extern const struct pinmux_ops meson8_pmx_ops;
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 68b345fc105a..49c7ce03547b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -13,6 +13,7 @@
 
 #include <dt-bindings/gpio/meson8-gpio.h>
 #include "pinctrl-meson.h"
+#include "pinctrl-meson8-pmx.h"
 
 static const struct pinctrl_pin_desc meson8_cbus_pins[] = {
 	MESON_PIN(GPIOX_0),
@@ -1054,6 +1055,7 @@ static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson8_cbus_groups),
 	.num_funcs	= ARRAY_SIZE(meson8_cbus_functions),
 	.num_banks	= ARRAY_SIZE(meson8_cbus_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static struct meson_pinctrl_data meson8_aobus_pinctrl_data = {
@@ -1066,6 +1068,7 @@ static struct meson_pinctrl_data meson8_aobus_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson8_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson8_aobus_functions),
 	.num_banks	= ARRAY_SIZE(meson8_aobus_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static const struct of_device_id meson8_pinctrl_dt_match[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 4d61df09bc3f..5bd808dc81e1 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/meson8b-gpio.h>
 #include "pinctrl-meson.h"
+#include "pinctrl-meson8-pmx.h"
 
 static const struct pinctrl_pin_desc meson8b_cbus_pins[] = {
 	MESON_PIN(GPIOX_0),
@@ -914,6 +915,7 @@ static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson8b_cbus_groups),
 	.num_funcs	= ARRAY_SIZE(meson8b_cbus_functions),
 	.num_banks	= ARRAY_SIZE(meson8b_cbus_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
@@ -926,6 +928,7 @@ static struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
 	.num_groups	= ARRAY_SIZE(meson8b_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson8b_aobus_functions),
 	.num_banks	= ARRAY_SIZE(meson8b_aobus_banks),
+	.pmx_ops	= &meson8_pmx_ops,
 };
 
 static const struct of_device_id meson8b_pinctrl_dt_match[] = {
-- 
2.13.6
