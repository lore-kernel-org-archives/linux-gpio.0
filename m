From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] pinctrl: sunxi: always look for apb block
Date: Thu, 1 Mar 2018 12:48:55 +0100
Message-ID: <20180301114855.s7rbk7wiealepqrf@flea>
References: <20180301113701.8888-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8754765491118089066=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180301113701.8888-1-andre.przywara@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--===============8754765491118089066==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w6qndh7wixfslq6r"
Content-Disposition: inline


--w6qndh7wixfslq6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 01, 2018 at 11:37:01AM +0000, Andre Przywara wrote:
> The Allwinner pinctrl device tree binding suggests that a clock named
> "apb" would drive the pin controller IP. However (for legacy reasons) we
> rely on this clock actually being the first clock defined.
> Since named clocks can be in any order, let's explicitly check for a
> clock called "apb" first, then revert to using the first (and only!)
> clock to keep compatibility with older DTs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 4b6cb25bc796..897ba13e6a03 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1360,10 +1360,21 @@ int sunxi_pinctrl_init_with_variant(struct platfo=
rm_device *pdev,
>  			goto gpiochip_error;
>  	}
> =20
> -	clk =3D devm_clk_get(&pdev->dev, NULL);
> +	clk =3D devm_clk_get(&pdev->dev, "apb");
>  	if (IS_ERR(clk)) {
> -		ret =3D PTR_ERR(clk);
> -		goto gpiochip_error;
> +		/*
> +		 * If no "apb" clock can be found, try the first one, which
> +		 * must be the only one defined.
> +		 */
> +		if (PTR_ERR(clk) =3D=3D -ENOENT &&
> +		    of_count_phandle_with_args(node, "clocks",
> +					       "#clock-cells") =3D=3D 1)
> +			clk =3D devm_clk_get(&pdev->dev, NULL);
> +
> +		if (IS_ERR(clk)) {
> +			ret =3D PTR_ERR(clk);
> +			goto gpiochip_error;
> +		}

I guess this can be made slightly less convoluted using something like

ret =3D of_count_phandle_with_args(node, "clocks", "#clock-cells");
clk =3D devm_clk_get(&pdev->dev, ret =3D=3D 1 ? NULL : "apb");

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--w6qndh7wixfslq6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqX6KYACgkQ0rTAlCFN
r3QSuRAAkylTcJyvrSOlMKadbPFIr8ey+Ox9lFbTA+DUPIhSYfJkYnc8BviJP9uD
a4e8S4TZxd46lSn+po8toHbMVS0+uaDR8ld7kTh/q74rMEWNU+BkyvF8ofI2rjJR
lQ7qNREriLLalQ90gkgTc8kY0C5TuuqffAH4kS9GajnqEWYURXDtgQRW3tl7UzhT
GrtCVuWoNJ9PqPOsQbQGq84al0WRFkO3UByphlOWXI4i2kL780/NAsTm1m1nXXxg
iSBY9uQJXmvbAuh7GEFxh5A6UYbYAcjxJZg9y5F4iLJxH0R48ja4/pQjzAQoZCR0
BJF06OwBS8mqG15QMJFqO8W/zQjH/Ml1/fK1Ps/yPhjRC+0vEfLf6Y3XvD286Pqg
blk2rDB//kBEk0vWkqz9TFSPCSrE2pCtuLD6X75KpurCL4Fwoi3P0nsDUcA6aqrW
JolsTt3SHaQAsYHQ0bJMAkmPnpJ25aD/KGCEYhEVYzWzueejzoWRTLlBHln45tM+
WFfO787JEDeFdvSz2YB1582xi31As5wyRQPABb3zGTQ11T8A6KdDb56e7h7flJto
4SMgCCleoEfa0NbJcHwO7/LNv7zrPKiQhvEa80CmhOHW98UgZmlqumn2+aWbJqX8
LZLXzkhKNJynzqHEuzbnAA88+vbUHbwuoL+82g5RWFSlKwdg9mE=
=iKQO
-----END PGP SIGNATURE-----

--w6qndh7wixfslq6r--


--===============8754765491118089066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8754765491118089066==--
