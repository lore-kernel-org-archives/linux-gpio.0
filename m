From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 27 Oct 2015 12:13:03 +0100
Message-ID: <20151027111303.GD4665@kw.sim.vm.gnt>
References: <20151019165914.GA22867@sophia>
 <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:36821 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753510AbbJ0LMM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 27 Oct 2015 07:12:12 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Diego Elio =?utf-8?Q?Petten=C3=B2?= <flameeyes@flameeyes.eu>, Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 11:06:58AM +0100, Linus Walleij wrote:
> On Mon, Oct 19, 2015 at 6:59 PM, William Breathitt Gray
> <vilhelm.gray@gmail.com> wrote:
>=20
> > The ACCES 104-IDIO-16 family of PC/104 utility boards feature 16
> > optically isolated inputs and 16 optically isolated FET solid state
> > outputs. This driver provides GPIO support for these 32 channels of
> > digital I/O. Change-of-State detection interrupts are not supported.
> >
> > GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
> > correspond to digital inputs 0-15. The base port address for the device
> > may be set via the idio_16_base module parameter.
> >
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> > Changes in v10:
> >   - Rename symbols to be more concise
> >   - Allocate GPIO device private data structure in probe function
>=20
> Yes, exactly like this. :)
>=20
> Patcha applied for kernel v4.4.
>=20
> > +menu "ISA GPIO drivers"
> > +
> > +config GPIO_104_IDIO_16
> > +       tristate "ACCES 104-IDIO-16 GPIO support"
> > +       depends on X86
> > +       help
> > +         Enables GPIO support for the ACCES 104-IDIO-16 family.
> > +
> > +endmenu
>=20
> I have five other drivers using port-based I/O:
>=20
> gpio-f7188x.c
> gpio-it87.c
> gpio-sch.c
> gpio-sch311x.c
> gpio-ts5500.c
>=20
> Do you think it makes sense to move all of these in under
> the "ISA GPIO drivers" menu as well? I guess they all require
> ISA after all.
>=20
> (Added their maintainers to the To: line so I can get some input
> on this.)

Hi Linus,

The Super-I/Os are connected to a LPC bridge. And since LPC is much like
ISA for software, then I guess it makes sense to move the drivers
gpio-f7188x and gpio-it87 under a "ISA GPIO drivers" menu.

Simon

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYvXD8ACgkQgtp0PDeOcDqmYgCfWlnXfgewfLHSU2jIvHDn1Cwz
pMEAoKGUsygoKQmy5+ZIvsU9eJ4p6XPX
=VtxN
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--
