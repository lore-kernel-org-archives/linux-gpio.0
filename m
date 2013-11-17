From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [Cocci] Warning masked by BUG() when CONFIG_BUG is enabled
Date: Sun, 17 Nov 2013 15:06:28 +0100
Message-ID: <20131117140627.GA6744@katana>
References: <87a9h4559j.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:51370 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751030Ab3KQOGj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 17 Nov 2013 09:06:39 -0500
Content-Disposition: inline
In-Reply-To: <87a9h4559j.fsf@natisbad.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As a side note, I noticed quite some instances of that pattern (switch
> statement w/ a 'default' calling BUG()) while more carefully looking at
> compilation output. I may get slapped for this, but just in case this
> is indeed something which deserves to be fixed and can be fixed
> automagically via some semantic patch, I have CC'ed Coccinelle people.

I don't think this can be fixed in a generic way. This driver, for
example, should IMO return -EINVAL when hitting default in probe and
simply get rid of the other BUG() calls. No need to halt the kernel
because of a broken match->data.


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSiM1jAAoJEBQN5MwUoCm2HAQP/i9dxWD5kOyyFe3xtroUt0Yt
6Q0yAenTzy5i3pfFL7ItGyMwyBQyEtvQnJbTrPGDgTMvG7RNMH+5BnL65C1GY9zU
OjeVapjB2gAApw0aLbR8EovvZQ4WRsWrASFJRYWzfhCA7KdccuNG11VqdxwUrghJ
pBdK1+eJP2d+jdijYU/XYAKv0pUy2kFbFbucDKDIV2P6EJmyz5poCOtyKCFaLYkr
VFqA4gPqUXiiVrF8//mUio32ndCGPlQXbrAp/0/Zt5ITRv4/K7xiLySxXNIEUrE8
if5j+w6NzRgw6BI8secwUcgShreIPh1TTMjz81tnVGgz5WK+s7Eiy/4tBCBlPZXM
itJmMssCXEMx/hVzzP0eZNBOPfi/+yoYXlF4uuP4o+e03WTsC1cRy67aDHFCrmP9
K86tKLwlXhmwY6T/vU+MdKRMzKs+pSMXTev2iJJOzXcXz22ojzqmnanTgEHomxU7
0OGJlYvBFtULvL+l0JpYRigJaBjQElBfyG76F9ipWOZlmtcMEWePlGHAI8vDTKgA
g/FfCxOchU8MforZsLP9hNoOxtbHjx25ENvCMI3rAZ29MbNDOaPBnI4Awc84OiHy
VxUVrqky2w0q9S2qpvOZdKJvLTeZ3eHbwaMKSGPRE+eO1K62EvkBzNltqjCdqWdx
o7RRhTBBeDCll7P9eqQ8
=KCbp
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
