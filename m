From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: Support named pins with custom configuration
Date: Tue, 13 Sep 2016 17:28:10 +0300
Message-ID: <6167007.snST7ECEYM@avalon>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se> <20160913140314.22035-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160913140314.22035-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch

On Tuesday 13 Sep 2016 16:03:11 Niklas S=F6derlund wrote:
> Pins not associated with a GPIO port can still have other configurati=
on
> parameters. Add a new macro SH_PFC_PIN_NAMED_CFG which allows for nam=
ed
> pins to be declared with a set of configurations. The new macro is an=

> modification of SH_PFC_PIN_NAMED to allow for optional configuration =
to
> be assigned.
>=20
> The flag SH_PFC_PIN_CFG_NO_GPIO is still enforced as this should only=
 be
> used to define pins not associated with a GPIO port.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index 5e966c0..a6a2346 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -507,6 +507,14 @@ extern const struct sh_pfc_soc_info shx3_pinmux_=
info;
>  =09=09.configs =3D SH_PFC_PIN_CFG_NO_GPIO,=09=09=09\
>  =09}
>=20
> +/* SH_PFC_PIN_NAMED_CFG - Expand to a sh_pfc_pin entry with the give=
n name
> */ +#define SH_PFC_PIN_NAMED_CFG(row, col, _name, cfgs)=09=09=09
\
> +=09{=09=09=09=09=09=09=09=09\
> +=09=09.pin =3D PIN_NUMBER(row, col),=09=09=09=09\
> +=09=09.name =3D __stringify(PIN_##_name),=09=09=09\
> +=09=09.configs =3D SH_PFC_PIN_CFG_NO_GPIO | cfgs,=09=09\
> +=09}
> +
>  /* PINMUX_DATA_ALL - Expand to a list of PORT_name_DATA, PORT_name_F=
N0,
>   *=09=09     PORT_name_OUT, PORT_name_IN marks
>   */

--=20
Regards,

Laurent Pinchart
