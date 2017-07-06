From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: add support of R40 to A10 pinctrl
 driver
Date: Thu, 6 Jul 2017 22:50:30 +0200
Message-ID: <20170706205030.e6wzn5n7ix3443cl@flea>
References: <20170706142822.20296-1-icenowy@aosc.io>
 <20170706142822.20296-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mbdzrfndsd5tl2um"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170706142822.20296-3-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: linux-gpio@vger.kernel.org


--mbdzrfndsd5tl2um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2017 at 10:28:22PM +0800, Icenowy Zheng wrote:
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "i2c0")),		/* SCK */
> +		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> +		  SUNXI_FUNCTION_VARIANT(0x3,
> +					 "pll_lock_dbg",
> +					 PINCTRL_SUN8I_R40)),

You have a number of lines where the wrapping is not consistent with
the rest, such as this one, but also...

>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 20),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "i2c2")),		/* SCK */
> +		  SUNXI_FUNCTION(0x2, "i2c2"),		/* SCK */
> +		  SUNXI_FUNCTION_VARIANT(0x4,
> +					 "pwm",		/* PWM4 */
> +					 PINCTRL_SUN8I_R40)),

=2E.. this one for example. Please fix this.

Looks good otherwise.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mbdzrfndsd5tl2um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZXqKWAAoJEBx+YmzsjxAgVj8P/REFGwfOS8uG83jPpk1Hvgv8
q1rURNZv0ZCdAn69lkbzF85aML3mQTMmi3zEKx1MNInLUFPc2JeYJckzyTt0DBp0
wlktGfMscNKCcQCAUvUnevc19hwwQXAmVpstDuHHH/mqizx7U++mOEQONDGmOEXi
zQdQC5vSOeKWYd+HHA9tBhR3dDnGK/7y3nfAL676HtoQ0x/Ved95DgWoWitSZSh0
QIo7Jy5RhSHEoWDajrfLhskt+vBqXY4S/uxcmGRsRi1UNPTDwG3GDOuLGrlFWI1h
pm79Cdy+NEyIuUi1p5dLpG2P7+OyP83/SPIbEGr3Rby3kRezb50M/EEYkiVBHvqq
KLVBsx0TRNyiCU//KLF5JsC0u8g+tkzL33UjnFavAlm0/QVeR9b5aOu9RclNPNUf
iHjKMnVy9zIGmP75aeKXSHWm/S/m+cPu9cef2aZjWIbD+Zy9C8EJFmqpFiGgTKYt
b+wAMORe03QjdLLVFwcZgJJE0/NAsQNXf/2TpU7HyFzGUsHAtvzuy0XFcSBPMNkY
8RxiGq1oPMJ8FCHlRSfK7WhgkXx01IXa6XeKm+nlJpH+rujE7WEm7HaF7RaiHnO1
kSrE7kJ4rvPxPvdXOgzLtemsKTKn+SOcCou+7pGKZPx5q7qIYaMyEd8CLFKJTTMB
yi8rqLARZn20tpwwJCan
=sJhe
-----END PGP SIGNATURE-----

--mbdzrfndsd5tl2um--
