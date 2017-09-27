From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Wed, 27 Sep 2017 02:20:18 +0200
Message-ID: <CACRpkda39LU8hynYtnMyKxm+A8Behkam8CWBTSkt+0U_Fw_VtQ@mail.gmail.com>
References: <AM5PR0701MB2657A33A85F675C4A0175CE0E4670@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:43632 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964956AbdI0AUT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2017 20:20:19 -0400
Received: by mail-io0-f170.google.com with SMTP id k101so14293103iod.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2017 17:20:19 -0700 (PDT)
In-Reply-To: <AM5PR0701MB2657A33A85F675C4A0175CE0E4670@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 22, 2017 at 8:41 PM, Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:

> This is an internal 32-bit input and 32-bit output port to the FPGA logic.

What does "internal" mean in this context? On the chip?

I hope it still qualifies to be called "general purpose input/output".

Otherwise it's not GPIO...

> Instantiate this in the device tree as:
>
>    gpio3: gpio@ff706010 {
>     #address-cells = <1>;
>     #size-cells = <0>;
>     compatible = "altr,fpgamgr-gpio";
>     reg = <0xff706010 0x8>;
>     status = "okay";
>
>     portd: gpio-controller@0 {
>      compatible = "altr,fpgamgr-gpio-output";
>      gpio-controller;
>      #gpio-cells = <2>;
>      reg = <0>;
>     };
>
>     porte: gpio-controller@1 {
>      compatible = "altr,fpgamgr-gpio-input";
>      gpio-controller;
>      #gpio-cells = <2>;
>      reg = <1>;
>     };

So one port is output-only and one is input-only?

Fair enough.

> +config GPIO_FPGAMGR

Call it GPIO_ALTERA_FPGAMGR or something.

"FPGAMGR" is too generic. There must be a plethora
of FPGA managers in the world.

> +obj-$(CONFIG_GPIO_FPGAMGR)     += gpio-fpgamgr.o

So call that file gpio-altera-fpgamgr.o as well.

> +/*

Add a blurb here at the top describing the driver and what it is for.

> + * Copyright (c) 2015 Softing Industrial Automation GmbH

> +static int fpgamgr_gpio_add_port(struct fpgamgr_gpio *gpio,
> +                                struct fpgamgr_port_property *pp,
> +                                unsigned int offs)
> +{
> +       struct fpgamgr_gpio_port *port;
> +       void __iomem *dat;
> +       int err;
> +
> +       port = &gpio->ports[offs];
> +       port->gpio = gpio;
> +       port->idx = pp->idx;
> +
> +       dat = gpio->regs + (pp->idx * 4);
> +
> +       err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
> +                        NULL, NULL, 0);

Nice reuse of MMIO GPIO.

> +#ifdef CONFIG_OF_GPIO
> +       port->bgc.of_node = pp->node;
> +#endif

Drop the #ifdef.

The Kconfig already depends on OF_GPIO so this is always true.

The concept of "port" is the same as "bank".

Please read Thierry's proposed changes that I will merge as soon as
he respins them, he creates a "bank" abstraction for gpiolib:
https://marc.info/?l=linux-gpio&m=150429237121695&w=2

I strongly feel you should use this infrastructure, even if Thierry's work
is much centered around being able to have per-bank IRQs.

> +static void fpgamgr_gpio_unregister(struct fpgamgr_gpio *gpio)
> +{
> +       unsigned int m;
> +
> +       for (m = 0; m < gpio->nr_ports; ++m)
> +               if (gpio->ports[m].is_registered)
> +                       gpiochip_remove(&gpio->ports[m].bgc);
> +}

Why can't you simply use devm_gpiochip_add_data() and get rid
of the unregister business? (data can be NULL)

> +static struct fpgamgr_platform_data *
> +fpgamgr_gpio_get_pdata_of(struct device *dev)
> +{
> +       struct device_node *node, *port_np;

Rename "node" to just "np" (node pointer) this is the convention
we usually employ.

Just declare it like this:

struct device_node *np = dev->of_node;

So you don't need to assign it later.

> +       struct fpgamgr_platform_data *pdata;
> +       struct fpgamgr_port_property *pp;
> +       int nports;
> +       int i;
> +
> +       node = dev->of_node;
> +       if (!IS_ENABLED(CONFIG_OF_GPIO) || !node)
> +               return ERR_PTR(-ENODEV);

Drop this, as stated above it is always enabled when compiling
and probing this code.

> +       nports = of_get_child_count(node);
> +       if (nports == 0)
> +               return ERR_PTR(-ENODEV);
> +
> +       pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
> +       if (!pdata)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pdata->properties = kcalloc(nports, sizeof(*pp), GFP_KERNEL);
> +       if (!pdata->properties) {
> +               kfree(pdata);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       pdata->nports = nports;

Again important to use Thierry's infrastructure for ports/banks.

> +static inline void fpgamgr_free_pdata_of(struct fpgamgr_platform_data
> *pdata)
> +{
> +       if (!IS_ENABLED(CONFIG_OF_GPIO) || !pdata)
> +               return;

Drop that.

> +static int fpgamgr_gpio_probe(struct platform_device *pdev)
> +{

Since you use the struct device * pointer a lot here, introduce a local
variable like this:


struct device *dev = &pdev->dev;

Then substitute &pdev->dev for just dev below. Make it so much
easier to read.

> +       unsigned int i;
> +       struct resource *res;
> +       struct fpgamgr_gpio *gpio;

gpio is a bit ambigous here don't you think?

At least call it "fgpio" or something.

> +static const struct of_device_id fpgamgr_of_match[] = {
> +       { .compatible = "altr,fpgamgr-gpio" },
> +       { /* Sentinel */ }
> +};

Are these device tree bindings already merged? Else they need
a separate patch with Cc to devicetree@vger.kernel.org.

> +#ifdef CONFIG_PM_SLEEP
> +static int fpgamgr_gpio_suspend(struct device *dev)
> +{
> +       return 0;
> +}
> +
> +static int fpgamgr_gpio_resume(struct device *dev)
> +{
> +       return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(fpgamgr_gpio_pm_ops, fpgamgr_gpio_suspend,
> +                        fpgamgr_gpio_resume);

Either implement the suspend resume for real or drop this entire thing.
Just skeleton functions are not going to help anyone.

> +static struct platform_driver fpgamgr_gpio_driver = {
> +       .driver         = {
> +               .name   = "gpio-fpgamgr",

gpio-altera-fpgamgr

> +               .owner  = THIS_MODULE,
> +               .pm     = &fpgamgr_gpio_pm_ops,

Drop that too unless you implement it.

Yours,
Linus Walleij
