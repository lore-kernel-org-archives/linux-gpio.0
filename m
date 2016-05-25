From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH] drivers/pinctrl: Add pinctrl-ast2400
Date: Wed, 25 May 2016 14:52:02 +0930
Message-ID: <1464153722.20948.81.camel@aj.id.au>
References: <1462515608-20566-1-git-send-email-andrew@aj.id.au>
	 <1462515608-20566-2-git-send-email-andrew@aj.id.au>
	 <CACRpkdb+xG53oRYro5NecwDL=JTfsxb=3AFgruPj4j=U+Gbh=A@mail.gmail.com>
Reply-To: andrew@aj.id.au
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tNBl6Y+ZULHorBLvjeGf"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:35194 "EHLO
	homiemail-a17.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750990AbcEYFWZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 May 2016 01:22:25 -0400
In-Reply-To: <CACRpkdb+xG53oRYro5NecwDL=JTfsxb=3AFgruPj4j=U+Gbh=A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>


--=-tNBl6Y+ZULHorBLvjeGf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, 2016-05-23 at 14:38 +0200, Linus Walleij wrote:
> Hi sorry for taking so long before reviewing. Too busy, what can I say.

No worries, I expected as much. Thanks for taking the time!

>=20
> On Fri, May 6, 2016 at 8:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >=20
> > Add pinctrl/pinmux support for the Aspeed AST2400 SoC. Configuration of
> > the SoC is somewhat involved: Enabling functions can involve writes of
> > multiple bits to multiple registers, and signals provided by a pin are
> > determined on a priority basis. That is, without care, it's possible to
> > configure a function in the mux and to not gain expected functionality.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >=20
> > +#include=20
> > +#include=20
> > +#include=20
> > +#include=20
> You should include your changes to Kconfig and Makefile in the patch
> so it is a complete driver. This is an example of why: if I can't see if
> your driver is really tristate in Kconfig I don't know whether=20
> should be included or not.
>=20
> If it is a bool don't include this.
> If it is a bool, don't use any MODULE_* macros either.

Okay. I'll do so when I send follow-up patches.

>=20
> >=20
> > +/* Challenges in the AST2400 Multifunction Pin Design
> > + * --------------------------------------------------
> > + *
> > + * * Reasonable number of pins (216)
> > + *
> > + * * The SoC function enabled on a pin is determined on a priority bas=
is
> > + *
> > + * * Using the priority system, pins can provide up to 3 different sig=
nals
> > + *=C2=A0=C2=A0=C2=A0types
> > + *
> > + * * The signal active on a pin is often described by compound logical
> > + *=C2=A0=C2=A0=C2=A0expressions involving multiple operators, register=
s and bits
> > + *
> > + *=C2=A0=C2=A0=C2=A0* The high and low priority functions' bit masks a=
re frequently not the
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0same
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(i.e. cannot just flip a bit to change=
 from high to low), or even in the
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0same register.
> > + *
> > + *=C2=A0=C2=A0=C2=A0* Not all functions are disabled by unsetting bits=
, some require setting
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bits
> > + *
> > + *=C2=A0=C2=A0=C2=A0* Not all signals can be deactivated as some expre=
ssions depend on values
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0in the hardware strapping register, wh=
ich is treated as read-only.
> Try to compresse the bullet list to text. This looks like a powerpoint
> presentation.

Will do.

>=20
> >=20
> > + * SoC Multi-function Pin Expression Examples
> > + * ------------------------------------------
> > + *
> > + * Here are some sample mux configurations from the datasheet to illus=
trate the
> > + * corner cases, roughly in order of least to most corner. In the tabl=
e, HP and
> > + * LP are high- and low- priority respectively.
> I believe that you got the hardware details right. Only someone with
> experience with the same hardware could review these gory details.
> So I will just trust that you got that part right.
>=20
> >=20
> > + * * Pins provide two to three signals in a priority order
> > + *
> > + * * For priorities levels defined on a pin, each priority provides on=
e signal
> > + *
> > + * * Enabling lower priority signals requires higher priority signals =
be
> > + *=C2=A0=C2=A0=C2=A0disabled
> (...)
> >=20
> > + * * A signal at a given priority on a given pin is active if any of t=
he
> > + *=C2=A0=C2=A0=C2=A0functions in which the signal participates are act=
ive, and no higher
> > + *=C2=A0=C2=A0=C2=A0priority signal on the pin is active
> That's a pretty baroque design. I wonder who came up with the idea
> that this needed to be a priority-based state machine thing. Did they
> have a usecase of different software threads independently competing
> about using the hardware or what?
>=20
> Or is it some hardware aid to help the programmer from shooting
> him/herself in the foot?

The datasheet doesn't appear to explain the motivation, so we're in the
dark.

>=20
> >=20
> > +#define A4 2
> > +SSSF_PIN_DECL(A4, GPIOA2, TIMER3, FUNC_DESC_SET(SCU80, 2));
> > +
> > +FUNC_EXPR_DECL_SINGLE(SD1, FUNC_DESC_SET(SCU90, 0));
> > +
> > +FUNC_EXPR_DECL_SINGLE(I2C10, FUNC_DESC_SET(SCU90, 23));
> > +
> > +#define C4 16
> > +MS_PIN_DECL(C4, GPIOC0, SD1, I2C10);
> > +#define B3 17
> > +MS_PIN_DECL(B3, GPIOC1, SD1, I2C10);
> These things look very terse. But I guess there is no way to alleviate
> the terseness that you can think of?

Less terse in what way? Something other than more descriptive/longer
the macro names?

Since sending the patch I've been concentrating on other things, but
I've had some half-baked thoughts about alternative approaches. My
intent was a roughly iterative approach, and with this first patch
revision I was trying to understand the problem of the hardware's
function priorities and capturing a signal's bitfield relationships.
The motivation for sending the patch as it is (now that I have an
understanding of the problems that need solving) was to find out if
there were existing patterns that could be used to shape the
implementation. Or if not, whether the approach was reasonable.

However, that was at the expense of a deeper understanding of the
approaches to integrating a solution into the pinctrl subsystem. Now
that I have a mental model for representing the mux configuration I
plan to hash out those half-baked ideas to see if they give a more
obvious solution. Hopefully any results will be less terse.=C2=A0

>=20
> >=20
> > +/* Note we account for GPIOY4-GPIOY7 even though they're not valid, th=
us 216
> > + * pins becomes 220.
> > + */
> > +#define AST2400_NR_GPIOS 220
> Rename AST2400_NR_PINS, they are not just GPIO's right?

Will do.

>=20
> >=20
> > +static struct pinctrl_ops ast2400_pinctrl_ops =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_groups_count =3D ast240=
0_pinctrl_get_groups_count,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_group_name =3D ast2400_=
pinctrl_get_group_name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_group_pins =3D ast2400_=
pinctrl_get_group_pins,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pin_dbg_show =3D ast2400_pi=
nctrl_pin_dbg_show,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dt_node_to_map =3D pinconf_=
generic_dt_node_to_map_pin,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dt_free_map =3D pinctrl_uti=
ls_dt_free_map,
> This has been renamed in the upstream kernel so rebase the patch
> on v4.6-rc1 when it's out.

Will do.

>=20
> >=20
> > +static bool func_expr_disable(const struct func_expr *expr, void __iom=
em *base)
> > +static inline bool maybe_disable(const struct func_expr **expr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0void __iomem *base)
> > +static bool sig_in_exprs(const struct func_expr **exprs,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0const struct func_expr *sig)
> Those functions are very hard to understand, maybe you could
> kerneldoc them? Just a few line about what each does.

Will do. No doubt they'll evolve in further experiments, but I'll
document them regardless.

>=20
> >=20
> > +static int ast2400_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0struct pinctrl_gpio_range *range,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0unsigned offset)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned pin =3D range->base=
 + offset;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct ast2400_pinctrl=
_data *pdata =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pinctrl_dev_get_drvdata(pctldev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct pin_prio *pprio=
 =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pdata->pins[pin].drv_data;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!pprio)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!maybe_disable(pprio->hi=
gh, pdata->reg_base))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -1;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!maybe_disable(pprio->lo=
w, pdata->reg_base))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -1;
> No returning opaque -1, use -ENODEV or something sensible.

Right, that was a quick-and-inexperienced hack. Will fix.

>=20
> >=20
> > +static struct pinctrl_gpio_range ast2400_gpios =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "ast2400-pctrl-gpi=
o-range",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.npins =3D ARRAY_SIZE(ast240=
0_pins),
> > +};
> Nope.
>=20
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* grange.name =3D "exynos54=
40-pctrl-gpio-range"; */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl_add_gpio_range(pctl,=
 &ast2400_gpios);
> And nope.
>=20
> A device tree driver should define the GPIO ranges in the
> device tree using gpio-ranges =3D <...>. There is documentation and
> examples of how to do this in
> Documentation/devicetree/bindings/gpio/gpio.txt

Yes. Understanding various devicetree integration was part of my
follow-up plan, e.g. the registers we're touching are really part of
what should be represented as an mfd/syscon device, and so some
(separate) work needs to be done to integrate that.

Thanks again for taking the time to look at the patch.

Andrew
--=-tNBl6Y+ZULHorBLvjeGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRTZ6AAoJEJ0dnzgO5LT5p4cP/A8zC7kgWdH0NjZt4ZlWD5TI
MAucE3dC+R6Hl6cn/gvrpZGlcSTIEgFYSzvfg2kT05jf9ZulNsS42MqwAS5hpork
E0Xaugp4ZgP0QhTt5tl+POI+gUa+GjyRxOKOQclNzneifo7kjIBGeA9dRAFGuKHb
MzI304n+HboTiEGGXuexAvZFfqRlmHYvxfxl/qCHe0OK+3qssg6LCqD9Bzn3BP/c
JlpJF9OMUAgWcLeOgFXhsP0LIhChz6MaLWJhFe/L5lI1lx2/6A7XFn1N9YorMw0q
drWDWzWaEN+jlfuAkOeTmpBj7Qb+HBotzDE6KiodF1Papdj+Gr2aQ/U3aC12T1//
324jQ/1+jQ+UhP0CaLgm+2Xf1YMVTAdcwklVjMMfAlO13O2l1votVnjMzpGHAAGt
84wWyonMUibUepv/bBKdiS0pH0hsrDP0Pk7yQUHguTY1laKN7dRt1/JoXTys7tXN
WvRvBKXjDN6Q6Swvzphxewjtdki9TlvcksegHBA/5L46mEYCj8qo818yHI76ZzWz
1RXgXax+pisWvXM4qd/B9IGbDiYlvsBjxxN+fNibiC5hK1vbYLT4UV3kWK8RO3N/
PWV4noiKKOcJbRjO52lYrP72WLLUo9U/k9ADJ6IpPLk8GNvsrq0I/s8boOAFwQK/
11Mk2aM2q69okVK2+uu8
=lrMO
-----END PGP SIGNATURE-----

--=-tNBl6Y+ZULHorBLvjeGf--

