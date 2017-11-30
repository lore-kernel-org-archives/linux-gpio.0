From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: uniphier: merge fix for "Update irq_domain_ops.activate()
 signature"
Date: Thu, 30 Nov 2017 11:21:30 +0900
Message-ID: <CAK7LNARoXhknthkYxKrk6OPR64_O-UpJRNnxjwxMdpR=Ak7fOQ@mail.gmail.com>
References: <1510580176-7483-1-git-send-email-yamada.masahiro@socionext.com> <CACRpkdb=hL02-yr+bJYiJ4xqR029YUFJHs34TdvCb8aeyJH6Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62795 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752838AbdK3CW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Nov 2017 21:22:28 -0500
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com [209.85.217.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id vAU2MBgE028982
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 11:22:11 +0900
Received: by mail-ua0-f170.google.com with SMTP id p33so4793050uag.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2017 18:22:11 -0800 (PST)
In-Reply-To: <CACRpkdb=hL02-yr+bJYiJ4xqR029YUFJHs34TdvCb8aeyJH6Uw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Linus,

2017-11-29 22:08 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> Masahiro,
>
> can you check that this ended up all right in the merge window,
> else send a fixup patch?
>
> Sorry for the mess.
>
> Yours,
> Linus Walleij
>

Linus Torvalds merged it very nicely.

Everything looks good to me.




> On Mon, Nov 13, 2017 at 2:36 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>
>> Changes since Stephens's original post
>>   - Fix checkpatch.pl warning
>>     "CHECK: Alignment should match open parenthesis"
>>   - Stretch lines since it fits in 80-columns
>>
>>
>>  drivers/gpio/gpio-uniphier.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
>> index d62cea4..71b768e 100644
>> --- a/drivers/gpio/gpio-uniphier.c
>> +++ b/drivers/gpio/gpio-uniphier.c
>> @@ -300,13 +300,15 @@ static int uniphier_gpio_irq_domain_alloc(struct irq_domain *domain,
>>         return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
>>  }
>>
>> -static void uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
>> -                                             struct irq_data *data)
>> +static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
>> +                                            struct irq_data *data, bool early)
>>  {
>>         struct uniphier_gpio_priv *priv = domain->host_data;
>>         struct gpio_chip *chip = &priv->chip;
>>
>>         gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
>> +
>> +       return 0;
>>  }
>>
>>  static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
>> --
>> 2.7.4
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
