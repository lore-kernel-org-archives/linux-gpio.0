From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
Date: Thu, 03 Nov 2016 18:55:30 +0200
Message-ID: <1878224.Wij8B8yE4Q@avalon>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se> <20161103153421.15527-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56790 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757963AbcKCQzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2016 12:55:50 -0400
In-Reply-To: <20161103153421.15527-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thursday 03 Nov 2016 16:34:20 Niklas S=F6derlund wrote:
> Always stating PIN_CONFIG_BIAS_DISABLE is supported gives untrue outp=
ut
> when examining /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins if=

> the operation get_bias() are implemented but the pin are not handled =
by
> the get_bias() implementation. In that case the output will state tha=
t
> "input bias disabled" indicating that this pin have bias control
> support.
>=20
> Make support for PIN_CONFIG_BIAS_DISABLE depend on that the pin eithe=
r
> support SH_PFC_PIN_CFG_PULL_UP or SH_PFC_PIN_CFG_PULL_DOWN. This also=

> solves the issue where SoC specific implementations print error messa=
ges
> if there particular implementation of {set,get}_bias() is called with=
 a
> pin it do not know about.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pinctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c
> b/drivers/pinctrl/sh-pfc/pinctrl.c index c577258..fcacfa7 100644
> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> @@ -570,7 +570,8 @@ static bool sh_pfc_pinconf_validate(struct sh_pfc=
 *pfc,
> unsigned int _pin,
>=20
>  =09switch (param) {
>  =09case PIN_CONFIG_BIAS_DISABLE:
> -=09=09return true;
> +=09=09return pin->configs &
> +=09=09=09(SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN);
>=20
>  =09case PIN_CONFIG_BIAS_PULL_UP:
>  =09=09return pin->configs & SH_PFC_PIN_CFG_PULL_UP;

--=20
Regards,

Laurent Pinchart

