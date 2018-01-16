From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [REGRESSION] mux/gpio.c is not able to get any gpio pins
Date: Wed, 17 Jan 2018 00:18:02 +0100
Message-ID: <CACRpkdZ0zDhxrNoAaytpr2cfMxTNZ4zj+U4WcZSQgVReuUQ=9g@mail.gmail.com>
References: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 16, 2018 at 10:47 PM, Peter Rosin <peda@axentia.se> wrote:

> diff between the two:
>
> --- bootlog.good        2018-01-16 22:39:29.196022434 +0100
> +++ bootlog.bad 2018-01-16 22:39:51.474264534 +0100
> @@ -118,7 +118,7 @@
>  0x000000180000-0x0000001a0000 : "oftree"
>  0x000000200000-0x000000700000 : "kernel"
>  0x000000800000-0x000020000000 : "rootfs"
> -gpio-mux mux-controller: 8-way mux-controller registered
> +gpio-mux mux-controller: failed to get gpios: -517
>  NET: Registered protocol family 10
>  Segment Routing with IPv6
>  sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> @@ -128,15 +128,7 @@
>  [drm] No driver support for vblank timestamp query.
>  atmel-hlcdc-display-controller atmel-hlcdc-dc: fb0:  frame buffer device
>  [drm] Initialized atmel-hlcdc 1.0.0 20141504 for atmel-hlcdc-dc on minor 0
> -i2c i2c-0: Added multiplexed i2c bus 3
> -i2c i2c-0: Added multiplexed i2c bus 4
> -i2c i2c-0: Added multiplexed i2c bus 5
> -i2c i2c-0: Added multiplexed i2c bus 6
> -i2c i2c-0: Added multiplexed i2c bus 7
> -i2c i2c-0: Added multiplexed i2c bus 8
> -i2c i2c-0: Added multiplexed i2c bus 9
> -i2c i2c-0: Added multiplexed i2c bus 10
> -i2c-mux-gpmux i2c-mux: 8-port mux on AT91 adapter
> +gpio-mux mux-controller: failed to get gpios: -517

It would be clearer with a trace, really.

Not that I'm especially good at using ftrace myself :/

I think gpiod_set_transitory() calls chip->set_config(chip, gpio, packed);
which calls  gpiochip_generic_config() which calls
pinctrl_gpio_set_config() which calls
pinctrl_get_device_gpio_range() which returns -EPROBE_DEFER;
if it can't find a range to map the GPIO to pin control.

Can you confirm this with e.g. debug prints in
pinctrl_get_device_gpio_range() in drivers/pinctrl/core.c?

To fix this, I think sx150x_probe() need to be rewritten
to register the pin controller first, then the GPIO chip,
so the range mapping is up and kicking when the chip gets
initialized.

Yours,
Linus Walleij
