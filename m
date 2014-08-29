From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: make driver mcp23s08 to support both device tree
 and platform data
Date: Fri, 29 Aug 2014 14:29:35 +0200
Message-ID: <CACRpkdZnmUeOEBvretYa=HtEMnBObh8D_ZZWmxugQfpdzF=y8A@mail.gmail.com>
References: <1409048902-21316-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:51887 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbaH2M3f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 08:29:35 -0400
Received: by mail-oa0-f45.google.com with SMTP id n16so1692622oag.32
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2014 05:29:35 -0700 (PDT)
In-Reply-To: <1409048902-21316-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Tue, Aug 26, 2014 at 12:28 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Device tree is not enabled in some archtecture where gpio driver mcp23s08
> is still required.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> v2-changes:
> - Parse device tree properties into platform data other than individual variables.

(...)
> +#ifdef CONFIG_OF
>         mcp->irq_domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
>                                                 &irq_domain_simple_ops, mcp);
> +#else
> +       mcp->irq_domain = irq_domain_add_linear(NULL, chip->ngpio,
> +                                               &irq_domain_simple_ops, mcp);
> +#endif

Argh this doesn't look good.

Cut the #ifdef and do this:

mcp->irq_domain = irq_domain_add_linear(chip->dev->of_node, chip->ngpio,
                                   &irq_domain_simple_ops, mcp);

Because the struct device * always has an of_node which is NULL
when OF is not used.

>         /* configure ~100K pullups */
> -       status = mcp->ops->write(mcp, MCP_GPPU, pullups);
> +       status = mcp->ops->write(mcp, MCP_GPPU, pdata->chip[cs].pullups);

Extending a non-pincontrol pin control interface, grrr.

Well I just have to live with it.

Now how was it: is this driver impossible to convert to GPIOLIB_IRQCHIP?

Yours,
Linus Walleij
