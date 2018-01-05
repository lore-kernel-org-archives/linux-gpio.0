From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2 05/13] pinctrl: Add Microsemi Ocelot SoC driver
Date: Sat, 6 Jan 2018 00:46:06 +0100
Message-ID: <20180105234606.GC5545@piout.net>
References: <20171208154618.20105-1-alexandre.belloni@free-electrons.com>
 <20171208154618.20105-6-alexandre.belloni@free-electrons.com>
 <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:53310 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752347AbeAEXqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jan 2018 18:46:07 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On 13/12/2017 at 09:15:20 +0100, Linus Walleij wrote:
> You need to add some comment on what is happening here and how the
> bits are used because just reading these two lines is pretty hard.
> 
> I guess f = 0, 1, 2 .... 31 or so.
> 
> pin->pin is also 0, 1, 2 ... 31?
> 
> BIT(pin->pin) is pretty self-evident. It is masking the bit controlling
> this pin in each register.
> 
> But setting bits (f << (pin->pin)) and then in the other register
> (f << (pin->pin -1))?
> 

I've added a comment. f can take 4 values, that is 2 bits. bit 0 goes to
bit(pin) of ALT0 and bit 1 goes to bit(pin) of ALT1

> Maybe you should even add an illustrative dev_dbg() print here
> showing which bits you mask and set, or use some helper bools
> so it is crystal clear what is going on.
> 
> So there is two registers to select "alternative functions" (I guess?)
> And each has one bit for the *same* pin.
> 

That is correct.

> This is the case also in drivers/pinctrl/nomadik/pinctrl-nomadik.c.
> It turns out to be a pretty horrible design decision: since the two
> bits are not changed in the same register transaction, switching
> from say function "00" to function "11" creates a "glitch" where
> you first activate funcion "10" after writing the first register,
> then finally go to function "11" after writing the second.
> 
> This had horrible electrical consequences and required special
> workarounds in Nomadik so be on the lookout for this type
> of problem.
> 

Yes, it is definitively racy. I've added that in the comment but I don't
expect that to cause any real issue soon. But I'll keep that in mind.

> > +static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
> > +                                    struct pinctrl_gpio_range *range,
> > +                                    unsigned int pin, bool input)
> > +{
> > +       struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> > +
> > +       regmap_update_bits(info->map, OCELOT_GPIO_OE, BIT(pin),
> > +                          input ? BIT(pin) : 0);
> > +
> > +       return 0;
> > +}
> (...)
> > +static const struct pinmux_ops ocelot_pmx_ops = {
> > +       .get_functions_count = ocelot_get_functions_count,
> > +       .get_function_name = ocelot_get_function_name,
> > +       .get_function_groups = ocelot_get_function_groups,
> > +       .set_mux = ocelot_pinmux_set_mux,
> > +       .gpio_set_direction = ocelot_gpio_set_direction,
> > +       .gpio_request_enable = ocelot_gpio_request_enable,
> > +};
> 
> This looks a bit weird since the same register is also written
> by the gpiochip to set direction.
> 
> If you want to relay the direction setting entirely to the pin
> control subsystem, then just have your callbacks in the
> gpiochip like this:
> 
> static int ocelot_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> {
>         return pinctrl_gpio_direction_input(chip->base + offset);
> }
> 
> static int ocelot_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>                                        int value)
> {
>        struct ocelot_pinctrl *info = gpiochip_get_data(chip);
>        unsigned int pin = BIT(offset);
> 
>        if (value)
>                regmap_write(info->map, OCELOT_GPIO_OUT_SET, pin);
>        else
>                regmap_write(info->map, OCELOT_GPIO_OUT_CLR, pin);
> 
>         return pinctrl_gpio_direction_output(chip->base + offset);
> }
> 
> Then all direction setting will just be relayed to the pin control
> side.
> 
> Shouldn't this call also set up the altfunction so you know
> the pin is now set in GPIO mode? That is how some other
> drivers do it at least. But maybe you prefer to do the
> muxing "on the side" (using pinmux ops only, and explicitly
> setting up the line as GPIO in e.g. the device tree)?
> 

Yes, my plan was to have an explicit muxing to GPIO in the device tree.

> In that case I think you might not need this callback at all.
> 
> Also: are you should you do not need to disable OCELOT_GPIO_OE
> in the .gpio_disable_free() callback?
> 

OCELOT_GPIO_OE doesn't matter if the pin is not muxed to GPIO.

I must admit I only tested the GPIO functionnality using /sys/class/gpio
as I only have one GPIO available on my board.

I'm sending v3 now.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
