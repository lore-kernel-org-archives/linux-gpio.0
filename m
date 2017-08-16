From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write
 logic
Date: Wed, 16 Aug 2017 23:15:40 +0930
Message-ID: <1502891140.681.6.camel@aj.id.au>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-W0tW0HtNcuMyYcPsFPWz"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>, linus.walleij@linaro.org, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--=-W0tW0HtNcuMyYcPsFPWz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yong,

On Wed, 2017-08-16 at 00:21 +0800, Yong Li wrote:
> On AST2500, the hardware strap register(SCU70) only accepts write =E2=80=
=981=E2=80=99,
> to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=E2=80=
=981=E2=80=99) to SCU7C
>=20
> Signed-off-by: Yong Li <sdliyong@gmail.com>

./scripts/checkpatch.pl complains about DOS line-endings thoughout -
you should fix your editor to use Unix line endings (at least for
kernel work). Maybe if Linus is feeling charitable he can fix it up for
you. Regarding the meat of the change:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Andrew Jeffery <andrew@aj.id.au>

Thanks for the patch!

Andrew

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 19 +++++++++++++++++--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A01 +
> =C2=A02 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index a86a4d6..f2d5133 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -183,6 +183,7 @@ static int aspeed_sig_expr_set(const struct aspeed_si=
g_expr *expr,
> =C2=A0{
> > =C2=A0	int ret;
> > =C2=A0	int i;
> > +	unsigned int rev_id;
> =C2=A0
> > =C2=A0	for (i =3D 0; i < expr->ndescs; i++) {
> > =C2=A0		const struct aspeed_sig_desc *desc =3D &expr->descs[i];
> @@ -213,8 +214,22 @@ static int aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> > =C2=A0		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP2=
)
> > =C2=A0			continue;
> =C2=A0
> > -		ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > -					=C2=A0desc->mask, val);
> > +		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> > +		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1) {
> > +			ret =3D regmap_read(maps[ASPEED_IP_SCU],
> > +				HW_REVISION_ID, &rev_id);
> > +			if (ret < 0)
> > +				return ret;
> +
> > +			if (0x04 =3D=3D ((rev_id >> 24) & 0xff))
> > +				ret =3D regmap_write(maps[desc->ip],
> > +					HW_REVISION_ID, (~val & desc->mask));
> > +			else
> > +				ret =3D regmap_update_bits(maps[desc->ip],
> > +					desc->reg, desc->mask, val);
> > +		} else
> > +			ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > +				desc->mask, val);
> =C2=A0
> > =C2=A0		if (ret)
> > =C2=A0			return ret;
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/as=
peed/pinctrl-aspeed.h
> index fa125db..d4d7f03 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -251,6 +251,7 @@
> =C2=A0#define SCU3C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x3C /* System Reset Control/Status Register */
> =C2=A0#define SCU48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x48 /* MAC Interface Clock Delay Setting */
> =C2=A0#define HW_STRAP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x70 /* =
AST2400 strapping is 33 bits, is split */
> +#define HW_REVISION_ID=C2=A0=C2=A00x7C /* Silicon revision ID register *=
/
> =C2=A0#define SCU80=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x80 /* Multi-function Pin Control #1 */
> =C2=A0#define SCU84=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x84 /* Multi-function Pin Control #2 */
> =C2=A0#define SCU88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x88 /* Multi-function Pin Control #3 */
--=-W0tW0HtNcuMyYcPsFPWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZlEyEAAoJEJ0dnzgO5LT5f88P/1IRg5ojSpif+u3BeQZuC3bm
+6olR80ypRrasa1jSeXQ6c64gBkDN3wV+zZWgYubP7WC7Lv0O9c8TtKeJdvuIU4a
x1A1Z8+EGponM1GwH3QEwx5BHp10UH7gD+uQ3jfQOOBYCr+VbIu0U+QjtIx1/AB1
FMRGs6E5dg81MT0OIWtBX6jd1FnBlB2raoZRIeWdOIYJ1LbgYS4vX4EEV937cGHK
tHd1o0dVHsK9MT8imiNAjyyP9Sxqwji8vUmp3d1Nnze1DykyBssOdEgXuF5f9ylt
uNKrNWYagRJWv22zkb5JB3+ZfGzX6fA5Lg9KB8VKpElSKtC8incf1DvM1V+m+CAN
DA2Bk8bvdadL6ZV0iZiq/+iam0FbqWSHdyM486oWeYiVDlPUQqPfOVa4FzH/27hq
JGoASk0kS4Kbi3K/lA/lUo8qgj0N4Zca9TC/fQVCFZn54ZmwD8pyDenWX7jjtKM7
18+XYAnfdAaI9KGkvC44KFXOoeQl4dOHdEJ1ThlLFaUHtaTSUphfDj6a8XvDRmuk
PO92ZyYGjzIEmuMSdD9dunWGOx5uu9o3myC2fCCrBelUjAQf8hxVGi8Qmc6posdA
RybNMwf3YUoMayEB4bYNiR4RQWfq5kKRGuP3OT3BVXgOcB6mS7q2/Bare6R4QScv
8I92lA/SYh69GBVYBpqP
=VGkW
-----END PGP SIGNATURE-----

--=-W0tW0HtNcuMyYcPsFPWz--
