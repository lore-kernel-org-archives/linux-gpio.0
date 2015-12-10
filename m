From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 162/182] mfd: dm355evm_msp: switch to gpiochip_add_data()
Date: Thu, 10 Dec 2015 10:36:05 +0000
Message-ID: <20151210103605.GN17876@x1>
References: <1449668849-6213-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35423 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740AbbLJKgJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 05:36:09 -0500
Received: by mail-wm0-f48.google.com with SMTP id u63so17688838wmu.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 02:36:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668849-6213-1-git-send-email-linus.walleij@linaro.org>
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
>  drivers/mfd/dm355evm_msp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index bc90efe01b59..d2c9a0dda531 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -260,7 +260,7 @@ static int add_children(struct i2c_client *client=
)
> =20
>  	/* GPIO-ish stuff */
>  	dm355evm_msp_gpio.parent =3D &client->dev;
> -	status =3D gpiochip_add(&dm355evm_msp_gpio);
> +	status =3D gpiochip_add_data(&dm355evm_msp_gpio, NULL);
>  	if (status < 0)
>  		return status;
> =20

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
