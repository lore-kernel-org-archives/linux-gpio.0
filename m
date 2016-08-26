From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 3/3] pinctrl: zx: Add ZTE ZX SoC pinctrl driver
Date: Fri, 26 Aug 2016 20:19:25 +0800
Message-ID: <1472213965-4899-2-git-send-email-jun.nie@linaro.org>
References: <1472213965-4899-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:32998 "EHLO
        mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751969AbcHZMT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2016 08:19:59 -0400
Received: by mail-pa0-f49.google.com with SMTP id cy9so6188754pac.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2016 05:19:59 -0700 (PDT)
In-Reply-To: <1472213965-4899-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: shawn.guo@linaro.org, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

This adds pinctrl driver for ZTE ZX platform. The bit width
of pinmux registers are not unified, so this dedicated driver
is needed and detail bit width data is store in private data.
The parent pin information is also stored in private data so
that parent pin can be requested automatically.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/pinctrl/Kconfig                |   1 +
 drivers/pinctrl/Makefile               |   1 +
 drivers/pinctrl/zte/Kconfig            |   9 +
 drivers/pinctrl/zte/Makefile           |   2 +
 drivers/pinctrl/zte/pinctrl-zx.c       | 550 ++++++++++++++++++++
 drivers/pinctrl/zte/pinctrl-zx.h       | 129 +++++
 drivers/pinctrl/zte/pinctrl-zx296718.c | 893 +++++++++++++++++++++++++++++++++
 7 files changed, 1585 insertions(+)
 create mode 100644 drivers/pinctrl/zte/Kconfig
 create mode 100644 drivers/pinctrl/zte/Makefile
 create mode 100644 drivers/pinctrl/zte/pinctrl-zx.c
 create mode 100644 drivers/pinctrl/zte/pinctrl-zx.h
 create mode 100644 drivers/pinctrl/zte/pinctrl-zx296718.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b3fe1d3..48e4217 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -271,6 +271,7 @@ source "drivers/pinctrl/tegra/Kconfig"
 source "drivers/pinctrl/uniphier/Kconfig"
 source "drivers/pinctrl/vt8500/Kconfig"
 source "drivers/pinctrl/mediatek/Kconfig"
+source "drivers/pinctrl/zte/Kconfig"
 
 config PINCTRL_XWAY
 	bool
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 8ebd7b8..ec42eb0 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -53,3 +53,4 @@ obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
 obj-$(CONFIG_PINCTRL_MTK)	+= mediatek/
+obj-$(CONFIG_PINCTRL_ZX)	+= zte/
diff --git a/drivers/pinctrl/zte/Kconfig b/drivers/pinctrl/zte/Kconfig
new file mode 100644
index 0000000..16baf74
--- /dev/null
+++ b/drivers/pinctrl/zte/Kconfig
@@ -0,0 +1,9 @@
+config PINCTRL_ZX
+	bool"ZTE pin controller driver"
+	select PINMUX
+	select GENERIC_PINCONF
+
+config PINCTRL_ZX296718
+	bool "Pinctrl driver data for ZX296718"
+	depends on OF && ARCH_ZX
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
index 0000000..a1c0a12
--- /dev/null
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -0,0 +1,550 @@
+/*
+ * ZTE ZX SoCs pinctrl driver.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+#include "pinctrl-zx.h"
+
+/**
+ * struct pcs_gpiofunc_range - pin ranges with same mux value of gpio function
+ * @offset:	offset base of pins
+ * @npins:	number pins with the same mux value of gpio function
+ * @gpiofunc:	mux value of gpio function
+ * @node:	list node
+ */
+struct pcs_gpiofunc_range {
+	unsigned offset;
+	unsigned npins;
+	unsigned gpiofunc;
+	struct list_head node;
+};
+
+static struct zx_pinctrl_function *
+zx_pctl_find_function_by_name(struct zx_pinctrl *pctl, const char *name)
+{
+	struct zx_pinctrl_function *func = pctl->functions;
+	int i;
+
+	for (i = 0; i < pctl->nfunctions; i++) {
+		if (!func[i].name)
+			break;
+
+		if (!strcmp(func[i].name, name))
+			return func + i;
+	}
+
+	return NULL;
+}
+
+static struct zx_desc_function *
+zx_pctl_desc_find_function_by_name(struct zx_pinctrl *pctl,
+				   const char *pin_name,
+				   const char *func_name)
+{
+	int i;
+
+	for (i = 0; i < pctl->desc->npins; i++) {
+		const struct zx_desc_pin *pin = pctl->desc->pins + i;
+
+		if (!strcmp(pin->pin.name, pin_name)) {
+			struct zx_desc_function *func = pin->functions;
+
+			while (func->name) {
+				if (!strcmp(func->name, func_name))
+					return func;
+				func++;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+static int zx_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->ngroups;
+}
+
+static const char *zx_pctrl_get_group_name(struct pinctrl_dev *pctldev,
+					   unsigned group)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->groups[group].name;
+}
+
+static int zx_pctrl_get_group_pins(struct pinctrl_dev *pctldev, unsigned group,
+				   const unsigned **pins, unsigned *num_pins)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = (unsigned *)&pctl->groups[group].pin;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static int zx_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+				   struct device_node *np_config,
+				   struct pinctrl_map **map,
+				   u32 *num_maps)
+{
+	return pinconf_generic_dt_node_to_map(pctldev, np_config, map,
+					      num_maps, PIN_MAP_TYPE_INVALID);
+}
+
+static const struct pinctrl_ops zx_pctrl_ops = {
+	.dt_node_to_map		= zx_pctrl_dt_node_to_map,
+	.dt_free_map		= pinctrl_utils_free_map,
+	.get_groups_count	= zx_pctrl_get_groups_count,
+	.get_group_name		= zx_pctrl_get_group_name,
+	.get_group_pins		= zx_pctrl_get_group_pins,
+};
+
+static int zx_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->nfunctions;
+}
+
+static const char *zx_pmx_get_func_name(struct pinctrl_dev *pctldev,
+					unsigned function)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->functions[function].name;
+}
+
+static int zx_pmx_get_func_groups(struct pinctrl_dev *pctldev,
+				  unsigned function,
+				  const char * const **groups,
+				  unsigned * const num_groups)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pctl->functions[function].groups;
+	*num_groups = pctl->functions[function].ngroups;
+
+	return 0;
+}
+
+static void zx_pmx_set(struct pinctrl_dev *pctldev, unsigned pin,
+		       u8 mval)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct pinctrl_pin_desc *pins = pctldev->desc->pins;
+	struct zx_pin_desc_data *zx_pin_dat;
+	void __iomem *membase;
+	unsigned long flags;
+	u32 val, mask;
+
+	spin_lock_irqsave(&pctl->lock, flags);
+
+	membase = pin < pctl->ntop_pins ? pctl->membase : pctl->aon_membase;
+	pins += pin;
+	zx_pin_dat = (struct zx_pin_desc_data *)pins->drv_data;
+	dev_dbg(pctl->dev, "%s set 0x%p offset 0x%x bitp %d val %d\n", __func__,
+		membase, zx_pin_dat->offset, zx_pin_dat->bitpos, mval);
+
+	val = readl(membase + zx_pin_dat->offset);
+	mask = (BIT(1 + zx_pin_dat->width) - 1) << zx_pin_dat->bitpos;
+	writel((val & ~mask) | mval << zx_pin_dat->bitpos,
+		membase + zx_pin_dat->offset);
+
+	spin_unlock_irqrestore(&pctl->lock, flags);
+}
+
+static int zx_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned function,
+			  unsigned group)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct zx_pinctrl_group *g = pctl->groups + group;
+	struct zx_pinctrl_function *func = pctl->functions + function;
+	struct zx_desc_function *desc =
+		zx_pctl_desc_find_function_by_name(pctl, g->name,
+						   func->name);
+
+	if (!desc)
+		return -EINVAL;
+
+	zx_pmx_set(pctldev, g->pin, desc->muxval);
+
+	return 0;
+}
+
+#define NONAON_MVAL 2
+int zx_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+	const struct pinctrl_pin_desc *pins = pctldev->desc->pins;
+	struct zx_pin_desc_data *zx_pin_dat;
+
+	pins += offset;
+	zx_pin_dat = (struct zx_pin_desc_data *)pins->drv_data;
+	if (!zx_pin_dat->parent)
+		return 0;
+
+	ret = pinctrl_request_pin(pctldev, zx_pin_dat->parent, "nonAON");
+	if (ret) {
+		dev_err(pctl->dev, "Failed to request parent pin %d\n",
+			zx_pin_dat->parent);
+		return ret;
+	}
+
+	dev_dbg(pctl->dev, "Requested parent pin %d\n", zx_pin_dat->parent);
+	zx_pmx_set(pctldev, zx_pin_dat->parent, NONAON_MVAL);
+
+	return ret;
+}
+
+static const struct pinmux_ops zx_pmx_ops = {
+	.get_functions_count	= zx_pmx_get_funcs_cnt,
+	.get_function_name	= zx_pmx_get_func_name,
+	.get_function_groups	= zx_pmx_get_func_groups,
+	.set_mux		= zx_pmx_set_mux,
+	.request		= zx_pmx_request,
+};
+
+static void zx_pin_get_pull(void __iomem *base,
+			     struct zx_pin_desc_data *zx_dat,
+			     bool *pull_up, bool *pull_down)
+{
+	u32 val;
+
+	*pull_up = false;
+	*pull_down = false;
+
+	val = readl(base + zx_dat->coffset);
+	val = val >> zx_dat->cbitpos;
+	if (val | ZX_PULL_UP_VAL)
+		*pull_up = true;
+
+	if (val | ZX_PULL_DOWN_VAL)
+		*pull_down = true;
+}
+
+static int zx_pin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned long *config)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct pinctrl_pin_desc *pins = pctldev->desc->pins;
+	struct zx_pin_desc_data *zx_dat;
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	bool pull_up, pull_down;
+	u32 val;
+	int ret = 0;
+
+	pins += pin;
+	zx_dat = (struct zx_pin_desc_data *)pins->drv_data;
+	if (zx_dat->parent) {
+		pin = zx_dat->parent;
+		pins = pctldev->desc->pins + pin;
+		zx_dat = (struct zx_pin_desc_data *)pins->drv_data;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		zx_pin_get_pull(pctl->cfg_membase,
+				zx_dat, &pull_up, &pull_down);
+		if (pull_up || pull_down)
+			ret = -EINVAL;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_UP:
+		zx_pin_get_pull(pctl->cfg_membase,
+				zx_dat, &pull_up, &pull_down);
+		if (!pull_up)
+			ret = -EINVAL;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		zx_pin_get_pull(pctl->cfg_membase,
+				zx_dat, &pull_up, &pull_down);
+		if (!pull_down)
+			ret = -EINVAL;
+		break;
+
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		val = readl(pctl->cfg_membase + zx_dat->coffset);
+		val = val >> zx_dat->cbitpos;
+		val &= ZX_DRV_MASK;
+		val = val >> ZX_DRV_SHIFT;
+		*config = pinconf_to_config_packed(param, (u16)val);
+		break;
+
+	case PIN_CONFIG_SLEW_RATE:
+		val = readl(pctl->cfg_membase + zx_dat->coffset);
+		val = val >> zx_dat->cbitpos;
+		val &= ZX_SLEW_MASK;
+		val = !!val;
+		*config = pinconf_to_config_packed(param, (u16)val);
+		break;
+
+	case PIN_CONFIG_INPUT_ENABLE:
+		val = readl(pctl->cfg_membase + zx_dat->coffset);
+		val = val >> zx_dat->cbitpos;
+		val &= ZX_INPUT_VAL;
+		ret = val ? 0 : -EINVAL;
+		break;
+
+	default:
+		ret = -ENOTSUPP;
+	}
+
+	return ret;
+}
+
+static int zx_pin_config_set(struct pinctrl_dev *pctldev,
+			     unsigned pin, unsigned long *configs,
+			     unsigned num_configs)
+{
+	struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct pinctrl_pin_desc *pins = pctldev->desc->pins;
+	struct zx_pin_desc_data *zx_dat;
+	u32 val, mask;
+	u16 param, arg;
+	int idx;
+
+	pins += pin;
+	zx_dat = (struct zx_pin_desc_data *)pins->drv_data;
+	if (zx_dat->parent) {
+		pin = zx_dat->parent;
+		pins = pctldev->desc->pins + pin;
+		zx_dat = (struct zx_pin_desc_data *)pins->drv_data;
+	}
+
+	for (idx = 0; idx < num_configs; idx++) {
+		param = pinconf_to_config_param(configs[idx]);
+		arg = pinconf_to_config_argument(configs[idx]);
+
+		pr_debug("PMX CFG PIN#%d [%s] CONFIG PARAM:%d ARG:%d >>>\n",
+			 pin, pins->name, param, arg);
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			mask = ZX_PULL_MASK << zx_dat->cbitpos;
+			val = readl(pctl->cfg_membase + zx_dat->coffset);
+			val = val & ~mask;
+			writel(val | ZX_PULL_UP_VAL << zx_dat->cbitpos,
+				pctl->cfg_membase + zx_dat->coffset);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			mask = ZX_PULL_MASK << zx_dat->cbitpos;
+			val = readl(pctl->cfg_membase + zx_dat->coffset);
+			val = val & ~mask;
+			writel(val | ZX_PULL_DOWN_VAL << zx_dat->cbitpos,
+				pctl->cfg_membase + zx_dat->coffset);
+			break;
+
+		case PIN_CONFIG_POWER_SOURCE:
+			mask = ZX_MSC_MASK << zx_dat->cbitpos;
+			val = readl(pctl->cfg_membase + zx_dat->coffset);
+			val = val & ~mask;
+			writel(val | ZX_MSC_VAL(arg) << zx_dat->cbitpos,
+				pctl->cfg_membase + zx_dat->coffset);
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			mask = ZX_SLEW_MASK << zx_dat->cbitpos;
+			val = readl(pctl->cfg_membase + zx_dat->coffset);
+			val = val & ~mask;
+			writel(val | ZX_SLEW_VAL(arg) << zx_dat->cbitpos,
+				pctl->cfg_membase + zx_dat->coffset);
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			val = readl(pctl->cfg_membase + zx_dat->coffset);
+			writel(val | ZX_INPUT_VAL << zx_dat->cbitpos,
+				pctl->cfg_membase + zx_dat->coffset);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			mask = ZX_DRV_MASK << zx_dat->cbitpos;
+			val = readl(pctl->cfg_membase + zx_dat->coffset);
+			val = val & ~mask;
+			writel(val | ZX_DRV_VAL(arg) << zx_dat->cbitpos,
+				pctl->cfg_membase + zx_dat->coffset);
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops zx_pinconf_ops = {
+	.pin_config_set = zx_pin_config_set,
+	.pin_config_get = zx_pin_config_get,
+	.is_generic = true,
+};
+
+static int zx_pinctrl_add_function(struct zx_pinctrl *pctl, const char *name)
+{
+	struct zx_pinctrl_function *func = pctl->functions;
+
+	while (func->name) {
+		/* function already there */
+		if (strcmp(func->name, name) == 0) {
+			func->ngroups++;
+			return -EEXIST;
+		}
+		func++;
+	}
+
+	func->name = name;
+	func->ngroups = 1;
+	pctl->nfunctions++;
+
+	return 0;
+}
+
+static int zx_pinctrl_build_state(struct platform_device *pdev)
+{
+	struct zx_pinctrl *pctl = platform_get_drvdata(pdev);
+	int i;
+
+	pctl->ngroups = pctl->desc->npins;
+
+	pctl->groups = devm_kzalloc(&pdev->dev,
+				    pctl->ngroups * sizeof(*pctl->groups),
+				    GFP_KERNEL);
+	if (!pctl->groups)
+		return -ENOMEM;
+
+	for (i = 0; i < pctl->desc->npins; i++) {
+		const struct zx_desc_pin *pin = pctl->desc->pins + i;
+		struct zx_pinctrl_group *group = pctl->groups + i;
+
+		group->name = pin->pin.name;
+		group->pin = pin->pin.number;
+	}
+
+	pctl->functions = devm_kzalloc(&pdev->dev,
+				pctl->desc->npins * sizeof(*pctl->functions),
+				GFP_KERNEL);
+	if (!pctl->functions)
+		return -ENOMEM;
+
+	for (i = 0; i < pctl->desc->npins; i++) {
+		const struct zx_desc_pin *pin = pctl->desc->pins + i;
+		struct zx_desc_function *func = pin->functions;
+
+		while (func->name) {
+			zx_pinctrl_add_function(pctl, func->name);
+			func++;
+		}
+	}
+
+	pctl->functions = krealloc(pctl->functions,
+				   pctl->nfunctions * sizeof(*pctl->functions),
+				   GFP_KERNEL);
+
+	for (i = 0; i < pctl->desc->npins; i++) {
+		const struct zx_desc_pin *pin = pctl->desc->pins + i;
+		struct zx_desc_function *func = pin->functions;
+
+		while (func->name) {
+			struct zx_pinctrl_function *func_item;
+			const char **func_grp;
+
+			func_item = zx_pctl_find_function_by_name(pctl,
+								  func->name);
+			if (!func_item)
+				return -EINVAL;
+
+			if (!func_item->groups) {
+				func_item->groups =
+					devm_kzalloc(&pdev->dev,
+						     func_item->ngroups *
+						     sizeof(*func_item->groups),
+						     GFP_KERNEL);
+				if (!func_item->groups)
+					return -ENOMEM;
+			}
+
+			func_grp = func_item->groups;
+			while (*func_grp)
+				func_grp++;
+
+			*func_grp = pin->pin.name;
+			func++;
+		}
+	}
+
+	return 0;
+}
+
+int zx_pinctrl_init(struct platform_device *pdev, struct zx_pinctrl_desc *desc)
+{
+	struct pinctrl_desc *pctrl_desc;
+	struct pinctrl_pin_desc *pins;
+	struct zx_pinctrl *pctl;
+	int i, ret;
+
+	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pctl);
+	spin_lock_init(&pctl->lock);
+	pctl->membase = desc->membase;
+	pctl->aon_membase = desc->aon_membase;
+	pctl->cfg_membase = desc->cfg_membase;
+	pctl->ntop_pins = desc->ntop_pins;
+	pctl->dev = &pdev->dev;
+	pctl->desc = desc;
+
+	ret = zx_pinctrl_build_state(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "dt probe failed: %d\n", ret);
+		return ret;
+	}
+
+	pins = devm_kzalloc(&pdev->dev, pctl->desc->npins * sizeof(*pins),
+			    GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < pctl->desc->npins; i++)
+		pins[i] = pctl->desc->pins[i].pin;
+
+	pctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*pctrl_desc), GFP_KERNEL);
+	if (!pctrl_desc)
+		return -ENOMEM;
+
+	pctrl_desc->name = dev_name(&pdev->dev);
+	pctrl_desc->owner = THIS_MODULE;
+	pctrl_desc->pins = pins;
+	pctrl_desc->npins = pctl->desc->npins;
+	pctrl_desc->pctlops = &zx_pctrl_ops;
+	pctrl_desc->pmxops =  &zx_pmx_ops;
+	pctrl_desc->confops = &zx_pinconf_ops;
+
+	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, pctrl_desc, pctl);
+	if (IS_ERR(pctl->pctl_dev)) {
+		dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
+		return PTR_ERR(pctl->pctl_dev);
+	}
+
+	dev_info(&pdev->dev, "initialized ZX pinctrl driver\n");
+	return 0;
+}
diff --git a/drivers/pinctrl/zte/pinctrl-zx.h b/drivers/pinctrl/zte/pinctrl-zx.h
new file mode 100644
index 0000000..5c5c614
--- /dev/null
+++ b/drivers/pinctrl/zte/pinctrl-zx.h
@@ -0,0 +1,129 @@
+/*
+ * Copyright 2016 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __PINCTRL_ZX_H
+#define __PINCTRL_ZX_H
+
+#define ZX_PULL_DOWN_VAL  1
+#define ZX_PULL_UP_VAL    2
+#define ZX_PULL_MASK      0x3
+#define ZX_MSC_MASK       4
+#define ZX_MSC_VAL(a)     ((a << 2) & ZX_MSC_MASK)
+#define ZX_INPUT_VAL      8
+#define ZX_DRV_MASK       0x70
+#define ZX_DRV_SHIFT      4
+#define ZX_DRV_VAL(a)     ((a << ZX_DRV_SHIFT) & ZX_DRV_MASK)
+#define ZX_SLEW_MASK      0x100
+#define ZX_SLEW_VAL(a)    ((a << 8) & ZX_SLEW_MASK)
+
+struct zx_desc_function {
+	const char	*name;
+	u8		muxval;
+};
+
+struct zx_pin_desc_data {
+	int	parent;
+	u16	offset;
+	u16	coffset; /* config reg offset */
+	u8	bitpos;
+	u8	cbitpos; /* config bit offset */
+	u8	width;
+};
+
+struct zx_desc_pin {
+	struct pinctrl_pin_desc	pin;
+	struct zx_desc_function	*functions;
+};
+
+struct zx_pinctrl_desc {
+	const struct zx_desc_pin	*pins;
+	unsigned			npins;
+	unsigned			ntop_pins;
+	void __iomem                    *membase;
+	void __iomem                    *aon_membase;
+	void __iomem                    *cfg_membase;
+};
+
+struct zx_pinctrl_function {
+	const char	*name;
+	const char	**groups;
+	unsigned	ngroups;
+};
+
+struct zx_pinctrl_group {
+	const char	*name;
+	unsigned long	config;
+	unsigned	pin;
+};
+
+struct zx_pinctrl {
+	void __iomem			*membase;
+	void __iomem			*aon_membase;
+	void __iomem                    *cfg_membase;
+	const struct zx_pinctrl_desc	*desc;
+	struct device			*dev;
+	struct zx_pinctrl_function	*functions;
+	unsigned			nfunctions;
+	unsigned			ntop_pins;
+	struct zx_pinctrl_group		*groups;
+	unsigned			ngroups;
+	spinlock_t			lock;
+	struct pinctrl_dev		*pctl_dev;
+};
+
+#define ZX_PINCTRL_PIN(bank, pin, bitp, wd, coff, cbp) {	\
+	.number = P ## bank ## _BASE + (pin),			\
+	.name = #bank #pin,					\
+	.drv_data = (void *) &(struct zx_pin_desc_data) {	\
+		.parent = 0,					\
+		.offset = P ## bank ## _OFF,			\
+		.bitpos = bitp,					\
+		.width = wd,					\
+		.coffset = coff,				\
+		.cbitpos = cbp,					\
+	},							\
+}
+
+#define ZX_PINCTRL_PIN_WITH_PARENT(bank, pin, bitp, wd, prt) {	\
+	.number = P ## bank ## _BASE + (pin),			\
+	.name = #bank #pin,					\
+	.drv_data = (void *) &(struct zx_pin_desc_data) {	\
+		.parent = prt,					\
+		.offset = P ## bank ## _OFF,			\
+		.bitpos = bitp,					\
+		.width = wd,					\
+	},							\
+}
+
+#define ZX_PINCTRL_AONPIN(bank, pin, bitp, wd, coff, cbp) {	\
+	.number = AONP ## bank ## _BASE + (pin),		\
+	.name = "AON" #bank #pin,				\
+	.drv_data = (void *) &(struct zx_pin_desc_data) {	\
+		.parent = 0,					\
+		.offset = P ## bank ## _OFF,			\
+		.bitpos = bitp,					\
+		.width = wd,					\
+		.coffset = coff,				\
+		.cbitpos = cbp,					\
+	},							\
+}
+
+#define ZX_PIN(_pin, ...)					\
+	{							\
+		.pin = _pin,					\
+		.functions = (struct zx_desc_function[]){	\
+			__VA_ARGS__, { } },			\
+	}
+
+#define ZX_FUNCTION(_val, _name)				\
+	{							\
+		.name = _name,					\
+		.muxval = _val,					\
+	}
+
+int zx_pinctrl_init(struct platform_device *pdev, struct zx_pinctrl_desc *desc);
+#endif
diff --git a/drivers/pinctrl/zte/pinctrl-zx296718.c b/drivers/pinctrl/zte/pinctrl-zx296718.c
new file mode 100644
index 0000000..864271f
--- /dev/null
+++ b/drivers/pinctrl/zte/pinctrl-zx296718.c
@@ -0,0 +1,893 @@
+/*
+ * Copyright (C) 2016 ZTE Semiconductor Corporation.
+ * Copyright (C) 2016 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *
+ * ZX296718 AON pins control high level multiplex and normal pins
+ * may require multiplex configuration of parent AON pins. As the AON pins
+ * number is not as much as normal pins, some normal pins are not routed
+ * through AON pin controller and are under direct control by itself.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-zx.h"
+
+#define PA_OFF 0x0
+#define PA_BASE 0
+#define PA_NR 16
+#define PB_OFF 0x4
+#define PB_BASE (PA_BASE + PA_NR)
+#define PB_NR 16
+#define PC_OFF 0x8
+#define PC_BASE (PB_BASE + PB_NR)
+#define PC_NR 12
+#define PD_OFF 0xc
+#define PD_BASE (PC_BASE + PC_NR)
+#define PD_NR 23
+#define PE_OFF 0x10
+#define PE_BASE (PD_BASE + PD_NR)
+#define PE_NR 14
+#define PF_OFF 0x14
+#define PF_BASE (PE_BASE + PE_NR)
+#define PF_NR 12
+#define PG_OFF 0x18
+#define PG_BASE (PF_BASE + PF_NR)
+#define PG_NR 11
+#define PH_OFF 0x1c
+#define PH_BASE (PG_BASE + PG_NR)
+#define PH_NR 13
+#define PI_OFF 0x20
+#define PI_BASE (PH_BASE + PH_NR)
+#define PI_NR 6
+
+#define AONPA_OFF 0
+#define AONPA_BASE (PI_BASE + PI_NR)
+#define AONPA_NR 14
+#define AONPB_OFF 0x4
+#define AONPB_BASE (AONPA_BASE + AONPA_NR)
+#define AONPB_NR 13
+#define AONPC_OFF 0x8
+#define AONPC_BASE (AONPB_BASE + AONPB_NR)
+
+static const struct zx_desc_pin zx296718_pins[] = {
+	ZX_PIN(ZX_PINCTRL_PIN(A, 0, 0, 2, 0x10, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* gtx clk */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* clk */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio0 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 1, 2, 2, 0x10, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* tx clk */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* vs */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio 1 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 2, 4, 2, 0x10, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd0 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* hs */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio 2 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 3, 6, 2, 0x14, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd1 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d0 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio3 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 4, 8, 2, 0x14, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd2 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d1 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio4 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 5, 10, 2, 0x14, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd3 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d2 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio5 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 6, 12, 2, 0x18, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd4 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d3 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio6 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 7, 14, 2, 0x18, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd5 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d4 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio7 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 8, 16, 2, 0x18, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd6 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d5 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio8 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 9, 18, 2, 0x1c, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* txd7 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d6 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio9 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 10, 20, 2, 0x1c, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* tx_er */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d7 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio10 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 11, 22, 2, 0x1c, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* tx_en */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d8 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio11 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 12, 24, 2, 0x20, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rx_clk */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d9 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio12 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 13, 26, 2, 0x20, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd0 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d10 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio13 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 14, 28, 2, 0x20, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd1 */
+		  ZX_FUNCTION(0x1, "DVI0"),	/* d11 */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio14 */
+	ZX_PIN(ZX_PINCTRL_PIN(A, 15, 30, 2, 0x24, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd2 */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* clk */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio15 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 0, 0, 2, 0x24, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd3 */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* hs */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio16 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 1, 2, 2, 0x24, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd4 */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* vs */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio17 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 2, 4, 2, 0x28, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd5 */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d0 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio18 */
+		  ZX_FUNCTION(0x3, "TSI0")),	/* dat0 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 3, 6, 2, 0x28, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd6 */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d1 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio19 */
+		  ZX_FUNCTION(0x3, "TSI0")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 4, 8, 2, 0x28, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rxd7 */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d2 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio20 */
+		  ZX_FUNCTION(0x3, "TSI0")),	/* sync */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 5, 10, 2, 0x2c, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rx_er */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d3 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio21 */
+		  ZX_FUNCTION(0x3, "TSI0")),	/* valid */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 6, 12, 2, 0x2c, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* rx_dv */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d4 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio22 */
+		  ZX_FUNCTION(0x3, "TSI1")),	/* dat0 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 7, 14, 2, 0x2c, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* col */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d5 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio23 */
+		  ZX_FUNCTION(0x3, "TSI1")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 8, 16, 2, 0x30, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* crs */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d6 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio24 */
+		  ZX_FUNCTION(0x3, "TSI1")),	/* sync */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 9, 18, 2, 0x30, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* mdc */
+		  ZX_FUNCTION(0x1, "DVI1"),	/* d7 */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio25 */
+		  ZX_FUNCTION(0x3, "TSI1")),	/* valid */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 10, 20, 1, 0x30, 18),
+		  ZX_FUNCTION(0x0, "GMII"),	/* mdio */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio26 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 11, 21, 2, 0x34, 18),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* clk */
+		  ZX_FUNCTION(0x1, "USIM0"),	/* clk */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio27 */
+		  ZX_FUNCTION(0x3, "SPINOR")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 12, 23, 2, 0x38, 0),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* cmd */
+		  ZX_FUNCTION(0x1, "USIM0"),	/* cd */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio28 */
+		  ZX_FUNCTION(0x3, "SPINOR")),	/* cs */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 13, 25, 2, 0x38, 9),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* dat0 */
+		  ZX_FUNCTION(0x1, "USIM0"),	/* rst */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio29 */
+		  ZX_FUNCTION(0x3, "SPINOR")),	/* dq0 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 14, 27, 2, 0x38, 18),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* dat1 */
+		  ZX_FUNCTION(0x1, "USIM0"),	/* data */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio30 */
+		  ZX_FUNCTION(0x3, "SPINOR")),	/* dq1 */
+	ZX_PIN(ZX_PINCTRL_PIN(B, 15, 29, 2, 0x3c, 0),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* dat2 */
+		  ZX_FUNCTION(0x1, "BGPIO"),	/* gpio31 */
+		  ZX_FUNCTION(0x2, "SPINOR")),	/* dq2 */
+	ZX_PIN(ZX_PINCTRL_PIN(C, 0, 0, 2, 0x3c, 9),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* dat3 */
+		  ZX_FUNCTION(0x1, "BGPIO"),	/* gpio32 */
+		  ZX_FUNCTION(0x2, "SPINOR")),	/* dq3 */
+	ZX_PIN(ZX_PINCTRL_PIN(C, 1, 2, 2, 0x3c, 18),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* cd */
+		  ZX_FUNCTION(0x1, "BGPIO"),	/* gpio33 */
+		  ZX_FUNCTION(0x2, "ISP")),	/* fl_trig */
+	ZX_PIN(ZX_PINCTRL_PIN(C, 2, 4, 2, 0x40, 0),
+		  ZX_FUNCTION(0x0, "SDIO1"),	/* wp */
+		  ZX_FUNCTION(0x1, "BGPIO"),	/* gpio34 */
+		  ZX_FUNCTION(0x2, "ISP")),	/* ref_clk */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(C, 3, 6, 3, AONPC_BASE),
+		  ZX_FUNCTION(0x0, "SPI1"),	/* clk */
+		  ZX_FUNCTION(0x1, "PCM"),	/* clk */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio35 */
+		  ZX_FUNCTION(0x3, "I2C4"),	/* scl */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* mclk */
+		  ZX_FUNCTION(0x5, "ISP")),	/* flash_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(C, 4, 9, 3, AONPC_BASE + 1),
+		  ZX_FUNCTION(0x0, "SPI1"),	/* cs */
+		  ZX_FUNCTION(0x1, "PCM"),	/* fs */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio36 */
+		  ZX_FUNCTION(0x3, "I2C4"),	/* sda */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* bclk */
+		  ZX_FUNCTION(0x5, "ISP")),	/* prelight_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(C, 5, 12, 3, AONPC_BASE + 2),
+		  ZX_FUNCTION(0x0, "SPI1"),	/* txd */
+		  ZX_FUNCTION(0x1, "PCM"),	/* txd */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio37 */
+		  ZX_FUNCTION(0x3, "UART5"),	/* rxd */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* ws */
+		  ZX_FUNCTION(0x5, "ISP")),	/* shutter_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(C, 6, 15, 3, AONPC_BASE + 3),
+		  ZX_FUNCTION(0x0, "SPI1"),	/* rxd */
+		  ZX_FUNCTION(0x1, "PCM"),	/* rxd */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio38 */
+		  ZX_FUNCTION(0x3, "UART5"),	/* txd */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* dout0 */
+		  ZX_FUNCTION(0x5, "ISP")),	/* shutter_open */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(C, 7, 18, 2, AONPA_BASE),
+		  ZX_FUNCTION(0x0, "I2C3"),	/* scl */
+		  ZX_FUNCTION(0x1, "SPI2"),	/* txd */
+		  ZX_FUNCTION(0x2, "I2S1")),	/* din0 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(C, 8, 20, 2, AONPA_BASE + 1),
+		  ZX_FUNCTION(0x0, "I2C3"),	/* sda */
+		  ZX_FUNCTION(0x1, "SPI2"),	/* rxd */
+		  ZX_FUNCTION(0x2, "I2S0")),	/* mclk */
+	ZX_PIN(ZX_PINCTRL_PIN(C, 9, 22, 3, 0x44, 18),
+		  ZX_FUNCTION(0x0, "USIM1"),	/* cd */
+		  ZX_FUNCTION(0x1, "UART4"),	/* rxd */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio39 */
+		  ZX_FUNCTION(0x3, "SPI3"),	/* clk */
+		  ZX_FUNCTION(0x4, "I2S0"),	/* bclk */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d8 */
+	ZX_PIN(ZX_PINCTRL_PIN(C, 10, 25, 3, 0x4c, 18),
+		  ZX_FUNCTION(0x0, "USIM1"),	/* clk */
+		  ZX_FUNCTION(0x1, "UART4"),	/* txd */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio40 */
+		  ZX_FUNCTION(0x3, "SPI3"),	/* cs */
+		  ZX_FUNCTION(0x4, "I2S0"),	/* ws */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d9 */
+	ZX_PIN(ZX_PINCTRL_PIN(C, 11, 28, 3, 0x4c, 0),
+		  ZX_FUNCTION(0x0, "USIM1"),	/* rst */
+		  ZX_FUNCTION(0x1, "UART4"),	/* cts */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio41 */
+		  ZX_FUNCTION(0x3, "SPI3"),	/* txd */
+		  ZX_FUNCTION(0x4, "I2S0"),	/* dout0 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d10 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 0, 0, 3, 0x4c, 9),
+		  ZX_FUNCTION(0x0, "USIM1"),	/* dat */
+		  ZX_FUNCTION(0x1, "UART4"),	/* rst */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio42 */
+		  ZX_FUNCTION(0x3, "SPI3"),	/* rxd */
+		  ZX_FUNCTION(0x4, "I2S0"),	/* din0 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d11 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 1, 3, 2, AONPC_BASE + 4),
+		  ZX_FUNCTION(0x0, "AUDIO"),	/* detect */
+		  ZX_FUNCTION(0x1, "I2C2"),	/* scl */
+		  ZX_FUNCTION(0x2, "SPI2")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 2, 5, 1, AONPA_BASE + 2),
+		  ZX_FUNCTION(0x0, "I2C2"),	/* sda */
+		  ZX_FUNCTION(0x1, "SPI2")),	/* cs */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 3, 6, 1, 0x58, 0),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* clk */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio43 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 4, 7, 1, 0x58, 9),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* cmd */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio44 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 5, 8, 1, 0x58, 18),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* dat0 */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio45 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 6, 9, 1, 0x5c, 0),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* dat1 */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio46 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 7, 10, 1, 0x5c, 9),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* dat2 */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio47 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 8, 11, 1, 0x5c, 18),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* dat3 */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio48 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 9, 12, 1, 0x60, 0),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* cd */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio49 */
+	ZX_PIN(ZX_PINCTRL_PIN(D, 10, 13, 1, 0x60, 9),
+		  ZX_FUNCTION(0x0, "SDIO0"),	/* wp */
+		  ZX_FUNCTION(0x1, "GPIO")),	/* gpio50 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 11, 14, 2, AONPC_BASE + 5),
+		  ZX_FUNCTION(0x0, "SPDIF"),	/* out */
+		  ZX_FUNCTION(0x1, "PWM"),	/* out0 */
+		  ZX_FUNCTION(0x2, "ISP")),	/* fl_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 12, 16, 1, AONPA_BASE + 7),
+		  ZX_FUNCTION(0x0, "SPI0"),	/* clk */
+		  ZX_FUNCTION(0x1, "ISP")),	/* flash_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 13, 17, 1, AONPA_BASE + 8),
+		  ZX_FUNCTION(0x0, "SPI0"),	/* cs */
+		  ZX_FUNCTION(0x1, "ISP")),	/* prelight_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 14, 18, 1, AONPA_BASE + 9),
+		  ZX_FUNCTION(0x0, "SPI0"),	/* txd */
+		  ZX_FUNCTION(0x1, "ISP")),	/* shutter_trig */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 15, 19, 1, AONPA_BASE + 10),
+		  ZX_FUNCTION(0x0, "SPI0"),	/* rxd */
+		  ZX_FUNCTION(0x1, "ISP")),	/* shutter_open */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 16, 20, 1, AONPA_BASE + 11),
+		  ZX_FUNCTION(0x0, "UART3"),	/* rxd */
+		  ZX_FUNCTION(0x1, "I2S0")),	/* din1 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 17, 21, 2, AONPA_BASE + 12),
+		  ZX_FUNCTION(0x0, "UART3"),	/* txd */
+		  ZX_FUNCTION(0x1, "I2S0"),	/* din2 */
+		  ZX_FUNCTION(0x2, "VGA")),	/* scl */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 18, 23, 2, AONPA_BASE + 13),
+		  ZX_FUNCTION(0x0, "PWM"),	/* out1 */
+		  ZX_FUNCTION(0x1, "I2S0"),	/* din3 */
+		  ZX_FUNCTION(0x2, "VGA")),	/* sda */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 19, 25, 2, AONPB_BASE),
+		  ZX_FUNCTION(0x0, "LCD"),	/* port0 lcd_te */
+		  ZX_FUNCTION(0x1, "I2S0"),	/* dout2 */
+		  ZX_FUNCTION(0x2, "PWM"),	/* out2 */
+		  ZX_FUNCTION(0x3, "VGA")),	/* hs1 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 20, 27, 2, AONPB_BASE + 1),
+		  ZX_FUNCTION(0x0, "LCD"),	/* port1 lcd_te */
+		  ZX_FUNCTION(0x1, "I2S0"),	/* dout3 */
+		  ZX_FUNCTION(0x2, "PWM"),	/* out3 */
+		  ZX_FUNCTION(0x3, "VGA")),	/* vs1 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 21, 29, 1, AONPB_BASE + 2),
+		  ZX_FUNCTION(0x0, "HDMI"),	/* scl */
+		  ZX_FUNCTION(0x1, "UART3")),	/* rxd */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(D, 22, 30, 1, AONPB_BASE + 3),
+		  ZX_FUNCTION(0x0, "HDMI"),	/* sda */
+		  ZX_FUNCTION(0x1, "UART3")),	/* txd */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 0, 0, 2, 0x60, 18),
+		  ZX_FUNCTION(0x0, "TSI0"),	/* dat0 */
+		  ZX_FUNCTION(0x1, "LCD"),	/* clk */
+		  ZX_FUNCTION(0x2, "BGPIO")),	/* gpio51 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 1, 2, 2, 0xa8, 18),
+		  ZX_FUNCTION(0x0, "SPINOR"),	/* clk */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat1 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat0 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio52 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 2, 4, 2, 0x7c, 0),
+		  ZX_FUNCTION(0x0, "TSI2"),	/* dat */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat2 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat1 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio53 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 3, 6, 2, 0x7c, 9),
+		  ZX_FUNCTION(0x0, "TSI2"),	/* clk */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat3 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat2 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio54 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 4, 8, 2, 0x7c, 18),
+		  ZX_FUNCTION(0x0, "TSI2"),	/* sync */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat4 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat3 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio55 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 5, 10, 2, 0x80, 0),
+		  ZX_FUNCTION(0x0, "TSI2"),	/* valid */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat5 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat4 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio56 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 6, 12, 2, 0x80, 9),
+		  ZX_FUNCTION(0x0, "SPINOR"),	/* cs */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat6 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat5 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio57 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 7, 14, 2, 0x80, 18),
+		  ZX_FUNCTION(0x0, "SPINOR"),	/* dq0 */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* dat7 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat6 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio58 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 8, 16, 2, 0x84, 0),
+		  ZX_FUNCTION(0x0, "SPINOR"),	/* dq1 */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* clk */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat7 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio59 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 9, 18, 2, 0x84, 9),
+		  ZX_FUNCTION(0x0, "SPINOR"),	/* dq2 */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* sync */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat8 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio60 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 10, 20, 2, 0x84, 18),
+		  ZX_FUNCTION(0x0, "SPINOR"),	/* dq3 */
+		  ZX_FUNCTION(0x1, "TSI0"),	/* valid */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat9 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio61 */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 11, 22, 3, 0x88, 0),
+		  ZX_FUNCTION(0x0, "VGA"),	/* hs */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat0 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat10 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio62 */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* din1 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 12, 25, 3, 0x88, 9),
+		  ZX_FUNCTION(0x0, "VGA"),	/* vs0 */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat1 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat11 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio63 */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* din2 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* vs */
+	ZX_PIN(ZX_PINCTRL_PIN(E, 13, 28, 3, 0x88, 18),
+		  ZX_FUNCTION(0x0, "TSI3"),	/* dat */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat2 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat12 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio64 */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* din3 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* hs */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 0, 0, 3, 0x8c, 0),
+		  ZX_FUNCTION(0x0, "TSI3"),	/* clk */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat3 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat13 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio65 */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* dout1 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d0 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 1, 3, 3, 0x8c, 9),
+		  ZX_FUNCTION(0x0, "TSI3"),	/* sync */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat4 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat14 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio66 */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* dout2 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d1 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 2, 6, 3, 0x8c, 18),
+		  ZX_FUNCTION(0x0, "TSI3"),	/* valid */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat5 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat15 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio67 */
+		  ZX_FUNCTION(0x4, "I2S1"),	/* dout3 */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d2 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 3, 9, 3, 0x90, 0),
+		  ZX_FUNCTION(0x0, "I2S1"),	/* ws */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat6 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat16 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio68 */
+		  ZX_FUNCTION(0x4, "VGA"),	/* scl */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d3 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 4, 12, 3, 0x90, 9),
+		  ZX_FUNCTION(0x0, "I2S1"),	/* bclk */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* dat7 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat17 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio69 */
+		  ZX_FUNCTION(0x4, "VGA"),	/* sda */
+		  ZX_FUNCTION(0x5, "B_DVI0")),	/* d4 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 5, 15, 2, 0x90, 18),
+		  ZX_FUNCTION(0x0, "I2S1"),	/* mclk */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* clk */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat18 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio70 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 6, 17, 2, 0x94, 0),
+		  ZX_FUNCTION(0x0, "I2S1"),	/* din0 */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* sync */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat19 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio71 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 7, 19, 2, 0x94, 9),
+		  ZX_FUNCTION(0x0, "I2S1"),	/* dout0 */
+		  ZX_FUNCTION(0x1, "TSI1"),	/* valid */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat20 */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio72 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 8, 21, 3, 0x94, 18),
+		  ZX_FUNCTION(0x0, "SPI3"),	/* clk */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* clk */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat21 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio73 */
+		  ZX_FUNCTION(0x4, "UART5"),	/* rxd */
+		  ZX_FUNCTION(0x5, "PCM"),	/* fs */
+		  ZX_FUNCTION(0x6, "I2S0"),	/* din1 */
+		  ZX_FUNCTION(0x7, "B_DVI0")),	/* d5 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 9, 24, 3, 0x98, 0),
+		  ZX_FUNCTION(0x0, "SPI3"),	/* cs */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat0 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat22 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio74 */
+		  ZX_FUNCTION(0x4, "UART5"),	/* txd */
+		  ZX_FUNCTION(0x5, "PCM"),	/* clk */
+		  ZX_FUNCTION(0x6, "I2S0"),	/* din2 */
+		  ZX_FUNCTION(0x7, "B_DVI0")),	/* d6 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 10, 27, 3, 0x98, 9),
+		  ZX_FUNCTION(0x0, "SPI3"),	/* txd */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat1 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* dat23 */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio75 */
+		  ZX_FUNCTION(0x4, "UART5"),	/* cts */
+		  ZX_FUNCTION(0x5, "PCM"),	/* txd */
+		  ZX_FUNCTION(0x6, "I2S0"),	/* din3 */
+		  ZX_FUNCTION(0x7, "B_DVI0")),	/* d7 */
+	ZX_PIN(ZX_PINCTRL_PIN(F, 11, 30, 1, 0xe4, 0),
+		  ZX_FUNCTION(0x0, "NAND"),	/* ldo_ms18_sel */
+		  ZX_FUNCTION(0x1, "BGPIO")),	/* gpio99 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 0, 0, 3, 0x98, 18),
+		  ZX_FUNCTION(0x0, "SPI3"),	/* rxd */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat2 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* stvu_vsync */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio76 */
+		  ZX_FUNCTION(0x4, "UART5"),	/* rts */
+		  ZX_FUNCTION(0x5, "PCM"),	/* rxd */
+		  ZX_FUNCTION(0x6, "I2S0"),	/* dout1 */
+		  ZX_FUNCTION(0x7, "B_DVI1")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 1, 3, 3, 0x9c, 0),
+		  ZX_FUNCTION(0x0, "I2S0"),	/* mclk */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat3 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* stvd */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio77 */
+		  ZX_FUNCTION(0x4, "USIM0"),	/* cd */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* vs */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 2, 6, 3, 0x9c, 9),
+		  ZX_FUNCTION(0x0, "I2S0"),	/* bclk */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat4 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* sthl_hsync */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio78 */
+		  ZX_FUNCTION(0x4, "USIM0"),	/* clk */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* hs */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 3, 9, 3, 0x9c, 18),
+		  ZX_FUNCTION(0x0, "I2S0"),	/* ws */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat5 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* sthr */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio79 */
+		  ZX_FUNCTION(0x4, "USIM0"),	/* rst */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* d0 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 4, 12, 3, 0xa0, 0),
+		  ZX_FUNCTION(0x0, "I2S0"),	/* din0 */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat6 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* OEV_DATAEN */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio80 */
+		  ZX_FUNCTION(0x4, "USIM0"),	/* dat */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* d1 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 5, 15, 2, 0xa0, 9),
+		  ZX_FUNCTION(0x0, "I2S0"),	/* dout0 */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* dat7 */
+		  ZX_FUNCTION(0x2, "LCD"),	/* CKV */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio81 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 6, 17, 3, 0xa0, 18),
+		  ZX_FUNCTION(0x0, "I2C5"),	/* scl */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* sync */
+		  ZX_FUNCTION(0x2, "LCD"),	/* ld */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio82 */
+		  ZX_FUNCTION(0x4, "PWM"),	/* out2 */
+		  ZX_FUNCTION(0x5, "I2S0"),	/* dout2 */
+		  ZX_FUNCTION(0x6, "B_DVI1")),	/* d2 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 7, 20, 3, 0xa4, 0),
+		  ZX_FUNCTION(0x0, "I2C5"),	/* sda */
+		  ZX_FUNCTION(0x1, "TSO1"),	/* vld */
+		  ZX_FUNCTION(0x2, "LCD"),	/* pol */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio83 */
+		  ZX_FUNCTION(0x4, "PWM"),	/* out3 */
+		  ZX_FUNCTION(0x5, "I2S0"),	/* dout3 */
+		  ZX_FUNCTION(0x6, "B_DVI1")),	/* d3 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 8, 23, 3, 0xa4, 9),
+		  ZX_FUNCTION(0x0, "SPI2"),	/* clk */
+		  ZX_FUNCTION(0x1, "TSO0"),	/* clk */
+		  ZX_FUNCTION(0x2, "LCD"),	/* degsl */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio84 */
+		  ZX_FUNCTION(0x4, "I2C4"),	/* scl */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* d4 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 9, 26, 3, 0xa4, 18),
+		  ZX_FUNCTION(0x0, "SPI2"),	/* cs */
+		  ZX_FUNCTION(0x1, "TSO0"),	/* data */
+		  ZX_FUNCTION(0x2, "LCD"),	/* rev */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio85 */
+		  ZX_FUNCTION(0x4, "I2C4"),	/* sda */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* d5 */
+	ZX_PIN(ZX_PINCTRL_PIN(G, 10, 29, 3, 0xa8, 0),
+		  ZX_FUNCTION(0x0, "SPI2"),	/* txd */
+		  ZX_FUNCTION(0x1, "TSO0"),	/* sync */
+		  ZX_FUNCTION(0x2, "LCD"),	/* u_d */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio86 */
+		  ZX_FUNCTION(0x4, "I2C4"),	/* scl */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* d6 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 0, 0, 3, 0xa8, 9),
+		  ZX_FUNCTION(0x0, "SPI2"),	/* rxd */
+		  ZX_FUNCTION(0x1, "TSO0"),	/* vld */
+		  ZX_FUNCTION(0x2, "LCD"),	/* r_l */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio87 */
+		  ZX_FUNCTION(0x4, "I2C3"),	/* sda */
+		  ZX_FUNCTION(0x5, "B_DVI1")),	/* d7 */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(H, 1, 3, 1, AONPB_BASE + 4),
+		  ZX_FUNCTION(0x0, "SPI4"),	/* clk */
+		  ZX_FUNCTION(0x1, "UART1")),	/* rxd */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(H, 2, 4, 1, AONPB_BASE + 5),
+		  ZX_FUNCTION(0x0, "SPI4"),	/* cs */
+		  ZX_FUNCTION(0x1, "UART1")),	/* txd */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(H, 3, 5, 1, AONPB_BASE + 6),
+		  ZX_FUNCTION(0x0, "SPI4"),	/* txd */
+		  ZX_FUNCTION(0x1, "UART2")),	/* rxd */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(H, 4, 6, 1, AONPB_BASE + 7),
+		  ZX_FUNCTION(0x0, "SPI4"),	/* rxd */
+		  ZX_FUNCTION(0x1, "UART2")),	/* txd */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 5, 7, 3, 0x54, 9),
+		  ZX_FUNCTION(0x0, "NAND"),	/* wp */
+		  ZX_FUNCTION(0x1, "PWM"),	/* out2 */
+		  ZX_FUNCTION(0x2, "SPI2"),	/* clk */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio88 */
+		  ZX_FUNCTION(0x4, "TSI0"),	/* dat0 */
+		  ZX_FUNCTION(0x5, "I2S1")),	/* din1 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 6, 10, 3, 0xb8, 0),
+		  ZX_FUNCTION(0x0, "NAND"),	/* boot_pagesize0 */
+		  ZX_FUNCTION(0x1, "PWM"),	/* out3 */
+		  ZX_FUNCTION(0x2, "SPI2"),	/* cs */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio89 */
+		  ZX_FUNCTION(0x4, "TSI0"),	/* clk */
+		  ZX_FUNCTION(0x5, "I2S1")),	/* din2 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 7, 13, 3, 0xb8, 9),
+		  ZX_FUNCTION(0x0, "NAND"),	/* boot_pagesize1 */
+		  ZX_FUNCTION(0x1, "I2C4"),	/* scl */
+		  ZX_FUNCTION(0x2, "SPI2"),	/* txd */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio90 */
+		  ZX_FUNCTION(0x4, "TSI0"),	/* sync */
+		  ZX_FUNCTION(0x5, "I2S1")),	/* din3 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 8, 16, 3, 0xb8, 18),
+		  ZX_FUNCTION(0x0, "NAND"),	/* BOOT_ADDR_CYCLES */
+		  ZX_FUNCTION(0x1, "I2C4"),	/* sda */
+		  ZX_FUNCTION(0x2, "SPI2"),	/* rxd */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio91 */
+		  ZX_FUNCTION(0x4, "TSI0"),	/* valid */
+		  ZX_FUNCTION(0x5, "I2S1")),	/* dout1 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 9, 19, 3, 0xbc, 0),
+		  ZX_FUNCTION(0x0, "NAND"),	/* RDY_BUSY0 */
+		  ZX_FUNCTION(0x1, "I2C2"),	/* scl */
+		  ZX_FUNCTION(0x2, "USIM0"),	/* cd */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio92 */
+		  ZX_FUNCTION(0x4, "TSI1")),	/* data0 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 10, 22, 3, 0xbc, 9),
+		  ZX_FUNCTION(0x0, "NAND"),	/* RDY_BUSY1 */
+		  ZX_FUNCTION(0x1, "I2C2"),	/* sda */
+		  ZX_FUNCTION(0x2, "USIM0"),	/* clk */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio93 */
+		  ZX_FUNCTION(0x4, "TSI1")),	/* clk */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 11, 25, 3, 0xbc, 18),
+		  ZX_FUNCTION(0x0, "NAND"),	/* RDY_BUSY2 */
+		  ZX_FUNCTION(0x1, "UART5"),	/* rxd */
+		  ZX_FUNCTION(0x2, "USIM0"),	/* rst */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio94 */
+		  ZX_FUNCTION(0x4, "TSI1"),	/* sync */
+		  ZX_FUNCTION(0x4, "I2S1")),	/* dout2 */
+	ZX_PIN(ZX_PINCTRL_PIN(H, 12, 28, 3, 0x54, 18),
+		  ZX_FUNCTION(0x0, "NAND"),	/* RDY_BUSY3 */
+		  ZX_FUNCTION(0x1, "UART5"),	/* txd */
+		  ZX_FUNCTION(0x2, "USIM0"),	/* dat */
+		  ZX_FUNCTION(0x3, "BGPIO"),	/* gpio95 */
+		  ZX_FUNCTION(0x4, "TSI1"),	/* valid */
+		  ZX_FUNCTION(0x4, "I2S1")),	/* dout3 */
+	ZX_PIN(ZX_PINCTRL_PIN(I, 0, 0, 2, 0x34, 0),
+		  ZX_FUNCTION(0x0, "GMII"),	/* 125m_in */
+		  ZX_FUNCTION(0x1, "USB2"),	/* 0_drvvbus */
+		  ZX_FUNCTION(0x2, "ISP"),	/* ref_clk */
+		  ZX_FUNCTION(0x3, "BGPIO")),	/* gpio96 */
+	ZX_PIN(ZX_PINCTRL_PIN(I, 1, 2, 2, 0x34, 9),
+		  ZX_FUNCTION(0x0, "GMII"),	/* 50m_out */
+		  ZX_FUNCTION(0x1, "USB2"),	/* 1_drvvbus */
+		  ZX_FUNCTION(0x2, "BGPIO"),	/* gpio97 */
+		  ZX_FUNCTION(0x3, "USB2")),	/* 0_drvvbus */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(I, 2, 4, 1, AONPB_BASE + 11),
+		  ZX_FUNCTION(0x0, "LCD")),	/* port0 lcd_te */
+	ZX_PIN(ZX_PINCTRL_PIN_WITH_PARENT(I, 3, 5, 1, AONPB_BASE + 12),
+		  ZX_FUNCTION(0x0, "LCD")),	/* port1 lcd_te */
+	ZX_PIN(ZX_PINCTRL_PIN(I, 4, 6, 1, 0xc8, 9),
+		  ZX_FUNCTION(0x0, "SPINOR")),	/* SDIO1_CLK_I */
+	ZX_PIN(ZX_PINCTRL_PIN(I, 5, 7, 1, 0xc8, 18),
+		  ZX_FUNCTION(0x0, "SPINOR")),	/* SSCLK_I */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 0, 0, 2, 0x48, 0),
+		  ZX_FUNCTION(0x0, "ANMI"),
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio29 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin0 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int4 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 1, 2, 2, 0x48, 9),
+		  ZX_FUNCTION(0x0, "WD"),	/* rst_b */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio30 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin1 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int5 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 2, 8, 2, 0x50, 0),
+		  ZX_FUNCTION(0x0, "SEC"),	/* en */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio28 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin3 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int7 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 3, 10, 2, 0x50, 9),
+		  ZX_FUNCTION(0x0, "UART0"),	/* rxd */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio20 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin34 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 4, 12, 2, 0x50, 18),
+		  ZX_FUNCTION(0x0, "UART0"),	/* txd */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio21 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin32 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 5, 14, 2, 0x64, 0),
+		  ZX_FUNCTION(0x0, "IR"),	/* in */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio0 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin27 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 6, 16, 2, 0x64, 9),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int0 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio23 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin5 */
+		  ZX_FUNCTION(0x3, "PCU")),	/* test6 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 7, 18, 2, 0x64, 18),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int1 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio24 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin6 */
+		  ZX_FUNCTION(0x3, "PCU")),	/* test0 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 8, 20, 2, 0x68, 0),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int2 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio25 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin7 */
+		  ZX_FUNCTION(0x3, "PCU")),	/* test1 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 9, 22, 2, 0x68, 9),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int3 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio26 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin8 */
+		  ZX_FUNCTION(0x3, "PCU")),	/* test2 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 10, 24, 2, 0x68, 18),
+		  ZX_FUNCTION(0x0, "KEY"),	/* col0 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio5 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin9 */
+		  ZX_FUNCTION(0x3, "PCU")),	/* test3 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 11, 26, 2, 0x6c, 0),
+		  ZX_FUNCTION(0x0, "KEY"),	/* col1 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio6 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin10 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 12, 28, 2, 0x6c, 9),
+		  ZX_FUNCTION(0x0, "KEY"),	/* col2 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio7 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin11 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(A, 13, 30, 2, 0x6c, 18),
+		  ZX_FUNCTION(0x0, "KEY"),	/* row0 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio8 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin33 */
+		  ZX_FUNCTION(0x3, "WD")),	/* rst_b */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 0, 0, 2, 0x70, 0),
+		  ZX_FUNCTION(0x0, "KEY"),	/* row1 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio9 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin12 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 1, 2, 2, 0x70, 9),
+		  ZX_FUNCTION(0x0, "KEY"),	/* row2 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio10 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin13 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 2, 4, 2, 0x70, 18),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test7 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio3 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin14 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 3, 6, 2, 0x74, 0),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test8 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio4 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin15 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 4, 8, 2, 0x78, 18),
+		  ZX_FUNCTION(0x0, "JTAG"),	/* tck */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio11 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin22 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int4 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 5, 10, 2, 0xac, 0),
+		  ZX_FUNCTION(0x0, "JTAG"),	/* trstn */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio12 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin23 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int5 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 6, 12, 2, 0xac, 9),
+		  ZX_FUNCTION(0x0, "JTAG"),	/* tms */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio13 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin24 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int6 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 7, 14, 2, 0xac, 18),
+		  ZX_FUNCTION(0x0, "JTAG"),	/* tdi */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio14 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin25 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int7 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 8, 16, 2, 0xb0, 0),
+		  ZX_FUNCTION(0x0, "JTAG"),	/* tdo */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio15 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin26 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 9, 18, 2, 0xb0, 9),
+		  ZX_FUNCTION(0x0, "I2C0"),	/* scl */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio16 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin28 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 10, 20, 2, 0xb0, 18),
+		  ZX_FUNCTION(0x0, "I2C0"),	/* sda */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio17 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin29 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 11, 22, 2, 0xb4, 0),
+		  ZX_FUNCTION(0x0, "I2C1"),	/* scl */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio18 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin30 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(B, 12, 24, 2, 0xb4, 9),
+		  ZX_FUNCTION(0x0, "I2C1"),	/* sda */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio19 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin31 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 0, 0, 2, 0x40, 9),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int0 */
+		  ZX_FUNCTION(0x1, "PCU"),	/* test12 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin39 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 1, 2, 2, 0x40, 18),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int1 */
+		  ZX_FUNCTION(0x1, "PCU"),	/* test13 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin40 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 2, 4, 2, 0x44, 0),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int2 */
+		  ZX_FUNCTION(0x1, "PCU"),	/* test14 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin41 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 3, 6, 2, 0x44, 9),
+		  ZX_FUNCTION(0x0, "EXT_INT"),	/* int3 */
+		  ZX_FUNCTION(0x1, "PCU"),	/* test15 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin42 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 4, 12, 2, 0x48, 18),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test4 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio27 */
+		  ZX_FUNCTION(0x2, "nonAON"),	/* pin2 */
+		  ZX_FUNCTION(0x3, "EXT_INT")),	/* int16 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 5, 14, 2, 0x78, 9),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test5 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio22 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin4 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 6, 16, 2, 0x74, 9),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test9 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio1 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin16 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 7, 18, 2, 0x74, 18),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test10 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio2 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin17 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 8, 20, 2, 0x78, 0),
+		  ZX_FUNCTION(0x0, "PCU"),	/* test11 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio31 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin43 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 9, 22, 2, 0xc0, 9),
+		  ZX_FUNCTION(0x0, "BOOT"),	/* sel0 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio18 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin18 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 10, 24, 2, 0xc0, 18),
+		  ZX_FUNCTION(0x0, "BOOT"),	/* sel1 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio19 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin19 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 11, 26, 2, 0xc4, 0),
+		  ZX_FUNCTION(0x0, "BOOT"),	/* sel2 */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio20 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin20 */
+	ZX_PIN(ZX_PINCTRL_AONPIN(C, 12, 28, 2, 0xc4, 9),
+		  ZX_FUNCTION(0x0, "DEEPSLP"),	/* deep sleep out_n */
+		  ZX_FUNCTION(0x1, "AGPIO"),	/* agpio21 */
+		  ZX_FUNCTION(0x2, "nonAON")),	/* pin21 */
+};
+
+static struct zx_pinctrl_desc zx296718_pinctrl_data = {
+	.pins = zx296718_pins,
+	.ntop_pins = AONPA_BASE,
+	.npins = ARRAY_SIZE(zx296718_pins),
+};
+
+static int zx296718_pinctrl_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct device_node *np;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	zx296718_pinctrl_data.membase = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(zx296718_pinctrl_data.membase))
+		return PTR_ERR(zx296718_pinctrl_data.membase);
+
+	np = of_find_compatible_node(NULL, NULL, "zte,zx296718-aonpmx");
+	zx296718_pinctrl_data.aon_membase = of_iomap(np, 0);
+	WARN_ON(!zx296718_pinctrl_data.aon_membase);
+	zx296718_pinctrl_data.cfg_membase = zx296718_pinctrl_data.aon_membase;
+
+	return zx_pinctrl_init(pdev, &zx296718_pinctrl_data);
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
+MODULE_DESCRIPTION("ZTE ZX296718 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1

