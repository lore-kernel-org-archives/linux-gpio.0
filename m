From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: fix theoretical uninitialized variable
 access
Date: Thu, 17 Nov 2016 10:28:16 +0100
Message-ID: <20161117092816.m54gp4bxwhqjquca@lukather>
References: <20161116141841.2030776-1-arnd@arndb.de>
 <20161116203358.midi7vmaqirpywtt@lukather>
 <CACRpkdYk25q9P5sErnfHcH49BT43vCCDihsZNEsf-6Gvpq+Pww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2qldhmulz2wvm5xt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYk25q9P5sErnfHcH49BT43vCCDihsZNEsf-6Gvpq+Pww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--2qldhmulz2wvm5xt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 10:08:28AM +0100, Linus Walleij wrote:
> On Wed, Nov 16, 2016 at 9:33 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > On Wed, Nov 16, 2016 at 03:18:18PM +0100, Arnd Bergmann wrote:
> >> gcc warns about a  way that it could use an uninitialized variable:
> >>
> >> drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pinctrl_init=
':
> >> drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: error: 'best_div' may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>
> >> This cannot really happen except if 'freq' is UINT_MAX and 'clock' is
> >> zero, and both of these are forbidden. To shut up the warning anyway,
> >> this changes the logic to initialize the return code to the first
> >> divider value before looking at the others.
> >>
> >> Fixes: 7c926492d38a ("pinctrl: sunxi: Add support for interrupt deboun=
cing")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks for that patch.
> >
> > Just out of curiosity, which gcc gives those warnings? I have 6.2 and
> > it didn't output anything..
>=20
> Context: Arnd re-enabled -Werror=3Dmaybe-uninitialized
> in the kernel build and this kind of stuff started to appear so
> it needs to be fixed up.

Ah, that makes sense. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2qldhmulz2wvm5xt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLXgwAAoJEBx+YmzsjxAgLBgP/A7xtp6jl3haTtyfTLY3bkvv
CFWIFRsumrbH+CLdvCahKqB0tKifIca8DoC+rJrp02CqJouXXC6kWx94Uv1GjQRe
reT043fB3V5EIyG0rWn2okzaO/1HQKlHfUAv+ByE4Gz6ubtlomk+4SR+NdswnjZD
RxfpSTEHzpe0EjJv0IvO8qI4geQY0n+0c/3Mi2MNGr1ECEhsVdFMmfjVvFkxkR/l
ygbiJH8q2yprBvhQwvRf5PT4oZ96UnNm0rUUVbJVkP/oHcyJyWSTKjtuLORIQAj5
nKL9zFEu2K6V1FG8eFIX636Qdpf+e9ecQelggNN7bqRBxZ169YEwY9986ZPXv5WY
H32ple6moIjmfZ8EWM2U6tQ++TUZJtIctQTVsNtQH8zmflOctvy+eGE9MSlNN9pq
rt5U+KyGi29YvffD3Sya7V3xu/ygpS2i/8HhLkLFkJ6e0zdmXJ5gW8A3in+hrLJN
DQ5oTfbbjaFHC37Tr5wPEeqBrRlRVGp6Ys+/kfEW/y2v+Ns167PyR77bFiS292B8
qkck0Fb2HQuNUT8Wld85sqaeZQZLzXkGysTiZ77pzhx+JjmS8ZPU7KU8nVfYe6QI
t6J6wuuXhE9OYZ5ag8c3Hn1mADDS2CBgziybl9uZNffPAdzOxDhLjVAw4TPHx58f
UbfabMvrhnF8MGUf5ywn
=hHNI
-----END PGP SIGNATURE-----

--2qldhmulz2wvm5xt--
