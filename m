From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Rework strap register write logic for
 the AST2500
Date: Wed, 30 Aug 2017 11:08:16 +0930
Message-ID: <1504057096.5933.12.camel@aj.id.au>
References: <20170823134125.2339-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-9pakij4eImAE9b00LrnU"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37399 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751318AbdH3Bi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Aug 2017 21:38:27 -0400
In-Reply-To: <20170823134125.2339-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, joel@jms.id.au, linux-kernel@vger.kernel.org, Yong Li <sdliyong@gmail.com>


--=-9pakij4eImAE9b00LrnU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 2017-08-23 at 23:11 +0930, Andrew Jeffery wrote:
> Yong Li found that writes to the AST2500 strapping register were not
> properly supported by the Aspeed pinctrl core and provided a patch to
> rectify the problem. Several revisions of the patch were posted and
> ultimately v4 should have been applied, however some unfortunate
> liberal application of tags on my part lead to confusion between v3[1]
> and v4[2].
>=C2=A0
> Generate the diff between v3 and v4 to apply as a fixup patch.
>=C2=A0
> [1] http://patchwork.ozlabs.org/patch/801662/
> [2] http://patchwork.ozlabs.org/patch/802946/
>=C2=A0
> > Cc: Yong Li <sdliyong@gmail.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Just wondering if you're going to pick this up? It's a fix for "1865af212df=
a
pinctrl: aspeed: Fix ast2500 strap register write logic" in pinctrl/devel a=
nd
pinctrl/for-next.

Cheers,

Andrew

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 26 ++++++++++++++++------=
----
> =C2=A01 file changed, 16 insertions(+), 10 deletions(-)
>=C2=A0
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index f2d5133f6993..7f13ce8450a3 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -183,7 +183,6 @@ static int aspeed_sig_expr_set(const struct aspeed_si=
g_expr *expr,
> =C2=A0{
> > =C2=A0	int ret;
> > =C2=A0	int i;
> > -	unsigned int rev_id;
> =C2=A0
> > =C2=A0	for (i =3D 0; i < expr->ndescs; i++) {
> > =C2=A0		const struct aspeed_sig_desc *desc =3D &expr->descs[i];
> @@ -216,20 +215,27 @@ static int aspeed_sig_expr_set(const struct aspeed_=
sig_expr *expr,
> =C2=A0
> > =C2=A0		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> > =C2=A0		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1=
) {
> > +			unsigned int rev_id;
> +
> > =C2=A0			ret =3D regmap_read(maps[ASPEED_IP_SCU],
> > =C2=A0				HW_REVISION_ID, &rev_id);
> > =C2=A0			if (ret < 0)
> > =C2=A0				return ret;
> =C2=A0
> > -			if (0x04 =3D=3D ((rev_id >> 24) & 0xff))
> > -				ret =3D regmap_write(maps[desc->ip],
> > -					HW_REVISION_ID, (~val & desc->mask));
> > -			else
> > -				ret =3D regmap_update_bits(maps[desc->ip],
> > -					desc->reg, desc->mask, val);
> > -		} else
> > -			ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > -				desc->mask, val);
> > +			if (0x04 =3D=3D (rev_id >> 24)) {
> > +				u32 value =3D ~val & desc->mask;
> +
> > +				if (value) {
> > +					ret =3D regmap_write(maps[desc->ip],
> > +						HW_REVISION_ID, value);
> > +					if (ret < 0)
> > +						return ret;
> > +				}
> > +			}
> > +		}
> +
> > +		ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > +					=C2=A0desc->mask, val);
> =C2=A0
> > =C2=A0		if (ret)
> > =C2=A0			return ret;
--=-9pakij4eImAE9b00LrnU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZphcIAAoJEJ0dnzgO5LT5SMsP/ikLQi0q7bxskhGtBuFVWXji
eycX1uebji0tySmmyTiUbjHhm8Pc3GZiiU8ZVe783CiVAtSR+N4zTHUirkqz0ZwO
rv9JAQ9qQXAYQkLwnBJONSRyZLKYgm3ZpjGvlgpsm45cyscio+hI7bwKwaIZeMoN
LWpfdWjyByDi7PBOj5Ss8g/AiyOqeuHb1eVAMHxnIIIuqsIRD8WinqX89I10BhNL
tVnxoVi/JQu5MSRY+LnBOn3owFiJZmEmdIT52BC/Mm8CbVt+IiOa9vd/+9mPDxgM
PaakC+MRwunecnT9OvHkbtqHOwxDRfuXchI+VkL6Uyagfo6cGgJSYHEhyvzBaJvk
OAf3FFDuDjYPrK3QPJBYuEAq1uRq++LEuSbe7vuwCIjhNGghZjlS/mRyX7QGW1pH
JlU69Riuxi6A+D2fmmUyLLYCNi3No0Efb4PQLmGUHAxwyi5L/Gf+YbWjLW1jGgoC
4JWKDvIurIpc9j8Kk7G6Yw2kO+MfIYW9LPkFLEfz9UAbusNNRuB4S/ZlbfmkMpXC
50dY/5pF1CgvwQhoCC+bahjcC/sgp20fPOa/OMPKtIJiKj17QXHIn6FXe3mDJHUV
yUE2mGk/76rbwuE1NFV/pTWWY8HRRYGc7ArXrev3w6Y6+HTBTahEwH4mp9cNMkiA
CzYbpMinp+hNWLkbuKqa
=rUeh
-----END PGP SIGNATURE-----

--=-9pakij4eImAE9b00LrnU--

