From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] added ams AS3722 gpio support
Date: Fri, 16 Aug 2013 19:20:52 +0100
Message-ID: <20130816182052.GP30073@sirena.org.uk>
References: <1376492358-16005-1-git-send-email-florian.lobmaier@ams.com>
 <CACRpkdbMUz3ujrb-QP4d_Mrc7SxKUsNLOF9_qsBphfqp5nF76w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kOdvwer/5gjFgNo6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:46903 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753595Ab3HPSU6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 14:20:58 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbMUz3ujrb-QP4d_Mrc7SxKUsNLOF9_qsBphfqp5nF76w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Lobmaier <florian.lobmaier@ams.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>


--kOdvwer/5gjFgNo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2013 at 05:38:37PM +0200, Linus Walleij wrote:
> On Wed, Aug 14, 2013 at 4:59 PM, Florian Lobmaier

> > +       ret = as3722_reg_read(as3722, AS3722_GPIO_SIGNAL_IN_REG, &val);

> These accessors is looking a lot like regmap being reimplemented.

> Have you considered switching the core driver to use regmap?

> This is definately to be fixed since it's using a new core MFD
> driver.

It's common to have inline wrappers for the regmap ops which take the
device specific struct and fish the regmap pointer out of it.

> > +static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> > +{
> > +       struct as3722_gpio *as3722_gpio = to_as3722_gpio(chip);
> > +       struct as3722 *as3722 = as3722_gpio->as3722;
> > +
> > +       return regmap_irq_get_virq(as3722->irq_data, AS3722_IRQ_GPIO1 + offset);
> > +}

> And *here* yoy're using regmap, this looks messy.

> Please use an irqdomain with the handling in the MFD core
> instead so the driver get a translated IRQ base per AS3722 IRQ passed,
> and get rid of this clunkiness.

> For example see how we're handling this in ab8500-core.c
> and abx500-pinctrl.c

This is actually doing the same thing as the ab8500 doing there - all
regmap_irq_get_virq() is doing is calling irq_create_mapping() on the
irqdomain to translate a hwirq into a virq.  It's an API function mostly
because it was created when regmap-irq didn't always use irqdomains,
plus it means drivers don't need to look at the domain.  There's also
regmap_irq_get_domain() which allows the translation to be done directly
in the driver if desired.

The remapping that the MFD core does unfortunately only works
transparently for single IRQs :(

--kOdvwer/5gjFgNo6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDm2BAAoJELSic+t+oim9h7EP/1AzEQquH/ZztthPu7NatBN0
/IW4GP3AeWxrJpZZMPoWJQAF4zPjZ5vrJTB0TAiRtCrcgv3Ay46rvU2x5Dt52elF
haYCeLW7Bty/pxBc+BHRFIX7ixtcBbmflg7Akoc+y5sr2eiH4HrOSJS2pdyKaAP1
h6hNbWASK3+45FWqeNhIVl8TwvWYdTajoPA9MJcottUdV/GMSim2hGDCqUrg+zBD
I+zG+l0MesKxxWT1ILEW5EW00DVDvpU+u2gFVrjAq/XZGb+oLVvwIZUr0meZTh8Q
lMB09tYI0EC+VbB9i+yVFmHefwUvLm9FU7KgU9uSkv/5iPxzABwBX6GJYbdmcyrP
qhZyOlIh5XFquNf02lRpPRTbB8eluyNh+EYuoqA4b3EVCVPYMlCLZTY+6RLZap6K
iOIikL7zCHy3E53nOnzwd5jg4Was06f11Z3AVCvPhA8Lw8oz62HyF0Oj3TTZWXc7
qTnveiKSQb/O3D1GuEGmKgmdZCOD9x9FLA1QdWc+sX6rFPt2e1F2Mj8o5hi3fBLi
wv62va6s7oaLjRhXkI0QucYCtLnyvgHkMGetyZQg9i/A19OD7UHhDEtdWX1z05he
vYa0kZwLbhQS0p4omQNfuDsYhwzvcx4S2gbHcu2ZBrxafUjH6WmXOYvPD3yCH7Qj
kzCE0hVGRI8hUD+v9hAG
=+vM6
-----END PGP SIGNATURE-----

--kOdvwer/5gjFgNo6--
