From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 042/182] gpio: mpc8xxx: use gpiochip data pointer
Date: Wed, 9 Dec 2015 20:19:56 +0100
Message-ID: <20151209191956.GW5072@pengutronix.de>
References: <1449667117-31740-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:57701 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753588AbbLITT7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 14:19:59 -0500
Content-Disposition: inline
In-Reply-To: <1449667117-31740-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Alexander Stein <alexander.stein@systec-electronic.com>

Hello Linus,

On Wed, Dec 09, 2015 at 02:18:37PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().

I wonder why your patch is an improvement. I imagine that container_of
is cheaper in instructions and memory/cache accesses.=20

>  static void mpc8xxx_gpio_save_regs(struct of_mm_gpio_chip *mm)
>  {
> -	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
> +	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(&mm->gc)=
;
> =20
>  	mpc8xxx_gc->data =3D in_be32(mm->regs + GPIO_DAT);
>  }

Also for my (subjective) eye the above change doesn't make the
assignment more readable.

So can you please expand your commit log (or rethink the patch)?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
