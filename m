From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Sun, 15 Oct 2017 22:18:13 +0200
Message-ID: <20171015201811.GA13063@mithrandir>
References: <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
 <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org>
 <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
 <d53e67a2-4f69-752f-ba35-53872d9b9760@codeaurora.org>
 <CACRpkdYfAcKrgbgybccurUKTyR0E+tHDyzp7sbXxXxKuyMOGhQ@mail.gmail.com>
 <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org>
 <CACRpkdZFunwQ=tiQqsapap7Ozz42hr=df5vqbC0S5xy5Wn+ZWw@mail.gmail.com>
 <255ad0dc-2d16-ae7f-0b45-500e23cff1a4@codeaurora.org>
 <20171003220311.GU457@codeaurora.org>
 <4f067c09-9ecf-9266-baa0-18575bca94eb@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37127 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdJOUSR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Oct 2017 16:18:17 -0400
Content-Disposition: inline
In-Reply-To: <4f067c09-9ecf-9266-baa0-18575bca94eb@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 06:26:23PM -0500, Timur Tabi wrote:
> On 10/03/2017 05:03 PM, Stephen Boyd wrote:
> > I don't see any value
> > beyond system wide debug in figuring out the default pin
> > configuration of a pin that doesn't have a consumer in Linux.
>=20
> I can agree with that.
>=20
> > Could we remove the pin direction finding part here in
> > gpiochip_add_pin_range() and lazily resolve the pin direction
> > when a pin is requested? We would need a similar check in the msm
> > specific debugfs code where we skip pins that aren't requested.
> > This is basically a revert of commit 72d320006177 ("gpio: set up
> > initial state from .get_direction()").
> >=20
> > ACPI can still describe only the pin ranges that they care about
> > exposing, but from the devicetree side it's been working well
> > enough to not touch pins that aren't used by anything in Linux.
> >=20
> > ---8<----
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index cd003b74512f..673028823bc5 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1210,16 +1210,7 @@ int gpiochip_add_data(struct gpio_chip *chip, vo=
id *data)
> >   		 * wrong direction in sysfs.
> >   		 */
> > -		if (chip->get_direction) {
> > -			/*
> > -			 * If we have .get_direction, set up the initial
> > -			 * direction flag from the hardware.
> > -			 */
> > -			int dir =3D chip->get_direction(chip, i);
> > -
> > -			if (!dir)
> > -				set_bit(FLAG_IS_OUT, &desc->flags);
> > -		} else if (!chip->direction_input) {
> > +		if (!chip->direction_input) {
> >   			/*
> >   			 * If the chip lacks the .direction_input callback
> >   			 * we logically assume all lines are outputs.
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/=
pinctrl-msm.c
> > index 273badd92561..4a0aeceb42f1 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -24,7 +24,7 @@
> >   #include <linux/pinctrl/pinconf.h>
> >   #include <linux/pinctrl/pinconf-generic.h>
> >   #include <linux/slab.h>
> > -#include <linux/gpio.h>
> > +#include <linux/gpio/driver.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/reboot.h>
> > @@ -494,6 +494,12 @@ static void msm_gpio_dbg_show_one(struct seq_file =
*s,
> >   	};
> >   	g =3D &pctrl->soc->groups[offset];
> > +
> > +	if (!gpiochip_is_requested(chip, gpio)) {
> > +		seq_printf(s, " %-8s:", g->name);
> > +		return;
> > +	}
> > +
> >   	ctl_reg =3D readl(pctrl->regs + g->ctl_reg);
> >   	is_out =3D !!(ctl_reg & BIT(g->oe_bit));
>=20
> In order for this to work, I had to add this function from patch #1:
>=20
> static int msm_gpio_request(struct gpio_chip *chip, unsigned int offset)
> {
> 	struct msm_pinctrl *pctrl =3D gpiochip_get_data(chip);
> 	const struct msm_pingroup *g =3D &pctrl->soc->groups[offset];
>=20
> 	if (!g->npins)
> 		return -ENODEV;
>=20
> 	return gpiochip_generic_request(chip, offset);
> }
>=20
> The problem with this is that none of the GPIOs are "requested", so it
> displays an output like this:
>=20
> # cat /sys/kernel/debug/gpio
> gpiochip0: GPIOs 0-149, parent: platform/QCOM8002:00, QCOM8002:00:
>  (null)  :
>  (null)  :
>  (null)  :
> [... truncated ]]
>  (null)  :
>  (null)  :
>  (null)  :
>  (null)  :
>  gpio36  :
>  gpio37  :
>  gpio38  :
>  gpio39  :
>  (null)  :
>  (null)  :
>=20
> It can't differentiate between GPIOs that don't exist and GPIOs that have=
n't
> been requested.

This confuses me. Why would you even want to register pins that don't
exist? It sounds to me like you're lying to gpiolib and then try to work
around it trying to access the GPIOs that don't exist but which you told
it were there.

Why not just tell gpiolib about only the GPIOs that exist?

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnjwoAACgkQ3SOs138+
s6FuQBAAl3N292B9U8surlYXkGU2GyoXAiIr7jKtYHDEfL0Wh/US64hnDqmiqzGV
ZHHGVetm1thoOCWf6RXf9GseFSuYzXe2XP0vqkRjYcWKo+s8K1cS+GqVHWZxdH62
JpNu3bJAwhTGIFt+lcjFQL4cFQ9kl/5HXzpFY8B0ffusPU49fvNBIcJMscH4v1s+
w4Lr1Mwhk9yQN02j4G0eZjc1656AwTHadS7iCspxNH8mt5dZPj7WlRetrtXd/qjO
8jNmg+TuAEVqkx9TbGX3UjhWAeYACIs54OH9k+9bdP16Kdv5+04P8KNdsXZhDC+3
ViqVFebg19PPE/xk6f7DSqsJAy+Tlza5ecrdOEzf1yPseCjSIP/ftN3ttkQ6/2U7
5XE9n7TzDA6qp9GlT7l1A4wg9FqbBfJm0xKmsK71IJCY5xbEtEjJt5Kh0i3AaDJj
BDojfQLwR8ZG2Wq0zvkQ8oLhSOXqlLkiLls5Yb/CupeeDGiUPG/NmnOGUKnjqgnT
Tf7BFZpz9ZA6YwhyeExZ1DXexOpyTtQGbjQBvEsWidLLXhu/kSq/LxFXf3upmGSn
e+OVy18PH8D7Ls0UWlBM86wzlkxLtip094XI0kCWbey/4lJY3ggZcKgTh0w2VguB
KngWB/VLQY6uEAUI8RMWUCDRlo8+xompkChr4eWIhc1/oJEpttc=
=2S9l
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
