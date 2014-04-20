From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 1/2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Sun, 20 Apr 2014 11:31:48 -0700
Message-ID: <53541294.304@openwrt.org>
References: <1397196885.12922.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:58181 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbaDTSbt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Apr 2014 14:31:49 -0400
Received: by mail-oa0-f45.google.com with SMTP id eb12so3495877oac.18
        for <linux-gpio@vger.kernel.org>; Sun, 20 Apr 2014 11:31:49 -0700 (PDT)
In-Reply-To: <1397196885.12922.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

Le 10/04/2014 23:14, Axel Lin a =C3=A9crit :
> The valid gpio is GPIO0 ~ GPIO58, so ngpio should be RDC321X_MAX_GPIO=
 + 1.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Florian Fainelli <florian@openwrt.org>

> ---
>   drivers/gpio/gpio-rdc321x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.=
c
> index 88577c3..9e7da2d 100644
> --- a/drivers/gpio/gpio-rdc321x.c
> +++ b/drivers/gpio/gpio-rdc321x.c
> @@ -176,7 +176,7 @@ static int rdc321x_gpio_probe(struct platform_dev=
ice *pdev)
>   	rdc321x_gpio_dev->chip.get =3D rdc_gpio_get_value;
>   	rdc321x_gpio_dev->chip.set =3D rdc_gpio_set_value;
>   	rdc321x_gpio_dev->chip.base =3D 0;
> -	rdc321x_gpio_dev->chip.ngpio =3D pdata->max_gpios;
> +	rdc321x_gpio_dev->chip.ngpio =3D pdata->max_gpios + 1;
>
>   	platform_set_drvdata(pdev, rdc321x_gpio_dev);
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
