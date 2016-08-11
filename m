From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Add ZTE ZX SoC pinctrl drivers
Date: Thu, 11 Aug 2016 14:59:05 +0200
Message-ID: <CACRpkdaMi7k9DMEmfv+rqjefGd9vYLkqh34EpTtO3+NqgjhsoA@mail.gmail.com>
References: <1470404897-2786-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34749 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752397AbcHKM7G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 08:59:06 -0400
Received: by mail-oi0-f45.google.com with SMTP id l203so3714321oib.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 05:59:06 -0700 (PDT)
In-Reply-To: <1470404897-2786-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>

On Fri, Aug 5, 2016 at 3:48 PM, Jun Nie <jun.nie@linaro.org> wrote:

> This adds pinctrl driver for ZTE ZX platform. The bit width
> of pinmux register is not unified, so this dedicated driver
> is needed and detail bit width data is store in private data.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
(...)

Device tree binding should be in a separate patch and sent to
devicetree@vger.kernel.org for review so make sure to split
it out for the next iteration.

> +Optional property:
> +- pinctrl-zx,gpio-range : list of value that are used to configure a GPIO
> +  range. They're value of subnode phandle, pin base in pinctrl device, pin
> +  number in this range, GPIO function value of this GPIO range.
> +  The number of parameters is depend on #pinctrl-zx,gpio-range-cells
> +  property.
> +
> +               /* pin base, nr pins & gpio function */
> +               pinctrl-zx,gpio-range = <&range 0 3 0 &range 3 9 1>;

Just use the standard gpio-range bindings from
Documentation/devicetree/bindings/gpio/gpio.txt

I don't see at all why the ZX needs its own homebrewn GPIO
ranges prefixed with pinctrl-zx.

> +Required subnode-properties:
> +
> +- pinctrl-zx,function: declair the subnode as function multiplex subnode
> +- pinctrl-zx,pins: List of strings containing the pin name.
> +- pinctrl-zx,config: List of value to mux required function of the pins listed
> +above to.

Do not cook up custom bindings where standards exists.
Use the standard bindings for function and pins. The value
to the mux should be inside the driver not in the device tree
since it is hardware driving information, not configuration.

Any pin configuration should use the standard bindings
for bias-pull-up; etc.

> +Optional sub-node: In case some pins could be configured as GPIO in the pinmux
> +register, those pins could be defined as a GPIO range. This sub-node is required
> +by pinctrl-zx,gpio-range property.
> +
> +Required properties in sub-node:
> +- #pinctrl-zx,gpio-range-cells : the number of parameters after phandle in
> +  pinctrl-zx,gpio-range property.
> +
> +       range: gpio-range {
> +               #pinctrl-zx,gpio-range-cells = <3>;
> +       };

This is backwards. The convention is that the GPIO driver
defines which ranges it needs on the pin controller, not
the other way around. Just use the standard bindings.

> +pinctrl_global: pinctrl@01462000 {
> +       compatible = "zte,zx296718-pinctrl";
> +       reg = <0x01462000 0x1000>;
> +       pinctrl-zx,gpio-range = <&rangegl 0 11 2 &range 11 3 3>;
> +       rangegl: gpio-range {
> +               #pinctrl-zx,gpio-range-cells = <3>;
> +       }

This

> +
> +       sdio1: sdio1 {
> +               pinctrl-zx,function;
> +               pinctrl-zx,pins = "p1-11", "p1-12", "p1-13", "p2-1";
> +               pinctrl-zx,config = /bits/ 8 <1 1 1 1>;
> +       };

This doesn't seem to need all these strange custom bindings.
function should contain a function name cross-referenced
by the driver, pins can use the standard binding.

The "config" I do not understand at all, and that is a warning
sign because this is supposed to be read and understood
by people. If you need to cross-reference register documentation
etc something is wrong. Please use the standard bindings.

> +++ b/drivers/pinctrl/zte/Kconfig
> @@ -0,0 +1,10 @@
> +config PINCTRL_ZX
> +       bool"ZTE pin controller driver"
> +       select PINMUX
> +       select PINCONF

select GENERIC_PINCONF and use that is my suggestion.
Inspect other drivers using this for inspiration.

> +config PINCTRL_ZX296718
> +       bool "Pinctrl driver data for ZX296718"
> +       depends on OF
> +       default ARCH_ZX296718

Usually it is better to have the platform select the pinctrl
driver than the pinctrl driver defaulting itself.

> +#include <linux/io.h>
> +#include <linux/module.h>

Why module.h when the Kconfig option is bool?

> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/consumer.h>

I don't see why a driver needs to include the consumer
header.

> +#include <linux/pinctrl/machine.h>

I don't see why a driver needs to include the machine header.

(...)
> +int zx_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                     struct device_node *np_config,
> +                     struct pinctrl_map **map, unsigned *num_maps)

Use the utility function pinconf_generic_dt_node_to_map_group()
if possible.

> +void zx_dt_free_map(struct pinctrl_dev *pctldev,
> +                   struct pinctrl_map *map, unsigned num_maps)

Definatly use the library function
pinctrl_utils_free_map() instead of reimplementing it.

I think this driver needs some work. All about simplification
and reuse: look at some other drivers using the standard
features from pin control, look at their device trees and get
inpspired by them.

Yours,
Linus Walleij
