From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: tca-6416: interrupt device tree configuration
Date: Wed, 2 Apr 2014 18:01:53 +0200
Message-ID: <20140402160153.GS26751@lukather>
References: <CAGm1_ksGDCfgTNpue_zEUTho88G3juSJ6qLttHb7ACFawdgKzw@mail.gmail.com>
 <CAGm1_kvwU2S0qqo4idDZpKMKmPEn67jaYYgrBHTjnjmBDNvG7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAwSoJxbKYwy34Oe"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:57040 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758702AbaDBQFI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Apr 2014 12:05:08 -0400
Content-Disposition: inline
In-Reply-To: <CAGm1_kvwU2S0qqo4idDZpKMKmPEn67jaYYgrBHTjnjmBDNvG7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: linux-gpio@vger.kernel.org


--bAwSoJxbKYwy34Oe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2014 at 12:06:03PM +0200, Yegor Yefremov wrote:
> On Tue, Mar 18, 2014 at 4:02 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > I've an am335x-based board with tca6416. The interrupt output of the
> > tca is connected to GPIO0_20 on my SoC. How should I configure this
> > wiring in device tree file?
> >
> > I've already managed to hook it on I2C and it is working so far:
> >
> >  tca6416: gpio@20 {
> >                 compatible =3D "ti,tca6416";
> >                 reg =3D <0x20>;
> >                 gpio-controller;
> >                 #gpio-cells =3D <2>;
> >   };
> >
> > Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt describes
> > following properties:
> >
> >   - interrupt-controller: Identifies the node as an interrupt controlle=
r.
> >   - #interrupt-cells: Number of cells to encode an interrupt source, sh=
all be 2.
> >   - interrupt-parent: phandle of the parent interrupt controller.
> >   - interrupts: Interrupt specifier for the controllers interrupt.
> >
> > and following example:
> >
> >         pcf8575: gpio@20 {
> >                 compatible =3D "nxp,pcf8575";
> >                 reg =3D <0x20>;
> >                 interrupt-parent =3D <&irqpin2>;
> >                 interrupts =3D <3 0>;
> >                 gpio-controller;
> >                 #gpio-cells =3D <2>;
> >                 interrupt-controller;
> >                 #interrupt-cells =3D <2>;
> >         };
> >
> > Where does irqpin2 come from? How to specify GPIO0_20 in "interrupts" c=
ontext?
>=20
> Maxime, I've seen your irq domain related patch. Could you please
> provide an example/hint for my question?

<&irqpin2> is called a phandle, and it's actually a reference to
another device tree node. So the answer to your question is from
somewhere else in the device tree.

It will be the parent interrupt controller, so in your case, I guess
you will have to do two things:
  - Say that your interrupt comes from

interrupt-parent =3D <&something>;

  - Say the actual interrupt it is using inside that parent

interrupts =3D <42>;

In your case, I guess something like:
interrupt-parent =3D <&gpio0>;
interrupts =3D <20 GPIO_ACTIVE_HIGH>;

Will work, but I'm not familiar enough with the am335x platform to
know for sure.

In any case, you should probably go through this talk:
http://elinux.org/images/a/a3/Elce2013-petazzoni-devicetree-for-dummies.pdf

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--bAwSoJxbKYwy34Oe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTPDRxAAoJEBx+YmzsjxAgJawP/2yENpW1LG5k583KCHpnkP7C
GwB2vqhRnslClOI+xW4D2clLYjPtbGD2B8/krkUCzLbRZCtFNTvkNkrSZhGOp1cT
uGVwOcJN2veYHkN5mm10JvzV5AZQkehaLDYTGyPkICWO98VD6Jj1WQ1Uy2au8JRz
fx/0uXiNJ7OuAqi1RB1G3/I/M2CCiQwjDYQzW3+fvITzrOq/K0epXB6pJNpTgMSk
eGo81utBQKWrWu348TazQytg6M9C5EO9Qm+pYmUpxlwGtsOEgMV1rfwfmNA/7m6q
gtMxFKUDRwhkTax/Oge0bE/0cwTGjy0kdbuOGIe8UkTFF4Xd7v4OP6klKasb3gOU
uNXWAtqBKhXn8CGrRzsdOlw4PcgCoYIGp0sdX2MrtEzIIPQ6U9DVtH86FAc6YioO
ucak3CgKGNTOv+GcUbPFChsuc9pkIG4eX7c459g7PNy5gSMlLhJPi5Iqg588CHcG
Mx4mQAZEuwayxt5zFc6pExx+LX+oT2AlfLHA49+Amjq4O2DhBENSpeYM0X6pvnuj
+XiWR+9Fm9vKhzUDa4TkA6++fGFi2wZH+wV+5EpUvVMNzkYNbMInPJ1a989rtcZz
WTZJl1XIQLdCeiuLy/i7IPfmyhFTcSJRucVY8cKvqkwf70bvoS1Tc0crV8CGWhcV
9aLJrxUAFXYnEONxKoBJ
=QGLY
-----END PGP SIGNATURE-----

--bAwSoJxbKYwy34Oe--
