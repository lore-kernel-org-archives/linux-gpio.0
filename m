From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 08/50] pinctrl: berlin: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 18:28:59 +0100
Message-ID: <20160224172859.GB29884@kwain>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-9-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456319775-3216-9-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 24, 2016 at 06:45:33PM +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Thanks!

Antoine

> Cc: Antoine T=E9nart <antoine.tenart@free-electrons.com>
> ---
>  drivers/pinctrl/berlin/berlin.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/ber=
lin.c
> index 46f2b48..2d58166 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -316,7 +316,8 @@ int berlin_pinctrl_probe_regmap(struct platform_devic=
e *pdev,
>  		return ret;
>  	}
> =20
> -	pctrl->pctrl_dev =3D pinctrl_register(&berlin_pctrl_desc, dev, pctrl);
> +	pctrl->pctrl_dev =3D devm_pinctrl_register(dev, &berlin_pctrl_desc,
> +						 pctrl);
>  	if (IS_ERR(pctrl->pctrl_dev)) {
>  		dev_err(dev, "failed to register pinctrl driver\n");
>  		return PTR_ERR(pctrl->pctrl_dev);
> --=20
> 2.1.4
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWzehaAAoJEFxNi8it27zY3V4P/RZ7qUr8oK3EvmxiizjGiksH
MdjLhBLPLeP7PplCBwajMTEeYasX9CSKG1Wvyke2bgv8jnrkY6fIEiTEb4jtH3b0
4CfsAOmZq5BpaByajrkxhBbqCReXe+Fq1wjm73ZvkeZ7po9d9yWduvAdm7vXDxPx
xwW0cAd6KXRTNk6aBCdF9Y7b6gt0IGY4ue2pyXULTYzG/s60u1rJ2Q/R8k1hvgiY
/nwBJoM60bmoITykGPjdxCnLu0PeJzaYDId4zOcLHZSpWsdFKCnrsdTlMHCpDu1/
zDLUduZVjt/8IvsfcBN5PMTGjbUeC1girEb3Ppzsru81r559BMNjGtJ6ix+iv6XC
hfduzz3M8VKDLCaPZC50LY4vUUl6LLOsdbUlHUKX/L8twO4YQIZqtjZNWZzVOdbK
ZAcaJ2DRz79Z337mWsb1UIscSCU5yTEKwzDAak0DUGQ5wT+elpctB+ZURxisI/8t
rJQdM6gnjX3Qp1jowW8o/nsXcr1+3s0A/MquzW/IKMezTHnbWS2s2OBTXLlF+S2T
d31b04JBXSRjY2JMsW1xSnTVRqLsJrQXSC7x3Kpm1YYlS6HpaLvbHuTTltSte+UJ
OAu63k9dJc4hcUQqyvGn3Y48ghMNjHd100mYLgZaaf5mYE/pff0FnbS5+5trJGOD
Em5P68t9nyHe5aQrvXxM
=4P7N
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
