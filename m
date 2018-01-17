From: Peter Rosin <peda@axentia.se>
Subject: Re: [REGRESSION] mux/gpio.c is not able to get any gpio pins
Date: Wed, 17 Jan 2018 11:39:11 +0100
Message-ID: <ba2e879c-3b44-e31e-055f-bf7ccd7961aa@axentia.se>
References: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
 <CACRpkdZ0zDhxrNoAaytpr2cfMxTNZ4zj+U4WcZSQgVReuUQ=9g@mail.gmail.com>
 <69f82f18-8334-1b88-97ee-04f77ea1ee03@axentia.se>
 <CACRpkdZz1NqRXtNUUPP8cCkLWo4p6SBBqHV0joXOadN40KjYFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZz1NqRXtNUUPP8cCkLWo4p6SBBqHV0joXOadN40KjYFg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 2018-01-17 10:35, Linus Walleij wrote:
> On Wed, Jan 17, 2018 at 12:57 AM, Peter Rosin <peda@axentia.se> wrote:
>> On 2018-01-17 00:18, Linus Walleij wrote:
> 
>>> I think gpiod_set_transitory() calls chip->set_config(chip, gpio, packed);
>>> which calls  gpiochip_generic_config() which calls
>>> pinctrl_gpio_set_config() which calls
>>> pinctrl_get_device_gpio_range() which returns -EPROBE_DEFER;
>>> if it can't find a range to map the GPIO to pin control.
>>>
>>> Can you confirm this with e.g. debug prints in
>>> pinctrl_get_device_gpio_range() in drivers/pinctrl/core.c?
>>
>> Yep, a debug print hits, so that that seems to be the origin of
>> the -EPROBE_DEFER.
> 
> OK we know where it comes from, good.
> 
>>> To fix this, I think sx150x_probe() need to be rewritten
>>> to register the pin controller first, then the GPIO chip,
>>> so the range mapping is up and kicking when the chip gets
>>> initialized.
>>
>> I tried with:
> 
> (solution that seems correct)

Which is more correct, to have the pinctrl_enable at the end of the
probe or directly after devm_pinctrl_register_and_init()?

> You should work on top of this change I think.
> 
>> No disco. I also tried with the pinctrl_enable call last in the probe
>> but that was no different.
> 
> This driver does not define a GPIO range for the GPIOchip though.
> (No gpiochip_add_ranges) so it is dependent on the DTS
> adding a gpio-ranges = <...>; entry.
> 
> The only DTS in the kernel tree using this chip does not...

I'm using arch/arm/boot/dts/at91-nattis-2-natte-2.dts which
includes at91-natte.dtsi which has the node with the sx1502q
in question. This is in -next.

> The thing is that when the driver requests generic config by
> assigning gpiochip_generic_config() to .set_config() it
> agrees to define a range mapping, so it may be breaching this
> contract. The primary driver using this method is the Intel driver
> in driver/pinctrl/intel/*. and this uses  gpiochip_add_pin_range()
> explicitly.
> 
> I would first try to add the gpio range in the DTS. Then the
> GPIO core will add the range (the code is in drivers/gpio/gpiolib-of.c)
> and everything will be happy.

If I, in the above mentioned node, add

		gpio-ranges = <&ioexp 0 0 8>;

it works.

> Another solution would be to do what Intel does and add a
> static GPIO range. Since the SX150x doesn't seem very
> configurable wrt pins-to-gpios mappings, this should be fine.

Adding the below on top of the previous pinctrl/gpiochip reshuffle
also works (with the dt change reverted, of course).

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 049dd15e04ef..cbf58a10113d 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1193,6 +1193,11 @@ static int sx150x_probe(struct i2c_client *client,
        if (ret)
                return ret;

+       ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
+                                    0, 0, pctl->data->npins);
+       if (ret)
+               return ret;
+
        /* Add Interrupt support if an irq is specified */
        if (client->irq > 0) {
                pctl->irq_chip.name = devm_kstrdup(dev, client->name,

> Yet another solution would be to make a local .set_config() call
> that just calls the local function  sx150x_pinconf_set()
> in some modified version and thus you break the dependence
> between the GPIO and pin controller.

Didn't try that, the above seems better anyway. I'll send
patches shortly, but please state where you want that pinctrl_enable
call; together with devm_pinctrl_register_and_init (or perhaps
just use plain old deprecated devm_pinctrl_register), or at the
end of the probe, after the gpio init block?

Cheers,
Peter
