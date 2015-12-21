From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix memory leak in error path
Date: Mon, 21 Dec 2015 14:41:41 -0800
Message-ID: <87fuyvfmqi.fsf@eliezer.anholt.net>
References: <1450658644-20858-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:44354 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401AbbLUWlp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Dec 2015 17:41:45 -0500
In-Reply-To: <1450658644-20858-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> In case of an invalid pin value bcm2835_pctl_dt_node_to_map()
> would leak the pull configs of already assigned pins.
> So avoid this by calling the free map function in error case.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Fixes: e1b2dc70cd5b ("pinctrl: add bcm2835 driver")

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWeIAmAAoJELXWKTbR/J7o5iwQAKRoq7jG2HLe2/HCJ2j6arHD
H2xS68aIDn32C5gEtuqzT3C+6Ijm8kyXTpxoaxF+yQsMUkgw2tIKfLQe7cSVtewH
GxoIbY7bE4t8jsoULyMEflIW1+Y7BFMGGxZyGpiTfcz/xEAzhPcqffaWTjMoL9/v
Wc2luieBiPDqkzwj6CFZ5YNySwI/haXoGafBaAwDFoUA50x+yQf/KP3OPLyGAzC3
FvIhoM9CafEPAxDdXfdNtTUFFO9XD8PG7YvIYgZZV7kvEZinfx1kPGnIo8KtATfX
8CCdCFvqL0mdybY/UyhOUQOV0TaFhn2GpJgnbFo2r7/yd+NSCEGL7P1EBG9r8/dC
I9WXUnC45qbPyMyRJErvXJkDM+7xQFuw40pOr+pfT77iBmgw3GBIxBjz8GevRie0
ooJaaXM38B5GMcROeew7l+joXwjOywDDTKUcFu2h7f+xOF8SLAmlYqkmqwu9C7B0
FdMlQwNqon0Qvg1CfZXIUfGESIY+ukk6GgNaae1L9PlNxpAEXjpZTangac4dFkd/
tzmQCkbuRTvdriLK7wW6joJp1bZKDgxDu9nJP02RXG9il1RhJPXEfJGuCH2cQtIJ
dw8seTborgFLZzhHK1cg+QvZictZGr/l3YkjvBa5+a7q3oXmOjv2UrryUvuKLwGp
sAZKKw3oRWvXMyjuj+z3
=Gy29
-----END PGP SIGNATURE-----
--=-=-=--
