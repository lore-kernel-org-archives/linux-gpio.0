From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 46/54] mfd: dm355evm_mps: Be sure to clamp return value
Date: Mon, 11 Jan 2016 07:47:22 +0000
Message-ID: <20160111074722.GH3331@x1>
References: <1450795633-28167-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37851 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758612AbcAKHrZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 02:47:25 -0500
Received: by mail-wm0-f51.google.com with SMTP id f206so254163858wmf.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jan 2016 23:47:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450795633-28167-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Tue, 22 Dec 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret =3D !!(val) design pattern.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  drivers/mfd/dm355evm_msp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index bc90efe01b59..ec4438ed2faf 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -147,7 +147,7 @@ static int msp_gpio_get(struct gpio_chip *chip, u=
nsigned offset)
>  		return status;
>  	if (reg =3D=3D DM355EVM_MSP_LED)
>  		msp_led_cache =3D status;
> -	return status & MSP_GPIO_MASK(offset);
> +	return !!(status & MSP_GPIO_MASK(offset));
>  }
> =20
>  static int msp_gpio_out(struct gpio_chip *chip, unsigned offset, int=
 value)

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
