From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH] gpiolib: Fix uninitialized variable warning
Date: Thu, 24 Dec 2015 00:16:42 -0800
Message-ID: <20151224081642.GA16437@tuxbot>
References: <1450907177-31529-1-git-send-email-ross.zwisler@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:36606 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754829AbbLXIQq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2015 03:16:46 -0500
Received: by mail-pa0-f42.google.com with SMTP id q3so124908010pav.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2015 00:16:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450907177-31529-1-git-send-email-ross.zwisler@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ross Zwisler <ross.zwisler@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed 23 Dec 13:46 PST 2015, Ross Zwisler wrote:

> Commit ef7c7553039b ("gpiolib: improve overlap check of range of gpio=
")
> introduced the following compiler warning:
>=20
> drivers/gpio/gpiolib.c: In function =91gpiochip_add=92:
> drivers/gpio/gpiolib.c:193:20: warning: =91iterator=92 may be used un=
initialized in this function [-Wmaybe-uninitialized]
>   struct gpio_chip *iterator;
>                     ^
>=20
> Fix this by initializing 'iterator' to NULL.
>=20
> Signed-off-by: Ross Zwisler <ross.zwisler@linux.intel.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn

> ---
>=20
> This was found in next-20151223.
>=20
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d72ac1f..abdcd6c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -190,7 +190,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
>  static int gpiochip_add_to_list(struct gpio_chip *chip)
>  {
>  	struct list_head *pos;
> -	struct gpio_chip *iterator;
> +	struct gpio_chip *iterator =3D NULL;
>  	struct gpio_chip *previous =3D NULL;
> =20
>  	if (list_empty(&gpio_chips)) {
> --=20
> 2.6.3
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
