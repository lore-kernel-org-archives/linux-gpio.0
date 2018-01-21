From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] gpio: pca953x: add required properties to example in
 bindings
Date: Sun, 21 Jan 2018 13:37:15 +0100
Message-ID: <20180121123715.q6f5agmrd2giv6o6@ninjato>
References: <20171222200900.8367-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdURWa9z5_zewz-MQph_g=3MTk3f+QnUmULMbugb6qmNOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7lius646uiz2iktd"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdURWa9z5_zewz-MQph_g=3MTk3f+QnUmULMbugb6qmNOQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-gpio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--7lius646uiz2iktd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +- gpio-controller: Marks the device node as a GPIO controller
> > +- #gpio-cells: Must be '2':
> > +       - First cell is the GPIO line number
> > +       - Second cell is for optional parameters (currently unused)
>=20
> Is it really unused?
>=20
> I'd expect at least GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW to work,
> cfr. Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt

I rephrased it in a way which should be correct and no get stale over
time. Will send it right away.

> > @@ -44,4 +49,6 @@ Example:
> >                 pinctrl-0 =3D <&pinctrl_pca9505>;
> >                 interrupt-parent =3D <&gpio3>;
> >                 interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
>=20
> Note that interrupts is also not documented.

I vote for incremental changes. I haven't tested that yet.


--7lius646uiz2iktd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpkiXcACgkQFA3kzBSg
KbYmzA//SMcwx3AMzBlmst+QGDSSLLp+E4t6XtzsZsh3jEE/QZbCbNUpavoBko7x
24QnYb0HLpQjPKN8ewy/XBVZH8S9mm6/n0eeXGuvLO9rAp7Wgzw1eMpL/4utl1fj
fvEzlJ84NyVeVUlRlcvyxyUkpab2XXJbFJ34buOf/PHjm3a/UVBA7uw71IbcMFNG
yqtGDDsoeEjb3n0/AFZrL6i7g5IA0KtnGdt1u+bNqT0Xet2pG8KkeCNWa1HZOOQ2
DvNc7zTYo8sD0PJKhWP0NWLIszAUilAOrvLo7o+Jv+ZEJiSenIUzQQie/yHwOuF0
OAia9XqQ3I/744kiRtgk6pNZqtns/Adz/fUNHzmGYkiul0E+CUKfarIH7wfedl5Q
+PKtkliYnBGISqTJjtblUs+emG45GGoXWewdN/zVReXxn6kQslDOkwX3boBbgYqE
FgnwPUZoM+Kv8KTkB8Sf4O5kXqsQdVBbLOdpBJxiBzMbApW8O6Uam211h6I4rBSv
SxcUEFM6Gtb1kPBIbkWl6OIhBN9TluTL/fOwfQfKmljd3gZcbNFtAz753zGUH234
0G7bpbBwGUmL2Xr9QhwojYWie2+RUXBMcSJBmUDw0s/CSSUK/QTNuwMpuGKsGecy
fzF47wLfX4AH+iCFLbFwTEkekM0ufffgtBx1TcWhO9s6zo9b+to=
=tGzy
-----END PGP SIGNATURE-----

--7lius646uiz2iktd--
