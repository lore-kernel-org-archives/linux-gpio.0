From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] gpio: gpio-ich: add support for Intel Baytrail
Date: Mon, 25 Jan 2016 12:43:59 +0000
Message-ID: <20160125124359.GI3368@x1>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
 <1453566729-30220-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35766 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755781AbcAYMoE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2016 07:44:04 -0500
Received: by mail-wm0-f50.google.com with SMTP id r129so62463851wmr.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2016 04:44:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1453566729-30220-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: ptyser@xes-inc.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 23 Jan 2016, Antoine Tenart wrote:

> This patch adds support for the Braytrail series, with the hardware
> blink capability.
>=20
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/gpio/gpio-ich.c     | 12 ++++++++++++
>  include/linux/mfd/lpc_ich.h |  1 +

Acked-by: Lee Jones <lee.jones@linaro.org>

>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
> index 4ba7ed502131..6f5fcae32855 100644
> --- a/drivers/gpio/gpio-ich.c
> +++ b/drivers/gpio/gpio-ich.c
> @@ -384,6 +384,15 @@ static struct ichx_desc avoton_desc =3D {
>  	.use_outlvl_cache =3D true,
>  };
> =20
> +/* Baytrail */
> +static struct ichx_desc baytrail_desc =3D {
> +	.ngpio =3D 96,
> +	.regs =3D ichx_regs,
> +	.reglen =3D ichx_reglen,
> +	.have_blink =3D true,
> +	.use_outlvl_cache =3D true,
> +};
> +
>  static int ichx_gpio_request_regions(struct resource *res_base,
>  						const char *name, u8 use_gpio)
>  {
> @@ -461,6 +470,9 @@ static int ichx_gpio_probe(struct platform_device=
 *pdev)
>  	case AVOTON_GPIO:
>  		ichx_priv.desc =3D &avoton_desc;
>  		break;
> +	case ICH_BAYTRAIL_GPIO:
> +		ichx_priv.desc =3D &baytrail_desc;
> +		break;
>  	default:
>  		return -ENODEV;
>  	}
> diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.=
h
> index 2b300b44f994..659a1cd875d8 100644
> --- a/include/linux/mfd/lpc_ich.h
> +++ b/include/linux/mfd/lpc_ich.h
> @@ -34,6 +34,7 @@ enum {
>  	ICH_V10CORP_GPIO,
>  	ICH_V10CONS_GPIO,
>  	AVOTON_GPIO,
> +	ICH_BAYTRAIL_GPIO,
>  };
> =20
>  struct lpc_ich_info {

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
