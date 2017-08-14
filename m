From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2] pinctrl: aspeed: Fix ast2500 strap register write
 logic
Date: Mon, 14 Aug 2017 10:23:13 +0930
Message-ID: <1502671993.7946.25.camel@aj.id.au>
References: <1502461363-70990-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-hFb5YnaPsqyLlJJJs9gh"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42589 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751406AbdHNAx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Aug 2017 20:53:26 -0400
In-Reply-To: <1502461363-70990-1-git-send-email-sdliyong@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>, linus.walleij@linaro.org, joel@jms.id.au, arnd@arndb.de, raltherr@google.com, robh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--=-hFb5YnaPsqyLlJJJs9gh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yong,

On Fri, 2017-08-11 at 22:22 +0800, Yong Li wrote:
> On AST2500, the hardware strap register(SCU70) only accepts write =E2=80=
=981=E2=80=99,
> to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=E2=80=
=981=E2=80=99) to SCU7C
>=20
> > Signed-off-by: Yong Li <sdliyong@gmail.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 20 ++++++++++++++++++--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A01 +
> =C2=A02 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index a86a4d6..9d2b2e9 100644
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
> @@ -213,8 +214,23 @@ static int aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> > =C2=A0		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP2=
)
> > =C2=A0			continue;
> =C2=A0
> > -		ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > -					=C2=A0desc->mask, val);
> > +		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> > +		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1 &&
> +			val =3D=3D 0) {

The AST2500 strapping register contains several multi-bit bit-fields.
Currently we know we'll only reach this test if we're modifying the
GPIO passthrough bits for bank D and E (bits 21 and 22 respectively),
so the 'val =3D=3D 0' test is functional but I wonder if we shouldn't be
more flexible. If we're more flexible here then we may only need to
modify the strap register test above this hunk to change the behaviour,
rather than needing to rework your additions here as well. More on this
below.

> +			ret =3D regmap_read(maps[ASPEED_IP_SCU],
> > +				HW_REVISION_ID, &rev_id);
> > +			if (ret < 0)
> > +				return ret;
> +
> > +			if (0x04 =3D=3D ((rev_id >> 24) & 0xff))
> > +				ret =3D regmap_update_bits(maps[desc->ip],
> +					HW_REVISION_ID, desc->mask, desc->mask);

regmap_update_bits() will do a read-modify-write operation whilst only
taking the regmap lock once, making the modification atomic. However,
HW_REVISION_ID is a W1C (write 1 to clear) register associated with
SCU70, so we don't actually need the read operation under the lock. We
can simply use regmap_write() here.

Addressing my comment on 'val =3D=3D 0' above, I think we can remove that
test if we instead write this as:

    ret =3D regmap_write(maps[    desc->ip], HW_REVISION_ID, (~val & desc->=
mask));

That way if we ever expand the HW_STRAP1 capabilites to cover the
bitfields (e.g. maybe we want to be able to dynamically switch SPI into
debug mode) the code should (hopefully) just work.

Cheers,

Andrew

> +			else
> > +				ret =3D regmap_update_bits(maps[desc->ip],
> > +					desc->reg, desc->mask, val);
> > +		} else
> +			ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
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
--=-hFb5YnaPsqyLlJJJs9gh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZkPR5AAoJEJ0dnzgO5LT5TsYP/0RLgFXxw7MqVYwmy9A2R5aT
4JOvtQ0wLU6KX7E2Mgk2biU4l1birLnd+R815NOQ0TA9EEkashuwGONhZ9alOhSo
JHUoZoQ88lESAZmkpMR8Y5KsQ6QKsHaA0uCQPTH5TjmxnG/WjBlVDcINmmVsN73f
driZckLCjg72Ep/Hl35RF/kSvkFEgknRCKM8pIefDWpvAXYpLghZiA7O6CpIknEU
wC28vlfOzoEEnTJDr/2NTUPZKmU5ql1aywqUPsJl05sCZw1XqLQA1GdtFLZJXX1L
MZc++pmxkgArGFNV0abV7OonP2mFk5HU34jZ7qo2pyhi8vDfaZ1OXtVfZJ5yfqK8
DFiFE2rhgrGOa41xtdoMz3lo6wyteIZRyBZCy/LsFhaWZN04GaaJxBlYzskLGn7M
WWqvqna9SNiVulFod7UVK0efK8eQLWs5QvsSQ32sD5lolw++mV9SFf8XmSoF3Apt
A/WKvugwj+iHMxv9H/Q/EdPUQL0XTw9o/597G10g+eTPpWsjpyLK4rWNau/AnOtZ
PYrYhvI78JmEn/gH4M878W5hmBboDs8YMGuwzqJAWhBayhxHOvAbVqa6Tp/hwtsR
QT8X1R001keLTs9JwiRIZluO3Hiryq9e/AS4pY/Z8tWbZZgoiKxAI4RowHb6VVNK
HTo4Zc54CnROaBvpBNoW
=qVEP
-----END PGP SIGNATURE-----

--=-hFb5YnaPsqyLlJJJs9gh--

