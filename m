From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH 5/8] gpio: omap: convert gpio irq functions to use GPIO
 offset
Date: Fri, 20 Mar 2015 17:06:02 +0200
Message-ID: <550C375A.5040802@linaro.org>
References: <1426785944-17255-1-git-send-email-grygorii.strashko@linaro.org> <1426785944-17255-6-git-send-email-grygorii.strashko@linaro.org> <20150319230334.GQ31346@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:36062 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbbCTPGL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2015 11:06:11 -0400
Received: by labe2 with SMTP id e2so13911087lab.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2015 08:06:09 -0700 (PDT)
In-Reply-To: <20150319230334.GQ31346@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ssantosh@kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/20/2015 01:03 AM, Tony Lindgren wrote:
> * grygorii.strashko@linaro.org <grygorii.strashko@linaro.org> [150319=
 10:26]:
>> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>>
>> Convert GPIO IRQ functions to use GPIO offset instead of system
>> GPIO numbers. This allows to drop unneeded conversations between
>> system GPIO <-> GPIO offset which are done in many places and
>> many times.
>> It is safe to do now because:
>> - gpiolib always passes GPIO offset to GPIO controller
>> - OMAP GPIO driver converted to use IRQ domain, so
>>    struct irq_data->hwirq contains GPIO offset
>>
>> This is preparation step before removing:
>>   #define GPIO_INDEX(bank, gpio)
>>   #define GPIO_BIT(bank, gpio)
>>   int omap_irq_to_gpio()
> ...
>
>>   static void omap_gpio_unmask_irq(struct irq_data *d)
>>   {
>>   	struct gpio_bank *bank =3D omap_irq_data_get_bank(d);
>> -	unsigned int gpio =3D omap_irq_to_gpio(bank, d->hwirq);
>> +	unsigned offset =3D d->hwirq;
>>   	unsigned int irq_mask =3D GPIO_BIT(bank, gpio);
>>   	u32 trigger =3D irqd_get_trigger_type(d);
>>   	unsigned long flags;
>
> This series up to this patch produces a build error that
> would break git bisect:
>
> drivers/gpio/gpio-omap.c: In function =E2=80=98omap_gpio_unmask_irq=E2=
=80=99:
> drivers/gpio/gpio-omap.c:866:37: error: =E2=80=98gpio=E2=80=99 undecl=
ared (first use in this function)
>    unsigned int irq_mask =3D GPIO_BIT(bank, gpio);

Oh. Thanks for catching that :) - splitting/rebasing issue.

--=20
regards,
-grygorii
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
