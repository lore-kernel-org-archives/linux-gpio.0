From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Deal with per-bank regulators
Date: Mon, 17 Dec 2018 14:16:50 +0100
Message-ID: <20181217131650.7jmcfnjcif7jiwtp@flea>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <3401ca7517927243f567899819e0d02eee12984f.1544104801.git-series.maxime.ripard@bootlin.com>
 <CACRpkdZU5jnEMe=eAgF5HoFUjyGbWVungSbu4XpOkHaf9xEYiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5154176771306655137=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZU5jnEMe=eAgF5HoFUjyGbWVungSbu4XpOkHaf9xEYiQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org


--===============5154176771306655137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6te4zq65fc77ol7d"
Content-Disposition: inline


--6te4zq65fc77ol7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 04:11:16PM +0100, Linus Walleij wrote:
> I have applied the patch, but noted that this might need device tree bind=
ing
> changes/amendments, are these already done?

I forgot to send it, I just sent a patch with the bindings.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6te4zq65fc77ol7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBehwgAKCRDj7w1vZxhR
xRgjAP0eRCcxoiv5OVz88TgrNwhqn6pxIg1UH8ycJ07E5yD1aAEArpIhUBJ9VXxI
VeLV8oQb9N+BQxJhthBxYAPszWoWowc=
=fauv
-----END PGP SIGNATURE-----

--6te4zq65fc77ol7d--


--===============5154176771306655137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5154176771306655137==--
