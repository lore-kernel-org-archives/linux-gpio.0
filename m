From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] gpio: aspeed: add MODULE_LICENSE()
Date: Tue, 13 Sep 2016 21:24:19 +0930
Message-ID: <CACPK8XeWmMmKQkEN5cdNhSPKVfGCT7ond1pzQxoT9ei=y3zMLw@mail.gmail.com>
References: <1473767118-11118-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:36479 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbcIMLyk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 07:54:40 -0400
Received: by mail-vk0-f65.google.com with SMTP id z193so7643314vke.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 04:54:40 -0700 (PDT)
In-Reply-To: <1473767118-11118-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>

On Tue, Sep 13, 2016 at 9:15 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The build complains about missing MODULE_LICENSE() in
> the Aspeed GPIO driver. The license is evident from the
> file header, put in "GPL".

Acked-by: Joel Stanley <joel@jms.id.au>

Either take this or apply https://lkml.org/lkml/2016/9/13/10.

Cheers,

Joel

>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Alistair Popple <alistair@popple.id.au>
> Cc: Jeremy Kerr <jk@ozlabs.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 64348a6fb60f..9f7266e05f0a 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -455,3 +455,4 @@ static struct platform_driver aspeed_gpio_driver = {
>  module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
>
>  MODULE_DESCRIPTION("Aspeed GPIO Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.7.4
>
