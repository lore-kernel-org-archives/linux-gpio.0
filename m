From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mxc: Shift generic request/free after gpiochip registration
Date: Tue, 1 Nov 2016 23:55:58 +0100
Message-ID: <CACRpkdYg2nKO5i7_5q0Hp3rvqmGiPCkueXxp7JnGTsJ-Mb1wAQ@mail.gmail.com>
References: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:35869 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbcKAWz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 18:55:59 -0400
Received: by mail-qk0-f172.google.com with SMTP id o68so218622352qkf.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Nov 2016 15:55:59 -0700 (PDT)
In-Reply-To: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Tue, Oct 25, 2016 at 8:02 PM, Deepak Das <deepak_das@mentor.com> wrote:

> generic gpio request/free should be added after gpiocip registration
> to validate mapping of gpiochip with pinctrl subsystem.
>
> gpiochip->pin_ranges list contains the information used by pinctrl
> subsystem to configure corresponding pins for gpio usage.
> This list will be empty if gpiochip fails to map with
> pinctrl subsystem for any reason.
> For Ex.:-
> generic gpio request/free should not be used if IOMUX pin controller
> device node is disabled in device tree.
>
> This commit checks above list and skips adding generic gpio request/free
> if list is found empty.
>
> Signed-off-by: Deepak Das <deepak_das@mentor.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

So we should not dereference gpiolib internals.

> -       if (of_property_read_bool(np, "gpio-ranges")) {
> -               port->gc.request = gpiochip_generic_request;
> -               port->gc.free = gpiochip_generic_free;
> -       }
> -
>         port->gc.to_irq = mxc_gpio_to_irq;
>         port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
>                                              pdev->id * 32;
> @@ -471,6 +466,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>         if (err)
>                 goto out_bgio;
>
> +       if (!list_empty(&port->gc.pin_ranges)) {
> +               port->gc.request = gpiochip_generic_request;
> +               port->gc.free = gpiochip_generic_free;
> +       }

Can't you just check the "gpio-ranges" property later instead?

Yours,
Linus Walleij
