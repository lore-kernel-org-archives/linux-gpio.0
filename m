From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 3/6] pinctrl: sh-pfc: r8a7795: Simplify get bias logic
Date: Sat, 12 Nov 2016 00:42:19 +0200
Message-ID: <1742469.h1uB4hWBoE@avalon>
References: <20161111203021.3384-1-niklas.soderlund@ragnatech.se> <20161111203021.3384-4-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161111203021.3384-4-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Friday 11 Nov 2016 21:30:18 Niklas S=F6derlund wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> The last else statement is missing braces and there indentation level=

> can be reduced.
>=20
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c index 2e8cc2a..6c58563 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -5367,13 +5367,12 @@ static unsigned int r8a7795_pinmux_get_bias(s=
truct
> sh_pfc *pfc, reg =3D pullups[pin].reg;
>  =09bit =3D BIT(pullups[pin].bit);
>=20
> -=09if (sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit) {
> -=09=09if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
> -=09=09=09return PIN_CONFIG_BIAS_PULL_UP;
> -=09=09else
> -=09=09=09return PIN_CONFIG_BIAS_PULL_DOWN;
> -=09} else
> +=09if (!(sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit))
>  =09=09return PIN_CONFIG_BIAS_DISABLE;
> +=09else if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
> +=09=09return PIN_CONFIG_BIAS_PULL_UP;
> +=09else
> +=09=09return PIN_CONFIG_BIAS_PULL_DOWN;
>  }
>=20
>  static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int=
 pin,

--=20
Regards,

Laurent Pinchart
