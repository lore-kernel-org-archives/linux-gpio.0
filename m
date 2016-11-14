From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/2] pinctrl: bcm2835: Return pins to inputs when freed
Date: Mon, 14 Nov 2016 10:24:15 -0800
Message-ID: <874m39vs1c.fsf@eliezer.anholt.net>
References: <1479126214-20529-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:57720 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933511AbcKNSYW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Nov 2016 13:24:22 -0500
In-Reply-To: <1479126214-20529-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>, Stefan Wahren <stefan.wahren@i2se.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> From: Phil Elwell <phil@raspberrypi.org>
>
> When dynamically unloading overlays, it is important that freed pins are
> restored to being inputs to prevent functions from being enabled in
> multiple places at once.
>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYKgFPAAoJELXWKTbR/J7o1jQQAIw7R8744v2f92HqzOlRQy1v
o2/o0TKjAzLNgY22I1SZejIt/IcE1qs9wWT+8JJpXERZoQdV2NH7O9J+l8Kx7JMU
0hoddeY+CWa4z8u5otB4NZer7kK9wllOHl4z7sKnoOe2wgdVyO+8EV0AihcotU3q
Ug0Q2KLveNn/621nlzuMaxox+dx9p4TEHSkG5N5+NExqP9vburtKOgTV+XCJWCwp
tSa/q3MKkR3DczqsCO+RuUTKsfwljbus9Sz7cC2qciP023cANMY6IWo4KObNKN3j
kl10qLMgAsvmGQmw4K8lh5lTGEjps+zYaJGJcNtftl6ZGKFv8seXZ+Fz0uF9PSr5
XMLKzz1a+eBzcV8TQsnMW2rd82AiskPVEk4oElWpksllHEkmwzDRn/3DXZrIsE+Q
qF459blXuyL5M5qBPHbDpjAqwNJAz5+MyIrHlExpz3X29rW50lrU6MwXTLAmkBAE
LjYHceBASuYtW5k9An3N/0VlA24NvvmnFQuQYYvuPPqAzgdNz7K2TSl0PL5r/Iea
3uykxxYX0lMhxi31mwfo8X3A2Kx8zB3IyxywY36FWG/VikH4g7wpcssbLZOTCR5Z
N5ocnPAz9zhmpyW+lurvGqT3gfYMytiFacfRkMoliugqw65rCFZyFh1e+73TcDDY
4IZfQkzZkndQptulnIGW
=Bsu3
-----END PGP SIGNATURE-----
--=-=-=--
