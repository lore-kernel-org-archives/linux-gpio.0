From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Fix and simplify pin bank regulator
 handling
Date: Thu, 10 Jan 2019 16:28:51 +0100
Message-ID: <20190110152851.g33mgpfgzeatj332@flea>
References: <20190110082633.6321-1-wens@csie.org>
 <20190110082633.6321-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2pnopejneh27lbcz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110082633.6321-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--2pnopejneh27lbcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 04:26:33PM +0800, Chen-Yu Tsai wrote:
> The new per-pin-bank regulator handling code in the sunxi pinctrl driver
> has mismatched conditions for enabling and disabling the regulator: it
> is enabled each time a pin is requested, but only disabled when the
> pin-bank's reference count reaches zero.
>=20
> Since we are doing reference counting already, there's no need to enable
> the regulator each time a pin is requested. Instead we can just do it
> for the first requested pin of each pin-bank. Thus we can reverse the
> test and bail out early if it's not the first occurrence.
>=20
> Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

> I'm getting the feeling that the current code is prone to race
> conditions when pinctrl sets are actively switched during runtime, or
> gpios are requested and freed from userspace.
>=20
> Any ideas?

IIRC, I've looked into it when writing that patch and there's an upper
mutex that prevents request from being called multiple times at
once. Linus might prove me wrong though.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2pnopejneh27lbcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDdkswAKCRDj7w1vZxhR
xT4RAQDm0VrViQOqnAb+y4lxm/C2Kk6e0f9nii3jW/wt7IavcgEA2l2fHktJKyQS
bjMr8bur8Y3On3zKYvDRU+a+LHjdEAc=
=+NHo
-----END PGP SIGNATURE-----

--2pnopejneh27lbcz--
