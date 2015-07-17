From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] Subject: pinctrl: imx1-core: Fix debug output in
 .pin_config_set callback
Date: Fri, 17 Jul 2015 09:56:23 +0200
Message-ID: <20150717075623.GL26287@pengutronix.de>
References: <55A85B59.5060906@gtsys.com.hk>
 <1437118723-19217-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64LDleNqNegJ4g97"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437118723-19217-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Ruehl <chris.ruehl@gtsys.com.hk>, linux-gpio@vger.kernel.org, stable@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--64LDleNqNegJ4g97
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2015 at 09:38:43AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> imx1_pinconf_set assumes that the array of pins in struct
> imx1_pinctrl_soc_info can be indexed by pin id to get the
> pinctrl_pin_desc for a pin. This used to be correct up to commit
> 607af165c047 which removed some entries from the array and so made it
> wrong to access the array by pin id.
>=20
> The result of this bug is a wrong pin name in the output for small pin
> ids and an oops for the bigger ones.
>=20
> This patch is the result of a discussion that includes patches by Markus
> Pargmann and Chris Ruehl.
>=20
> Fixes: 607af165c047 ("pinctrl: i.MX27: Remove nonexistent pad definitions=
")
> Cc: stable@vger.kernel.org
> Reported-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Markus Pargmann <mpa@pengutronix.de>

> ---
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinc=
trl/freescale/pinctrl-imx1-core.c
> index 5fd4437cee15..88a7fac11bd4 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -403,14 +403,13 @@ static int imx1_pinconf_set(struct pinctrl_dev *pct=
ldev,
>  			     unsigned num_configs)
>  {
>  	struct imx1_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	const struct imx1_pinctrl_soc_info *info =3D ipctl->info;
>  	int i;
> =20
>  	for (i =3D 0; i !=3D num_configs; ++i) {
>  		imx1_write_bit(ipctl, pin_id, configs[i] & 0x01, MX1_PUEN);
> =20
>  		dev_dbg(ipctl->dev, "pinconf set pullup pin %s\n",
> -			info->pins[pin_id].name);
> +			pin_desc_get(pctldev, pin_id)->name);
>  	}
> =20
>  	return 0;
> --=20
> 2.1.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--64LDleNqNegJ4g97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVqLUnAAoJEEpcgKtcEGQQRm8QALA9EozyvGdL4cxLASJGJ91f
Ssv/kNMQVFm1JHGSfqHPkTtj327Ru28ulM3YjwAdcMpj+7kieyyHLKHEcmH5mvId
Wy2zeNrvkNucsz7yAFuaePoQ3jwAe/bWYrjA//Wz1KJRInNkgis/wwpFGGEC3M4M
Eyh8kHgiIwqGZAfcvazEAc1GGK3gnYo0r/MzcbpzpwlRDA00B1ibrjFbobZrIW0G
cTdUb+/WSpzwzbDIXelAH5O7i/U70GwVIsWeFyxEkLZjXBLVGlpCT0cwPm1qTb8H
ITsvlylHiOaUX0l5ctvgJbe5S9SrHgjF/BIeG6U4Ek5zx6nKuU5i1O/GM/WHYGvf
G9QNraFtl4qbB9sOKCxc+LtVqPFgeW/J6+sX7U4IgFQ8NLHJoSXtncF14rCCNydg
yrcEm9HYpbEi4CPodV8aSNMqMQ8yXP2Yh9vArHD9yGBtvMiqyHBizVHMX/UrR+cc
L0PxSvrjvJZwWwVMSgKhH52J/z5iRBWIUdULV1T+0nCWOfq9BlpDSPulKr/XIwre
JC1YoKvJJQx5WaBPHxwhWiE3a/wisI1lmbhsvV/IoOCVBICrp4TEQuJVwQWjMwNX
zSc1oOwc+5GJdVsskA7rKJ5yHye84s1YsXtJfE2vFd1AcKrMyIJ9vgGbymFbfITs
rIHn5QxR5nFwBvl3QsEW
=8FBu
-----END PGP SIGNATURE-----

--64LDleNqNegJ4g97--
