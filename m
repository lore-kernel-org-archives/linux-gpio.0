From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RESEND] gpio: generic: Use platform_device_id->driver_data
 field for driver flags
Date: Mon, 17 Mar 2014 15:52:47 +0900
Message-ID: <CAAVeFuLEXWJE0Ad_5778k5hV_Xx4Vk0gFWxxRjKOu2AVyx19ew@mail.gmail.com>
References: <1394946634-25753-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:55294 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbaCQGxI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Mar 2014 02:53:08 -0400
Received: by mail-ve0-f169.google.com with SMTP id pa12so5416602veb.0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Mar 2014 23:53:07 -0700 (PDT)
In-Reply-To: <1394946634-25753-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Anton Vorontsov <cbouatmailru@gmail.com>

On Sun, Mar 16, 2014 at 2:10 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/gpio/gpio-generic.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index d815dd2..b5dff9e 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -488,7 +488,7 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
>         void __iomem *dirout;
>         void __iomem *dirin;
>         unsigned long sz;
> -       unsigned long flags = 0;
> +       unsigned long flags = pdev->id_entry->driver_data;
>         int err;
>         struct bgpio_chip *bgc;
>         struct bgpio_pdata *pdata = dev_get_platdata(dev);
> @@ -519,9 +519,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
>         if (err)
>                 return err;
>
> -       if (!strcmp(platform_get_device_id(pdev)->name, "basic-mmio-gpio-be"))
> -               flags |= BGPIOF_BIG_ENDIAN;
> -
>         bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
>         if (!bgc)
>                 return -ENOMEM;
> @@ -551,9 +548,14 @@ static int bgpio_pdev_remove(struct platform_device *pdev)
>  }
>
>  static const struct platform_device_id bgpio_id_table[] = {
> -       { "basic-mmio-gpio", },
> -       { "basic-mmio-gpio-be", },
> -       {},
> +       {
> +               .name           = "basic-mmio-gpio",
> +               .driver_data    = 0,
> +       }, {
> +               .name           = "basic-mmio-gpio-be",
> +               .driver_data    = BGPIOF_BIG_ENDIAN,
> +       },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(platform, bgpio_id_table);

Agreed that this kind of setup ought to be data-oriented.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
