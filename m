From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] gpiolib: Provide helper macros for logging of GPIO
 events
Date: Sat, 7 Sep 2013 14:10:15 +0100
Message-ID: <20130907131015.GN29403@sirena.org.uk>
References: <1378471128-3330-1-git-send-email-broonie@kernel.org>
 <1378471128-3330-2-git-send-email-broonie@kernel.org>
 <CAAVeFuLLDc+BynoroG8TBx5yT+jYPHfoppDFFqjwistOu-5HnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nG9yj4eE4W6Oba0"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36840 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257Ab3IGNKn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Sep 2013 09:10:43 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuLLDc+BynoroG8TBx5yT+jYPHfoppDFFqjwistOu-5HnA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linaro-kernel@lists.linaro.org


--+nG9yj4eE4W6Oba0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 07, 2013 at 11:34:36AM +0900, Alexandre Courbot wrote:

> I like the idea of having log helpers, but we are trying to deprecate
> the representation of GPIO as integers. Well, for now this is indeed
> the only way to use them, so what I am saying might only apply when
> the gpiod RFC patches are refined and merged, but how about thinking
> of another way to represent them, e.g. by GPIO chip name/GPIO index
> wrt. their chip? The representation needs to be compact, which is
> another challenge.

dev_name() plus label perhaps?  Some of the labels do tend to get a bit
long but if they're used this way it'd probably encourage brevity.

--+nG9yj4eE4W6Oba0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSKyWzAAoJELSic+t+oim957EP/3L2miDJAT84zb6ITcf6yvgC
Rr1ITEY+7pgZSZarBbVMzxsY3Y7azWe8E+8rCZ80SK+VvO0kGqJhlSaZ6HA+JHW0
TTO/QpN7I94jNf3jyg87ZGBIBVVWG2Z/Hi6YqfnbhL20H5pEE2zryyU73E9vbDc4
OWor6ZMPDXNRVV9KfUEs9riau5UnD32l6EzTu0DgvbbHfMAEjuUtagDeSd8j4s+a
2kgmLUTMzBzDKt3JyW1tUofn9BUvNel1ln9MtBYKep6n/JFtnyK3Yuh4fasQthpp
1+M+mqIB2EGMa67iLlNezqZfkEbK7Rm0HBQlSWgPkkI1nd6UpPisharYq2s0nRrd
IsFUJ61jjUowrqRoCXv9iJEq1ku7ZWZID1q7awVaYqSDMU4abQO6GCpUho/vh5si
QmGaWNHluOFG2gD1y6OOEvtP3GhjdveCT9XaEruzYHhDgbeqMLy+vPhirudfQNpI
s8wZ+u+t4qsfOpHRNXpNuUEwlnZZzlX/8MV3kaLYhYMIPIYPrEqzp/N2KSCLVeov
ZufQGuPckFP9t+mjftm3wtzq8+s+ferD5QYtUSJrlhJLA4Scb+xCzH1ROnzyzr51
dM9zEa1wEyAny1WaIr2u5/fszveK28XTltpVf34uJcctGz4KFWi9kHnGZgZ2rG1Z
pe3mRXPy8aAFxF3c0uhX
=Gdca
-----END PGP SIGNATURE-----

--+nG9yj4eE4W6Oba0--
