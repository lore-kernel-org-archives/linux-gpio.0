From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH v2] drivers: field for new GPIO driver
Date: Tue, 13 Oct 2015 18:59:24 +0300
Message-ID: <CALT56yP9H-dA95aYQeqx3DPkEqt47ur9pU1sqEEAyjuiT4=q9Q@mail.gmail.com>
References: <1444727059-4196-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:38036 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932274AbbJMP7Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2015 11:59:24 -0400
Received: by igkz10 with SMTP id z10so19776058igk.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2015 08:59:24 -0700 (PDT)
In-Reply-To: <1444727059-4196-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

2015-10-13 12:04 GMT+03:00 YD Tseng <ltyu101@gmail.com>:
> Dear all:
>
> This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.
>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
>
> ---
> v2: 1. fixed the coding style
>     2. registers renaming
>
> A new file is added and 2 files are modified.
> drivers/gpio/gpio-amdpt.c            New file
> drivers/gpio/Kconfig                       Modified file
> drivers/gpio/Makefile                    Modified file
>
> diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers/gpio/gpio-amdpt.c linux-4.2/drivers/gpio/gpio-amdpt.c
> --- linux-4.2.vanilla/drivers/gpio/gpio-amdpt.c 1969-12-31 19:00:00.000000000 -0500
> +++ linux-4.2/drivers/gpio/gpio-amdpt.c 2015-05-21 07:49:24.736020310 -0400
> @@ -0,0 +1,289 @@
> +/*
> + * AMD Promontory GPIO driver
> + *
> + * Copyright (C) 2015 ASMedia Technology Inc.
> + * Author: YD Tseng <yd_tseng@asmedia.com.tw>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/gpio.h>

#include <linux/gpio/driver.h> instead ?

> +#include <linux/spinlock.h>
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +
> +#define TOTAL_GPIO_PINS 8
> +
> +/* PCI-E MMIO register offsets */
> +#define PT_DIRECTION_REG   0x00
> +#define PT_INPUTDATA_REG   0x04
> +#define PT_OUTPUTDATA_REG  0x08
> +#define PT_CLOCKRATE_REG   0x0C
> +#define PT_SYNC_REG        0x28
> +
> +struct pt_gpio_chip {
> +       struct gpio_chip         gc;
> +       struct platform_device   *pdev;

You don't really need pdev. You can use gc->dev for logging information instead.

> +       void __iomem             *reg_base;
> +       spinlock_t               lock;
> +};
> +
> +#define to_pt_gpio(c)  container_of(c, struct pt_gpio_chip, gc)
> +
> +static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> +       struct platform_device *pdev;
> +       unsigned long flags;
> +       u32 using_pins;
> +
> +       pdev = pt_gpio->pdev;
> +
> +       dev_dbg(&pdev->dev, "pt_gpio_request offset=%x\n", offset);
> +
> +       spin_lock_irqsave(&pt_gpio->lock, flags);
> +
> +       using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
> +       if (using_pins&(1<<offset)) {

spaces? Also using_pins & BIT(offset) would be more readable.

> +               dev_warn(&pdev->dev, "PT GPIO pin %x reconfigured\n", offset);
> +               spin_unlock_irqrestore(&pt_gpio->lock, flags);
> +               return -EINVAL;
> +       }
> +       else
> +               writel(using_pins|(1<<offset), pt_gpio->reg_base + PT_SYNC_REG);

Please refer to CodingStyle document.

Also you don't need the "else" word at all here.

> +
> +       spin_unlock_irqrestore(&pt_gpio->lock, flags);
> +
> +       return 0;
> +}
> +

[skipped]

> +static int pt_gpio_get_value(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> +       struct platform_device *pdev;
> +       unsigned long flags;
> +       u32 data;
> +
> +       pdev = pt_gpio->pdev;
> +
> +       spin_lock_irqsave(&pt_gpio->lock, flags);
> +
> +       /* configure as output */
> +       if ((readl(pt_gpio->reg_base + PT_DIRECTION_REG)>>offset)&0x1)

data = readl(...);
if (data & BIT(offset)) {
   ...
} else {
  ...
}

> +               data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
> +       else    /* configure as input */
> +               data = readl(pt_gpio->reg_base + PT_INPUTDATA_REG);
> +
> +       spin_unlock_irqrestore(&pt_gpio->lock, flags);
> +
> +       data >>= offset;
> +       data &= 1;

Ghm.

> +
> +       dev_dbg(&pdev->dev, "pt_gpio_get_value offset=%x, value=%x\n", offset,
> +               data);
> +
> +       return data;
> +}
> +

[skipped]

> +
> +static int pt_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned offset, int value)
> +{
> +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> +       struct platform_device *pdev;
> +       unsigned long flags;
> +       u32 data;
> +
> +       pdev = pt_gpio->pdev;
> +
> +       dev_dbg(&pdev->dev, "pt_gpio_direction_output offset=%x, value=%x\n",
> +               offset, value);
> +
> +       spin_lock_irqsave(&pt_gpio->lock, flags);
> +
> +       data = readl( pt_gpio->reg_base + PT_OUTPUTDATA_REG);
> +       if (value)
> +               writel(data |= BIT(offset),  pt_gpio->reg_base + PT_OUTPUTDATA_REG);
> +       else
> +               writel(data &= ~BIT(offset),  pt_gpio->reg_base + PT_OUTPUTDATA_REG);

data = readl(..);
if (value)
  data |= BIT(offset);
else
  data &= ~BIT(offset);
writel(...);

> +
> +       data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
> +       data |= BIT(offset);
> +       writel(data, pt_gpio->reg_base + PT_DIRECTION_REG);
> +
> +       spin_unlock_irqrestore(&pt_gpio->lock, flags);
> +
> +       return 0;
> +}

[skipped]

> +
> +static int __init pt_gpio_init(void)
> +{
> +       return platform_driver_register(&pt_gpio_driver);
> +}
> +
> +static void __exit pt_gpio_exit(void)
> +{
> +       platform_driver_unregister(&pt_gpio_driver);
> +}
> +
> +module_init(pt_gpio_init);
> +module_exit(pt_gpio_exit);

I'd suggest to use module_platform_driver() macro here.

> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("YD Tseng <yd_tseng@asmedia.com.tw>");
> +MODULE_DESCRIPTION("AMD Promontory GPIO Driver");
> +MODULE_ALIAS("platform:pt-gpio");

Do you really need this alias? For what purpose?


-- 
With best wishes
Dmitry
