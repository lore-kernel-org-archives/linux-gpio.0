From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 169/182] mfd: vexpress-sysreg: switch to
 gpiochip_add_data()
Date: Thu, 10 Dec 2015 10:34:26 +0000
Message-ID: <20151210103426.GH17876@x1>
References: <1449668914-6545-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:33789 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459AbbLJKea (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:34:30 -0500
Received: by mail-wm0-f53.google.com with SMTP id c201so25918203wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:34:29 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668914-6545-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Wed, 09 Dec 2015, Linus Walleij wrote:

> We're planning to remove the gpiochip_add() function to swith
> to gpiochip_add_data() with NULL for data argument.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/mfd/vexpress-sysreg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sys=
reg.c
> index 855c0204f09a..201a3ea2a9d3 100644
> --- a/drivers/mfd/vexpress-sysreg.c
> +++ b/drivers/mfd/vexpress-sysreg.c
> @@ -202,7 +202,7 @@ static int vexpress_sysreg_probe(struct platform_=
device *pdev)
>  	bgpio_init(mmc_gpio_chip, &pdev->dev, 0x4, base + SYS_MCI,
>  			NULL, NULL, NULL, NULL, 0);
>  	mmc_gpio_chip->ngpio =3D 2;
> -	gpiochip_add(mmc_gpio_chip);
> +	gpiochip_add_data(mmc_gpio_chip, NULL);
> =20
>  	return mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>  			vexpress_sysreg_cells,

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
