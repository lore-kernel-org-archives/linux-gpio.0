From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: use gpiolib API to mark a GPIO used
 as an IRQ
Date: Thu, 24 Jul 2014 13:46:14 +0200
Message-ID: <20140724114614.GU20328@lukather>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
 <1405358677-23657-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yRXsXhSYq7voLSEz"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:47563 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751058AbaGXLuO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 07:50:14 -0400
Content-Disposition: inline
In-Reply-To: <1405358677-23657-2-git-send-email-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com


--yRXsXhSYq7voLSEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Sorry for the belated reply.

On Tue, Jul 15, 2014 at 01:24:36AM +0800, Chen-Yu Tsai wrote:
> When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
> the gpiolib so we can keep track of the usage centrally.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

It looks fine:
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yRXsXhSYq7voLSEz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT0PIFAAoJEBx+YmzsjxAgU58QAIJwW9R28dzQBFGvw/KRUbPv
UzUhKdjffQESfaSh6LoaIZSMnrk8rqbTqWUhZhW3SCsKkSPC0z36pL6Kstt+csDu
F79vvlp/Fg+sFyhiddpFgZSPvRbkTVfcuvOjxHrIZRpkdP2CYtAiBUeu11j/ZffO
4E+Idd9vaHoDCzGMHRZZxF0WLZCmxgBptBXfabFzgkYy4utVhjiDC+m5YKh+lJo0
NhXR6qkm58T+VaPT3hYkXNB/dDmk/ekE4fJhmmQ3VMDIe5Z7LSZSYV+k4hqakMaU
zpGI/rd9+fG72kGG0509urwpLxl2gxvNTRIxNLNaJmbI2UMqqf9pYsfj4SfzAssr
lnznOKYcNEKHgRabLRjetsCqGKYpGxuPAgNeOgCzQ1MiOb9pQyJsfrWokdIZzKZu
R/rIe4Wl4mVsnmol9l6loBG3A3yvtShRiSxx33Hl6PoHDFA27lysiljkqKjlvtqJ
ion+AqigzpeNRJDsin1yNs7CVD2vSayrCMbwz05L/0tP7EZQcsAhnfBjp35qhd4m
OOADDNmwanLEOU3Qcol66f1Z4s9uH97CfjZubxnszVcQ+KdUSiyPLr6ojgndlNgk
RtRL9C6OwlgAHYo0MPapqA0b4vWwXXblq9TVyZFgXz9FJiC550m6FVJ4qb3wVxrM
benDuxyj5mnqM1JyRGJ9
=TjMs
-----END PGP SIGNATURE-----

--yRXsXhSYq7voLSEz--
