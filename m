From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH -next] gpio: aspeed: fix return value check in aspeed_gpio_probe()
Date: Thu, 15 Sep 2016 11:18:12 +0930
Message-ID: <CACPK8XcGYs9W1Wk=oXM9txDN5fiEszSuNh9y4Vhc55YUTj6nAQ@mail.gmail.com>
References: <1473903032-20524-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:36355 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754281AbcIOBse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 21:48:34 -0400
Received: by mail-vk0-f65.google.com with SMTP id c124so333612vka.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2016 18:48:33 -0700 (PDT)
In-Reply-To: <1473903032-20524-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>

On Thu, Sep 15, 2016 at 11:00 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Thanks for the patch!

Cheers,

Joel

> ---
>  drivers/gpio/gpio-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9f7266e..8aa3406 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -413,8 +413,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>                 return -ENXIO;
>
>         gpio->base = devm_ioremap_resource(&pdev->dev, res);
> -       if (!gpio->base)
> -               return -ENOMEM;
> +       if (IS_ERR(gpio->base))
> +               return PTR_ERR(gpio->base);
>
>         spin_lock_init(&gpio->lock);
>
>
>
>
