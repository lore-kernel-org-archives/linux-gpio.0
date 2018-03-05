From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: always look for apb block
Date: Mon, 5 Mar 2018 08:27:20 +0100
Message-ID: <20180305072720.bzqb2vkizbcxh7me@flea.lan>
References: <20180303122554.20984-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7331565477751626407=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180303122554.20984-1-andre.przywara@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--===============7331565477751626407==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftzkrapqzuwdb2ze"
Content-Disposition: inline


--ftzkrapqzuwdb2ze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 03, 2018 at 12:25:54PM +0000, Andre Przywara wrote:
> The Allwinner pinctrl device tree binding suggests that a clock named
> "apb" would drive the pin controller IP. However (for legacy reasons) we
> rely on this clock actually being the first clock defined.
> Since named clocks can be in any order, let's explicitly check for a
> clock called "apb" if there is more than one clock referenced.
>=20
> Kudo to Maxime for suggesting this much more elegant approach.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ftzkrapqzuwdb2ze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqc8VcACgkQ0rTAlCFN
r3R39Q//STY5tKzhScBlqthN7Ccf1mkvZXanoPzf1JWBJXC14z5AMux+bT9XtnoF
5qtCve0sGo0gFXFpJKiWNPAY+gQI8XotoWJ6VW8mgyXYSjYWRVssD6PvHDyx4Grr
kKtXQL513l9qdvn/rEwd+/sguBCeqkg5vb+TuEZYSwBqsUFva7MIsRer1YEKFsUB
rlIq8mLC/vZt/L4kpgRLceWpWB7IEXI8xt7BEDcUM1gu4xCSVCfWWwQ7aqfVIypn
BR6/HP2ztfyKGqzL8Tk+u6hqNwqhXa5D15phxpZbZU1Xw73JS2t/Eu9Q63pefdCX
r5Z8KfDe+QdYCeUYDr6R3xX5W91L7Og2yLBrJ/Uj/jgYG6TtTNf/y0rR4Znsi+6d
HEowOPDNP2nl8dADrkhkze52qYtc/pk+egeL8zygF1i2JpoUeSfdMPX2vMfSnZXx
xQRZ6XtieXZerwE3kw9qSdW5284JhRjbxfB5ewkSNd/eT4iLDWT5Q8O0JcEzTqkD
o+EJpXpt2XBi8q5t9yHjbBh3kpZJ29s4SFaEsBZ/Fcd9vnlRhtm/0SdtrHkt+OXq
mO6XzKAQklUkO06Q0RHOTYBg04fFzueifLvd6kVMDPJ5IlEbBue/5kny/KXgE2k7
odpQSWmvIoyG66Fen7ewwx8sF1WrHwd1nTF3B3T0EazX4rdYBLA=
=L6ku
-----END PGP SIGNATURE-----

--ftzkrapqzuwdb2ze--


--===============7331565477751626407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7331565477751626407==--
