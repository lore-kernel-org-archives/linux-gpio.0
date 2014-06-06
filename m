From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2][v4] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Fri, 6 Jun 2014 11:06:50 +0100
Message-ID: <20140606100650.GG2520@sirena.org.uk>
References: <2025835.bJlicUAVfz@pcimr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Guq+xBHXhbnAFmh4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56813 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbaFFKYP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jun 2014 06:24:15 -0400
Content-Disposition: inline
In-Reply-To: <2025835.bJlicUAVfz@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Gerhard Sittig <gsi@denx.de>


--Guq+xBHXhbnAFmh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 02, 2014 at 05:28:50PM +0200, Rojhalat Ibrahim wrote:
> Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> interface which allow setting multiple outputs with just one function call.
> Also add an optional set_multiple function to the driver interface. Without an
> implementation of that function in the chip driver outputs are set
> sequentially.

Reviwed-by: Mark Brown <broonie@linaro.org>

Mainly from the point of view of the API; I did glance at the
implementation but not in total detail.

--Guq+xBHXhbnAFmh4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTkZK3AAoJELSic+t+oim9qP0P/1unBQLC1Z1uPm1hG49gyro0
7ee+YUNb8CsbuElhYSWRwfDg5N54KIlMTONMGDTGItBfKGsLavYsaelF/5zaXGUv
8fi3BIOkiU7qvIbQouFvbE/BFVtGgqq70zDxZv+GdgPfshXVdqSYToPUPj2fGI/Y
74y6DVka5yrUi5Hpk7dgulE/1vkkRhcJ0YAc2dXb+hRvlV5xt/5dX+GZjF2fXF9M
osxJTmAgFvsjAzfu8XrDXB/KX9jkT9am/ZVOCeY9gX3uk6ga2dnOZzwcIj+uVI+w
10Pk7a+xkF0qeG6H6PAUYS8ndV5dCcRVLhEf681uHX9yPkNfsP8DYaZuRxxbJ2bb
tcljG9J5heAQNMnB7XxRnHRjT+3reuqvi9f2WHk7lfvqVRCsAPBx3UwH1FgnzkYV
6YsKpNYa2i91YzEpB3ogy/WRAikWehRGxjkweH1lFEtDRKs0SGmiyq2BcbxKEL99
yNzBLMt0kBRb8EyKmlAhtg3SRVyYSiXbUhvFbG4/Z+M+BK8X1EoYPeoNPdif9t6g
Dhm3JbfwbBwYUWiWPhKx8JjG/Os/5Qvgdsc5t3+aXpEQiKZxyN6N70eKE/u6fJO0
8QYHRaZTDV2pJkWow0gLpfwcY8RcPCGEw1qNJOQS53bp/yxmHZfM44eF7Hfaw5t9
LRLksWPiM/FIXwlaEVKB
=Ht3u
-----END PGP SIGNATURE-----

--Guq+xBHXhbnAFmh4--
