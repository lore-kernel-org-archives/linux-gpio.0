From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] gpio/pinctrl: sunxi: stop poking around in private vars
Date: Tue, 16 Feb 2016 09:08:27 +0100
Message-ID: <20160216080827.GB4344@lukather>
References: <1455218943-25917-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:47591 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754188AbcBPII3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 03:08:29 -0500
Content-Disposition: inline
In-Reply-To: <1455218943-25917-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Chen-Yu Tsai <wens@csie.org>


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Feb 11, 2016 at 08:29:03PM +0100, Linus Walleij wrote:
> This kind of hacks disturbs the refactoring of the gpiolib.
>=20
> The descriptor table belongs to the gpiolib, if we want to know
> something about something in it, use or define the proper accessor
> functions. Let's add this gpiochip_lins_is_irq() to do what the
> sunxi driver is trying at so we can privatize the descriptors
> properly.
>=20
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

It looks ok.

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWwtj7AAoJEBx+YmzsjxAgLs4P/ArPp19M/EA12a/kT4ZWPU0S
n4d5G6NGjr+c98mxWl7tONDT8IGoL6sZJrAOynKSmbKoTBfLHegNmLm4uhYcxMsO
61MBfy4Cz3DTudFjXMJ9tWkau/pnAi3MdoI238xnnNlS0frIMKip9on4eL1sTi7k
//yM2W5p4/GIhJM2C9zRvxpSvsTxa6n1rU1oZ7LFGOhc2zSBhCPMcADzbxYl/cEN
qeD3s1654u5Dd6GLt80c833lYFV4/aJXHugmUnFCmK2IEtBYzOCJeBIrR8eSuP4C
981bbZTb4GPeB+Mpo9J/qTtnHeTZo/d0jksE8o9yvR8cGqirrsYwKoDeuaxlwA5z
1pt6U7d9wf5Qheagr0WwQ0T0fMPrgaHhlVvzqtebjvhNArbVWAwGBm4Q83tK0ETv
AoDlvU4+PVAGWih7ragfqzQmD1f4g3a1dkhDpwwAzYgk5ISz1xZsc2Q8CnCFtsxF
Zcibf813TwZbEsJE0Kl/hFGVkTMo/WNDBhABwJIOAMcCjAm0HYbvUqiuaCPXb4hp
d+tzsXMk6cIhWvolYb132nnUX7fJgC6skzzBhAkoerr8H+sMB+zldUvembV4B6VL
0MQNrw9Yc64TtRsI1dsSb+EjZCcKCFN0VJNJQ7iIPUOmjEF8Pfmi2mPqLsVa42hy
ltTq7yrQ5cMobgIEvi3O
=wOmw
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
