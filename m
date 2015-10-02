From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: add GPIO support for IT87xx, replacing gpio-it8761e
Date: Fri, 2 Oct 2015 14:54:55 +0200
Message-ID: <20151002125455.GE7306@kw.sim.vm.gnt>
References: <1442852664-8948-1-git-send-email-vincent.donnefort@seagate.com>
 <1442852664-8948-2-git-send-email-vincent.donnefort@seagate.com>
 <CACRpkdb-DYCxEZGhk1TEjpJRiar5oi=zjmBmmgQie-xr+X+sVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mjWZ9NKzhEjSVTm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:52755 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752706AbbJBMwf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 2 Oct 2015 08:52:35 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb-DYCxEZGhk1TEjpJRiar5oi=zjmBmmgQie-xr+X+sVg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Diego Elio =?utf-8?Q?Petten=C3=B2?= <flameeyes@flameeyes.eu>


--7mjWZ9NKzhEjSVTm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 03:47:03AM -0700, Linus Walleij wrote:
> On Mon, Sep 21, 2015 at 9:24 AM, Vincent Donnefort <vdonnefort@gmail.com>=
 wrote:
>=20
> > From: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>
> >
> > This patch adds support for the GPIOs found on the ITE super-I/O chips
> > IT87xx.
> >
> > Signed-off-by: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>
> > Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>=20
> No clue what you're doing really but it seems good, so patch applied.

Hi Linus,

This super-I/O device is embedded in a LaCie NAS. The driver has been
originally written and submitted by Diego Elio Petten=C3=B2. But at the time
it has not been merged for some reasons. Since we (LaCie) need this
driver, we are simply taking over the mainline submission work. Some
fixing and cleaning have been done by Christophe. And now Vincent is
submitting the driver again. Vincent, Christophe and myself are all
working for LaCie/Seagate.

I hope this helps to clarify the situation :)

Simon

--7mjWZ9NKzhEjSVTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYOfp8ACgkQgtp0PDeOcDpFeQCdEE+IwfZNYQe9fFUiYJ+W6VJS
ZX8AoIdFsH/vN2afDMD9X+2f2wKWg7in
=LpZl
-----END PGP SIGNATURE-----

--7mjWZ9NKzhEjSVTm--
