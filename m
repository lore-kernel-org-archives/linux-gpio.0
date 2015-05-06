From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 16/27] regulator: Allow compile test of GPIO consumers if
 !GPIOLIB
Date: Wed, 6 May 2015 16:20:35 +0100
Message-ID: <20150506152035.GU22845@sirena.org.uk>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-16-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gorlpuYsmWC1I+wV"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53062 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737AbbEFPUv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 11:20:51 -0400
Content-Disposition: inline
In-Reply-To: <1430843563-18615-16-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>


--gorlpuYsmWC1I+wV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 05, 2015 at 06:32:32PM +0200, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.

Applied, thanks.

--gorlpuYsmWC1I+wV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVSjFCAAoJECTWi3JdVIfQ9qkH/A+dG5ijkvUXXv95206nYO7j
bGePb7jm/W4SMuzsq1JnBLdShddadK/gr6XWVGwW//j2xoMAcvn9Cp7g0Of05XdS
VfEHocq0YeHbqYlClvlfUdzktA5GNhVUo5+jCCwUuhi5eR2WAXvcly7JnkMTR001
6SyHMzbQueBu1G6fwL1SHEyCBAI9tJ9B2V1cnj/i8liTn7Jlnke4G1hyRqDyJBbO
xI27dqKemZa4J0niVaNqt4wXlSM3x1LQjMtA3B1k953rgzHatfgbsaik5Lxx1gnK
59OToth3NoxI2hR0PMV1L4hEvn5QTfUymDdmYyIbRs35Lu/72wzWD0WHUWUcuPc=
=uL0O
-----END PGP SIGNATURE-----

--gorlpuYsmWC1I+wV--
