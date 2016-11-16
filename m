From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: fix theoretical uninitialized variable
 access
Date: Wed, 16 Nov 2016 21:33:58 +0100
Message-ID: <20161116203358.midi7vmaqirpywtt@lukather>
References: <20161116141841.2030776-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="giid35f4r2leuudf"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:53105 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752605AbcKPUeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2016 15:34:01 -0500
Content-Disposition: inline
In-Reply-To: <20161116141841.2030776-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--giid35f4r2leuudf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Nov 16, 2016 at 03:18:18PM +0100, Arnd Bergmann wrote:
> gcc warns about a  way that it could use an uninitialized variable:
>=20
> drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pinctrl_init':
> drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: error: 'best_div' may be us=
ed uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>=20
> This cannot really happen except if 'freq' is UINT_MAX and 'clock' is
> zero, and both of these are forbidden. To shut up the warning anyway,
> this changes the logic to initialize the return code to the first
> divider value before looking at the others.
>=20
> Fixes: 7c926492d38a ("pinctrl: sunxi: Add support for interrupt debouncin=
g")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for that patch.

Just out of curiosity, which gcc gives those warnings? I have 6.2 and
it didn't output anything..

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--giid35f4r2leuudf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLMKrAAoJEBx+YmzsjxAg8rIP/j0OQeJZoiy3WVwQZQt8ImTZ
c3hd7KtvXyvhwK4hmhmJXN/MFG2cUuFxZ6N9ssqrpDC7hFPmktwK9GO0/pooI9LK
31C8RpY92qEgLWBnVsATynnRrVOzuIVzqSLNbNhFTP6fTluQw6o7/vxH6aLzTlhw
xU0JIFxAt73euQ1qi1Ml/vwo22ZGGhTPZqiDRQ0kQltlf5YdW3UyWztKdlh2pxEy
qfWGPV8aUSUXSFgsXahNJPWEjgGgUfvd6rsudAC4HH2gbTGw0+nUJkGJfWeRS5Wq
sf+BdgG+JZxPejZs2AiC1VUdzRhodySuIDPO69xTLnJA1kV4+wrnvgyMVvcyJytl
zTLjKd/Iq/LXhRRbyL/VFNhd2flnSRcYiZ9A3fzecQjLjADkE5FI9MvQtsfE1kod
FQuIiXorLkkiUmoHPCfubR57VGdYdSSV5luDEmtAVhD/WKT6Yh0fHwXUWN81TIJk
epTaBujffyG7uTjvDexFKEtdnx+JoSrelPexrux2HzPzMdqpSfIVVoSk1BtedNw8
Rls3sZ2vPnw285ngSS7pglgXT7at2yqFJQCWa9cWB71NLFsY/N2wu4TeBbL2WOuf
IvFf8U5DeLOppiWY4kdFkHpMG3+QHV4/BSqv4J23BO2ygbFK/F58Dy5V8xV62Bhw
CLRTEP4WCohd+pVqBP5K
=2mRi
-----END PGP SIGNATURE-----

--giid35f4r2leuudf--
