From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 2/6] pinctrl: sh-pfc: Add helper to handle bias lookup table
Date: Sat, 12 Nov 2016 03:46:11 +0200
Message-ID: <4161854.1CIEq2dT0e@avalon>
References: <20161111203021.3384-1-niklas.soderlund@ragnatech.se> <20161111203021.3384-3-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161111203021.3384-3-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Friday 11 Nov 2016 21:30:17 Niklas S=F6derlund wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> On some SoC there are no simple mapping of pins to bias register bits=

> and a lookup table is needed. This logic is already implemented in so=
me
> SoC specific drivers that could benefit from a generic implementation=
.
>=20
> Add helpers to deal with the lookup which later can be used by the So=
C
> specific drivers. The logic used to lookup are different from the one=
 it
> aims to replace, this is intentional. This new method reduces the mem=
ory
> consumption at the cost of increased CPU usage and fix a bug where a
> WARN() would incorrectly be triggered if the register offset is 0.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>
> ---
>  drivers/pinctrl/sh-pfc/core.c   | 16 ++++++++++++++++
>  drivers/pinctrl/sh-pfc/core.h   |  4 ++++
>  drivers/pinctrl/sh-pfc/sh_pfc.h |  6 ++++++
>  3 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/c=
ore.c
> index f3a8897..8e38df7 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -389,6 +389,22 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsign=
ed
> mark, int pinmux_type) return 0;
>  }
>=20
> +int sh_pfc_pin_to_bias_info(const struct sh_pfc_bias_info *pullups,
> +=09=09=09    unsigned int num, unsigned int pin,
> +=09=09=09    struct sh_pfc_bias_info *info)

How about returning a const struct sh_pfc_bias_info * instead ? This wo=
uld=20
avoid copying the data into the *info argument. You could then rename p=
ullups=20
to info (I don't really like the pullups name as the table can contain=20=

pulldown information as well).

> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < num; i++) {
> +=09=09if (pullups[i].pin =3D=3D pin) {
> +=09=09=09*info =3D pullups[i];
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09return WARN_ON_ONCE(-EINVAL);
> +}
> +
>  static int sh_pfc_init_ranges(struct sh_pfc *pfc)
>  {
>  =09struct sh_pfc_pin_range *range;
> diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/c=
ore.h
> index 0bbdea58..d902cd2 100644
> --- a/drivers/pinctrl/sh-pfc/core.h
> +++ b/drivers/pinctrl/sh-pfc/core.h
> @@ -33,4 +33,8 @@ void sh_pfc_write_reg(struct sh_pfc *pfc, u32 reg,
> unsigned int width, int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsi=
gned
> int pin);
>  int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_=
type);
>=20
> +int sh_pfc_pin_to_bias_info(const struct sh_pfc_bias_info *pullups,
> +=09=09=09    unsigned int num, unsigned int pin,
> +=09=09=09    struct sh_pfc_bias_info *info);
> +
>  #endif /* __SH_PFC_CORE_H__ */
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index 2345421..fc82b6d 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -189,6 +189,12 @@ struct sh_pfc_window {
>  =09unsigned long size;
>  };
>=20
> +struct sh_pfc_bias_info {
> +=09unsigned int pin;

You should make this a u16, otherwise the structure will be padded to 8=
 bytes=20
anyway, removing the benefit of storing reg and bit in 16 bits.

> +=09u16 reg : 11;
> +=09u16 bit : 5;
> +};
> +
>  struct sh_pfc_pin_range;
>=20
>  struct sh_pfc {

--=20
Regards,

Laurent Pinchart
