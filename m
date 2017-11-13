From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH] pinctrl: Add some depends on HAS_IOMEM
Date: Mon, 13 Nov 2017 12:06:56 +0100
Message-ID: <20171113110655.sogbdto2v3fjjrch@earth>
References: <20171113100739.4354-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o5os2l2da26enotr"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36656 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751265AbdKMLG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 06:06:59 -0500
Content-Disposition: inline
In-Reply-To: <20171113100739.4354-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Phil Reid <preid@electromag.com.au>


--o5os2l2da26enotr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 13, 2017 at 11:07:39AM +0100, Linus Walleij wrote:
> Some compilation fallout from UM Linux (which does not have
> IOMEM) makes it necessary to depend on HAS_IOMEM for drivers
> that doesn't have other factors restricting their selection.
>=20
> Cc: Phil Reid <preid@electromag.com.au>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Reported-by: R. Daneel Olivaw <kbuild-all@01.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

>  drivers/pinctrl/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 92bf1a06162c..f5ca67caac41 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -98,6 +98,7 @@ config PINCTRL_AT91PIO4
> =20
>  config PINCTRL_AMD
>  	tristate "AMD GPIO pin control"
> +	depends on HAS_IOMEM
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select PINCONF
> @@ -201,6 +202,7 @@ config PINCTRL_RZA1
>  config PINCTRL_SINGLE
>  	tristate "One-register-per-pin type device tree based pinctrl driver"
>  	depends on OF
> +	depends on HAS_IOMEM
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
> --=20
> 2.13.6
>=20

--o5os2l2da26enotr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloJfMwACgkQ2O7X88g7
+poVhw//csZTbo4rb0UqmzfDV1bSvS2sTVIBZCQxNsiXOgNPlvZKhWC61D9kSK6W
d8o+suJaRjezsdaD6sRIql1fZJSwJvKFvMdFUpuOjrNsH6pjmVxFJ4Fq170NNT1p
deIDklBSQr6E6VxqgzbT8WhNtQSrnKEOM4uBp0siD/rN80bNB8HAnAfDF425xyfS
gPSMd0JhkZPezXaaEvAws4NSaw2hfUA69izIYzhm6REo/ETyO8mO+6TO5GZfGmgD
mTsczro3KWfYHqybx4Ho/1eQ/ZcJdW6gotx/7yRexJur1UvTWZyCcbR5XiS1U7Tt
+60yhW/bdOM3g6WquIWluh2bYeIOic8dhpKvTCCTm2elFgaGrNxwUS35cerNH59u
8Bsjk1bMBpuovkTmx3lBR9TnjQ7s6iaUCTkWXo7bta9fmb9h0JkeWgg7scWrvqCq
dqcDCjaFlv/RXhvo3gtbri90XtndHtUImid7QBF39wFlhAY3vcYC3F1fNt7IN2wF
zLPvTOFD83e5Let+xTHqQkalsYJ5wvzTsZGxeXsdGcO0whRRBcPgoNS+4lZxZUJC
zTKkjfqIg4k4N48GHHSqMeGrSuIhWq2jYOuoDKZFercDz0zdr7I+kAY6voyfFIvK
SMzRmw74cnINeDksaWMRp1PR4+l70Rld6doIo5XtZbVvdYi8XPc=
=Zf+Z
-----END PGP SIGNATURE-----

--o5os2l2da26enotr--
