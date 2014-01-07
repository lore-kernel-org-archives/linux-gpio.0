From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH Resend] gpio: lp3943: Remove redundant of_match_ptr helper
Date: Tue, 7 Jan 2014 07:39:40 +0000
Message-ID: <20140107073940.GA3182@lee--X1>
References: <1389076038-16730-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:59539 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754472AbaAGHjp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 02:39:45 -0500
Received: by mail-wg0-f51.google.com with SMTP id b13so16809504wgh.30
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2014 23:39:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1389076038-16730-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-gpio@vger.kernel.org

> 'lp3943_gpio_of_match' is always compiled in. Hence the
> helper macro is not needed.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-lp3943.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
> index 7b8db88ebb7b..a0341c92bcb4 100644
> --- a/drivers/gpio/gpio-lp3943.c
> +++ b/drivers/gpio/gpio-lp3943.c
> @@ -231,7 +231,7 @@ static struct platform_driver lp3943_gpio_driver =
=3D {
>  	.driver =3D {
>  		.name =3D "lp3943-gpio",
>  		.owner =3D THIS_MODULE,
> -		.of_match_table =3D of_match_ptr(lp3943_gpio_of_match),
> +		.of_match_table =3D lp3943_gpio_of_match,
>  	},
>  };
>  module_platform_driver(lp3943_gpio_driver);

Applied, thanks.

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
