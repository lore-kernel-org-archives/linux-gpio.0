From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] pinctrl: Add ZTE ZX SoC pinctrl drivers
Date: Fri,  5 Aug 2016 21:48:17 +0800
Message-ID: <1470404897-2786-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:36757 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161412AbcHENsx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2016 09:48:53 -0400
Received: by mail-pf0-f169.google.com with SMTP id h186so97392950pfg.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Aug 2016 06:48:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: shawn.guo@linaro.org, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

This adds pinctrl driver for ZTE ZX platform. The bit width
of pinmux register is not unified, so this dedicated driver
is needed and detail bit width data is store in private data.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-zx.txt     |  70 +++
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/zte/Kconfig                        |  10 +
 drivers/pinctrl/zte/Makefile                       |   2 +
 drivers/pinctrl/zte/pinctrl-zx.c                   | 544 +++++++++++++++++++++
 drivers/pinctrl/zte/pinctrl-zx.h                   |  92 ++++
 drivers/pinctrl/zte/pinctrl-zx296718.c             |  71 +++
 8 files changed, 791 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
 create mode 100644 drivers/pinctrl/zte/Kconfig
 create mode 100644 drivers/pinctrl/zte/Makefile
 create mode 100644 drivers/pinctrl/zte/pinctrl-zx.c
 create mode 100644 drivers/pinctrl/zte/pinctrl-zx.h
 create mode 100644 drivers/pinctrl/zte/pinctrl-zx296718.c

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
new file mode 100644
index 0000000..55aad4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
@@ -0,0 +1,70 @@
+* ZTE ZX Pin Controller
+
+The pins controlled by ZX pin controller are organized in banks,
+number of pins in each bank may vary.  Each pin has different multiplexing
+functions. Controller does not support IO pull up/down configuration,
+which is supported with different controller.
+
+Required properties:
+- compatible:
+  "zte,zx296718-pinctrl"
+
+- reg: Should contain the register physical address and length for the
+  pin controller.
+
+Optional property:
+- pinctrl-zx,gpio-range : list of value that are used to configure a GPIO
+  range. They're value of subnode phandle, pin base in pinctrl device, pin
+  number in this range, GPIO function value of this GPIO range.
+  The number of parameters is depend on #pinctrl-zx,gpio-range-cells
+  property.
+
+		/* pin base, nr pins & gpio function */
+		pinctrl-zx,gpio-range = <&range 0 3 0 &range 3 9 1>;
+
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices.
+
+A pinctrl node should contain at least one subnodes representing the
+pinctrl groups available on the machine. Each subnode will list the
+pins it needs. If one of these options is not set, its actual value
+will be unspecified.
+
+Required subnode-properties:
+
+- pinctrl-zx,function: declair the subnode as function multiplex subnode
+- pinctrl-zx,pins: List of strings containing the pin name.
+- pinctrl-zx,config: List of value to mux required function of the pins listed
+above to.
+
+Optional sub-node: In case some pins could be configured as GPIO in the pinmux
+register, those pins could be defined as a GPIO range. This sub-node is required
+by pinctrl-zx,gpio-range property.
+
+Required properties in sub-node:
+- #pinctrl-zx,gpio-range-cells : the number of parameters after phandle in
+  pinctrl-zx,gpio-range property.
+
+	range: gpio-range {
+		#pinctrl-zx,gpio-range-cells = <3>;
+	};
+
+- #pinctrl-zx,gpio-range-cells:
+
+Examples:
+
+pinctrl_global: pinctrl@01462000 {
+	compatible = "zte,zx296718-pinctrl";
+	reg = <0x01462000 0x1000>;
+	pinctrl-zx,gpio-range = <&rangegl 0 11 2 &range 11 3 3>;
+	rangegl: gpio-range {
+		#pinctrl-zx,gpio-range-cells = <3>;
+	}
+
+	sdio1: sdio1 {
+		pinctrl-zx,function;
+		pinctrl-zx,pins = "p1-11", "p1-12", "p1-13", "p2-1";
+		pinctrl-zx,config = /bits/ 8 <1 1 1 1>;
+	};
+};
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index fb8200b..23e9fcc 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -249,6 +249,7 @@ source "drivers/pinctrl/tegra/Kconfig"
 source "drivers/pinctrl/uniphier/Kconfig"
 source "drivers/pinctrl/vt8500/Kconfig"
 source "drivers/pinctrl/mediatek/Kconfig"
+source "drivers/pinctrl/zte/Kconfig"
 
 config PINCTRL_XWAY
 	bool
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 42a5c1d..0c79d9b 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -51,3 +51,4 @@ obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
 obj-$(CONFIG_PINCTRL_MTK)	+= mediatek/
+obj-$(CONFIG_PINCTRL_ZX)	+= zte/
diff --git a/drivers/pinctrl/zte/Kconfig b/drivers/pinctrl/zte/Kconfig
new file mode 100644
index 0000000..76e9bd3
--- /dev/null
+++ b/drivers/pinctrl/zte/Kconfig
@@ -0,0 +1,10 @@
+config PINCTRL_ZX
+	bool"ZTE pin controller driver"
+	select PINMUX
+	select PINCONF
+
+config PINCTRL_ZX296718
+	bool "Pinctrl driver data for ZX296718"
+	depends on OF
+	default ARCH_ZX296718
+	select PINCTRL_ZX
diff --git a/drivers/pinctrl/zte/Makefile b/drivers/pinctrl/zte/Makefile
new file mode 100644
index 0000000..c42e651
--- /dev/null
+++ b/drivers/pinctrl/zte/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_PINCTRL_ZX)	+= pinctrl-zx.o
+obj-$(CONFIG_PINCTRL_ZX296718)	+= pinctrl-zx296718.o
diff --git a/drivers/pinctrl/zte/pinctrl-zx.c b/drivers/pinctrl/zte/pinctrl-zx.c
new file mode 100644
index 0000000..69eceef
--- /dev/null
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -0,0 +1,544 @@
+/*
+ * Copyright (C) 2015 - 2016 ZTE Semiconductor Corporation.
+ * Copyright (C) 2016 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/slab.h>
+
+#include "../core.h"
+#include "pinctrl-zx.h"
+
+static int zx_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->ngroups;
+}
+
+const char *zx_get_group_name(struct pinctrl_dev *pctldev,
+			      unsigned selector)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->pin_groups[selector].name;
+}
+
+int zx_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
+		      const unsigned **pins, unsigned *num_pins)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = pctl->pin_groups[selector].pins;
+	*num_pins = pctl->pin_groups[selector].npins;
+	return 0;
+}
+
+int zx_dt_node_to_map(struct pinctrl_dev *pctldev,
+		      struct device_node *np_config,
+		      struct pinctrl_map **map, unsigned *num_maps)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct property *prop;
+	const char *function;
+	const char *group;
+	int ret, i = 0;
+
+	*map = NULL;
+	*num_maps = 0;
+	if (!of_find_property(np_config, "pinctrl-zx,function", NULL)) {
+		dev_err(pctl->dev,
+			"missing pinctrl-zx,function property in node %s\n",
+			np_config->name);
+		return -EINVAL;
+	}
+	function = np_config->name;
+
+	ret = of_property_count_strings(np_config, "pinctrl-zx,pins");
+	if (ret < 0) {
+		dev_err(pctl->dev, "could not parse property pinctrl-zx,pins\n");
+		goto exit;
+	}
+	*num_maps = ret;
+	*map = kmalloc_array(ret, sizeof(struct pinctrl_map), GFP_KERNEL);
+	if (!*map)
+		return -ENOMEM;
+
+	of_property_for_each_string(np_config, "pinctrl-zx,pins", prop, group) {
+		(*map)[i].type = PIN_MAP_TYPE_MUX_GROUP;
+		(*map)[i].data.mux.group = group;
+		(*map)[i].data.mux.function = function;
+		i++;
+	}
+	ret = 0;
+exit:
+	return ret;
+}
+
+void zx_dt_free_map(struct pinctrl_dev *pctldev,
+		    struct pinctrl_map *map, unsigned num_maps)
+{
+	int i;
+
+	for (i = 0; i < num_maps; i++)
+		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
+			kfree(map[i].data.configs.configs);
+
+	kfree(map);
+}
+
+static const struct pinctrl_ops zx_pctrl_ops = {
+	.get_groups_count	= zx_get_groups_count,
+	.get_group_name		= zx_get_group_name,
+	.get_group_pins		= zx_get_group_pins,
+	.dt_node_to_map		= zx_dt_node_to_map,
+	.dt_free_map		= zx_dt_free_map,
+};
+
+/* check if the selector is a valid pin function selector */
+static int zx_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct zx_pinctrl *pctl;
+
+	pctl = pinctrl_dev_get_drvdata(pctldev);
+	return pctl->nfunctions;
+}
+
+/* return the name of the pin function specified */
+static const char *zx_pinmux_get_fname(struct pinctrl_dev *pctldev,
+				       unsigned selector)
+{
+	struct zx_pinctrl *pctl;
+
+	pctl = pinctrl_dev_get_drvdata(pctldev);
+	return pctl->pin_functions[selector].name;
+}
+
+/* return the groups associated for the specified function selector */
+static int zx_pinmux_get_groups(struct pinctrl_dev *pctldev,
+				unsigned selector, const char * const **groups,
+				unsigned * const num_groups)
+{
+	struct zx_pinctrl *pctl;
+
+	pctl = pinctrl_dev_get_drvdata(pctldev);
+	*groups = pctl->pin_functions[selector].groups;
+	*num_groups = pctl->pin_functions[selector].ngroups;
+	return 0;
+}
+
+static int zx_pinmux_config(struct zx_pinctrl *pctl,
+			    const struct pinctrl_pin_desc *pin,
+			    unsigned int config)
+{
+	struct zx_pin_desc_data *pin_data = pin->drv_data;
+	unsigned long flags;
+	void __iomem *reg;
+	unsigned int val;
+	unsigned int mask;
+
+	if (IS_ERR(pin_data)) {
+		dev_err(pctl->dev, "failed to get prv_data of pin %s\n",
+			pin->name);
+		return PTR_ERR(pin_data);
+	}
+	mask = ((1 << pin_data->width) - 1) << pin_data->shift;
+	spin_lock_irqsave(&pctl->lock, flags);
+	reg = pctl->base + pin_data->offset;
+	val = readl(reg);
+	val &= ~mask;
+	val |= (config << pin_data->shift) & mask;
+	writel(val, reg);
+	spin_unlock_irqrestore(&pctl->lock, flags);
+	dev_dbg(pctl->dev, "config reg:0x%llx, val:0x%x", (u64)reg, val);
+	return 0;
+}
+
+static int group_to_index(const struct zx_pin_func *func,
+			 const struct zx_pin_group *grp)
+{
+	int i;
+
+	for (i = 0; i < func->ngroups; i++) {
+		if (!strcmp(func->groups[i], grp->name))
+			return i;
+	}
+	return -EINVAL;
+}
+
+/* enable a specified pinmux by writing to registers */
+static int zx_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned selector, unsigned group)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct zx_pin_group *grp = &pctl->pin_groups[group];
+	const struct zx_pin_func *func = &pctl->pin_functions[selector];
+	const struct pinctrl_pin_desc *pin;
+	unsigned int pin_num, config;
+	int i, index;
+
+	index = group_to_index(func, grp);
+	if (index < 0) {
+		dev_err(pctl->dev, "cannot find group:%s in func:%s",
+			grp->name, func->name);
+		return index;
+	}
+
+	config = func->vals[index];
+	for (i = 0; i < grp->npins; i++) {
+		pin_num = grp->pins[i];
+		pin = &pctl->pctl_desc.pins[pin_num];
+		zx_pinmux_config(pctl, pin, config);
+	}
+	return 0;
+}
+
+static int zx_pinmux_gpio_request(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned pin_num)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct pinctrl_pin_desc *pin;
+	struct list_head *pos, *tmp;
+	struct zx_pinctrl_gpio_range *frange = NULL;
+
+	list_for_each_safe(pos, tmp, &pctl->gpio_ranges) {
+		frange = list_entry(pos, struct zx_pinctrl_gpio_range, node);
+		if (pin_num >= frange->offset + frange->npins
+			|| pin_num < frange->offset)
+			continue;
+		pin = &pctl->pctl_desc.pins[pin_num];
+		zx_pinmux_config(pctl, pin, frange->func);
+	}
+	return 0;
+}
+
+static const struct pinmux_ops zx_pinmux_ops = {
+	.get_functions_count	= zx_get_functions_count,
+	.get_function_name	= zx_pinmux_get_fname,
+	.get_function_groups	= zx_pinmux_get_groups,
+	.set_mux		= zx_pinmux_set_mux,
+	.gpio_request_enable	= zx_pinmux_gpio_request,
+};
+
+static int zx_pinctrl_create_func(struct zx_pinctrl *pctl,
+				  struct device_node *func_np,
+				  struct zx_pin_func *func)
+{
+	int ret, npins, nvals;
+	int i;
+	u8 *vals;
+
+	npins = of_property_count_strings(func_np, "pinctrl-zx,pins");
+	if (npins < 1)
+		return 0;
+
+	nvals = of_property_count_u8_elems(func_np, "pinctrl-zx,config");
+	if (nvals != npins) {
+		dev_err(pctl->dev, "Unmatched nr in %s, nvals:%d, npins:%d",
+			func_np->name, nvals, npins);
+		return -EINVAL;
+	}
+
+	dev_dbg(pctl->dev, "function:%s, npins:%d\n", func_np->name, npins);
+
+	vals = devm_kzalloc(pctl->dev, nvals * sizeof(u8), GFP_KERNEL);
+	if ((!vals)) {
+		dev_err(pctl->dev, "failed to allocate memory for vals list\n");
+		return -ENOMEM;
+	}
+
+	func->name = func_np->name;
+	func->vals = vals;
+	func->groups = devm_kzalloc(pctl->dev, npins * sizeof(char *),
+				    GFP_KERNEL);
+	if ((!func->groups)) {
+		dev_err(pctl->dev, "failed to allocate memory for groups\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < npins; ++i) {
+		const char *gname;
+
+		ret = of_property_read_string_index(func_np, "pinctrl-zx,pins",
+						    i, &gname);
+		if (ret) {
+			dev_err(pctl->dev,
+				"failed to read pin name %d from %s node\n",
+				i, func_np->name);
+			return ret;
+		}
+		func->groups[i] = gname;
+	}
+	func->ngroups = npins;
+
+	ret = of_property_read_u8_array(func_np, "pinctrl-zx,config",
+					vals, nvals);
+	dev_dbg(pctl->dev, "function %s create over", func_np->name);
+	return 1;
+}
+
+static int zx_pinctrl_create_groups(struct zx_pinctrl *pctl)
+{
+	const struct pinctrl_pin_desc *pins = pctl->pctl_desc.pins;
+	struct zx_pin_group *groups;
+	int i;
+
+	groups = devm_kzalloc(pctl->dev,
+			      pctl->pctl_desc.npins * sizeof(*groups),
+			      GFP_KERNEL);
+	if (!groups) {
+		dev_err(pctl->dev, "mem alloc for groups failed\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < pctl->pctl_desc.npins; i++) {
+		groups[i].name = pins[i].name;
+		groups[i].pins = &pins[i].number;
+		groups[i].npins = 1;
+	}
+
+	pctl->pin_groups = groups;
+	pctl->ngroups = pctl->pctl_desc.npins;
+	return 0;
+}
+
+static int zx_pinctrl_create_functions(struct zx_pinctrl *pctl)
+{
+	struct device_node *np = pctl->dev->of_node;
+	struct device_node *child_np;
+	struct zx_pin_func *functions, *func;
+	int cnt = 0;
+	int ret;
+
+	/*
+	 * Iterate over all the child nodes of the pin controller node
+	 * and create pin groups and pin function lists.
+	 */
+	for_each_child_of_node(np, child_np) {
+		if (!of_get_child_count(child_np)) {
+			if (!of_find_property(child_np,
+			    "pinctrl-zx,function", NULL))
+				continue;
+			++cnt;
+			continue;
+		}
+	}
+	if (!cnt) {
+		dev_err(pctl->dev, "no function node found in %s node\n",
+			np->name);
+		return 0;
+	}
+
+	functions = devm_kzalloc(pctl->dev, cnt * sizeof(*functions),
+					GFP_KERNEL);
+	if (!functions)
+		return -ENOMEM;
+
+	func = functions;
+	cnt = 0;
+	for_each_child_of_node(np, child_np) {
+		if (!of_get_child_count(child_np)) {
+			ret = zx_pinctrl_create_func(pctl, child_np, func);
+			if (ret < 0)
+				return ret;
+			if (ret > 0) {
+				++func;
+				++cnt;
+			}
+			continue;
+		}
+	}
+
+	pctl->pin_functions = functions;
+	pctl->nfunctions = cnt;
+	return 0;
+}
+
+static int zx_pinctrl_add_gpio_func(struct zx_pinctrl *pctl)
+{
+	const char *propname = "pinctrl-zx,gpio-range";
+	const char *cellname = "#pinctrl-zx,gpio-range-cells";
+	int ret, i;
+	struct of_phandle_args gpiospec;
+	struct zx_pinctrl_gpio_range *range;
+	struct device_node *node = pctl->dev->of_node;
+
+	for (i = 0; ; i++) {
+		ret = of_parse_phandle_with_args(node, propname, cellname,
+						 i, &gpiospec);
+		/* Do not treat it as error. Only treat it as end condition. */
+		if (ret) {
+			ret = 0;
+			break;
+		}
+		range = devm_kzalloc(pctl->dev, sizeof(*range), GFP_KERNEL);
+		if (!range) {
+			ret = -ENOMEM;
+			break;
+		}
+		range->offset = gpiospec.args[0];
+		range->npins = gpiospec.args[1];
+		range->func = gpiospec.args[2];
+		mutex_lock(&pctl->mutex);
+		list_add_tail(&range->node, &pctl->gpio_ranges);
+		mutex_unlock(&pctl->mutex);
+	}
+	return ret;
+}
+
+/*
+ * get the bank data
+ */
+static int zx_pinctrl_get_data(struct zx_pinctrl *pctl,
+			       struct zx_pin_bank *bank)
+{
+	struct pinctrl_pin_desc *pin;
+	struct zx_pin_desc_data *pin_data;
+	int npins;
+	unsigned int i, j, pin_base = 0;
+	char *pin_names;
+
+	npins = 0;
+	for (i = 0; i < bank->nbanks; i++)
+		npins += bank->banks[i].npins;
+	pin = devm_kzalloc(pctl->dev,
+			   npins * sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
+	if (!pin)
+		return -ENOMEM;
+	pctl->pctl_desc.pins = pin;
+
+	pin_names = devm_kzalloc(pctl->dev,
+				 npins * PIN_NAME_LENGTH * sizeof(char),
+				 GFP_KERNEL);
+	if (!pin_names) {
+		dev_err(pctl->dev, "mem alloc for pin names failed\n");
+		return -ENOMEM;
+	}
+
+	pin_data = devm_kzalloc(pctl->dev,
+				npins * sizeof(struct zx_pin_desc_data),
+				GFP_KERNEL);
+	if (!pin_data) {
+		dev_err(pctl->dev, "mem alloc for pin data failed\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < bank->nbanks; i++) {
+		struct zx_pin_bank_data *bank_data = &bank->banks[i];
+		int shift = 0;
+
+		for (j = 0; j < bank_data->npins; j++, pin++, pin_data++) {
+			sprintf(pin_names, "%s-%d", bank_data->name, j);
+			pin_data->offset = bank_data->offset;
+			pin_data->width = bank_data->width[j];
+			pin_data->shift = shift;
+			pin->name = pin_names;
+			pin->drv_data = pin_data;
+			pin->number = pin_base + j;
+
+			shift += bank_data->width[j];
+			pin_names += PIN_NAME_LENGTH;
+		}
+		pin_base += bank_data->npins;
+	}
+
+	pctl->pctl_desc.npins = npins;
+
+	return 0;
+}
+
+/*
+ * create functions and groups across the fdt
+ */
+static int zx_pinctrl_parse_dt(struct platform_device *pdev,
+						struct zx_pinctrl *pctl)
+{
+	int ret = 0;
+
+	ret = zx_pinctrl_create_groups(pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "groups not available\n");
+		return ret;
+	}
+
+	ret = zx_pinctrl_create_functions(pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "functions not available\n");
+		return ret;
+	}
+	return ret;
+}
+
+int zx_pinctrl_init(struct platform_device *pdev,
+		    struct zx_pin_bank *bank)
+{
+	struct resource *res;
+	struct zx_pinctrl *pctl;
+	struct pinctrl_desc *pctl_desc;
+	int ret;
+
+	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, pctl);
+
+	spin_lock_init(&pctl->lock);
+	mutex_init(&pctl->mutex);
+	INIT_LIST_HEAD(&pctl->gpio_ranges);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pctl->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pctl->base))
+		return PTR_ERR(pctl->base);
+
+	pctl->dev = &pdev->dev;
+
+	ret = zx_pinctrl_get_data(pctl, bank);
+	if (ret) {
+		dev_err(&pdev->dev, "driver data not available\n");
+		return ret;
+	}
+
+	ret = zx_pinctrl_parse_dt(pdev, pctl);
+	if (ret)
+		return ret;
+
+	pctl_desc = &pctl->pctl_desc;
+	pctl_desc->name = "zx-pinctrl";
+	pctl_desc->owner = THIS_MODULE;
+	pctl_desc->pctlops = &zx_pctrl_ops;
+	pctl_desc->pmxops = &zx_pinmux_ops;
+	pctl_desc->confops = NULL;
+	pctl->pctl_dev = pinctrl_register(&pctl->pctl_desc, pctl->dev, pctl);
+	if (!pctl->pctl_dev) {
+		dev_err(pctl->dev, "could not register zx pinctrl driver\n");
+		ret = -EINVAL;
+		goto free;
+	}
+
+	ret = zx_pinctrl_add_gpio_func(pctl);
+	if (ret < 0) {
+		dev_err(pctl->dev, "could not register zx gpio\n");
+		ret = -EINVAL;
+		goto free;
+	}
+	dev_info(pctl->dev, "Registered zx pinctrl\n");
+	return 0;
+
+free:
+	return ret;
+}
diff --git a/drivers/pinctrl/zte/pinctrl-zx.h b/drivers/pinctrl/zte/pinctrl-zx.h
new file mode 100644
index 0000000..fc3a28f
--- /dev/null
+++ b/drivers/pinctrl/zte/pinctrl-zx.h
@@ -0,0 +1,92 @@
+/*
+ * Copyright (C) 2015 - 2016 ZTE Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __PINCTRL_ZX_H
+#define __PINCTRL_ZX_H
+#define P0_BASE	0
+#define P1_BASE	16
+#define P2_BASE	32
+#define P3_BASE	44
+#define P4_BASE	67
+#define P5_BASE	81
+#define P6_BASE	92
+#define P7_BASE	103
+#define P8_BASE	116
+
+#define PIN_NAME_LENGTH 10
+#define GROUP_MAX_PINS 32
+
+/*
+ * pinctrl bits are not aligned
+ */
+struct zx_pin_desc_data {
+	u32	offset;
+	u8	shift;
+	u8	width;
+};
+
+/*
+ * offset: offset to the pinctrl base
+ * width: an array of widths of all the pins
+ */
+struct zx_pin_bank_data {
+	char		*name;
+	unsigned int	offset;
+	u8		*width;
+	u8		npins;
+};
+
+struct zx_pin_bank {
+	struct zx_pin_bank_data *banks;
+	u32 nbanks;
+};
+
+#define ZX_PIN_BANK(c, o, w, n)	\
+	{			\
+		.name = c,	\
+		.offset = o,	\
+		.width = w,	\
+		.npins = n	\
+	}
+
+struct zx_pin_group {
+	const char		*name;
+	const unsigned int	*pins;
+	u32			npins;
+};
+
+struct zx_pin_func {
+	const char	*name;
+	const char	**groups;
+	const u8	*vals;
+	u32		ngroups;
+};
+
+struct zx_pinctrl {
+	void __iomem			*base;
+	struct pinctrl_dev		*pctl_dev;
+	struct device			*dev;
+	struct pinctrl_desc		pctl_desc;
+	const struct zx_pin_group	*pin_groups;
+	unsigned int			ngroups;
+	const struct zx_pin_func	*pin_functions;
+	unsigned int			nfunctions;
+	struct list_head		gpio_ranges;
+	spinlock_t			lock;
+	struct mutex			mutex;
+};
+
+
+struct zx_pinctrl_gpio_range {
+	unsigned int offset;
+	unsigned int npins;
+	unsigned int func;
+	struct list_head node;
+};
+
+int zx_pinctrl_init(struct platform_device *pdev, struct zx_pin_bank *bank);
+#endif
diff --git a/drivers/pinctrl/zte/pinctrl-zx296718.c b/drivers/pinctrl/zte/pinctrl-zx296718.c
new file mode 100644
index 0000000..03b6b9d
--- /dev/null
+++ b/drivers/pinctrl/zte/pinctrl-zx296718.c
@@ -0,0 +1,71 @@
+/*
+ * Copyright (C) 2015 - 2016 ZTE Semiconductor Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-zx.h"
+
+static u8 pin0_width[]  = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,};
+static u8 pin1_width[]  = {2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2,};
+static u8 pin2_width[]  = {2, 2, 2, 3, 3, 3, 3, 2, 2, 3, 3, 3,};
+static u8 pin3_width[]  = {3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1,
+			   1, 2, 2, 2, 2, 1, 1};
+static u8 pin4_width[]  = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3,};
+static u8 pin5_width[]  = {3, 3, 3, 3, 3, 2, 2, 2, 3, 3, 3,};
+static u8 pin6_width[]  = {3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3,};
+static u8 pin7_width[]  = {3, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3,};
+static u8 pin8_width[]  = {2, 2,};
+
+static struct zx_pin_bank_data zx296718_pin_bank_data[]  = {
+	ZX_PIN_BANK("p0", 0x0, pin0_width, 16),
+	ZX_PIN_BANK("p1", 0x4, pin1_width, 16),
+	ZX_PIN_BANK("p2", 0x8, pin2_width, 12),
+	ZX_PIN_BANK("p3", 0xc, pin3_width, 23),
+	ZX_PIN_BANK("p4", 0x10, pin4_width, 14),
+	ZX_PIN_BANK("p5", 0x14, pin5_width, 11),
+	ZX_PIN_BANK("p6", 0x18, pin6_width, 11),
+	ZX_PIN_BANK("p7", 0x1c, pin7_width, 13),
+	ZX_PIN_BANK("p8", 0x20, pin8_width, 2),
+};
+
+static struct zx_pin_bank zx296718_pin_bank = {
+	.banks = zx296718_pin_bank_data,
+	.nbanks = ARRAY_SIZE(zx296718_pin_bank_data),
+};
+
+static int zx296718_pinctrl_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = zx_pinctrl_init(pdev, &zx296718_pin_bank);
+	if (ret)
+		pr_err("zx pinctrl init failed\n");
+	return ret;
+}
+
+static const struct of_device_id zx296718_pinctrl_match[] = {
+	{ .compatible = "zte,zx296718-pinctrl", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, zx296718_pinctrl_match);
+
+static struct platform_driver zx296718_pinctrl_driver = {
+	.probe  = zx296718_pinctrl_probe,
+	.driver = {
+		.name       = "zx296718-pinctrl",
+		.of_match_table = zx296718_pinctrl_match,
+	},
+};
+builtin_platform_driver(zx296718_pinctrl_driver);
+
+MODULE_AUTHOR("Yuan Haibo <yuan.haibo@zte.com.cn>");
+MODULE_DESCRIPTION("ZTE ZX296718 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1

