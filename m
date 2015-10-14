From: YD Tseng <ltyu101@gmail.com>
Subject: Re:[PATCH v2] drivers: field for new GPIO driver
Date: Wed, 14 Oct 2015 18:15:11 +0800
Message-ID: <1444817711-2219-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:36755 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478AbbJNKPT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2015 06:15:19 -0400
Received: by pabur7 with SMTP id ur7so1650082pab.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2015 03:15:18 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, dbaryshkov@gmail.com
Cc: Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw


> #include <linux/gpio/driver.h> instead ?

Modified in the code.

>
> > +#include <linux/spinlock.h>
> > +#include <linux/acpi.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define TOTAL_GPIO_PINS 8
> > +
> > +/* PCI-E MMIO register offsets */
> > +#define PT_DIRECTION_REG   0x00
> > +#define PT_INPUTDATA_REG   0x04
> > +#define PT_OUTPUTDATA_REG  0x08
> > +#define PT_CLOCKRATE_REG   0x0C
> > +#define PT_SYNC_REG        0x28
> > +
> > +struct pt_gpio_chip {
> > +       struct gpio_chip         gc;
> > +       struct platform_device   *pdev;
>
> You don't really need pdev. You can use gc->dev for logging information instead.

Modified in the code.

>
> > +       void __iomem             *reg_base;
> > +       spinlock_t               lock;
> > +};
> > +
> > +#define to_pt_gpio(c)  container_of(c, struct pt_gpio_chip, gc)
> > +
> > +static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> > +       struct platform_device *pdev;
> > +       unsigned long flags;
> > +       u32 using_pins;
> > +
> > +       pdev = pt_gpio->pdev;
> > +
> > +       dev_dbg(&pdev->dev, "pt_gpio_request offset=%x\n", offset);
> > +
> > +       spin_lock_irqsave(&pt_gpio->lock, flags);
> > +
> > +       using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
> > +       if (using_pins&(1<<offset)) {
>
> spaces? Also using_pins & BIT(offset) would be more readable.

Modified in the code.

>
> > +               dev_warn(&pdev->dev, "PT GPIO pin %x reconfigured\n", offset);
> > +               spin_unlock_irqrestore(&pt_gpio->lock, flags);
> > +               return -EINVAL;
> > +       }
> > +       else
> > +               writel(using_pins|(1<<offset), pt_gpio->reg_base + PT_SYNC_REG);
>
> Please refer to CodingStyle document.
>
> Also you don't need the "else" word at all here.

Modified in the code.

>
> > +
> > +       spin_unlock_irqrestore(&pt_gpio->lock, flags);
> > +
> > +       return 0;
> > +}
> > +
> 
> [skipped]

Sorry, will you please describe what the meaning for [skipped]?

>
> > +static int pt_gpio_get_value(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> > +       struct platform_device *pdev;
> > +       unsigned long flags;
> > +       u32 data;
> > +
> > +       pdev = pt_gpio->pdev;
> > +
> > +       spin_lock_irqsave(&pt_gpio->lock, flags);
> > +
> > +       /* configure as output */
> > +       if ((readl(pt_gpio->reg_base + PT_DIRECTION_REG)>>offset)&0x1)
>
> data = readl(...);
> if (data & BIT(offset)) {
>    ...
> } else {
>   ...
> }
>

Modified in the code.

> > +               data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
> > +       else    /* configure as input */
> > +               data = readl(pt_gpio->reg_base + PT_INPUTDATA_REG);
> > +
> > +       spin_unlock_irqrestore(&pt_gpio->lock, flags);
> > +
> > +       data >>= offset;
> > +       data &= 1;
>
> Ghm.

Sorry, will you please describe what the meaning for Ghm.?

>
> > +
> > +       dev_dbg(&pdev->dev, "pt_gpio_get_value offset=%x, value=%x\n", offset,
> > +               data);
> > +
> > +       return data;
> > +}
> > +
>
> [skipped]

Sorry, will you please describe what the meaning for [skipped]?

>
> > +
> > +static int pt_gpio_direction_output(struct gpio_chip *gc,
> > +                                       unsigned offset, int value)
> > +{
> > +       struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
> > +       struct platform_device *pdev;
> > +       unsigned long flags;
> > +       u32 data;
> > +
> > +       pdev = pt_gpio->pdev;
> > +
> > +       dev_dbg(&pdev->dev, "pt_gpio_direction_output offset=%x, value=%x\n",
> > +               offset, value);
> > +
> > +       spin_lock_irqsave(&pt_gpio->lock, flags);
> > +
> > +       data = readl( pt_gpio->reg_base + PT_OUTPUTDATA_REG);
> > +       if (value)
> > +               writel(data |= BIT(offset),  pt_gpio->reg_base + PT_OUTPUTDATA_REG);
> > +       else
> > +               writel(data &= ~BIT(offset),  pt_gpio->reg_base + PT_OUTPUTDATA_REG);
>
> data = readl(..);
> if (value)
>   data |= BIT(offset);
> else
>   data &= ~BIT(offset);
> writel(...);
>

Modified in the code.

> > +
> > +       data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
> > +       data |= BIT(offset);
> > +       writel(data, pt_gpio->reg_base + PT_DIRECTION_REG);
> > +
> > +       spin_unlock_irqrestore(&pt_gpio->lock, flags);
> > +
> > +       return 0;
> > +}
>
> [skipped]
>

Sorry, will you please describe what the meaning for [skipped]?

> > +
> > +static int __init pt_gpio_init(void)
> > +{
> > +       return platform_driver_register(&pt_gpio_driver);
> > +}
> > +
> > +static void __exit pt_gpio_exit(void)
> > +{
> > +       platform_driver_unregister(&pt_gpio_driver);
> > +}
> > +
> > +module_init(pt_gpio_init);
> > +module_exit(pt_gpio_exit);
>
> I'd suggest to use module_platform_driver() macro here.
>

Modified in the code.

> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("YD Tseng <yd_tseng@asmedia.com.tw>");
> > +MODULE_DESCRIPTION("AMD Promontory GPIO Driver");
> > +MODULE_ALIAS("platform:pt-gpio");
>
> Do you really need this alias? For what purpose?

Removed MODULE_ALIAS.

