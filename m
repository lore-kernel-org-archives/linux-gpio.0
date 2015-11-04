From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: change member .dev to .parent
Date: Wed, 4 Nov 2015 17:13:00 +0000
Message-ID: <20151104171300.GJ3503@x1>
References: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38483 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030743AbbKDRNZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2015 12:13:25 -0500
Received: by wicll6 with SMTP id ll6so36390266wic.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2015 09:13:05 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Alek Du <alek.du@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>

On Wed, 04 Nov 2015, Linus Walleij wrote:

> The name .dev in a struct is normally reserved for a struct device
> that is let us say a superclass to the thing described by the struct.
> struct gpio_chip stands out by confusingly using a struct device *dev
> to point to the parent device (such as a platform_device) that
> represents the hardware. As we want to give gpio_chip:s real devices,
> this is not working. We need to rename this member to parent.
>=20
> This was done by two coccinelle scripts, I guess it is possible to
> combine them into one, but I don't know such stuff. They look like
> this:
>=20
> @@
> struct gpio_chip *var;
> @@
> -var->dev
> +var->parent
>=20
> and:
>=20
> @@
> struct gpio_chip var;
> @@
> -var.dev
> +var.parent
>=20
> This patch hits all over the place, but I *strongly* prefer this
> solution to any piecemal approaches that just exercise patch
> mechanics all over the place. It mainly hits drivers/gpio and
> drivers/pinctrl which is my own backyard anyway.
>=20
> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Alek Du <alek.du@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Other subsystem maintainers: please ACK this. I want to merge this
> big patch in the beginning of -rc1. I can create an immutable branch
> or tag if you think it will cause you problems, so you can pull it
> in.
> ---

[...]

>  drivers/mfd/dm355evm_msp.c                    |  2 +-
>  drivers/mfd/htc-egpio.c                       |  2 +-
>  drivers/mfd/htc-i2cpld.c                      |  4 +--
>  drivers/mfd/tps65010.c                        |  2 +-

[...]

>  120 files changed, 265 insertions(+), 252 deletions(-)

[...]

> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index 4c826f78acd0..bc90efe01b59 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -259,7 +259,7 @@ static int add_children(struct i2c_client *client=
)
>  	int		i;
> =20
>  	/* GPIO-ish stuff */
> -	dm355evm_msp_gpio.dev =3D &client->dev;
> +	dm355evm_msp_gpio.parent =3D &client->dev;
>  	status =3D gpiochip_add(&dm355evm_msp_gpio);
>  	if (status < 0)
>  		return status;
> diff --git a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
> index 6ccaf90d98fd..eca19d637785 100644
> --- a/drivers/mfd/htc-egpio.c
> +++ b/drivers/mfd/htc-egpio.c
> @@ -321,7 +321,7 @@ static int __init egpio_probe(struct platform_dev=
ice *pdev)
>  		ei->chip[i].dev =3D &(pdev->dev);
>  		chip =3D &(ei->chip[i].chip);
>  		chip->label           =3D "htc-egpio";
> -		chip->dev             =3D &pdev->dev;
> +		chip->parent             =3D &pdev->dev;

Are you buggering up my tabbing, or is this a Gitisum?

I'm sure it is.  Anyway:

  Acked-by: Lee Jones <lee.jones@linaro.org>

=2E. use it wisely. ;)

>  		chip->owner           =3D THIS_MODULE;
>  		chip->get             =3D egpio_get;
>  		chip->set             =3D egpio_set;
> diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
> index 1bd5b042c8b3..a36f6a5a308b 100644
> --- a/drivers/mfd/htc-i2cpld.c
> +++ b/drivers/mfd/htc-i2cpld.c
> @@ -430,7 +430,7 @@ static int htcpld_register_chip_gpio(
>  	/* Setup the GPIO chips */
>  	gpio_chip =3D &(chip->chip_out);
>  	gpio_chip->label           =3D "htcpld-out";
> -	gpio_chip->dev             =3D dev;
> +	gpio_chip->parent             =3D dev;
>  	gpio_chip->owner           =3D THIS_MODULE;
>  	gpio_chip->get             =3D htcpld_chip_get;
>  	gpio_chip->set             =3D htcpld_chip_set;
> @@ -441,7 +441,7 @@ static int htcpld_register_chip_gpio(
> =20
>  	gpio_chip =3D &(chip->chip_in);
>  	gpio_chip->label           =3D "htcpld-in";
> -	gpio_chip->dev             =3D dev;
> +	gpio_chip->parent             =3D dev;
>  	gpio_chip->owner           =3D THIS_MODULE;
>  	gpio_chip->get             =3D htcpld_chip_get;
>  	gpio_chip->set             =3D NULL;
> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index 448f0a182dc4..b96847491277 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -638,7 +638,7 @@ static int tps65010_probe(struct i2c_client *clie=
nt,
>  		tps->outmask =3D board->outmask;
> =20
>  		tps->chip.label =3D client->name;
> -		tps->chip.dev =3D &client->dev;
> +		tps->chip.parent =3D &client->dev;
>  		tps->chip.owner =3D THIS_MODULE;
> =20
>  		tps->chip.set =3D tps65010_gpio_set;

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
