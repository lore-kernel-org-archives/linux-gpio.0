From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Fix hardware strap register write logic
Date: Fri, 11 Aug 2017 18:02:15 +0930
Message-ID: <1502440335.7946.23.camel@aj.id.au>
References: <1502436472-136063-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-93oxR4C5jvsipe1ALCdw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60675 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751891AbdHKIlT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Aug 2017 04:41:19 -0400
In-Reply-To: <1502436472-136063-1-git-send-email-sdliyong@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>, linus.walleij@linaro.org, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--=-93oxR4C5jvsipe1ALCdw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yong,

On Fri, 2017-08-11 at 15:27 +0800, Yong Li wrote:
> The hardware strap register(SCU70) only accepts write =E2=80=981=E2=80=99=
,
> to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=E2=80=
=981=E2=80=99) to SCU7C
>=20
> > Signed-off-by: Yong Li <sdliyong@gmail.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 9 +++++++--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h | 1 +
> =C2=A02 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index a86a4d6..4305052 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -213,8 +213,13 @@ static int aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> > =C2=A0		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP2=
)
> > =C2=A0			continue;
> =C2=A0
> > -		ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > -					=C2=A0desc->mask, val);
> > +		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1 &&
> > +			val =3D=3D 0)
> > +			ret =3D regmap_update_bits(maps[desc->ip], HW_REVISION_ID,
> > +				desc->mask, desc->mask);
> > +		else
> > +			ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> +				desc->mask, val);

Good catch! However, this looks like it's only true on the AST2500 (and
related) SoCs. The AST2400 will clear the bits on writing 0 to
HW_STRAP1, so you will need some strategy to differentiate the two.
You're adding the HW_REVISION_ID offset, so maybe we could read that
back and write HW_REVISION_ID if the top byte is 0x04. This would save
some pain propagating the compatible through to here.

For reference, HW_REVISION_ID is structured as:

31:24: Reserved - SoC generation
	AST11xx: 0x00
	AST20xx: 0x00
	AST21xx: 0x00
	AST22xx: 0x00
	AST23xx: 0x01
	AST13xx: 0x01
	AST10xx: 0x01
	AST24xx: 0x02
	AST14xx: 0x02
	AST12xx: 0x02
	AST25xx: 0x04

23:16: Hardware revision
	A0: 0x00
	A1: 0x01
	A2: 0x03

15:8: Chip bonding option

7:0: Reserved

Cheers,

Andrew

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
--=-93oxR4C5jvsipe1ALCdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZjWuPAAoJEJ0dnzgO5LT5ZlEP/201xFS4aG4Ws+Dxije5d6Ji
o6lDk0bBsETz8dy9IowvpuH7aEt6OdQHVEoLDkcPeh9trWf90AjTwTrn3QJPwdMF
0tWmd7DcnrWxOh6eJQnhyzg/jRSQdzhp5MW1JTE65KYwuhtPy9Jg2f3rCngdeRNs
Jd3yyi34hLKl1s9RL93M2hO9pGdsomr+HucpCkNIi2g1AjPIng8uLm0+yHCm0w/H
mw70Ai4SA7R0AM6ESYRQvIRe4iv+tGHokGTb4SbdBoZNxGopB0uoB3g39fCmsVqI
sMsISw7u6XuLHPFu3YTpRdDrbOKv0wjWEKm5vQZPlPSZ3DlNJmb1Dm+cCBWWHKNs
guD5SGYcfHNSW7yAtVmsBmFWQOSRTEXt1Xe/m997WfUQmLGSxcR7c/LuMP4TzvIO
tPo+mDupNXT8LlyFdRviENUj83Ctzg940lXiz0PPNRYGKzS8HF5LjeRa6i8vCMc8
2ZRXEx+34uKnqHpRXe+58vM/pY5HGrSUo3ENy2nwv08XZNzIGUANkn4K0frck0Jy
LsLUd0clk24MDoqDC1g8+6vZYZUZ44lrzMmC9EfJ9+ouMeUBImLU4xvmxMBzJpRA
CEBPZNgE+PzQsscHl5ZHyEMvG2WhEDAIXfa9uhJRRWSXyQiRV9zkvK/6uNBz9/IW
RMItNyK5dLxWx8QPaamN
=rW8b
-----END PGP SIGNATURE-----

--=-93oxR4C5jvsipe1ALCdw--

