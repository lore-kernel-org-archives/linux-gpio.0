From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 2/4] dts: sun8i-h3: Add APB0 related clocks and resets
Date: Thu, 25 Feb 2016 11:33:17 -0800
Message-ID: <20160225193317.GM4736@lukather>
References: <1456146208-13890-1-git-send-email-k@japko.eu>
 <1456146208-13890-3-git-send-email-k@japko.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:54174 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S933377AbcBYTde (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 14:33:34 -0500
Content-Disposition: inline
In-Reply-To: <1456146208-13890-3-git-send-email-k@japko.eu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Adamski <k@japko.eu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com


--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 02:03:26PM +0100, Krzysztof Adamski wrote:
> APB0 is bearly mentioned in H3 User Manual and it is only setup in the
> Allwinners kernel dump for CIR. I have verified experimentally that the
> gate for R_PIO exists and works, though. There are probably other gates
> there but I don't know their order right now and I don't have access to
> their peripherals on my board to test them.
>=20
> After some experiments and reviewing how this is organized on other
> sunxi SoCs, I couldn't actually find any way to disable clocks for R_PIO
> and they are working properly without doing anything so I assume they
> are connected straight to the 24Mhz oscillator for now.
>=20
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWz1b9AAoJEBx+YmzsjxAg2Z4P/28hfuPDFdRanM2hG5uCQ5HH
HqdjMi0SFCV05d++Fdc8CeVDZNShJXkFIRNw9kdQ17mrAb7c7UbxeFpYIM00y6yz
3CTHaHYh+TWTnxkdPcwvRm5so8T4dU8eHnflNc0Z9feMp7UBxTT1zl5nbsgRfpan
or1WTR2WIC1x8Md3tQK0MA0MHTIp3+ppKGV/DiZt6L5l9EnAeUEXiIt95YLBUTez
cZuALjw5pi86dWs2YZGYCVFFR2t14P4HG5CtVUgUglEGfRMwyZcuxdT2+n9inSj6
yu11XFhwX7PrpZX+FUiMuZ1f4fz5Tmbk0ml+eiJyjPuFIadwSWluWpz++DvE/d9/
4RSi+yMeV6SM+8E6i5PUQ4tHfMNXmGkQHOlvh5f3DHeWaa/EL21b7Ge69tgtgRs6
gTJfqAInK+Vh+gd6DdNl1ZMS2zwcrpZ+OB4/YN7zheCVEIetfDDUCT+ADjtOJjwI
LiEJu/9zWaWa/GN94OzV8xebetDSM0/OT8QFnfTo9uufFT5hXk0yFc/cmx3r+3PQ
C6+CC1Zo0UIk14EiPc88vizMfVKi1akiinGmTw4UkezgODXS9kEPDQpwNa5k8tnR
C7mWhr60CAjBbuEIFyeFqY36UHu55wLBRGZC+8Hv4zG64egWsk8ZtWgKD3NardnB
i6JjZjhJYG8JzxGvyiRR
=+S+9
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--
