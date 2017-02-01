From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Wed, 01 Feb 2017 17:21:59 +0200
Message-ID: <2041391.79UjQ7DgUt@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wednesday 25 Jan 2017 19:09:43 Jacopo Mondi wrote:
> Add core module for per-pin Renesas RZ series pin controller.
> The core module allows SoC driver to register their pins and SoC
> specific operations and interfaces with pinctrl and pinmux core on their
> behalf.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/pinctrl/Kconfig             |   1 +
>  drivers/pinctrl/Makefile            |   1 +
>  drivers/pinctrl/rz-pfc/Kconfig      |  18 ++
>  drivers/pinctrl/rz-pfc/Makefile     |   1 +
>  drivers/pinctrl/rz-pfc/pinctrl-rz.c | 447 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/rz-pfc/pinctrl-rz.h | 114 +++++++++
>  6 files changed, 582 insertions(+)
>  create mode 100644 drivers/pinctrl/rz-pfc/Kconfig
>  create mode 100644 drivers/pinctrl/rz-pfc/Makefile
>  create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.c
>  create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.h

As Chris pointed out, s/rz-pfc/renesas/ would be a good idea. This code isn't 
specific to RZ chips (even if it's only used by them at the moment), so the rz 
prefix and suffix should probably replaced with something else (in file names 
and in the code too).

[snip]

> diff --git a/drivers/pinctrl/rz-pfc/Kconfig b/drivers/pinctrl/rz-pfc/Kconfig
> new file mode 100644
> index 0000000..3714c10
> --- /dev/null
> +++ b/drivers/pinctrl/rz-pfc/Kconfig
> @@ -0,0 +1,18 @@
> +#
> +# Renesas RZ pinctrl drivers
> +#
> +
> +if ARCH_RENESAS
> +
> +config PINCTRL_RZ_PINCTRL

You can add a

	depends on ARCH_RENESAS

to replace the above if. It should actually be

	depends on ARCH_RENESAS || COMPILE_TEST

to extend compile-test coverage. An even better option could be to drop the 
depends line completely, and replace def_bool with bool. That way the option 
will only be enabled if explicitly selected by another option (as done in 
patch 2/5).

> +	select PINMUX
> +	select PINCONF
> +	select GPIOLIB
> +	select GENERIC_PINCONF
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GENERIC_PINCTRL_GROUPS
> +	def_bool y

Won't this enable the driver by default on all platforms, while only RZ needs 
it ? It's also customary to have the bool/tristate line as the very first line 
in the config option.

> +	help
> +	  This enables pin control drivers for Renesas RZ platforms
> +
> +endif

[snip]

> diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rz.c
> b/drivers/pinctrl/rz-pfc/pinctrl-rz.c new file mode 100644
> index 0000000..3efbf03
> --- /dev/null
> +++ b/drivers/pinctrl/rz-pfc/pinctrl-rz.c
> @@ -0,0 +1,447 @@
> +/*
> + * Pinctrl support for Renesas RZ Series
> + *
> + * Copyright (C) 2017 Jacopo Mondi
> + * Copyright (C) 2017 Renesas Electronics Corporation
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +

No need for a blank line here.

> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +

Or here.

> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "../core.h"
> +#include "../devicetree.h"
> +#include "../pinmux.h"
> +
> +#include "pinctrl-rz.h"
> +
> +#define DRIVER_NAME		"rz-pinctrl"
> +#define RZ_PIN_ARGS_COUNT	3
> +
> +/**
> + * rz_pinctrl_pos_to_index() - Retrieve the index of pin at position
> [bank:pin]
> + *
> + * This can be improved, as it walks all the pins reported by the SoC
> driver
> + *
> + * @return: pin number between [0 - npins]; -1 if not found
> + */
> +static int rz_pinctrl_pos_to_index(struct rz_pinctrl_dev *rz_pinctrl,
> +				   unsigned int bank, unsigned int pin)
> +{
> +	struct rz_pinctrl_info *info;
> +	struct rz_pin_desc *rz_pin;
> +	int i, npins;

i and npins are never negative, you can make them unsigned int. One variable 
declaration per line is also preferred.

> +
> +	info = rz_pinctrl->info;

You can move this to the variable declaration line.

> +	npins = info->npins;
> +	for (i = 0; i < npins; ++i) {

You can drop the npins variable and use info->npins directly.

> +		rz_pin = &info->pins[i];
> +
> +		/*
> +		 * return the pin index in the array, not the pin number,
> +		 * so that we can access it easily when muxing group's pins

Please start sentences with a capital letter and end them with a period.

> +		 */
> +		if (rz_pin->bank == bank && rz_pin->pin == pin)
> +			return i;
> +	}
> +
> +	return -1;

How about -EINVAL ? -1 is -EPERM, which would not be an appropriate error code 
if you end up leaking it to upper layers.

> +}
> +
> +/* ------------------------------------------------------------------------
> + * pinctrl operations
> + */
> +static void rz_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file
> *s,
> +			    unsigned int pin)
> +{
> +	struct rz_pinctrl_dev *rz_pinctrl;
> +	struct rz_pinctrl_info *info;
> +
> +	rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
> +	info = rz_pinctrl->info;

You can also assign at declaration time here.

> +	seq_printf(s, "%s %s\n", info->pins[pin].name, DRIVER_NAME);

The pinctrl core already prints the pin name:

                seq_printf(s, "pin %d (%s) ", pin, desc->name);

                /* Driver-specific info per pin */
                if (ops->pin_dbg_show)
                        ops->pin_dbg_show(pctldev, s, pin);

You can just print the driver name here. I'm actually wondering whether 
printing the driver name is useful, or if we could simply drop this function.

> +}
> +
> +/**
> + * rz_dt_node_to_map() - Parse device tree nodes and collect pins, groups
> and
> + *			 functions

I don't think we have groups and functions, do we ?

> + *
> + * Pins for RZ series pin controller described by "renesas-rz,pins"
> property
> + * are arrays of u32 values in the form:

As mentioned elsewhere, "renesas,pins" will do. We could even use "pins", but 
then we'd have to comply with the pinctrl generic bindings (with a bin number 
in the first call instead of separate bank and pin for instance).

> + *
> + * "renesas-rz,pins" = <BANK PIN MUX>, ... ;
> + *
> + * Parse the list arguments and identify pins through their position
> + * (bank and pin offset) and save the provided mux mode for later use.
> + *
> + * TODO: the array can be expended to support additional parameters for
> + *	 pin configurations values (IO direction etc)
> + *
> + * @pctldev: pin controller device
> + * @np_config: device tree node to parse
> + * @map: pointer to pin map (output)
> + * @num_maps: number of collected maps (output)
> + *
> + * @return: 0 for success; != 0 otherwise

"; a negative error code otherwise" ? The function never returns a positive 
value.

I don't think kerneldoc uses @return. Please try to compile the documentation 
and fix errors and warnings.

> + */
> +static int rz_dt_node_to_map(struct pinctrl_dev *pctldev,
> +			     struct device_node *np_config,
> +			     struct pinctrl_map **map, unsigned int *num_maps)
> +{
> +	struct rz_pinctrl_dev *rz_pinctrl;
> +	const char *prop_name = "renesas-rz,pins",
> +		   *grpname, **fngrps;
> +	unsigned int *grpins,
> +		     *mux_modes;

One variable declaration per line please.

> +	int i, npins, ret;

i is never negative, you can make it an unsigned int.

> +
> +	rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);

You can initialize the variable at declaration time.

> +	npins = pinctrl_count_index_with_args(np_config, prop_name);
> +	if (npins <= 0) {
> +		dev_err(rz_pinctrl->dev, "Missing pins configuration prop\n");

Maybe (... "Missing %s property\n", prop_name); to be more explicit ?

> +		return -EINVAL;
> +	}
> +
> +	mux_modes = devm_kzalloc(rz_pinctrl->dev, sizeof(*mux_modes) * npins,
> +				 GFP_KERNEL);
> +	grpins = devm_kzalloc(rz_pinctrl->dev, sizeof(*grpins) * npins,
> +			      GFP_KERNEL);

As explained in another e-mail, you can use kzalloc() here instead of 
devm_kzalloc(). Or, even better, kcalloc().

> +	if (unlikely(!grpins || !mux_modes))
> +		return -ENOMEM;
> +
> +	/*
> +	 * functions are made of 1 group only;
> +	 * in facts, functions and groups are identical for RZ pin controller,
> +	 * except that functions carry an array of mux modes (aka alternate
> +	 * functions IDs)
> +	 */
> +	fngrps = devm_kzalloc(rz_pinctrl->dev, sizeof(*fngrps), GFP_KERNEL);
> +	if (unlikely(!fngrps)) {
> +		ret = -ENOMEM;
> +		goto free_pins;
> +	}
> +
> +	*num_maps = 0;
> +	(*map) = devm_kzalloc(rz_pinctrl->dev, sizeof(**map), GFP_KERNEL);

No need for parentheses around *map.

> +	if (unlikely(!*map)) {
> +		ret = -ENOMEM;
> +		goto free_fngrps;
> +	}
> +
> +	/* collect pin numbers and mux confs to create groups and functions */
> +	for (i = 0; i < npins; ++i) {
> +		struct of_phandle_args of_pins_args;
> +		unsigned int bank, offs, mode, pin_idx;

You can spell offset fully.

> +
> +		/* DTS identifies pin by position: bank and pin offset */
> +		ret = pinctrl_parse_index_with_args(np_config, prop_name, i,
> +						    &of_pins_args);
> +		if (ret)
> +			goto free_map;
> +
> +		if (of_pins_args.args_count < RZ_PIN_ARGS_COUNT) {
> +			dev_err(rz_pinctrl->dev,
> +				"Wrong arguments number for renesas-rz,pins");
> +			ret = -EINVAL;
> +			goto free_map;
> +		}
> +
> +		bank = of_pins_args.args[0];
> +		offs = of_pins_args.args[1];
> +		mode = of_pins_args.args[2];
> +
> +		/* pin_idx is the index on the static pin array */
> +		pin_idx = rz_pinctrl_pos_to_index(rz_pinctrl, bank, offs);
> +		if (pin_idx < 0) {
> +			dev_err(rz_pinctrl->dev,
> +				"Invalid pin position %d-%d\n", bank, offs);

bank and offset are unsigned, you should use %u.

> +			ret = -EINVAL;
> +			goto free_map;
> +		}
> +
> +		grpins[i] = pin_idx;
> +		mux_modes[i] = mode;
> +	}
> +
> +	grpname = np_config->name;
> +	fngrps[0] = grpname;
> +
> +	mutex_lock(&rz_pinctrl->mutex);

This seems weird. The pinctrl generic functions indeed state that the caller 
must take care of locking, but there doesn't seem to be any lock protecting 
races between .dt_node_to_map() calling the generic functions below, and the 
generic .get_group_*() handlers.

> +	ret = pinctrl_generic_add_group(pctldev, grpname, grpins, npins, 
NULL);
> +	if (ret) {
> +		mutex_unlock(&rz_pinctrl->mutex);
> +		goto free_map;
> +	}
> +
> +	ret = pinmux_generic_add_function(pctldev, grpname, fngrps,
> +					  1, mux_modes);
> +	if (ret) {
> +		mutex_unlock(&rz_pinctrl->mutex);
> +		goto free_map;
> +	}
> +	mutex_unlock(&rz_pinctrl->mutex);
> +
> +	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> +	(*map)->data.mux.group = grpname;
> +	(*map)->data.mux.function = grpname;
> +	*num_maps = 1;
> +
> +	return 0;
> +
> +free_map:
> +	devm_kfree(rz_pinctrl->dev, *map);
> +free_fngrps:
> +	devm_kfree(rz_pinctrl->dev, fngrps);
> +free_pins:
> +	devm_kfree(rz_pinctrl->dev, mux_modes);
> +	devm_kfree(rz_pinctrl->dev, grpins);
> +	return ret;
> +}
> +
> +/**
> + * rz_dt_free_map()
> + */
> +static void rz_dt_free_map(struct pinctrl_dev *pctldev,
> +			   struct pinctrl_map *map, unsigned int num_maps)
> +{
> +	struct rz_pinctrl_dev *rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	devm_kfree(rz_pinctrl->dev, map);

Shouldn't you also free the other allocated pieces of memory (fngrps, 
mux_modes and grpins) ?

> +}
> +
> +static const struct pinctrl_ops rz_pinctrl_ops = {
> +	.get_groups_count = pinctrl_generic_get_group_count,
> +	.get_group_name = pinctrl_generic_get_group_name,
> +	.get_group_pins = pinctrl_generic_get_group_pins,
> +	.pin_dbg_show = rz_pin_dbg_show,
> +	.dt_node_to_map = rz_dt_node_to_map,
> +	.dt_free_map = rz_dt_free_map,
> +};
> +
> +/* ------------------------------------------------------------------------
> + * pinconfig operations
> + */
> +
> +/* TODO */

Yes ? :-)

> +/* ------------------------------------------------------------------------
> + * pinmux operations
> + */
> +
> +/**
> + * rz_pinmux_set() - Retrieve pins from a group and apply mux settings
> + *
> + * @pctldev: pin controller device
> + * @selector: Function selector
> + * @group: Group selector
> + * @return: 0 for success; != otherwise

Same comment as above.

> + */
> +static int rz_pinmux_set(struct pinctrl_dev *pctldev, unsigned int
> selector,
> +			 unsigned int group)
> +{
> +	struct rz_pinctrl_dev *rz_pinctrl;
> +	struct rz_pinctrl_info *info;
> +	struct rz_pinctrl_ops *ops;
> +	struct group_desc *grp;
> +	struct function_desc *func;
> +	unsigned int npins, *mux_modes;
> +	int i;

i is never negative.

> +
> +	rz_pinctrl = pinctrl_dev_get_drvdata(pctldev);
> +	info = rz_pinctrl->info;
> +	ops = info->ops;

You can do this at variable declaration time.

> +	grp = pinctrl_generic_get_group(pctldev, group);
> +	if (!grp)
> +		return -EINVAL;
> +
> +	func = pinmux_generic_get_function(pctldev, selector);
> +	if (!func)
> +		return -EINVAL;
> +
> +	npins = grp->num_pins;

No need for an intermediate variable, use grp->num_pins directly.

> +	mux_modes = (unsigned int *)func->data;
> +
> +	for (i = 0; i < npins; ++i) {
> +		unsigned int pin_idx, mux_mode;
> +		struct rz_pin_desc *pin;
> +		int ret;
> +
> +		/*
> +		 * use pin index to retrieve pin descriptor;
> +		 * then provide it to the set_mux SoC operation
> +		 */
> +		pin_idx = grp->pins[i];
> +		pin = &info->pins[pin_idx];
> +		mux_mode = mux_modes[i];
> +
> +		if (!ops || !ops->set_mux) {
> +			dev_err(rz_pinctrl->dev, "Pin muxing not 
supported\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = ops->set_mux(rz_pinctrl, pin, mux_mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +struct pinmux_ops rz_pinmux_ops = {
> +	.get_functions_count = pinmux_generic_get_function_count,
> +	.get_function_name = pinmux_generic_get_function_name,
> +	.get_function_groups = pinmux_generic_get_function_groups,
> +	.set_mux = rz_pinmux_set,
> +};
> +
> +/* ------------------------------------------------------------------------
> + * rz pinctrl operations
> + */
> +
> +/**
> + * rz_add_pins() - Enumerate pins reported by SoC driver in pin desc array

Does this function really enumerate pins ?
> + *
> + * @rz_pinctrl: RZ pincontroller
> + *
> + * @return: 0 for success; != 0 otherwise

Same as above, and some comment for below.

> + */
> +static int rz_add_pins(struct rz_pinctrl_dev *rz_pinctrl)
> +{
> +	struct rz_pinctrl_info *info;
> +	struct rz_pin_desc *pin;
> +	unsigned int npins, i;
> +
> +	info = rz_pinctrl->info;
> +	npins = info->npins;

Fold this with variable declaration. I'd get rid of the npins variable, you 
can use info->npins.

> +	rz_pinctrl->pins = devm_kzalloc(rz_pinctrl->dev,
> +					npins * sizeof(*rz_pinctrl->pins),
> +					GFP_KERNEL);

kcalloc.

> +	if (unlikely(!rz_pinctrl->pins))
> +		return -ENOMEM;
> +
> +	rz_pinctrl->desc.pins = rz_pinctrl->pins;
> +	rz_pinctrl->desc.npins = npins;
> +
> +	for (i = 0; i < npins; ++i) {
> +		pin = &info->pins[i];
> +
> +		rz_pinctrl->pins[i].number = pin->number;
> +		rz_pinctrl->pins[i].name = pin->name;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * rz_pinctrl_map_res() - Map memory resources for pincontroller

You can call the function ..._map_resources.

> + * @pdev: platform device
> + * @rz_pincrl: RZ pincontroller
> + *
> + * @return: 0 for success; != 0 otherwise
> + */
> +static int rz_pinctrl_map_res(struct platform_device *pdev,
> +			      struct rz_pinctrl_dev *rz_pinctrl)
> +{
> +	struct resource *res;
> +	struct rz_pinctrl_res *rz_res;
> +	unsigned int i, nres;
> +
> +	nres = pdev->num_resources;
> +	rz_res = devm_kzalloc(&pdev->dev, nres * sizeof(*rz_res),
> +			      GFP_KERNEL);

kcalloc() here too.

> +	if (unlikely(!rz_res))
> +		return -ENOMEM;
> +
> +	rz_pinctrl->nres = nres;
> +	rz_pinctrl->res = rz_res;
> +
> +	for (i = 0; i < nres; i++) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		if (!res)
> +			return -ENODEV;
> +
> +		rz_res = &rz_pinctrl->res[i];
> +
> +		rz_res->start = res->start;
> +		rz_res->size = resource_size(res);

If you remove the debugging statement from patch 2/5 you can drop the start 
and size fields.

> +		rz_res->base = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(rz_res->base))
> +			return PTR_ERR(rz_res->base);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * rz_pinctrl_probe() - Register pincontroller driver operations
> + *
> + * @pdev: platform device
> + * @info: SoC device info structure
> + */
> +int rz_pinctrl_probe(struct platform_device *pdev, struct rz_pinctrl_info
> *info)
> +{
> +	int ret;
> +	struct rz_pinctrl_dev *rz_pinctrl;
> +
> +	rz_pinctrl = devm_kzalloc(&pdev->dev, sizeof(*rz_pinctrl), 
GFP_KERNEL);

kzalloc()

> +	if (!rz_pinctrl)
> +		return -ENOMEM;
> +
> +	rz_pinctrl->dev = &pdev->dev;
> +	rz_pinctrl->info = info;
> +
> +	ret = rz_pinctrl_map_res(pdev, rz_pinctrl);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, rz_pinctrl);
> +
> +	rz_pinctrl->desc.name = DRIVER_NAME;
> +	rz_pinctrl->desc.pctlops = &rz_pinctrl_ops;
> +	rz_pinctrl->desc.pmxops = &rz_pinmux_ops;
> +	rz_pinctrl->desc.owner = THIS_MODULE;
> +
> +	ret = rz_add_pins(rz_pinctrl);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&rz_pinctrl->mutex);

I'd move this earlier, to make sure the mutex is initialized before it gets 
used in case we start using it in rz_pinctrl_map_res() or rz_add_pins() later.

> +	ret = pinctrl_register_and_init(&rz_pinctrl->desc, rz_pinctrl->dev,
> +					rz_pinctrl, &rz_pinctrl->pctl);
> +	if (ret) {
> +		dev_err(&pdev->dev, "could not register rz pinctrl driver\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void rz_pinctrl_remove(struct platform_device *pdev)
> +{
> +	struct rz_pinctrl_dev *rz_pinctrl = platform_get_drvdata(pdev);
> +
> +	pinctrl_unregister(rz_pinctrl->pctl);
> +}

The code is always compiled in, and the device never goes away. I'd drop 
remove support, as it's completely useless. You then need to set the 
device_driver structure suppress_bind_attrs field.

> +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
> +MODULE_DESCRIPTION("Pinctrl driver for Reneas RZ series");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rz.h
> b/drivers/pinctrl/rz-pfc/pinctrl-rz.h new file mode 100644
> index 0000000..b873c89
> --- /dev/null
> +++ b/drivers/pinctrl/rz-pfc/pinctrl-rz.h
> @@ -0,0 +1,114 @@
> +/*
> + * Pinctrl support for Renesas RZ Series
> + *
> + * Copyright (C) 2017 Jacopo Mondi
> + * Copyright (C) 2017 Renesas Electronics Corporation
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +#ifndef __RZ_PINCTRL_H__
> +#define __RZ_PINCTRL_H__
> +
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/types.h>
> +
> +/*
> ---------------------------------------------------------------------------
> - + * pinctrl-rz data types
> + */
> +#define RZ_PIN_NAME(bank, pin)						
\
> +	PIN_##bank##_##pin
> +
> +#define RZ_PIN_DESC(b, p)						\
> +	{ .number = RZ_PIN_NAME(b, p),					\
> +	  .name = __stringify(RZ_PIN_NAME(b, p)),			\
> +	  .bank = b, .pin = p }
> +
> +/**
> + * rz_pin_desc - Single RZ pin descriptor
> + *
> + * @number: pin number as enumerated by SoC driver
> + * @name: pin name as reported by SoC driver
> + * @bank: pin bank location
> + * @pin: pin register offset
> + */
> +struct rz_pin_desc {
> +	unsigned int bank, pin;
> +	unsigned int number;
> +	const char *name;
> +};
> +
> +/**
> + * rz_pinctrl_info - SoC info data
> + *
> + * @ops: SoC specific operations
> + * @npins: number of pins
> + * @pins: pin array
> + */
> +struct rz_pinctrl_ops;
> +struct rz_pinctrl_info {
> +	struct rz_pinctrl_ops *ops;
> +
> +	unsigned int npins;
> +	struct rz_pin_desc *pins;
> +};
> +
> +/**
> + * rz_pinctrl_res - Memory resource for RZ SoC
> + *
> + * @start: physical address base
> + * @size: memory region size
> + * @base: logical address base
> + */
> +struct rz_pinctrl_res {
> +	resource_size_t start;
> +	resource_size_t size;
> +	void __iomem *base;
> +};
> +
> +/**
> + * rz_pinctrl_dev - RZ pincontroller device
> + *
> + * @dev: device
> + * @info: SoC data
> + * @nres: number of memory regions
> + * @res: memory regions
> + * @mutex: protect pin*_generic functions
> + * @pins: pin array for pinctrl core
> + * @desc: pincontroller desc for pinctrl core
> + * @pctl: pinctrl device
> + */
> +struct rz_pinctrl_dev {
> +	struct device *dev;
> +
> +	struct rz_pinctrl_info *info;
> +
> +	unsigned int nres;
> +	struct rz_pinctrl_res *res;
> +
> +	struct mutex mutex;
> +
> +	struct pinctrl_pin_desc *pins;
> +	struct pinctrl_desc desc;
> +	struct pinctrl_dev *pctl;
> +};
> +
> +/**
> + * rz_pinctrl_ops - SoC operations
> + *
> + * @set_mux: perform pin muxing on SoC registers
> + */
> +struct rz_pinctrl_ops {
> +	int (*set_mux)(struct rz_pinctrl_dev *, struct rz_pin_desc *,
> +		       unsigned int mux_mode);
> +};
> +
> +/* ------------------------------------------------------------------------
> + * pinctrl-rz prototypes
> + */
> +int rz_pinctrl_probe(struct platform_device *pdev,
> +		     struct rz_pinctrl_info *info);
> +void rz_pinctrl_remove(struct platform_device *pdev);
> +
> +#endif

-- 
Regards,

Laurent Pinchart
