From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Mon, 14 Nov 2016 14:18:40 +0100
Message-ID: <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:33857 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752765AbcKNNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2016 08:18:41 -0500
Received: by mail-qt0-f176.google.com with SMTP id n6so46796884qtd.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2016 05:18:41 -0800 (PST)
In-Reply-To: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

On Wed, Nov 9, 2016 at 11:28 AM, Shah, Nehal-bakulchandra
<Nehal-bakulchandra.Shah@amd.com> wrote:

> This Provide IRQ sharing for AMD's GPIO devices.And set IRQCHIP_SKIP_SET_WAKE flag.
>
> Also, fix the build issue for devm_request_irq()
>
> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

This is not looking correct at all.

> @@ -529,16 +531,13 @@ static void amd_gpio_irq_handler(struct irq_desc *desc)
>                 }
>         }
>
> -       if (handled == 0)
> -               handle_bad_irq(desc);
> -
>         spin_lock_irqsave(&gpio_dev->lock, flags);
>         reg = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
>         reg |= EOI_MASK;
>         writel(reg, gpio_dev->base + WAKE_INT_MASTER_REG);
>         spin_unlock_irqrestore(&gpio_dev->lock, flags);
>
> -       chained_irq_exit(chip, desc);
> +       return 0;

You are removing the chained interrupt handling for no good reason.
The commit message does not say why this is being done.

It's especially erroneous to remove chained_irq_exit() but not
chained_irq_enter(), but generally, NONE of them should be
removed this *is* a chained interrupt handler.

>         gpiochip_set_chained_irqchip(&gpio_dev->gc,
>                                  &amd_gpio_irqchip,
>                                  irq_base,
> -                                amd_gpio_irq_handler);
> +                                NULL);
> +
> +       ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
> +                              IRQF_SHARED, dev_name(&pdev->dev), gpio_dev);
> +       if (ret)
> +               goto out2;

This is just wrong. The gpiochip_set_chained_irqchip() should not
be called in combination with devm_request_irq() like this.

devm_request_irq() should not be used at all. Keep the chained
handler.

I'm worried that this patch has a "trial-and-error" quality, it seems
you don't really know what is going on.

Please investigate and send the patch with a commitlog that describes
exactly why you are doing what you are doing.

Yours,
Linus Walleij
