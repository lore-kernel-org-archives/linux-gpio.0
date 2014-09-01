From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH v2] gpio: make driver mcp23s08 to support both device tree
 and platform data
Date: Mon, 1 Sep 2014 10:18:39 +0800
Message-ID: <CAJxxZ0NAYGmA1rwwnb2S80bVygpk_amU=KpK7BWZejx8wQQzww@mail.gmail.com>
References: <1409048902-21316-1-git-send-email-sonic.adi@gmail.com>
	<CACRpkdZnmUeOEBvretYa=HtEMnBObh8D_ZZWmxugQfpdzF=y8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:61197 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbaIACSk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Aug 2014 22:18:40 -0400
Received: by mail-oi0-f48.google.com with SMTP id a141so3072121oig.7
        for <linux-gpio@vger.kernel.org>; Sun, 31 Aug 2014 19:18:39 -0700 (PDT)
In-Reply-To: <CACRpkdZnmUeOEBvretYa=HtEMnBObh8D_ZZWmxugQfpdzF=y8A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

Hi Linus,

On Fri, Aug 29, 2014 at 8:29 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Aug 26, 2014 at 12:28 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
>
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Device tree is not enabled in some archtecture where gpio driver mcp23s08
>> is still required.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>>
>> v2-changes:
>> - Parse device tree properties into platform data other than individual variables.
>
> (...)
>> +#ifdef CONFIG_OF
>>         mcp->irq_domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
>>                                                 &irq_domain_simple_ops, mcp);
>> +#else
>> +       mcp->irq_domain = irq_domain_add_linear(NULL, chip->ngpio,
>> +                                               &irq_domain_simple_ops, mcp);
>> +#endif
>
> Argh this doesn't look good.
>
> Cut the #ifdef and do this:
>
> mcp->irq_domain = irq_domain_add_linear(chip->dev->of_node, chip->ngpio,
>                                    &irq_domain_simple_ops, mcp);
>
> Because the struct device * always has an of_node which is NULL
> when OF is not used.

OK.

>
>>         /* configure ~100K pullups */
>> -       status = mcp->ops->write(mcp, MCP_GPPU, pullups);
>> +       status = mcp->ops->write(mcp, MCP_GPPU, pdata->chip[cs].pullups);
>
> Extending a non-pincontrol pin control interface, grrr.
>
> Well I just have to live with it.
>
> Now how was it: is this driver impossible to convert to GPIOLIB_IRQCHIP?
>
I guess this should be a different patch from the owner of gpio-mcp23s08?


Thanks,

Sonic Zhang
