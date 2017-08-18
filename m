From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4] pinctrl: aspeed: Fix ast2500 strap register write
 logic
Date: Fri, 18 Aug 2017 11:06:22 +0930
Message-ID: <1503020182.681.10.camel@aj.id.au>
References: <1503010402-90405-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-dVmuIvOv3Dkjhg4X06qW"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45835 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753482AbdHRBge (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Aug 2017 21:36:34 -0400
In-Reply-To: <1503010402-90405-1-git-send-email-sdliyong@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>, linus.walleij@linaro.org, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--=-dVmuIvOv3Dkjhg4X06qW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-18 at 06:53 +0800, Yong Li wrote:
> On AST2500, the hardware strap register(SCU70) only accepts write =E2=80=
=981=E2=80=99,
> to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=E2=80=
=981=E2=80=99) to SCU7C
>=20
> Signed-off-by: Yong Li <sdliyong@gmail.com>

Take 2 ;)

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Andrew Jeffery <andrew@aj.id.au>

Cheers,

Andrew

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 21 +++++++++++++++++++++
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A01 +
> =C2=A02 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index a86a4d6..7f13ce8 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -213,6 +213,27 @@ static int aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> > =C2=A0		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP2=
)
> > =C2=A0			continue;
> =C2=A0
> > +		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> > +		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1) {
> > +			unsigned int rev_id;
> +
> > +			ret =3D regmap_read(maps[ASPEED_IP_SCU],
> > +				HW_REVISION_ID, &rev_id);
> > +			if (ret < 0)
> > +				return ret;
> +
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
> > =C2=A0		ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > =C2=A0					=C2=A0desc->mask, val);
> =C2=A0
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
--=-dVmuIvOv3Dkjhg4X06qW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZlkSWAAoJEJ0dnzgO5LT5Fr8P/RAd4NRkRMTgT1H3/aVjFzSL
Qo1SePtXXW2HVobaxdmNOeNiUIacK/sZUa8otfPQ7WFEG7rKdv0G1j0wd7Ch5RwG
ZWjrD+SxPZmR9Yj6z/j0FUV4mVp2bOCCZH7b3xG+b6e+q9kbWi461TZmqr+9ILgt
UUpteH1Z6C8jk3YPAQhbq0AzzC+SMhP8xqePHg+XNcbYqWQ4lhlYeYFY4tLFsPMp
slsoL5Cu4Mz4Di6V2TuL/Q6AvT+D8QgOrEc9+iyieLeT4I68RaXTDpgHnR26fbER
pYTnhcBsrerFUFP2pyF7lwK96X89DA/wYBqDlMVVbndM39xsJBSGG0ViVzMBQ9i5
gOsBg8Suc5yREWpACbgCFUyK14Zza5XMjT98g2hz3Y0m6jHDXQPLvmHyZnmGYr+F
s4C7miFaWG/BnCbaY2iBWLdUh4irZBuzJeDBnKLz5zJAvK+htP+Q4XjsZMc7RP5S
0My+s/CbD/70usn2E6zUKWmXbYywwCTqhFZNYB8wsjHjQ29ZyEienhZ3HXZX/SIm
Xg+i749nVWqyjoWzBy+ttkZrEGnJq8v7ryh0zD/A5HovrInJ/kLlFB2ft2RGnNiW
YmCf3B4+UHygrdNVJDZuUuMxDoyICpuPbeq0eoHmKK5FFJCS7iQZbOEUDBPQqC1P
lDA2DaQlgtD/Rh1XuYln
=Mamu
-----END PGP SIGNATURE-----

--=-dVmuIvOv3Dkjhg4X06qW--

