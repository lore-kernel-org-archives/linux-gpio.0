From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: bcm2835: reduce GPPUD set-up time
Date: Mon, 31 Oct 2016 10:49:23 -0700
Message-ID: <87a8dks924.fsf@eliezer.anholt.net>
References: <1477920093-28180-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:44155 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S945046AbcJaRt1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Oct 2016 13:49:27 -0400
In-Reply-To: <1477920093-28180-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Since the BCM2835 datasheet doesn't exactly specify the set-up time for
> the GPIO Pull-up/down Clock Registers there was an assumption of 150 cycles
> at a clock rate of 1 MHz. During a discussion [1] in the Raspberry Pi forum
> it turns out that clock rate refers to the VPU which has a rate of 250 MHz.
> So we can reduce the delay to a sensible value and update the comment above.
>
> I tested this optimization with a Raspberry Pi B and a multimeter.
>
> [1] - https://www.raspberrypi.org/forums/viewtopic.php?f=72&t=163352
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

I've confirmed that the only clock input to the hardware module that
contains the GPPUD registers is the VPU clock, and I don't see anything
else over in the pads area either.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYF4QjAAoJELXWKTbR/J7oeycP/3rap1Sb8nBBecoYbXIMakn9
A5eyPI+F4puxydfq4mV7tWN5W/v4xX6Tl7rDBHy4jdvkm4dIRDuuxbFm4CnsObqt
lvYN7Mlyh/Bcs9ZngAv3gCZ/9X3+Q8W1d9ZODyqDh/4UZnp5Tm/fFf8ljXxjSfMQ
D98Igz1Pn4afTfIKsDAbxF21M+SbjgQuJHaFbEIPXacEmoW6vNF9o++VnqCv1UxK
DIFARURAQ0Un8JE59J3ii/4f85tPAwngisX80D8acZBTm7QjojO0af56GrPEUtTX
gWD0IfOKRHzdJ3i5dhE9Kn0sCb3Q4R3klqAoNkG+kOhZ1uKQnptAb+jmX/vPl0e1
0AgFjZw+2SPVGBe346ctq9AehFznwiatl0tHQ7b7XA080lb+YBaCENSvWnFikdYR
QWLPfEf1p5hyf9prHY1BhfP3epu4oafP+g2zNdYZ1XOca4kXdl1M+DdZhUuopaKx
0ovxeExIGrHm6vdnuSvW1NuawaYuC6GFcg6tDf4WSsDPjRN/Tq5ypICp0DEqqCzD
taFuCJojoSdTMsWzGrsEOR7WkrjFvEAQGxO3GnZBm8wjJ9kdipaAUijpFanRsYSs
v93TtXQiaVE922SSFtFny69nkjMrDYYaAJOutPoVwfTApmeJJgE/hIpP6KpyA2PQ
ZEYTkQj97fdGVQVrIsr2
=npO2
-----END PGP SIGNATURE-----
--=-=-=--
