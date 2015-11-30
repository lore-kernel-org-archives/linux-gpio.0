From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix initial value for direction_output
Date: Mon, 30 Nov 2015 09:17:36 -0800
Message-ID: <87r3j7tnin.fsf@eliezer.anholt.net>
References: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:42612 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484AbbK3RRk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 12:17:40 -0500
In-Reply-To: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>, Martin Sperl <kernel@martin.sperl.org>

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Currently the provided initial value for bcm2835_gpio_direction_output
> has no effect. So fix this issue by changing the value before
> changing the GPIO direction. As a result we need to move the function below
> bcm2835_gpio_set.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> CC: Martin Sperl <kernel@martin.sperl.org>
> CC: Stephen Warren <swarren@wwwdotorg.org>

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWXISxAAoJELXWKTbR/J7oiFwP/34k7Q6wDLfHa9/yUnpVhjKJ
7PKErCFlVO0NMrNQ6fNWm22KG38ctzbFNs1EQ6c1zXulh1AOtWc9kXT2J3rp5BKE
vU4cxsLrNRe2sJJUCgrVMWjnNDYtkM1qS/5XrB7JNgBmfqHluT07ADkAx4BoLp6m
+P7q89U7/QD0UZZvTQ/giQN21wCvoB1sFANne2rFc7eUtAKM9Ke7S0GCpi+Xd6c9
ytCRFYS5gixwGw2P0ILSqgmqnlaPHLctuTr2T+eH1OEq4VjSSNsnV1xcZah82A0y
9J+2gaRZArzKjl7bPHCfo0vvlW+BXdFgIQ/LgclM9LuS55Z4iQ0HO9kgAkmIAsqm
jdl24Cb/sAxeoY2q1kCdenBIhPJzoFik9OtifGehp/i65lEI3NJPctPSn+b+2s5w
DNumQqD4tT98GDS2qHvh/HVcBGVKV8n/7WDRHDSRo85gWk+U467/O8IRcxkPhw2Q
KwxoodWTBb2AWvIJD59QN+fP6BGwWq4sFUbn75sP1zcAeYYHFua/qPRmi8BGj706
rJqgXvXMeOkTpF33otm/qHtG9ut6xM4dAqZv8XcSpF6AftzgoMrlQQaSC6tVlIfg
54GUZA7iKrN2yYywRHy6vclkBNKwGTLsI53LK4PRt+kIPNZaX1Y7yyuqNz9GWKFu
ZfdJe3ZUl+mFlCvHtqbO
=kGuf
-----END PGP SIGNATURE-----
--=-=-=--
