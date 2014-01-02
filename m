From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: generic: Use platform_device_id->driver_data field
 for driver flags
Date: Thu, 2 Jan 2014 14:13:26 +0100
Message-ID: <CACRpkdZ9R4ejf-UuGb6TFzv-3OJNtdENkdFaH02nNboKKTTXjg@mail.gmail.com>
References: <1387656930-15174-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:38031 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbaABNN1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 08:13:27 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so14676147oag.6
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 05:13:26 -0800 (PST)
In-Reply-To: <1387656930-15174-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Anton Vorontsov <anton.vorontsov@linaro.org>, Anton Vorontsov <anton@enomsg.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Dec 21, 2013 at 9:15 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/gpio/gpio-generic.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index d2196bf..82d36fc 100644
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
> @@ -549,9 +546,15 @@ static int bgpio_pdev_remove(struct platform_device *pdev)
>  }
>
>  static const struct platform_device_id bgpio_id_table[] = {
> -       { "basic-mmio-gpio", },
> -       { "basic-mmio-gpio-be", },
> -       {},
> +       {
> +               .name           = "basic-mmio-gpio",
> +               .driver_data    = 0,
> +       },
> +       {
> +               .name           = "basic-mmio-gpio-be",
> +               .driver_data    = BGPIOF_BIG_ENDIAN,
> +       },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(platform, bgpio_id_table);

Looks right to me, but I'd like Anton to ACK this patch as this is his
driver.

Yours,
Linus Walleij
