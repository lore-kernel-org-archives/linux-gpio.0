From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Add initial pinconf support
Date: Thu, 23 Feb 2017 10:54:22 +1030
Message-ID: <1487809462.21631.4.camel@aj.id.au>
References: <20170220143850.10723-1-andrew@aj.id.au>
         <CACPK8XeXW_YjGkV0S5OJj2b814DA1tT33o-_0ToNvJ7UM4sy7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-9SRg7tw9xCAtW/JLgjzO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58028 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932426AbdBWAYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Feb 2017 19:24:32 -0500
In-Reply-To: <CACPK8XeXW_YjGkV0S5OJj2b814DA1tT33o-_0ToNvJ7UM4sy7w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>


--=-9SRg7tw9xCAtW/JLgjzO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-02-22 at 14:09 +1030, Joel Stanley wrote:
> > On Tue, Feb 21, 2017 at 1:08 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > Several pinconf parameters have a fairly straight-forward mapping onto
> > the Aspeed pin controller. These include management of pull-down bias,
> > drive-strength, and some debounce configuration.
> >=20
> > Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
> > ADC and RMII/RGMII pins. As the bias configuration for each pin in a
> > bank maps onto a single per-bank bit, configuration tables are
> > introduced to describe the ranges of pins and the supported pinconf
> > parameter. The use of tables also helps with the sparse support of
> > pinconf properties, and the fact that not all GPIO banks support
> > biasing or drive-strength configuration.
> >=20
> > Further, as the pin controller uses a consistent approach for bias and
> > drive strength configuration at the register level, a second table is
> > defined for looking up the the bit-state required to enable or query th=
e
> > provided configuration.
> >=20
> > Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
> > system, and pinctrl-aspeed-g5 on an AST2500EVB. The test method was to
> > set the appropriate bits via devmem and verify the result through the
> > controller's pinconf-pins debugfs file. This simultaneously validates
> > the get() path and half of the set() path. The remainder of the set()
> > path was validated by configuring a handful of pins via the devicetree
> > with the supported pinconf properties and verifying the appropriate
> > registers were touched.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Looks good. I assume the bindings are generic and don't need any
> update for this. Perhaps an update to the example would be helpful.

Yes, the code makes use of the generic pinconf bindings. It's probably
best I update the aspeed pinctrl bindings document to explicitly call
this out.

>=20
> Some minor comments below.
>=20
> > ---
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 117 +++++++++++++++-
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 153 ++++++++++++++++=
++++-
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0| =
207 +++++++++++++++++++++++++++++
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h=C2=A0=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A028 ++++
> > =C2=A04 files changed, 503 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g4.c
> > index 7de596e2b9d4..3e8625110136 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> > @@ -2234,6 +2234,110 @@ static const struct aspeed_pin_function aspeed_=
g4_functions[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_PINCTRL_FUNC(WDT=
RST2),
> > =C2=A0};
> >=20
> > +static struct aspeed_pin_config aspeed_g4_configs[] =3D {
>=20
> I think this could be const.

Agreed.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* GPIO banks ranges [A, B],=
 [D, J], [M, R] */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_PULL_DOWN,=
 { D6,=C2=A0=C2=A0D5=C2=A0=C2=A0}, SCU8C, BIT(16) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_DISABLE,=
=C2=A0=C2=A0=C2=A0{ D6,=C2=A0=C2=A0D5=C2=A0=C2=A0}, SCU8C, BIT(16) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_PULL_DOWN,=
 { J21, E18 }, SCU8C, BIT(17) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_DISABLE,=
=C2=A0=C2=A0=C2=A0{ J21, E18 }, SCU8C, BIT(17) },
>=20
> I didn't verify every definition is correct. I wondered why we skipped
> bit 18, but it is reserved by the looks.

Yes, 18 is reserved. Banks C, K and Q have Schmitt triggers and aren't
internally biased.

I don't blame you for not verifying every definition. Luckily enough I
lost my sanity on the initial pinctrl effort so this was a breeze, but
using ball numbers vs GPIO numbers does make things harder to verify
than I'd like. But we already have the ball numbers defined, so that's
what I chose to live with.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_PULL_DOWN,=
 { A18, E15 }, SCU8C, BIT(19) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_DISABLE,=
=C2=A0=C2=A0=C2=A0{ A18, E15 }, SCU8C, BIT(19) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_PULL_DOWN,=
 { D15, B14 }, SCU8C, BIT(20) },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ PIN_CONFIG_BIAS_DISABLE,=
=C2=A0=C2=A0=C2=A0{ D15, B14 }, SCU8C, BIT(20) },
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g5.c
> > index 43221a3c7e23..b22523bdd79b 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> > =C2=A0static struct pinmux_ops aspeed_g5_pinmux_ops =3D {
> > @@ -2308,16 +2450,25 @@ static struct pinctrl_ops aspeed_g5_pinctrl_ops=
 =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_group_name =3D asp=
eed_pinctrl_get_group_name,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_group_pins =3D asp=
eed_pinctrl_get_group_pins,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pin_dbg_show =3D aspee=
d_pinctrl_pin_dbg_show,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dt_node_to_map =3D pinconf_=
generic_dt_node_to_map_pin,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dt_node_to_map =3D pinconf_=
generic_dt_node_to_map_all,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dt_free_map =3D pinctr=
l_utils_free_map,
> > =C2=A0};
> >=20
> > +static struct pinconf_ops aspeed_g5_conf_ops =3D {
>=20
> const here too?

Yep.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.is_generic =3D true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pin_config_get =3D aspeed_p=
in_config_get,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pin_config_set =3D aspeed_p=
in_config_set,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pin_config_group_get =3D as=
peed_pin_config_group_get,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pin_config_group_set =3D as=
peed_pin_config_group_set,
> > +};
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > @@ -514,6 +514,20 @@ struct aspeed_pin_desc {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_LIST_DECL_SING=
LE(gpio, gpio); \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MS_PIN_DECL_(pin, SIG_E=
XPR_LIST_PTR(gpio))
> >=20
> > +/**
> > + * @param The pinconf parameter type
> > + * @pins The pin range this config struct covers, [low, high]
> > + * @reg The register housing the configuration bits
> > + * @mask The mask to select the bits of interest in @reg
> > + */
> > +struct aspeed_pin_config {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum pin_config_param param;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int pins[2];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int reg;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 mask;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 value;
>=20
> Can we save some space by making these smaller types. pins could be
> u16 at least.

Yeah, no worries. Realistically value could also be smaller as the
masks are all single bits. This also means we could rename 'mask' to
'bit' and derive the mask, and make both mask and value a u8.

Thanks for the review.

Andrew

>=20
> > +};
> > +
--=-9SRg7tw9xCAtW/JLgjzO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYriu2AAoJEJ0dnzgO5LT5M/sQAJIw7pzx0Sc6uWE1wXOaeOT7
XIPXpvhDVEXdDNrQMSPbp0lYHEn9Mkrz3QrwSdtV+NADi1V1ahrSCFNPEV0urYwI
hEmiT7rAyfUPuktK4TlAAmIgiz5TkQ8pyWfIF1rP9E5M9ytY+fEQniUgwqXZEH0o
S1ihuZz8nxT5E+0TVp0kKJx29vHYqxMdCJCAvbx65LeCpsSPog0rFUX8lWi2g2mz
LOwe3tDJ2qdmad/xkWd8EhN+SJPgg2TsGZPnvBPlNhz5VHeJXpksDKsHWgtne/pM
siuicEyZHihD0R3Pqe888lz1CJI8MOHFrDSolZHPmFHtEiI4v9rgieMiwe3ifr0W
w8+suUXXUPlXkSOZk/ORboWVOWzYmY42nymQsXv4KvPGbLwEoco9iHtr5SRvbnrf
tvNfvvAB00YVrn6YfTS/0xatxdbeqRGOO8sNT257FnpjTdJb/E+4iskQtKVVJOoM
oyNWKxpZVjIRNi9FFbbeC/E+/PMXH1D6Zcc9mOyw2Mem1WALIdJszmEAqvE31tAr
AvTxuDJRPEVKXEoctVddaYW3nNWu+z4u6KmI9HLepnNfx7uc0kh8zwTK18vbFrEC
P/992oC1IYfNywb9VniS/OdGxyY37Q8lFkP1UtBwNQdlLSnjIlKKkOeCAvmdrSWq
Ip5PZ1Poya+MsI58CXDQ
=ww1z
-----END PGP SIGNATURE-----

--=-9SRg7tw9xCAtW/JLgjzO--

