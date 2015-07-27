From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/4] pinctrl: sunxi: Add custom irq_domain_ops
Date: Mon, 27 Jul 2015 14:27:58 +0200
Message-ID: <20150727122758.GU2564@lukather>
References: <1437396074-15791-1-git-send-email-maxime.ripard@free-electrons.com>
 <1437396074-15791-4-git-send-email-maxime.ripard@free-electrons.com>
 <CACRpkdagO0DhB_1KLcKDPJ9RoKx=aiUMLMX59bZOXkA4PcN8cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uN3tURjgVTLfI0kr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdagO0DhB_1KLcKDPJ9RoKx=aiUMLMX59bZOXkA4PcN8cg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--uN3tURjgVTLfI0kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2015 at 02:04:38PM +0200, Linus Walleij wrote:
> On Mon, Jul 20, 2015 at 2:41 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > The current interrupt parsing code was working by accident, because the
> > default was actually parsing the first node of interrupts.
> >
> > While that was mostly working (and the flags were actually ignored), th=
is
> > binding has never been documented, and doesn't work with SoCs that have
> > multiple interrupt banks anyway.
> >
> > Add a proper interrupt xlate function, that uses the same description t=
han
> > the GPIOs (<bank> <pin> <flags>), that will make things less confusing.
> >
> > The EINT number will still be used as the hwirq number, but won't be
> > exposed through the DT.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> This patch does not apply to the pinctrl devel branch.
>=20
> Does it need to be rebased or do I need to merge in fixes?
>=20
> Holding patch 3/4 and 4/4 until this is resolved.

I'll rebase and resend the last 2 patches.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uN3tURjgVTLfI0kr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVtiPOAAoJEBx+YmzsjxAgrEIP/0W7qEpmrKHtU2VgJA8zLxXu
1ZLgvukvqVhdcboLeSpjjIY7RNLvRl+5tRaaAEBBobyBFl0cpyrEnC3Fi0lca1pJ
42E9oJBjYv3zR9dr6rxJb3XE79erm2E/DQHmOsaxpDMWJT8fx/xdXUxspiXb0VeY
TLCq7suLJkLH4l4Hwf0J6VrGgW0j3BiE6zKFSwxRtHYEMp1/w03rbyhMCrFVLoHq
yp0kJrwFwGs4zLi+wM+eF3AibcZ1+VnwwUCKYDzX1xvqr/YaiYpGQR3GpWc0nk0w
mQjebheQibamonw4ABWAJYfMb4EWUzgZHDRc08OdWvZro+ojoF9eAcZ7jkkQLDvY
aH7TOUDJOC95+1QnAKLHl73/DCZ4v2pxeY3Npt9xuN3+qsYgAnq/hnpYs2alU2Iu
vaLrQYtlQZB1obI7PiPJWRv+HTRPZM2LUcwg3Os8hZruGBfonUQ9KPvQuoOWzCV9
b1Q0o0dmjhKMwqA+m9+j53YtnzDEQHkFdBU1etRfpcqSQyGE0L9DXT2+e3vuYXs9
A/S7CNVVFwJUCVpqDXdGJlagJgaX5pHzG5sTwNQTuIYoDXTDEMYSsnZXpC7n3qbi
X/Lsh7CAcU+0VCtS2aFMQd6EYUWOVUgmlolr4UPb0ChlvWJRtH6EyY1UVnA2esgM
4T+0mCOKY1sn8vBRTanl
=ps1A
-----END PGP SIGNATURE-----

--uN3tURjgVTLfI0kr--
