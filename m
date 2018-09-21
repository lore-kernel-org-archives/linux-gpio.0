From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH -next] pinctrl: sunxi: fix 'pctrl->functions' allocation
 in sunxi_pinctrl_build_state
Date: Fri, 21 Sep 2018 15:43:16 +0200
Message-ID: <20180921134316.io4isy7fgewjkcrv@flea>
References: <20180921015941.28468-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d5kfno5n4ibzgult"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921015941.28468-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: wens@csie.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--d5kfno5n4ibzgult
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 09:59:41AM +0800, YueHaibing wrote:
> fixes following Smatch static check warning:
>=20
>  ./drivers/pinctrl/sunxi/pinctrl-sunxi.c:1112 sunxi_pinctrl_build_state()
>  warn: passing devm_ allocated variable to kfree. 'pctrl->functions'
>=20
> As we will be calling krealloc() on pointer 'pctrl->functions', which mea=
ns
> kfree() will be called in there, devm_kzalloc() shouldn't be used with
> the allocation in the first place.  Fix the warning by calling kcalloc()
> and managing the free procedure in error path on our own.
>=20
> Fixes: 0e37f88d9ad8 ("ARM: sunxi: Add pinctrl driver for Allwinner SoCs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--d5kfno5n4ibzgult
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluk9XMACgkQ0rTAlCFN
r3QlYA//at/S51iemKySABdUNfmxAbP4GxYkIoBSEDPggtdtuM37fmjb/riNLLM6
s4WUoitJVaTTTwpRVPLtrLYrFoB/ExGKqqrFhHV6VuXLScgjgHgK6aKqaxJMCXIb
BxOTWbkQdKDmr4URa2Sv9ixIziIWtJub/pn2KJGkS4ohO9GUEy8oZLqdt9JuvYa4
JjhzjmRUAzdQUdnAFXjR8Qys3oQqqI0I6yIO81ZQqBNHAsC18xnvR6BhD4wIZewj
NXUr8uc6BfPcxQZvJa51UikSpFkBm7NpuAKATcbgLJ43q2oYUzCCLCysetV4I4EG
XpgGfhdWagQBYFKLxv2ny7qL17jcyIaZzfmf6PkWMVclA653ppnDOp9y5RyTsJln
OlwlWy2RGI7FV9YSCIh2ZyqC/N7t0izqYSFw2ehzU+YVYtfQhy6Rytx1Fr5ezE3u
euEKlZVcNaqOubgD4M++rQPpm78cRxG8ZzMh07nUP8oSbEzXjV02tknnh1GA77qB
i+azXJ1hlOc0KjZppxwzPKn/jAc/nlWTsbnexST5qXmK3pmmUcyW8E8xjnnevdjC
6nQBk17l21UhvL7h09WduAsgbBP9i8qLKbLiAoTqwNLWs1jsCq0zaH42Y6YbEpnK
lnmv5rJI62l9EXwplP6zmr7jxiTsBMQrn0hReZRIS8c904qsU1U=
=9tKN
-----END PGP SIGNATURE-----

--d5kfno5n4ibzgult--
