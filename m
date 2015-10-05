From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: field for new GPIO driver
Date: Mon, 5 Oct 2015 09:37:33 +0200
Message-ID: <CACRpkdb=hnOUYbgCG2y9MpYR4ErPze+i-6RiV5XPx5sScX+9pg@mail.gmail.com>
References: <1443755105-7708-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35978 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751480AbbJEHhe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 03:37:34 -0400
Received: by oibi136 with SMTP id i136so86553883oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 00:37:33 -0700 (PDT)
In-Reply-To: <1443755105-7708-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Yd_Tseng@asmedia.com.tw, =?UTF-8?B?VHVuZ1l1IEx1KOWRguadseaYsSk=?= <TungYu_Lu@asmedia.com.tw>

On Fri, Oct 2, 2015 at 5:05 AM, YD Tseng <ltyu101@gmail.com> wrote:

>>> Is this hardware really different or can the old driver be augmented to handle both?

> This hardware is different.  We design a new silicon for AMD.

OK

> +#include <linux/gpio.h>

Should only #include <linux/gpio/driver.h>

> +/* memory mapped register offsets */
> +#define PT_DIRECTION_REG   0x00
> +#define PT_INPUTDATA_REG   0x04
> +#define PT_OUTPUTDATA_REG  0x08

A very simple memory-mapped I/O GPIO, you should use
select GPIO_GENERIC
#include <linux/basic_mmio_gpio.h>

And see for example drivers/gpio/gpio-74xx-mmio.c
on how to use this generic MMIO library right.

> +#define PT_DEBOUNCE_REG    0x0C

So the driver should support the .set_debounce() method.

> +#define PT_VENDER0_REG     0x28
> +#define PT_VENDER1_REG     0x2C

Is it not VENDOR, and what is in these registers really?
>From the code it seems it is pin control registers, and this
driver should then be in drivers/pinctrl/*.

See for example drivers/pinctrl/intel/* for how to do that
right.

> +static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> +       struct platform_device *pdev;
> +       void __iomem *v_reg = pt_gpio->reg_base + PT_VENDER0_REG;

Too many local variables. Just used a->b->c directly.
Well this will be using the MMIO library anyway so most stuff
go away.

> +       using_pins = readl(v_reg);
> +       if (using_pins&(1<<offset))
> +               dev_warn(&pdev->dev, "PT GPIO pin %x reconfigured\n", offset);
> +       else
> +               writel(using_pins|(1<<offset), v_reg);

What is this? Pin multiplexing? Then implement this
properly using pin control.

> +       void __iomem *reg;
(...)
> +       /* initialize register setting */
> +       reg = pt_gpio->reg_base + PT_VENDER0_REG;
> +       writel(0, reg);
> +       reg = pt_gpio->reg_base + PT_DEBOUNCE_REG;
> +       writel(0, reg);

Argh no, just writel(0, pt_gpio->reg_base + PT_VENDOR0_REG);
Too many helper variables. The compiler will optimize it out, but
this makes things hard to read (for me).

But again, I do not believe the real name of that register is
"VENDER0" and you should implement debounce properly
and use GPIO_GENERIC

Yours,
Linus Walleij
