From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [REGRESSION] mux/gpio.c is not able to get any gpio pins
Date: Wed, 17 Jan 2018 10:35:18 +0100
Message-ID: <CACRpkdZz1NqRXtNUUPP8cCkLWo4p6SBBqHV0joXOadN40KjYFg@mail.gmail.com>
References: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
 <CACRpkdZ0zDhxrNoAaytpr2cfMxTNZ4zj+U4WcZSQgVReuUQ=9g@mail.gmail.com> <69f82f18-8334-1b88-97ee-04f77ea1ee03@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69f82f18-8334-1b88-97ee-04f77ea1ee03@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 17, 2018 at 12:57 AM, Peter Rosin <peda@axentia.se> wrote:
> On 2018-01-17 00:18, Linus Walleij wrote:

>> I think gpiod_set_transitory() calls chip->set_config(chip, gpio, packed);
>> which calls  gpiochip_generic_config() which calls
>> pinctrl_gpio_set_config() which calls
>> pinctrl_get_device_gpio_range() which returns -EPROBE_DEFER;
>> if it can't find a range to map the GPIO to pin control.
>>
>> Can you confirm this with e.g. debug prints in
>> pinctrl_get_device_gpio_range() in drivers/pinctrl/core.c?
>
> Yep, a debug print hits, so that that seems to be the origin of
> the -EPROBE_DEFER.

OK we know where it comes from, good.

>> To fix this, I think sx150x_probe() need to be rewritten
>> to register the pin controller first, then the GPIO chip,
>> so the range mapping is up and kicking when the chip gets
>> initialized.
>
> I tried with:

(solution that seems correct)

You should work on top of this change I think.

> No disco. I also tried with the pinctrl_enable call last in the probe
> but that was no different.

This driver does not define a GPIO range for the GPIOchip though.
(No gpiochip_add_ranges) so it is dependent on the DTS
adding a gpio-ranges = <...>; entry.

The only DTS in the kernel tree using this chip does not...

The thing is that when the driver requests generic config by
assigning gpiochip_generic_config() to .set_config() it
agrees to define a range mapping, so it may be breaching this
contract. The primary driver using this method is the Intel driver
in driver/pinctrl/intel/*. and this uses  gpiochip_add_pin_range()
explicitly.

I would first try to add the gpio range in the DTS. Then the
GPIO core will add the range (the code is in drivers/gpio/gpiolib-of.c)
and everything will be happy.

Another solution would be to do what Intel does and add a
static GPIO range. Since the SX150x doesn't seem very
configurable wrt pins-to-gpios mappings, this should be fine.

Yet another solution would be to make a local .set_config() call
that just calls the local function  sx150x_pinconf_set()
in some modified version and thus you break the dependence
between the GPIO and pin controller.

Yours,
Linus Walleij
