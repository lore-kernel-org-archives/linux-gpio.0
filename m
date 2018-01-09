From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RESEND PATCH] ARM: pinctrl: sunxi-pinctrl: fix pin funtion can
 not be match correctly.
Date: Tue, 9 Jan 2018 12:02:04 +0100
Message-ID: <20180109110204.w6264q4xrullng6y@flea>
References: <20180109055902.GA1306@arx-s1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zt6oj6macksa24w5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180109055902.GA1306@arx-s1>
Sender: linux-kernel-owner@vger.kernel.org
To: hao_zhang <hao5781286@gmail.com>
Cc: wens@csie.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--zt6oj6macksa24w5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2018 at 01:59:02PM +0800, hao_zhang wrote:
> Pin function can not be match correctly when SUNXI_PIN describe with
> mutiple variant and same function.
>=20
> such as:
> on pinctrl-sun4i-a10.c
>=20
> SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
> 		SUNXI_FUNCTION(0x0, "gpio_in"),
> 		SUNXI_FUNCTION(0x1, "gpio_out"),
> 		SUNXI_FUNCTION_VARIANT(0x2, "pwm",    /* PWM0 */
> 			PINCTRL_SUN4I_A10 |
> 			PINCTRL_SUN7I_A20),
> 		SUNXI_FUNCTION_VARIANT(0x3, "pwm",    /* PWM0 */
> 			PINCTRL_SUN8I_R40)),
>=20
> it would always match to the first variant function
> (PINCTRL_SUN4I_A10, PINCTRL_SUN7I_A20)
>=20
> so we should add variant compare on it.
>=20
> Regards
> Hao
>=20
> Signed-off-by: hao_zhang <hao5781286@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zt6oj6macksa24w5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpUoSsACgkQ0rTAlCFN
r3T38A//S7ANLCx3BX85xf+yaK5+2JpquizB0vQNiF2cNU/22dzfRoISyalXd49s
0gmbRR+pUCkVl9TbGoVEV0dY6Kyn51Mlu+XkeXACd+TbUGJr3B6ovk3dt5MIUXld
0TeiSiMUqKY/IsW4iMYNO8jD/sPzmwzxB697Oelo4VjiyAnqR8LEhba+iFQoiefM
ptfU1oKEi8t6OChdeqe1Y4CLzmbHjqVfvZ5GbYvDTX2G4P2RqqwijCBvN4P7wyXQ
F4Cpbf3PyFAVsl9dxUgPXoT5E1smrbh77a37MARLh0ug+bgV4KE0/jEhOoUiOtwp
JE8XvOs4P9Sx9zjCLkuJtd8GIchgt5Tc72XzxHXxNXSIfkvvl6be/V97TK1MISJL
HrIy5XKqL5aIxxv/3+hila86pv9WLCukAGziZEryHCUBPf+xY9XwiqMi1kfh7ydd
j7DclEYve1rPSXLeGLWS42WHYpgYhPw0kdv2WqKK/wg8/pdH1ti7NnTjULGxi1C5
wlE9DXLO/08Lg6jL+4B16Y3GTtxC6xcWSEBYwzev6UGjeXOA1hH9O9jIdGbLHJ2D
GH9VbClxfZgzSotPk59ve/9c/304XczRFofYIpBpPA+ilkD2ATVote9N0CS8Qu0l
o07r9/1JrK+zS/rJNIkPEp3zL9NQKEAOU2a4zqREsG1fQ1kkHLo=
=+ljV
-----END PGP SIGNATURE-----

--zt6oj6macksa24w5--
