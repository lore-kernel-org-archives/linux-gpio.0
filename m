From: YD Tseng <ltyu101@gmail.com>
Subject: Re:[PATCH v2] drivers: field for new GPIO driver
Date: Tue, 13 Oct 2015 17:01:46 +0800
Message-ID: <1444726906-4148-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:35872 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751020AbbJMJCg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2015 05:02:36 -0400
Received: by pacex6 with SMTP id ex6so15565398pac.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2015 02:02:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, dbaryshkov@gmail.com
Cc: Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

Dear all,

Sorry to bother you and we resend it.  The new patch will be submitted in another email.

> >>> Is this hardware really different or can the old driver be augmented to handle both?
>
> > This hardware is different.  We design a new silicon for AMD.
>
> OK
>
> > +#include <linux/gpio.h>
>
> Should only #include <linux/gpio/driver.h>
>
> > +/* memory mapped register offsets */
> > +#define PT_DIRECTION_REG   0x00
> > +#define PT_INPUTDATA_REG   0x04
> > +#define PT_OUTPUTDATA_REG  0x08
>
> A very simple memory-mapped I/O GPIO, you should use
> select GPIO_GENERIC
> #include <linux/basic_mmio_gpio.h>
>
> And see for example drivers/gpio/gpio-74xx-mmio.c
> on how to use this generic MMIO library right.

This GPIO controller is located behind PCI-E device, We refer to drivers/gpio/gpio-amd8111.c.

>
> > +#define PT_DEBOUNCE_REG    0x0C
>
> So the driver should support the .set_debounce() method.

rename PT_DEBOUNCE_REG to PT_CLOCKRATE_REG.

>
> > +#define PT_VENDER0_REG     0x28
> > +#define PT_VENDER1_REG     0x2C
>
> Is it not VENDOR, and what is in these registers really?
> From the code it seems it is pin control registers, and this
> driver should then be in drivers/pinctrl/*.
>
> See for example drivers/pinctrl/intel/* for how to do that
> right.

rename PT_VENDOR0_REG to PT_SYNC_REG, remove PT_VENDOR1_REG

>
> > +static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> > +       struct platform_device *pdev;
> > +       void __iomem *v_reg = pt_gpio->reg_base + PT_VENDER0_REG;
>
> Too many local variables. Just used a->b->c directly.
> Well this will be using the MMIO library anyway so most stuff
> go away.

Modify in the new patch.

>
> > +       using_pins = readl(v_reg);
> > +       if (using_pins&(1<<offset))
> > +               dev_warn(&pdev->dev, "PT GPIO pin %x reconfigured\n", offset);
> > +       else
> > +               writel(using_pins|(1<<offset), v_reg);
>
> What is this? Pin multiplexing? Then implement this
> properly using pin control.

It's only used to sync the gpio pins.(avoid reusing the same pin) We modified some code in pt_gpio_request(), this routine will return EINVAL if a pin is used.

>
> > +       void __iomem *reg;
> (...)
> > +       /* initialize register setting */
> > +       reg = pt_gpio->reg_base + PT_VENDER0_REG;
> > +       writel(0, reg);
> > +       reg = pt_gpio->reg_base + PT_DEBOUNCE_REG;
> > +       writel(0, reg);
>
> Argh no, just writel(0, pt_gpio->reg_base + PT_VENDOR0_REG);
> Too many helper variables. The compiler will optimize it out, but
> this makes things hard to read (for me).

Modify in the new patch.

>
> But again, I do not believe the real name of that register is
> "VENDER0" and you should implement debounce properly
> and use GPIO_GENERIC

rename PT_VENDOR0_REG to PT_SYNC_REG

>
> Yours,
> Linus Walleij

Best Regards,
YD Tseng
