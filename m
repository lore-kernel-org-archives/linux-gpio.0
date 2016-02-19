From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sirf/atlas7: stop poking around in GPIO internals
Date: Fri, 19 Feb 2016 09:21:35 +0100
Message-ID: <CACRpkda7HTW-kG+1A6s6qRm8Obwfn3Weq5d_70RaMCfFgvJb-Q@mail.gmail.com>
References: <1455265873-21534-1-git-send-email-linus.walleij@linaro.org>
	<CAGsJ_4zHEtmHmxbprnc=1qOXgk3G_pqyueHke8PusMKNP_rmmg@mail.gmail.com>
	<CACRpkdb8SVGdwhY9zsYxZQ5H2R-qd1v7iFek3SwdtAnWr41DaA@mail.gmail.com>
	<CAGsJ_4xf22j-QDxujuRzUY8eG9krR3Uy+_ZsqAoEUCamYV4PWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGsJ_4xf22j-QDxujuRzUY8eG9krR3Uy+_ZsqAoEUCamYV4PWQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Barry Song <baohua@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Guoying Zhang <Guoying.Zhang@csr.com>, Wei Chen <Wei.Chen@csr.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 19, 2016 at 4:21 AM, Barry Song <baohua@kernel.org> wrote:
> 2016-02-19 4:42 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Thu, Feb 18, 2016 at 3:50 AM, Barry Song <baohua@kernel.org> wrote:
>>
>>> gpiochip_add(chip will call this automatically since range is set in dtsi:
>>> gpio_0: gpio_mediam@17040000 {
>>> #gpio-cells = <2>;
>>> #interrupt-cells = <2>;
>>> compatible = "sirf,atlas7-gpio";
>>> reg = <0x17040000 0x1000>;
>>> interrupts = <0 13 0>, <0 14 0>;
>>> clocks = <&car 98>;
>>> clock-names = "gpio0_io";
>>> gpio-controller;
>>> interrupt-controller;
>>>
>>> gpio-banks = <2>;
>>> gpio-ranges = <&pinctrl 0 0 0>,
>>> <&pinctrl 32 0 0>;
>>> gpio-ranges-group-names = "lvds_gpio_grp",
>>> "jtag_uart_nand_gpio_grp";
>>
>> Aha I see.
>>
>>>> -
>>>> -               /* Records gpio_pin_range to a7gc */
>>>> -               list_for_each_entry(pin_range, &chip->pin_ranges, node) {
>>>> -                       struct pinctrl_gpio_range *range;
>>>> -
>>>> -                       range = &pin_range->range;
>>>> -                       if (range->id == NGPIO_OF_BANK * idx) {
>>>> -                               bank->gpio_offset = range->id;
>>>> -                               bank->ngpio = range->npins;
>>>> -                               bank->gpio_pins = range->pins;
>>>> -                               bank->pctldev = pin_range->pctldev;
>>>> -                               break;
>>>> -                       }
>>>> -               }
>>>> -
>>>> -               BUG_ON(!bank->pctldev);
>>>
>>> this doesn't work. my pin range is not continuous and linear, so we
>>> need the "if (range->id == NGPIO_OF_BANK * idx)" to calculate the
>>> gpio_offset.
>>> and gpio_offset is used in many places:
>>
>> Can't you use:
>>
>> struct pinctrl_gpio_range *range =
>>                 pinctrl_find_gpio_range_from_pin(pctldev, pin);
>>
>> In these places instead?
>
> this is why gpio_offset was involved to avoid doing complex
> pinctrl_find_gpio_range_from_pin() everytime.
> since the range mapping is not linear, gpio_offset is a cache to do that.

OK I think I know what the problem is: you do this in your device
tree:

gpio-ranges = <&pinctrl 0 0 0>,
<&pinctrl 32 0 0>,
<&pinctrl 64 0 0>,
<&pinctrl 96 0 0>;
gpio-ranges-group-names = "gnss_gpio_grp",
"lcd_vip_gpio_grp",
"sdio_i2s_gpio_grp",
"sp_rgmii_gpio_grp";
};

So these gpio-ranges will populate the ranges using the pins from
these groups.

The problem is: these ranges are a lie. They are incorrect, as you
say yourself "pin range is not continous".

But the definition of a pin range is that it is continous!

So you have put erroneous data into the device tree and then
you use code in the driver to fix up that erroneous data.

So instead: fix up the ranges in the GPIO device tree node.

You don't have to use group names to define the ranges,
noone is forcing you to do that. Cut the whole
gpio-ranges-group-names property and use just
<&pinctrl 0 1 12>, <&pinctrl 12 14 4> etc as is needed
to proper register the *real* ranges, instead of going in
and augmenting the ranges in the kernel.

Yours,
Linus Walleij
