From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/9] gpiolib: Add GPIO name support
Date: Tue, 21 Jul 2015 12:10:37 +0200
Message-ID: <20150721101037.GB20023@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
 <CAAVeFuL5F=Y2boCWp_TZEAN-kdT-Ob9r-h1-eNVDjBHftFYkeg@mail.gmail.com>
 <20150721095457.GA9981@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33895 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754336AbbGUKKk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 06:10:40 -0400
Content-Disposition: inline
In-Reply-To: <20150721095457.GA9981@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 21, 2015 at 11:54:57AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Tue, Jul 21, 2015 at 06:00:37PM +0900, Alexandre Courbot wrote:
> > On Sat, Jul 18, 2015 at 5:05 AM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> > > I must say I like this series.
> I think apart from patch 3 which I'd like to have discussed a bit more,
> I like it, too. I didn't try, but the series should work fine without
> patch 3 such that this patch can be discussed separately and the
> remaining 8 patches can go in?

This series should work without patch 3, yes. Just remove the hogging
keyword from the gpios defined in the devicetree.
However some test coverage for this series would be good.

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrhqcAAoJEEpcgKtcEGQQAq0P/jRBEz2g8DtmWjGHu1CMKv5Y
Tu1QcL2vKtzXgi+XvPbtV6KjHFPLpL8kCyMn4oap97hZ8iPx2khk54C0M3tVOYag
KAFq9eFZ4AANcCQMcTu4KImzQ3C3FQMdQ+PA+Dj7pH4ZuANVj9mptafxtRCYXOrA
rPKln5/IzDYkZuyWN91wSZzRhoK+sccAs0k6x6t+sHRg4f5fTQPK3YSaPQpL54IW
xlrbOMEq/W0N+E7e2cjDQqKQkNRwiVlG29DV/ocRwN5V2Z4HjSndz/9JTOqBVp8Y
a5F7ps4NQk99FMKevYsrC2LhNQWlFx0Fjl8pDKAXuaDLrb6mFEZfdHRbMjj+Hfqm
gXnNnzob6TyMEhaSVt0tjHdl0zHkoaKM3MRyarhKNFhJxDUvc++fiSsHCRTKpqM6
MM2b+90d9mEtIo4+XTj3VC25Cfp6oxMZFu/WYA75MpNdfoG0aoHwYM0feEDunUab
eFi9tAMqtKg6jbW7Sm03nGRaGFyqQF6nzyu73u42IGaoR6LWpM1femtLdzGHQH9X
a2kcpSW9hLrgG5KkEr3mgkoSZHDW5yh7v6C6BuUoKOU86rDJpusEv/BzWn+gepLn
rSSnHltDHn+iTAm9k5hhQcSfn4+iflvtaKTnEuTBwuEWGwD5jxhETvgme7psQDyr
546UvnXMWUg+hOgjyhGx
=jJ4m
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
