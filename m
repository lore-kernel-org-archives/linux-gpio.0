From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: Remove stray printk call in sun5i
 driver's probe function
Date: Thu, 2 Feb 2017 09:13:49 +0100
Message-ID: <20170202081349.kqjho7ebjqdn35rh@lukather>
References: <20170201160209.9261-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ciwqbsrcfu25uqee"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:44327 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdBBINv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 03:13:51 -0500
Content-Disposition: inline
In-Reply-To: <20170201160209.9261-1-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--ciwqbsrcfu25uqee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 12:02:09AM +0800, Chen-Yu Tsai wrote:
> There is a stray printk call in the new sun5i pinctrl driver's probe
> function.
>=20
> Remove it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ciwqbsrcfu25uqee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYkuo9AAoJEBx+YmzsjxAgh/cP/jfJMgv/i/MSFXRtsnHatR9Y
yKeuE5z5M9cwPgmvlp5DbR+AehREPuY1Wp4ddC6mrdG1xvqqyeYqpRZKa15YEtVl
AVVAjyW4hOMxJ2XpdnOSLWZNotFSUzJPo/FLBau7lf5k+ab9szApoW349htH4PJ5
Tg9vJHg+rL8xWUXtzx+6X+nKzpVo9mOQi3Q9QeBM5WBFVI+QwY1jA0MPT3AmslFX
mD/Ez+/hOIDduhNPIJYkAHTWc/ZeL7VjV8gig8JpQ3fGEo9pml/ExriucR37LZGo
cX0pRSsHFAU+sRsluTxR2DFhiefx6QPacaJYRaX9tfsfjS0grFU6OivEtsIiTKFW
toJ0z9JecRxeklo9OGu4K+1c5gquahKD37et/BR+WQ7k3wqTP5GzTOTwr+q0liRm
Us6vSt8A3Y5ogUzF77tl2RHxl4ZwGisEbEbthFASLuzIKQYP7ko6tmMsv0pxvVyY
EpFg1TaCrS9WxxpOx76XWp6UO1VlH07F32h2RtUQYTNr3UJyHmdGCXr+uPiHW7FT
8gdHPEX1OEkzSCYCq1dqZbkizkXfnSs60keZKlJFfewfH80jq/3zQbPXQnTgHSz7
sU6WxdXD+9EU4oUkacJZiufKQsRfC6NL9ZRiCHM0V4SNQbZgfJoQ7uJHPAAGa2ss
g613qK+XTXE9x802DrOq
=jEHH
-----END PGP SIGNATURE-----

--ciwqbsrcfu25uqee--
