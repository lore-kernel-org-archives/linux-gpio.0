From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 2/2] gpio: rdc321x: Convert to use devm_kzalloc
Date: Sun, 20 Apr 2014 11:32:09 -0700
Message-ID: <535412A9.5090304@openwrt.org>
References: <1397196885.12922.2.camel@phoenix> <1397196961.12922.4.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:34205 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbaDTScK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Apr 2014 14:32:10 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so3434704oag.7
        for <linux-gpio@vger.kernel.org>; Sun, 20 Apr 2014 11:32:09 -0700 (PDT)
In-Reply-To: <1397196961.12922.4.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Le 10/04/2014 23:16, Axel Lin a =C3=A9crit :
> This saves a few unwind code.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Florian Fainelli <florian@openwrt.org>

> ---
>   drivers/gpio/gpio-rdc321x.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.=
c
> index 9e7da2d..3027591 100644
> --- a/drivers/gpio/gpio-rdc321x.c
> +++ b/drivers/gpio/gpio-rdc321x.c
> @@ -141,7 +141,8 @@ static int rdc321x_gpio_probe(struct platform_dev=
ice *pdev)
>   		return -ENODEV;
>   	}
>
> -	rdc321x_gpio_dev =3D kzalloc(sizeof(struct rdc321x_gpio), GFP_KERNE=
L);
> +	rdc321x_gpio_dev =3D devm_kzalloc(&pdev->dev, sizeof(struct rdc321x=
_gpio),
> +					GFP_KERNEL);
>   	if (!rdc321x_gpio_dev) {
>   		dev_err(&pdev->dev, "failed to allocate private data\n");
>   		return -ENOMEM;
> @@ -150,8 +151,7 @@ static int rdc321x_gpio_probe(struct platform_dev=
ice *pdev)
>   	r =3D platform_get_resource_byname(pdev, IORESOURCE_IO, "gpio-reg1=
");
>   	if (!r) {
>   		dev_err(&pdev->dev, "failed to get gpio-reg1 resource\n");
> -		err =3D -ENODEV;
> -		goto out_free;
> +		return -ENODEV;
>   	}
>
>   	spin_lock_init(&rdc321x_gpio_dev->lock);
> @@ -162,8 +162,7 @@ static int rdc321x_gpio_probe(struct platform_dev=
ice *pdev)
>   	r =3D platform_get_resource_byname(pdev, IORESOURCE_IO, "gpio-reg2=
");
>   	if (!r) {
>   		dev_err(&pdev->dev, "failed to get gpio-reg2 resource\n");
> -		err =3D -ENODEV;
> -		goto out_free;
> +		return -ENODEV;
>   	}
>
>   	rdc321x_gpio_dev->reg2_ctrl_base =3D r->start;
> @@ -187,21 +186,17 @@ static int rdc321x_gpio_probe(struct platform_d=
evice *pdev)
>   					rdc321x_gpio_dev->reg1_data_base,
>   					&rdc321x_gpio_dev->data_reg[0]);
>   	if (err)
> -		goto out_free;
> +		return err;
>
>   	err =3D pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
>   					rdc321x_gpio_dev->reg2_data_base,
>   					&rdc321x_gpio_dev->data_reg[1]);
>   	if (err)
> -		goto out_free;
> +		return err;
>
>   	dev_info(&pdev->dev, "registering %d GPIOs\n",
>   					rdc321x_gpio_dev->chip.ngpio);
>   	return gpiochip_add(&rdc321x_gpio_dev->chip);
> -
> -out_free:
> -	kfree(rdc321x_gpio_dev);
> -	return err;
>   }
>
>   static int rdc321x_gpio_remove(struct platform_device *pdev)
> @@ -213,8 +208,6 @@ static int rdc321x_gpio_remove(struct platform_de=
vice *pdev)
>   	if (ret)
>   		dev_err(&pdev->dev, "failed to unregister chip\n");
>
> -	kfree(rdc321x_gpio_dev);
> -
>   	return ret;
>   }
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
