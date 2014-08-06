From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Wed, 6 Aug 2014 20:39:30 +0100
Message-ID: <20140806193930.GL17528@sirena.org.uk>
References: <25983307.ZjJOfz2Kpg@pcimr>
 <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
 <20140731071235.GH3407@book.gsilab.sittig.org>
 <12452684.GmmEHEPXzu@pcimr>
 <20140806124544.GE28369@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f7FN0BAtwwvtMg8W"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50196 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753248AbaHFTjm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Aug 2014 15:39:42 -0400
Content-Disposition: inline
In-Reply-To: <20140806124544.GE28369@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@the-dreams.de>


--f7FN0BAtwwvtMg8W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2014 at 02:45:44PM +0200, Gerhard Sittig wrote:

> Could you spot the LCD driver mentioned by Mark?  There are
> displays that implement a typically four or optionally eight bit
> data bus plus some three control lines (E/RW/RS), usually GPIO
> bitbanged -- so in total it's 7 or 11 software controlled pins.
> One of the controller chips is HD44780, compatibles have KS...
> and SED... names.

I think the users just stayed out of tree due to not being able to get
stuff merged.

--f7FN0BAtwwvtMg8W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4oRuAAoJELSic+t+oim9vvwP/3A0O3ifuorBcmJIjIc2ohn4
eN5y9Yqs7x6FIP7/02uCoCQnltqQajLLKCoJEr8DeU+8Cw2SVulzYsUkZposula3
XoWZzLymuD8v60+k4jyZX4863zeEMOs5Yzx8za5oEixi5nT82sHkcjunXYb8vitw
FRsrNuA1pP0VQJKsR5y5DdV2DUvVFjC2n43X7rvVFp1pFUBnOzCx/ywOjRTaLHlp
Cwa8bVt3IeDlfZEu1EYfYYkYhJHslFHY5PiU+pg9jxv83mblAFv2IHRa6eXtYlH0
hGKjNPLu6XjqKGBol1to4sfz/gX6r4FVKWDAcsFe/KOLdr5JirXkp27ktJUix68x
xOgfdAmlgI/AX01AQm9SeNJbVEtvmhVDIbByhMxmpxNTvFh+6jsuSAZDNmgXRV9N
ASXb24LPXaUo+GRmqD4PY1ktO3HUCBhmg/FGasAN3AoFHeCICBv0xrZmC92YnMo3
FsZ60WqQ3O3qHGktRvDb66sS/BhLsaD8rO75Xtrnu/3tuh6ruSV4lGTZV4840RmA
C4f27LGZIna1iIZbXYXp30KfH4GJNNhI6IUYWtfBWdmpOMdFBydb7ocxrN46D/aW
ULuPBuZqKOAs3hI1oWcT4cpDud5E6NKv97Kjoxs3DQ6Xg3JLnC56lN3tAecTvSWL
74S8YIArdLFAoep7MZ2O
=ErCH
-----END PGP SIGNATURE-----

--f7FN0BAtwwvtMg8W--
