From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Tue, 6 Oct 2015 11:13:16 +0200
Message-ID: <20151006091316.GK19355@pengutronix.de>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
 <20151004133742.GO4284@localhost>
 <CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
 <20151005100147.GB25143@localhost>
 <CACRpkdZBw7ayenkRTtpQH==G64TGNEXv6DgzdRAZxCCHJUZuRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:36729 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751653AbbJFJNT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 05:13:19 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZBw7ayenkRTtpQH==G64TGNEXv6DgzdRAZxCCHJUZuRg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>


--FUFe+yI/t+r3nyH4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 01:07:09PM +0200, Linus Walleij wrote:
> On Mon, Oct 5, 2015 at 12:01 PM, Johan Hovold <johan@kernel.org> wrote:
>=20
> >> I think it is ABI-correct: it uses desc->name if that is set, and
> >> currently that is only set from chip->names[] so status quo.
> >
> > Yes, but this work was aiming at generalising the hogs so that they
> > could later be requested (and exported), right?
>=20
> Yeah something like so... thinking about it we should indeed
> takes the names directly from chip->names[] for this, so we
> can use the name field in the gpio descriptor for the "real"
> chardev interface later.

So what is this "real" chardev interface all about? What are the
requirements and features for such an interface? How is it supposed to
work? Was this already discussed somewhere?

Any chance that you both are at the ELCE?

Best Regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--FUFe+yI/t+r3nyH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWE5CsAAoJEEpcgKtcEGQQxzgQAI4Lz6NIe0uwqSJs+cbxJmRJ
T0Z/MwSQLQPqlGf8FMgmdlAZrj86t5UszGu0R4tk5TDfvdbDhx9j2ssESKd6O2L9
wsys6o9xthvY1b6VDqXCq+TxCVeppr1510uyynvGBZ8DxwRUPm1aSssW8HoASwyN
lQROC1myaKyX2/VcaCcinUIEgT8GwboV5axhBjgfBs+F9i5bRaqlX+VWyum9DoEb
kenSLzpgbzau6UcmN5IK2dnBKbg8h7MmCq9MnafXcAmWKD7yhEfJB7Li93zTY2Pt
rXnG1MaTV1NJpt0KeMVor8Gcg5DqF3DZ3MkJtTyngzDQ5RU11kG2cuRbX8UDjXHt
ZnWtFi8Co/c7QFAfD75sIdTW2mAjGGekLymTKKJay9jtUIrjdJGbFvIKiQw0vBX2
iTlg4MsMcFD27s3xH9QR2mQZ7VWQueIt3GYckeJ9PDaRkFSmSFSo6rOgUp4FkzeN
hFieUdCRGahg4atvGNnica/b3VrPZnnnjkv1Zr/YlZnYJr5rGtLyfyjplJjzPe2+
rfGCeEVJdQ+2N+Hry0bkioxfHiAN1SDwK54rZlWrM/rsfM3yR4rrUeoWARCftVrk
cEUrzy6/wusw/bJ87ErH95o4X7N/hhHydlHl8bkrjhG76XhDcalV8ihZRZ+80BrS
GJhLYyd5SkzrKvfRotPO
=K+ko
-----END PGP SIGNATURE-----

--FUFe+yI/t+r3nyH4--
