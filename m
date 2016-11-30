From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3] RFC: pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
Date: Tue, 29 Nov 2016 16:22:28 -0800
Message-ID: <87twapddff.fsf@eliezer.anholt.net>
References: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:48220 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751566AbcK3AWj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Nov 2016 19:22:39 -0500
In-Reply-To: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> It should be possible to use the GPIOLIB_IRQCHIP helper
> library with the BCM2835 driver since it is a pretty straight
> forward cascaded irqchip.
>
> The only difference from other drivers is that the BCM2835
> has several banks for a single gpiochip, and each bank has
> a separate IRQ line. Instead of creating one gpiochip per
> bank, a single gpiochip covers all banks GPIO lines. This
> makes it necessary to resolve the bank ID in the IRQ
> handler.
>
> The GPIOLIB_IRQCHIP allows several IRQs to be cascaded off
> the same gpiochip by calling gpiochip_set_chained_irqchip()
> repeatedly, but we have been a bit short on examples
> for how this should be handled in practice, so this is intended
> as an example of how this can be achieved.
>
> The old code did not model the chip as a chained interrupt
> handler, but this patch also rectifies that situation.

I went ahead and put together a little bit of test code for HDMI to
collect hotplug interrupts.  By registering the GPIO IRQ from the
driver, I'm seeing my line in /proc/interrupts and its count increments
when I plug/unplug.  Given that, feel free to apply:

Tested-by: Eric Anholt <eric@anholt.net>
Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlg+G8UACgkQtdYpNtH8
nuh2ORAAqJ322yt0Z6hPWXnvkd7UWqCovhkLvCpv/hkdV2hOO+suwtqOZCYqTQ6g
rEiIELJ8fNM0PLoDyBs1+nlkOWbZ4oKJ3zSzVR06fZN/gOfjhly5lqgt+xmcVPSU
rpiW910XblF1+KnWAyEw524PZwHMBktvHFYKVpgAafYZK1m0rkQmkWprRlUS7OnR
ud+rdTTnN09wLGL2dk7B/M6mmhHFY+xwGwUhFiO6UVgDiF84n8Do+nWMVghkIikD
R0pmp0Mzp/AxNw6KIMdbOXeT/2I4K0pHbm+WD7VgcMVVT0rZvJzjJ4ujsZMFQBXc
5jifIRi4PiZz+0w1Q47ncOOAHBiRlLGtzoIKxu7RW2dlgZwhO1w/VadQWyTVL0kv
T9NLc7LMxd74h4zZLrlD6QavfzgF+FX94Qo0AHKMxYEbeDo1hv+en78n0uokCt5w
V0fVwkF+GNqT/dA6+BbjvbVJcaFnfoJbFe45EsE2lx2VDPOledaKlHWNcTrbnpXw
0ibs8P3P01biFp0gw/MKDzq22bxMyYjD8yqRw6mPr4WqckbXGWDP5DsvZTIGpHku
/oL0bXqRFunruLgEmpE4F9X8/EWUfahNfURzhaqNahvvR0YBCESty3bgefI/MsgA
Sx4+5e6FFR2/8hTSn3URoXUR0bPy2uTSsbheu0mX25mw/WFWzOI=
=Ps73
-----END PGP SIGNATURE-----
--=-=-=--
