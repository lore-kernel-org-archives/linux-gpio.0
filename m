From: Barry Song <baohua@kernel.org>
Subject: Re: [PATCH] pinctrl: sirf/atlas7: stop poking around in GPIO internals
Date: Fri, 19 Feb 2016 11:21:38 +0800
Message-ID: <CAGsJ_4xf22j-QDxujuRzUY8eG9krR3Uy+_ZsqAoEUCamYV4PWQ@mail.gmail.com>
References: <1455265873-21534-1-git-send-email-linus.walleij@linaro.org>
 <CAGsJ_4zHEtmHmxbprnc=1qOXgk3G_pqyueHke8PusMKNP_rmmg@mail.gmail.com> <CACRpkdb8SVGdwhY9zsYxZQ5H2R-qd1v7iFek3SwdtAnWr41DaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb8SVGdwhY9zsYxZQ5H2R-qd1v7iFek3SwdtAnWr41DaA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Guoying Zhang <Guoying.Zhang@csr.com>, Wei Chen <Wei.Chen@csr.com>
List-Id: linux-gpio@vger.kernel.org

2016-02-19 4:42 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Feb 18, 2016 at 3:50 AM, Barry Song <baohua@kernel.org> wrote:
>
>> gpiochip_add(chip will call this automatically since range is set in dtsi:
>> gpio_0: gpio_mediam@17040000 {
>> #gpio-cells = <2>;
>> #interrupt-cells = <2>;
>> compatible = "sirf,atlas7-gpio";
>> reg = <0x17040000 0x1000>;
>> interrupts = <0 13 0>, <0 14 0>;
>> clocks = <&car 98>;
>> clock-names = "gpio0_io";
>> gpio-controller;
>> interrupt-controller;
>>
>> gpio-banks = <2>;
>> gpio-ranges = <&pinctrl 0 0 0>,
>> <&pinctrl 32 0 0>;
>> gpio-ranges-group-names = "lvds_gpio_grp",
>> "jtag_uart_nand_gpio_grp";
>
> Aha I see.
>
>>> -
>>> -               /* Records gpio_pin_range to a7gc */
>>> -               list_for_each_entry(pin_range, &chip->pin_ranges, node) {
>>> -                       struct pinctrl_gpio_range *range;
>>> -
>>> -                       range = &pin_range->range;
>>> -                       if (range->id == NGPIO_OF_BANK * idx) {
>>> -                               bank->gpio_offset = range->id;
>>> -                               bank->ngpio = range->npins;
>>> -                               bank->gpio_pins = range->pins;
>>> -                               bank->pctldev = pin_range->pctldev;
>>> -                               break;
>>> -                       }
>>> -               }
>>> -
>>> -               BUG_ON(!bank->pctldev);
>>
>> this doesn't work. my pin range is not continuous and linear, so we
>> need the "if (range->id == NGPIO_OF_BANK * idx)" to calculate the
>> gpio_offset.
>> and gpio_offset is used in many places:
>
> Can't you use:
>
> struct pinctrl_gpio_range *range =
>                 pinctrl_find_gpio_range_from_pin(pctldev, pin);
>
> In these places instead?

this is why gpio_offset was involved to avoid doing complex
pinctrl_find_gpio_range_from_pin() everytime.
since the range mapping is not linear, gpio_offset is a cache to do that.

>
> ?
>
> That is what most drivers do.
>
> Yours,
> Linus Walleij

-barry
