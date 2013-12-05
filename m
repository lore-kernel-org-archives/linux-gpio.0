From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Thu, 5 Dec 2013 17:56:48 +0100
Message-ID: <20131205165647.GM16823@kw.sim.vm.gnt>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
 <20131129185606.GK16823@kw.sim.vm.gnt>
 <529C806F.4000204@einfach.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WoqaC9TUMqqIOlla"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:59342 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756897Ab3LEQ5I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 11:57:08 -0500
Content-Disposition: inline
In-Reply-To: <529C806F.4000204@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org


--WoqaC9TUMqqIOlla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2013 at 12:43:27PM +0000, Bruno Randolf wrote:
> Hi Simon and all!

Hi Bruno,

>=20
> Thanks for your feedback, but please keep in mind that I am not
> working for any chip manufacturer or board vendor. I'm just a user who
> wants to share his work, and I believe in 99% of the cases only one
> single "super i/o" chip will be in a given system, and 99% of the
> users will not use more than the first 8 GPIOs. However I'm going to
> try to support all available GPIOs on this chip, but I have the
> following problem:
>=20
> The chip has the following GPIOs:
>=20
> 10-17			8 continous GPIOs, OK
> 21, 22, 27		20 and 23-26 not available
> 30-34, 36, 37		35 not available
> 40, 42, 44-47		41, 43 not available
> GP50-57			8 continous GPIOs, OK
> GP60-67			8 continous GPIOs, OK
>=20
> The datasheet is available at:
>=20
> http://www.smsc.com/Products/PC_System_and_I-O_Controllers/Embedded_I-O_P=
roducts/LPC-Based_Embedded_I-O/SCH3112_SCH3114_SCH3116
>=20
> So I'd register 6 gpio_chip structures with a different base, but how
> should I handle these "holes"? Via gpio_chip.request? Or return error
> in direction_input and direction_output?
>=20
> On 11/29/2013 06:56 PM, Simon Guinot wrote:
> >> +static unsigned int sch311x_gpio_conf[] =3D { +	{ 0x23,		/* GP10
> >> config register */
> > ^ Does this even compile ?
>=20
> Sorry, a mistake crept in.
>=20
> >> +static inline void sch311x_sio_enter(int sio_config_port) +{
> >=20
> > As a Super-I/O is a multifunction device, I think you should
> > request the Super-I/O port here, using request_muxed_region() for
> > example.
> >=20
> > This is a collaborative way to prevent against concurrent
> > accesses.
>=20
> Ok, thanks for this info.
>=20
> > It seems to me that all the sch311x_gpio_conf registers are
> > contiguous, except for address 0x27. Then, maybe you can transform
> > this loop into a single request_region() call ?
>=20
> It's except 0x27, and then when I add more GPIO lines the registers
> get even more non-contiguous... I could manually check which areas can
> be combined, but I think it's not worth it...
>=20
> >> +	sch311x_sio_enter(sio_config_port);
> >=20
> > Don't you need to check the vendor ID here ?
>=20
> How?

Well, I can't find any vendor ID register in the datasheet.

>=20
> >> +	dev_id =3D reg =3D=3D 0x7c ? 2 : reg =3D=3D 0x7d ? 4 : 6;
> >=20
> > Outch :)
>=20
> Well, again, I have copied this part from watchdog/sch311x_wdt.c
>=20
> >> + +	/* Select logical device A (runtime registers) */ +
> >> sch311x_sio_outb(sio_config_port, 0x07, 0x0a);
> >=20
> > How behaves the Super-I/O if an another driver selects a different=20
> > logical device later ? Is that OK ?
>=20
> I'm not sure but I believe so because we just got the base address of
> the logical device in the next lines.

Yes, it looks correct.

Note that this base address is shared between several drivers:
watchdog/sch311x_wdt, hwmon/dme1737 and gpio/gpio-sch311x.c.
The same logical device (0xa) is used.

Moreover some offsets against this base address are also shared. For
example, 0x47 is a "valid" offset for both the GPIO and the watchdog
drivers. I guess that the correct usage for this pin depends on how the
hardware is wired. Unfortunately, there is no way for the drivers to
guess that.

Did you had the opportunity to run all this drivers together ?

Simon

--WoqaC9TUMqqIOlla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKgsE8ACgkQgtp0PDeOcDreRQCgkX35OmT/sxni8XnKJHf8/XH0
FJwAn3vIqdBekEUC6PHuioBODkEur8Pw
=3pAS
-----END PGP SIGNATURE-----

--WoqaC9TUMqqIOlla--
