From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Wed, 25 Jan 2017 19:09:43 +0100
Message-ID: <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:43205 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751688AbdAYSJ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 13:09:57 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Add core module for per-pin Renesas RZ series pin controller.
The core module allows SoC driver to register their pins and SoC
specific operations and interfaces with pinctrl and pinmux core on their
behalf.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/Kconfig             |   1 +
 drivers/pinctrl/Makefile            |   1 +
 drivers/pinctrl/rz-pfc/Kconfig      |  18 ++
 drivers/pinctrl/rz-pfc/Makefile     |   1 +
 drivers/pinctrl/rz-pfc/pinctrl-rz.c | 447 ++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/rz-pfc/pinctrl-rz.h | 114 +++++++++
 6 files changed, 582 insertions(+)
 create mode 100644 drivers/pinctrl/rz-pfc/Kconfig
 create mode 100644 drivers/pinctrl/rz-pfc/Makefile
 create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.c
 create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8f8c2af..6d72e58 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -294,6 +294,7 @@ source "drivers/pinctrl/mvebu/Kconfig"
 source "drivers/pinctrl/nomadik/Kconfig"
 source "drivers/pinctrl/pxa/Kconfig"
 source "drivers/pinctrl/qcom/Kconfig"
+source "drivers/pinctrl/rz-pfc/Kconfig"
 source "drivers/pinctrl/samsung/Kconfig"
 source "drivers/pinctrl/sh-pfc/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index a251f43..96e7ece 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_MVEBU)	+= mvebu/
 obj-y				+= nomadik/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
+obj-$(CONFIG_PINCTRL_RZ_PINCTRL)	+= rz-pfc/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_PINCTRL_SH_PFC)	+= sh-pfc/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
diff --git a/drivers/pinctrl/rz-pfc/Kconfig b/drivers/pinctrl/rz-pfc/Kconfig
new file mode 100644
index 0000000..3714c10
--- /dev/null
+++ b/drivers/pinctrl/rz-pfc/Kconfig
@@ -0,0 +1,18 @@
+#
+# Renesas RZ pinctrl drivers
+#
+
+if ARCH_RENESAS
+
+config PINCTRL_RZ_PINCTRL
+	select PINMUX
+	select PINCONF
+	select GPIOLIB
+	select GENERIC_PINCONF
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCTRL_GROUPS
+	def_bool y
+	help
+	  This enables pin control drivers for Renesas RZ platforms
+
+endif
diff --git a/drivers/pinctrl/rz-pfc/Makefile b/drivers/pinctrl/rz-pfc/Makefile
new file mode 100644
index 0000000..cba8283
--- /dev/null
+++ b/drivers/pinctrl/rz-pfc/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PINCTRL_RZ_PINCTRL)		+= pinctrl-rz.o
diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rz.c b/drivers/pinctrl/rz-pfc/pinctrl-rz.c
new file mode 100644
index 0000000..3efbf03
--- /dev/null
+++ b/drivers/pinctrl/rz-pfc/pinctrl-rz.c
@@ -0,0 +1,447 @@
+/*
+ * Pinctrl support for Renesas RZ Series
+ *
+ * Copyright (C) 2017 Jacopo Mondi
+ * Copyright (C) 2017 Renesas Electronics Corporation
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../devicetree.h"
+#include "../pinmux.h"
+
+#include "pinctrl-rz.h"
+
+#define DRIVER_NAME		"rz-pinctrl"
+#define RZ_PIN_ARGS_COUNT	3
+
+/**
+ * rz_pinctrl_pos_to_index() - Retrieve the index of pin at position [bank:pin]
+ *
+ * This can be improved, as it walks all the pins reported by the SoC driver
+ *
+ * @return: pin number between [0 - npins]; -1 if not found
+ */
+static int rz_pinctrl_pos_to_index(struct rz_pinctrl_dev *rz_pinctrl,
+				   unsigned int bank, unsigned int pin)
+{
+	struct rz_pinctrl_info *info;
+	struct rz_pin_desc *rz_pin;
+	int i, npins;
+
+	info = rz_pinctrl->info;
+	npins = info->npins;
+	for (i = 0; i < npins; ++i) {
+		rz_pin = &info->pins[i];
+
+		/*
+		 * return the pin index in the array, not the pin number,
+		 * so that we can access it easily when muxing group's pins
+		 */
+		if (rz_pin->bank == bank && rz_pin->pin == pin)
+			return i;
+	}
+
+	return -1;
+}
+
+/* ----------------------------------------------------------------------------
+ * pinctrl operations
+ */
+static void rz_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			    unsigned int pin)
+{
+	struct rz_pinctrl_dev *rz_pinctrl;
+	struct rz_pinctrl_info *info;
+
+	rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	info = rz_pinctrl->info;
+
+	seq_printf(s, "%s %s\n", info->pins[pin].name, DRIVER_NAME);
+}
+
+/**
+ * rz_dt_node_to_map() - Parse device tree nodes and collect pins, groups and
+ *			 functions
+ *
+ * Pins for RZ series pin controller described by "renesas-rz,pins" property
+ * are arrays of u32 values in the form:
+ *
+ * "renesas-rz,pins" = <BANK PIN MUX>, ... ;
+ *
+ * Parse the list arguments and identify pins through their position
+ * (bank and pin offset) and save the provided mux mode for later use.
+ *
+ * TODO: the array can be expended to support additional parameters for
+ *	 pin configurations values (IO direction etc)
+ *
+ * @pctldev: pin controller device
+ * @np_config: device tree node to parse
+ * @map: pointer to pin map (output)
+ * @num_maps: number of collected maps (output)
+ *
+ * @return: 0 for success; != 0 otherwise
+ */
+static int rz_dt_node_to_map(struct pinctrl_dev *pctldev,
+			     struct device_node *np_config,
+			     struct pinctrl_map **map, unsigned int *num_maps)
+{
+	struct rz_pinctrl_dev *rz_pinctrl;
+	const char *prop_name = "renesas-rz,pins",
+		   *grpname, **fngrps;
+	unsigned int *grpins,
+		     *mux_modes;
+	int i, npins, ret;
+
+	rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	npins = pinctrl_count_index_with_args(np_config, prop_name);
+	if (npins <= 0) {
+		dev_err(rz_pinctrl->dev, "Missing pins configuration prop\n");
+		return -EINVAL;
+	}
+
+	mux_modes = devm_kzalloc(rz_pinctrl->dev, sizeof(*mux_modes) * npins,
+				 GFP_KERNEL);
+	grpins = devm_kzalloc(rz_pinctrl->dev, sizeof(*grpins) * npins,
+			      GFP_KERNEL);
+	if (unlikely(!grpins || !mux_modes))
+		return -ENOMEM;
+
+	/*
+	 * functions are made of 1 group only;
+	 * in facts, functions and groups are identical for RZ pin controller,
+	 * except that functions carry an array of mux modes (aka alternate
+	 * functions IDs)
+	 */
+	fngrps = devm_kzalloc(rz_pinctrl->dev, sizeof(*fngrps), GFP_KERNEL);
+	if (unlikely(!fngrps)) {
+		ret = -ENOMEM;
+		goto free_pins;
+	}
+
+	*num_maps = 0;
+	(*map) = devm_kzalloc(rz_pinctrl->dev, sizeof(**map), GFP_KERNEL);
+	if (unlikely(!*map)) {
+		ret = -ENOMEM;
+		goto free_fngrps;
+	}
+
+	/* collect pin numbers and mux confs to create groups and functions */
+	for (i = 0; i < npins; ++i) {
+		struct of_phandle_args of_pins_args;
+		unsigned int bank, offs, mode, pin_idx;
+
+		/* DTS identifies pin by position: bank and pin offset */
+		ret = pinctrl_parse_index_with_args(np_config, prop_name, i,
+						    &of_pins_args);
+		if (ret)
+			goto free_map;
+
+		if (of_pins_args.args_count < RZ_PIN_ARGS_COUNT) {
+			dev_err(rz_pinctrl->dev,
+				"Wrong arguments number for renesas-rz,pins");
+			ret = -EINVAL;
+			goto free_map;
+		}
+
+		bank = of_pins_args.args[0];
+		offs = of_pins_args.args[1];
+		mode = of_pins_args.args[2];
+
+		/* pin_idx is the index on the static pin array */
+		pin_idx = rz_pinctrl_pos_to_index(rz_pinctrl, bank, offs);
+		if (pin_idx < 0) {
+			dev_err(rz_pinctrl->dev,
+				"Invalid pin position %d-%d\n", bank, offs);
+			ret = -EINVAL;
+			goto free_map;
+		}
+
+		grpins[i] = pin_idx;
+		mux_modes[i] = mode;
+	}
+
+	grpname = np_config->name;
+	fngrps[0] = grpname;
+
+	mutex_lock(&rz_pinctrl->mutex);
+	ret = pinctrl_generic_add_group(pctldev, grpname, grpins, npins, NULL);
+	if (ret) {
+		mutex_unlock(&rz_pinctrl->mutex);
+		goto free_map;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, grpname, fngrps,
+					  1, mux_modes);
+	if (ret) {
+		mutex_unlock(&rz_pinctrl->mutex);
+		goto free_map;
+	}
+	mutex_unlock(&rz_pinctrl->mutex);
+
+	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)->data.mux.group = grpname;
+	(*map)->data.mux.function = grpname;
+	*num_maps = 1;
+
+	return 0;
+
+free_map:
+	devm_kfree(rz_pinctrl->dev, *map);
+free_fngrps:
+	devm_kfree(rz_pinctrl->dev, fngrps);
+free_pins:
+	devm_kfree(rz_pinctrl->dev, mux_modes);
+	devm_kfree(rz_pinctrl->dev, grpins);
+	return ret;
+}
+
+/**
+ * rz_dt_free_map()
+ */
+static void rz_dt_free_map(struct pinctrl_dev *pctldev,
+			   struct pinctrl_map *map, unsigned int num_maps)
+{
+	struct rz_pinctrl_dev *rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	devm_kfree(rz_pinctrl->dev, map);
+}
+
+static const struct pinctrl_ops rz_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.pin_dbg_show = rz_pin_dbg_show,
+	.dt_node_to_map = rz_dt_node_to_map,
+	.dt_free_map = rz_dt_free_map,
+};
+
+/* ----------------------------------------------------------------------------
+ * pinconfig operations
+ */
+
+/* TODO */
+
+/* ----------------------------------------------------------------------------
+ * pinmux operations
+ */
+
+/**
+ * rz_pinmux_set() - Retrieve pins from a group and apply mux settings
+ *
+ * @pctldev: pin controller device
+ * @selector: Function selector
+ * @group: Group selector
+ * @return: 0 for success; != otherwise
+ */
+static int rz_pinmux_set(struct pinctrl_dev *pctldev, unsigned int selector,
+			 unsigned int group)
+{
+	struct rz_pinctrl_dev *rz_pinctrl;
+	struct rz_pinctrl_info *info;
+	struct rz_pinctrl_ops *ops;
+	struct group_desc *grp;
+	struct function_desc *func;
+	unsigned int npins, *mux_modes;
+	int i;
+
+	rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	info = rz_pinctrl->info;
+	ops = info->ops;
+
+	grp = pinctrl_generic_get_group(pctldev, group);
+	if (!grp)
+		return -EINVAL;
+
+	func = pinmux_generic_get_function(pctldev, selector);
+	if (!func)
+		return -EINVAL;
+
+	npins = grp->num_pins;
+	mux_modes = (unsigned int *)func->data;
+
+	for (i = 0; i < npins; ++i) {
+		unsigned int pin_idx, mux_mode;
+		struct rz_pin_desc *pin;
+		int ret;
+
+		/*
+		 * use pin index to retrieve pin descriptor;
+		 * then provide it to the set_mux SoC operation
+		 */
+		pin_idx = grp->pins[i];
+		pin = &info->pins[pin_idx];
+		mux_mode = mux_modes[i];
+
+		if (!ops || !ops->set_mux) {
+			dev_err(rz_pinctrl->dev, "Pin muxing not supported\n");
+			return -EINVAL;
+		}
+
+		ret = ops->set_mux(rz_pinctrl, pin, mux_mode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct pinmux_ops rz_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = rz_pinmux_set,
+};
+
+/* ----------------------------------------------------------------------------
+ * rz pinctrl operations
+ */
+
+/**
+ * rz_add_pins() - Enumerate pins reported by SoC driver in pin desc array
+ *
+ * @rz_pinctrl: RZ pincontroller
+ *
+ * @return: 0 for success; != 0 otherwise
+ */
+static int rz_add_pins(struct rz_pinctrl_dev *rz_pinctrl)
+{
+	struct rz_pinctrl_info *info;
+	struct rz_pin_desc *pin;
+	unsigned int npins, i;
+
+	info = rz_pinctrl->info;
+	npins = info->npins;
+
+	rz_pinctrl->pins = devm_kzalloc(rz_pinctrl->dev,
+					npins * sizeof(*rz_pinctrl->pins),
+					GFP_KERNEL);
+	if (unlikely(!rz_pinctrl->pins))
+		return -ENOMEM;
+
+	rz_pinctrl->desc.pins = rz_pinctrl->pins;
+	rz_pinctrl->desc.npins = npins;
+
+	for (i = 0; i < npins; ++i) {
+		pin = &info->pins[i];
+
+		rz_pinctrl->pins[i].number = pin->number;
+		rz_pinctrl->pins[i].name = pin->name;
+	}
+
+	return 0;
+}
+
+/**
+ * rz_pinctrl_map_res() - Map memory resources for pincontroller
+ *
+ * @pdev: platform device
+ * @rz_pincrl: RZ pincontroller
+ *
+ * @return: 0 for success; != 0 otherwise
+ */
+static int rz_pinctrl_map_res(struct platform_device *pdev,
+			      struct rz_pinctrl_dev *rz_pinctrl)
+{
+	struct resource *res;
+	struct rz_pinctrl_res *rz_res;
+	unsigned int i, nres;
+
+	nres = pdev->num_resources;
+	rz_res = devm_kzalloc(&pdev->dev, nres * sizeof(*rz_res),
+			      GFP_KERNEL);
+	if (unlikely(!rz_res))
+		return -ENOMEM;
+
+	rz_pinctrl->nres = nres;
+	rz_pinctrl->res = rz_res;
+
+	for (i = 0; i < nres; i++) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			return -ENODEV;
+
+		rz_res = &rz_pinctrl->res[i];
+
+		rz_res->start = res->start;
+		rz_res->size = resource_size(res);
+		rz_res->base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(rz_res->base))
+			return PTR_ERR(rz_res->base);
+	}
+
+	return 0;
+}
+
+/**
+ * rz_pinctrl_probe() - Register pincontroller driver operations
+ *
+ * @pdev: platform device
+ * @info: SoC device info structure
+ */
+int rz_pinctrl_probe(struct platform_device *pdev, struct rz_pinctrl_info *info)
+{
+	int ret;
+	struct rz_pinctrl_dev *rz_pinctrl;
+
+	rz_pinctrl = devm_kzalloc(&pdev->dev, sizeof(*rz_pinctrl), GFP_KERNEL);
+	if (!rz_pinctrl)
+		return -ENOMEM;
+
+	rz_pinctrl->dev = &pdev->dev;
+	rz_pinctrl->info = info;
+
+	ret = rz_pinctrl_map_res(pdev, rz_pinctrl);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, rz_pinctrl);
+
+	rz_pinctrl->desc.name = DRIVER_NAME;
+	rz_pinctrl->desc.pctlops = &rz_pinctrl_ops;
+	rz_pinctrl->desc.pmxops = &rz_pinmux_ops;
+	rz_pinctrl->desc.owner = THIS_MODULE;
+
+	ret = rz_add_pins(rz_pinctrl);
+	if (ret)
+		return ret;
+
+	mutex_init(&rz_pinctrl->mutex);
+
+	ret = pinctrl_register_and_init(&rz_pinctrl->desc, rz_pinctrl->dev,
+					rz_pinctrl, &rz_pinctrl->pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "could not register rz pinctrl driver\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+void rz_pinctrl_remove(struct platform_device *pdev)
+{
+	struct rz_pinctrl_dev *rz_pinctrl = platform_get_drvdata(pdev);
+
+	pinctrl_unregister(rz_pinctrl->pctl);
+}
+
+MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
+MODULE_DESCRIPTION("Pinctrl driver for Reneas RZ series");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rz.h b/drivers/pinctrl/rz-pfc/pinctrl-rz.h
new file mode 100644
index 0000000..b873c89
--- /dev/null
+++ b/drivers/pinctrl/rz-pfc/pinctrl-rz.h
@@ -0,0 +1,114 @@
+/*
+ * Pinctrl support for Renesas RZ Series
+ *
+ * Copyright (C) 2017 Jacopo Mondi
+ * Copyright (C) 2017 Renesas Electronics Corporation
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+#ifndef __RZ_PINCTRL_H__
+#define __RZ_PINCTRL_H__
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/types.h>
+
+/* ----------------------------------------------------------------------------
+ * pinctrl-rz data types
+ */
+#define RZ_PIN_NAME(bank, pin)						\
+	PIN_##bank##_##pin
+
+#define RZ_PIN_DESC(b, p)						\
+	{ .number = RZ_PIN_NAME(b, p),					\
+	  .name = __stringify(RZ_PIN_NAME(b, p)),			\
+	  .bank = b, .pin = p }
+
+/**
+ * rz_pin_desc - Single RZ pin descriptor
+ *
+ * @number: pin number as enumerated by SoC driver
+ * @name: pin name as reported by SoC driver
+ * @bank: pin bank location
+ * @pin: pin register offset
+ */
+struct rz_pin_desc {
+	unsigned int bank, pin;
+	unsigned int number;
+	const char *name;
+};
+
+/**
+ * rz_pinctrl_info - SoC info data
+ *
+ * @ops: SoC specific operations
+ * @npins: number of pins
+ * @pins: pin array
+ */
+struct rz_pinctrl_ops;
+struct rz_pinctrl_info {
+	struct rz_pinctrl_ops *ops;
+
+	unsigned int npins;
+	struct rz_pin_desc *pins;
+};
+
+/**
+ * rz_pinctrl_res - Memory resource for RZ SoC
+ *
+ * @start: physical address base
+ * @size: memory region size
+ * @base: logical address base
+ */
+struct rz_pinctrl_res {
+	resource_size_t start;
+	resource_size_t size;
+	void __iomem *base;
+};
+
+/**
+ * rz_pinctrl_dev - RZ pincontroller device
+ *
+ * @dev: device
+ * @info: SoC data
+ * @nres: number of memory regions
+ * @res: memory regions
+ * @mutex: protect pin*_generic functions
+ * @pins: pin array for pinctrl core
+ * @desc: pincontroller desc for pinctrl core
+ * @pctl: pinctrl device
+ */
+struct rz_pinctrl_dev {
+	struct device *dev;
+
+	struct rz_pinctrl_info *info;
+
+	unsigned int nres;
+	struct rz_pinctrl_res *res;
+
+	struct mutex mutex;
+
+	struct pinctrl_pin_desc *pins;
+	struct pinctrl_desc desc;
+	struct pinctrl_dev *pctl;
+};
+
+/**
+ * rz_pinctrl_ops - SoC operations
+ *
+ * @set_mux: perform pin muxing on SoC registers
+ */
+struct rz_pinctrl_ops {
+	int (*set_mux)(struct rz_pinctrl_dev *, struct rz_pin_desc *,
+		       unsigned int mux_mode);
+};
+
+/* ----------------------------------------------------------------------------
+ * pinctrl-rz prototypes
+ */
+int rz_pinctrl_probe(struct platform_device *pdev,
+		     struct rz_pinctrl_info *info);
+void rz_pinctrl_remove(struct platform_device *pdev);
+
+#endif
-- 
2.7.4

