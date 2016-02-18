From: Barry Song <baohua@kernel.org>
Subject: Re: [PATCH] pinctrl: sirf/atlas7: stop poking around in GPIO internals
Date: Thu, 18 Feb 2016 10:50:23 +0800
Message-ID: <CAGsJ_4zHEtmHmxbprnc=1qOXgk3G_pqyueHke8PusMKNP_rmmg@mail.gmail.com>
References: <1455265873-21534-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:35491 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424281AbcBRCup (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2016 21:50:45 -0500
In-Reply-To: <1455265873-21534-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Guoying Zhang <Guoying.Zhang@csr.com>, Wei Chen <Wei.Chen@csr.com>

Linus,
thanks!

2016-02-12 16:31 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>
> This code is poking around in the gpio_chip:s internal structures
> to achieve some kind of pin to GPIO mappings.
>
> - It is wrong to poke around in these structs and the pinctrl
>   maintainer was stupid to let it pass unnoticed, mea culpa.
>
> - The right interface to use is gpiochip_add_pin_range()

gpiochip_add(chip will call this automatically since range is set in dtsi:
gpio_0: gpio_mediam@17040000 {
#gpio-cells = <2>;
#interrupt-cells = <2>;
compatible = "sirf,atlas7-gpio";
reg = <0x17040000 0x1000>;
interrupts = <0 13 0>, <0 14 0>;
clocks = <&car 98>;
clock-names = "gpio0_io";
gpio-controller;
interrupt-controller;

gpio-banks = <2>;
gpio-ranges = <&pinctrl 0 0 0>,
<&pinctrl 32 0 0>;
gpio-ranges-group-names = "lvds_gpio_grp",
"jtag_uart_nand_gpio_grp";
};

see:
https://git.kernel.org/cgit/linux/kernel/git/baohua/linux.git/tree/arch/arm/boot/dts/atlas7.dtsi?h=sirf-3.18#n2151

>
> - The code appears unused: the pin control part of the driver
>   is not adding any ranges, so we're iterating over an empty
>   list. Maybe it is poking around in some other pin controllers
>   GPIO ranges, and that's just totally wrong, again use
>   gpiochip_add_pin_range() and specify the right pin
>   controller.
>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Guoying Zhang <Guoying.Zhang@csr.com>
> Cc: Wei Chen <Wei.Chen@csr.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SiRF maintainers: look at this immediately and explain what is
> going on.
> ---
>  drivers/pinctrl/sirf/pinctrl-atlas7.c | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
> index beb024c31a5d..3d233fc3448a 100644
> --- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
> +++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
> @@ -338,7 +338,6 @@ struct atlas7_pinctrl_data {
>  #define ATLAS7_GPIO_CTL_DATAIN_MASK            BIT(7)
>
>  struct atlas7_gpio_bank {
> -       struct pinctrl_dev *pctldev;

this is ok.

>         int id;
>         int irq;
>         void __iomem *base;
> @@ -6070,7 +6069,6 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
>         }
>
>         for (idx = 0; idx < nbank; idx++) {
> -               struct gpio_pin_range *pin_range;
>                 struct atlas7_gpio_bank *bank;
>
>                 bank = &a7gc->banks[idx];
> @@ -6088,22 +6086,6 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
>
>                 gpiochip_set_chained_irqchip(chip, &atlas7_gpio_irq_chip,
>                                         bank->irq, atlas7_gpio_handle_irq);
> -
> -               /* Records gpio_pin_range to a7gc */
> -               list_for_each_entry(pin_range, &chip->pin_ranges, node) {
> -                       struct pinctrl_gpio_range *range;
> -
> -                       range = &pin_range->range;
> -                       if (range->id == NGPIO_OF_BANK * idx) {
> -                               bank->gpio_offset = range->id;
> -                               bank->ngpio = range->npins;
> -                               bank->gpio_pins = range->pins;
> -                               bank->pctldev = pin_range->pctldev;
> -                               break;
> -                       }
> -               }
> -
> -               BUG_ON(!bank->pctldev);

this doesn't work. my pin range is not continuous and linear, so we
need the "if (range->id == NGPIO_OF_BANK * idx)" to calculate the
gpio_offset.
and gpio_offset is used in many places:
5637
5638 static int __atlas7_gpio_to_pin(struct atlas7_gpio_chip *a7gc, u32 gpio)
5639 {
5640         struct atlas7_gpio_bank *bank;
5641         u32 ofs;
5642
5643         bank = atlas7_gpio_to_bank(a7gc, gpio);
5644         ofs = gpio - bank->gpio_offset;
5645         if (ofs >= bank->ngpio)
5646                 return -ENODEV;
5647
5648         return bank->gpio_pins[ofs];
5649 }


5651 static void atlas7_gpio_irq_ack(struct irq_data *d)
5652 {
5653         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
5654         struct atlas7_gpio_chip *a7gc = to_atlas7_gpio(gc);
5655         struct atlas7_gpio_bank *bank;
5656         void __iomem *ctrl_reg;
5657         u32 val, pin_in_bank;
5658         unsigned long flags;
5659
5660         bank = atlas7_gpio_to_bank(a7gc, d->hwirq);
5661         pin_in_bank = d->hwirq - bank->gpio_offset;
5662         ctrl_reg = ATLAS7_GPIO_CTRL(bank, pin_in_bank);
5663
5664         spin_lock_irqsave(&a7gc->lock, flags);
5665
5666         val = readl(ctrl_reg);
5667         /* clear interrupt status */
5668         writel(val, ctrl_reg);
5669
5670         spin_unlock_irqrestore(&a7gc->lock, flags);
5671 }

...


>         }
>
>         platform_set_drvdata(pdev, a7gc);
> --


-barry
