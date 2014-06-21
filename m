From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Sat, 21 Jun 2014 21:24:55 +0100
Message-ID: <20140621202455.GT5099@sirena.org.uk>
References: <25983307.ZjJOfz2Kpg@pcimr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q+wpwnhz7AD6XSs6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52523 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754007AbaFUUZQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Jun 2014 16:25:16 -0400
Content-Disposition: inline
In-Reply-To: <25983307.ZjJOfz2Kpg@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Gerhard Sittig <gsi@denx.de>


--Q+wpwnhz7AD6XSs6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 16, 2014 at 03:51:23PM +0200, Rojhalat Ibrahim wrote:
> Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> interface which allow setting multiple outputs with just one function call.
> Also add an optional set_multiple function to the driver interface. Without an
> implementation of that function in the chip driver outputs are set
> sequentially.

I'm pretty sure I reviewed the external interfaces last time and they
don't seem to have changed so:

Reviwed-by: Mark Brown <broonie@linaro.org>

Please carry forward tags that still apply so people don't need to
duplicate review.

--Q+wpwnhz7AD6XSs6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTpeoUAAoJELSic+t+oim95ToP/0puqOPIcVHqpwfSAnoyw9WW
rmU7WDV7axzPeoL3KRwSJ4WUygSeA4AR1rH4wyP53DqWBSitSP1PngLtsdHHLUMH
Qy/eUFY+m2OjLdE3tXpPT8rMjVK/iW31hqGyHoFhBswZmY4hy03jrn1wPIj5lA3J
noHgkdCy6TWDcTVGE6kawir1oqqPMx8iTNNgcLMfpm3ccX/CGjZne+eb5ZWe5H+r
Zm/5ocCrtJiNGtSRAjjP3Rp/mLTkOenbxOf4eeq51T4oEDh2fzJ7QRg4JNQWFKJq
oqadlXp04i97FRL2Yqw5RdRfX9AG/Xz8v3HK65wp0sjAlw2rAmpsQJ7DR7wOe2My
3M+K05Iv9Nff7ADmbgPVtVTIi0SIeDlysiZT6XMsGYsUJEqbmE1tKiErXTBq3wQz
Gkjacqi1uAAPtYsKk84uoGHNHXXj6blaxVl2+D2p06Q+2T/rXmq8Xgv9tNUIClRY
9105Co7YvwDQtFTG3fJozumPYUIivWfY15Kisod7FVC0RklMjvpCWI2ZiGGDeJJ+
xiPhI5Q0LSqTkKr3R4b/TObVs1RAgji67RvruuhcqZ2DfVMYA8jfeh5j3rNPBhEU
GDmMgDDPvxDOxRZWezFm75Dd7kU7CuLWBdaSfDxSeI6bOXAcX9ngNBUPfmTK+nLr
L8LseKHrmUuRvsfH3tkP
=Va/h
-----END PGP SIGNATURE-----

--Q+wpwnhz7AD6XSs6--
