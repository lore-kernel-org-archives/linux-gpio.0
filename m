From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: add support of R40 to A10 pinctrl
 driver
Date: Fri, 7 Jul 2017 11:18:38 +0200
Message-ID: <20170707091838.64phmj2p5qvn3dxc@flea>
References: <20170706142822.20296-1-icenowy@aosc.io>
 <20170706142822.20296-3-icenowy@aosc.io>
 <20170706205030.e6wzn5n7ix3443cl@flea>
 <72337BAD-680C-46BC-8DF5-645028E08F65@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ksml2aqpdco54r6c"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46489 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750882AbdGGJUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jul 2017 05:20:03 -0400
Content-Disposition: inline
In-Reply-To: <72337BAD-680C-46BC-8DF5-645028E08F65@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com


--ksml2aqpdco54r6c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2017 at 07:13:30AM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B47=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=884=
:50:30, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=B0:
> >On Thu, Jul 06, 2017 at 10:28:22PM +0800, Icenowy Zheng wrote:
> >>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
> >>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >> -		  SUNXI_FUNCTION(0x2, "i2c0")),		/* SCK */
> >> +		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> >> +		  SUNXI_FUNCTION_VARIANT(0x3,
> >> +					 "pll_lock_dbg",
> >> +					 PINCTRL_SUN8I_R40)),
> >
> >You have a number of lines where the wrapping is not consistent with
> >the rest, such as this one, but also...
>=20
> I think this one is because of extraordinary function name.

Since you don't have a comment, I guess that's not really that bad.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ksml2aqpdco54r6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZX1HuAAoJEBx+YmzsjxAgRSkP/3Uv8ot0V2Bl+4ee3ti1xxEL
RujkiAMkYALJMMIkbYmr9mxNzh4bEVOPBMO40VYHC7UzZB8db9U/yPm15lROiOwK
TtVkVJhwnIXK8qm6row+bk+Aa4JLLEyamM46VzQJO2Du7ymcibhd5d/eiL9FpugC
S8IWUhwblZayKD5yu7D0nYaYDq35HqZMbzYFSToyQu5O/7VpknR7jOut3QlEbMFx
bWWyiwYCNdITY0jCTfXjnIzRrvzmaCT3VeZka59j9auqEqCn67cpZC8XSV3gAYJi
K3Fmr+O70dMUYI4kbw0s9F0YSj0E3xuRGZ2isTGPqRu+BSk8x+G/uFdfLB7DeBa/
AAo6FyPV3SGwdCmnSCzc4r1nrWybV1RU7mqYasGvfS6LCaBUmpAdD6oOJXFIaAW1
GxdzRc55Ku9ERt6TLa4AdvF6pQxsHUoMr2KQXiivJdOpgvbXncMB3F9TrxZ86AXf
dIkCROQ7HPKgbBusv7GjiiOk+jVyeoLhY9HWVBZJNDrc/KCfZDdw1L11hb9HNE81
v+zHiG+MWItPC/bN45TrXEahk0QvkLyj8by+nsZCSzWOfUzmneT+6zCCXffDrCmn
EBN7bxFzZoChftBE9hMEGxjl91jrU2wpEP8D5y/vkqUwYoJ8QPhu61j31lzGnuNn
ByPohibYGgi5aIT0BnAf
=tjHm
-----END PGP SIGNATURE-----

--ksml2aqpdco54r6c--
