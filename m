From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] gpio: ucb1400: Add MODULE_ALIAS
Date: Tue, 19 Nov 2013 09:52:14 +0100
Message-ID: <1384851134.4750.18.camel@chaos.site>
References: <1384846280.4900.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43885 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751186Ab3KSIwT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 19 Nov 2013 03:52:19 -0500
In-Reply-To: <1384846280.4900.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marex@denx.de>, linux-gpio@vger.kernel.org

Hi Axel,

Le Tuesday 19 November 2013 =C3=A0 15:31 +0800, Axel Lin a =C3=A9crit :
> This driver can be built as a module now.
> Add MODULE_ALIAS to support module auto-loading.
>=20
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-ucb1400.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.=
c
> index 1a605f2..06fb5cf 100644
> --- a/drivers/gpio/gpio-ucb1400.c
> +++ b/drivers/gpio/gpio-ucb1400.c
> @@ -105,3 +105,4 @@ module_platform_driver(ucb1400_gpio_driver);
> =20
>  MODULE_DESCRIPTION("Philips UCB1400 GPIO driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ucb1400_gpio");

Sorry for missing that in my previous patch, and thanks for catching my
mistake.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

I believe this should make it into kernel version 3.13 to avoid
regressions.

--=20
Jean Delvare
Suse L3 Support

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
