From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mfd: lpc_ich: add GPIO support for Baytrail
Date: Mon, 25 Jan 2016 12:45:41 +0000
Message-ID: <20160125124541.GK3368@x1>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
 <1453566729-30220-4-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35346 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756751AbcAYMpq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2016 07:45:46 -0500
Received: by mail-wm0-f43.google.com with SMTP id r129so62519600wmr.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2016 04:45:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1453566729-30220-4-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: ptyser@xes-inc.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 23 Jan 2016, Antoine Tenart wrote:

> This patch adds the GPIO support for the Baytrail family.
>=20
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mfd/lpc_ich.c | 1 +
>  1 file changed, 1 insertion(+)

I can't take this yet, as it has a dependency on the GPIO patch.

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index f13a5ded3958..d86b496874df 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -508,6 +508,7 @@ static struct lpc_ich_info lpc_chipset_info[] =3D=
 {
>  	[LPC_BAYTRAIL] =3D {
>  		.name =3D "Bay Trail SoC",
>  		.iTCO_version =3D 3,
> +		.gpio_version =3D ICH_BAYTRAIL_GPIO,
>  	},
>  	[LPC_COLETO] =3D {
>  		.name =3D "Coleto Creek",

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
