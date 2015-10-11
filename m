From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH V2 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Sun, 11 Oct 2015 16:43:25 +0100
Message-ID: <20151011154325.GK2278@lukather>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
 <1444577659-17621-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWJxWxNlJUNgDlXi"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:53487 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751456AbbJKPna (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2015 11:43:30 -0400
Content-Disposition: inline
In-Reply-To: <1444577659-17621-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@ch>


--pWJxWxNlJUNgDlXi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2015 at 05:34:19PM +0200, Jonas Gorski wrote:
> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
>=20
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Eric Anholt <eric@anholt.net>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Andrew Bresticker <abrestic@chromium.org>
> Acked-by: Baruch Siach <baruch@tkos.co.il>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Lee Jones <lee@kernel.org>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 14 ++------------
>  drivers/pinctrl/intel/pinctrl-cherryview.c    | 14 ++------------
>  drivers/pinctrl/intel/pinctrl-intel.c         | 14 ++------------
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++------------
>  drivers/pinctrl/nomadik/pinctrl-abx500.c      | 18 ++----------------
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c     | 22 ++--------------------
>  drivers/pinctrl/pinctrl-adi2.c                | 14 ++------------
>  drivers/pinctrl/pinctrl-as3722.c              | 14 ++------------
>  drivers/pinctrl/pinctrl-at91.c                | 26 ++-------------------=
-----
>  drivers/pinctrl/pinctrl-coh901.c              | 22 ++--------------------
>  drivers/pinctrl/pinctrl-digicolor.c           | 14 ++------------
>  drivers/pinctrl/pinctrl-pistachio.c           | 14 ++------------
>  drivers/pinctrl/pinctrl-rockchip.c            | 14 ++------------
>  drivers/pinctrl/pinctrl-st.c                  | 14 ++------------
>  drivers/pinctrl/pinctrl-xway.c                | 18 ++----------------
>  drivers/pinctrl/qcom/pinctrl-msm.c            | 16 ++--------------
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 14 ++------------
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       | 14 ++------------
>  drivers/pinctrl/samsung/pinctrl-samsung.c     | 14 ++------------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 14 ++------------

For sunxi,

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--pWJxWxNlJUNgDlXi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWGoOdAAoJEBx+YmzsjxAg44gP/j+xZ378Z/wwdpPlVIXZ33CJ
O8K7xJXbzmDupiw3FaY0hU8+XZ3MxC20xmfiFx782e56hIO9EDx8GN4Tqkv/cdBP
rFPBROrgmMy2h7Q5E7Q7D+d6jIiAl3mg7k7nbZHo++TSoZLTOcpyPFeOB5iZCHvA
pbTb+v+K4gEeWqMKbKzGFTlxhqeHhVlsmJoIT3PF2F2tlRfjKOd7Dw65e3gzc07p
tTdcWHNXOp3CBi022NUSpDLD2UdAUlaqHeqdXuiqvJyRZxsaV3nMfrO9rQqs+eC5
1y5UZPcRiZwBRttDWBTWCRopWl2ytf8OFnXChQLpZRCJnDodWFCuRJ7T2RzGpAQY
SJBbE+uLjdOCuFNoOTzb9LM2lxDYeAL1dP9EK7zlZ36HIU9/2O1WPEB5+Z8kg/H9
RuOz5Bx8ag5YwtmBpSMiBMPD09NdDarXUhOSYQmlle8c6Zm3lCsg7kCR1EnkDJ/8
1tw9kueuebnZIWvO26SuV8ZDjYR9B+KJZv05tesG6ytfPawIeO5Jr1p8msSx+wf9
oP/3bnvaLnCAOSV3pMfjdljbzOtMybgUrptrvzerCKH2IPD+ZsH/DpNb9fkK2K6K
u88kekiKVHSLhna7BKyvRdWcOHrLAXKPVT/55pBlTp328mQz7dWz4KQ5+H09Gpiu
ZaiBRoNXgr76zK4ZwQdt
=vCmB
-----END PGP SIGNATURE-----

--pWJxWxNlJUNgDlXi--
