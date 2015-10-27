From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 27 Oct 2015 15:40:38 +0100
Message-ID: <20151027144037.GE4665@kw.sim.vm.gnt>
References: <20151019165914.GA22867@sophia>
 <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
 <20151027142343.GI1548@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151027142343.GI1548@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Diego Elio =?utf-8?Q?Petten=C3=B2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 04:23:43PM +0200, Mika Westerberg wrote:
> On Tue, Oct 27, 2015 at 11:06:58AM +0100, Linus Walleij wrote:
> > > +menu "ISA GPIO drivers"
> > > +
> > > +config GPIO_104_IDIO_16
> > > +       tristate "ACCES 104-IDIO-16 GPIO support"
> > > +       depends on X86
> > > +       help
> > > +         Enables GPIO support for the ACCES 104-IDIO-16 family.
> > > +
> > > +endmenu
> >=20
> > I have five other drivers using port-based I/O:
> >=20
> > gpio-f7188x.c
> > gpio-it87.c
> > gpio-sch.c
> > gpio-sch311x.c
> > gpio-ts5500.c
> >=20
> > Do you think it makes sense to move all of these in under
> > the "ISA GPIO drivers" menu as well? I guess they all require
> > ISA after all.
> >=20
> > (Added their maintainers to the To: line so I can get some input
> > on this.)
>=20
> Not all of them actually require ISA. For example gpio-sch is part of an
> MFD device which is a PCI device. PCI bus also has notion of I/O ports.

Should this driver not be moved under the "MFD GPIO expanders" menu ?

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYvjOUACgkQgtp0PDeOcDoPdwCeOQ0GTszUY3uR0t/IQ4Jxz3f3
9IoAnjYNJDQJpdO0ftklHn56iUP7J1sA
=N7ik
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
