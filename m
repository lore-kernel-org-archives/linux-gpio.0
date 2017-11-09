From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: Fix undefined lock_dep_class
Date: Thu, 9 Nov 2017 11:06:33 +0100
Message-ID: <20171109100633.GB20678@ulmo>
References: <20171108204236.4493-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5934 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752920AbdKIKGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2017 05:06:38 -0500
In-Reply-To: <20171108204236.4493-1-linus.walleij@linaro.org>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 09:42:36PM +0100, Linus Walleij wrote:
> The struct is wrong, this is named lock_class_key.
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 961b5da38bb9..86dcd02cf602 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1940,7 +1940,7 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
>  #else /* CONFIG_GPIOLIB_IRQCHIP */
> =20
>  static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
> -				       struct lock_dep_class *lock_key)
> +				       struct lock_class_key *key)
>  {
>  	return 0;
>  }

Reviewed-by: Thierry Reding <treding@nvidia.com>

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloEKKkACgkQ3SOs138+
s6GJ/xAAkLIVTL9XGGPYerzM3lUQDt1GN6VfgqAOGaXIimvPBgnKPmOoM8rbQ3Ri
gjEAqbFFuketoT9DRqvxcfydn7kdPpqAm/Cf40+8LlxwCzrNEM4Or9Cb4+HjXJeZ
3rJpQLgkxzMUO1kzLJsuWCNK1zz8CcbIUpsm5Zm2Rmx1FknzgWJWAUI6W2t7qwSd
DViTP7sI8pfrp6PpNm0UQVJQSahjZ1HQd5DMOhbYOo6hTtDPQeqehaaERnH3/Hp9
kEnw7VhsX67evm7rHWBnBvppWpXxryBQpd5fkwrhVKPJpS+YhiSJT/IpRwc2vxpc
uz5ZG7SYp/eDBLTpwnZ478LeBT0ZNZ8flzHlnfxoWoQbmrHrhQjQkQ+DjUm7eL8y
RItobZUdRQX+YtPt73IOjT9T1FS8pu66hGHD9zNB66yNyM95xCGuDdLo1xcoZOYb
cfBANSn1yntcwgLjHHxvukuzEEAydX3nHEb/cnapf9MqYVZWn9hKEcsBicpbfutK
7Sr5d9feSOkYiaO6eNP4DaBxaBM0HPBGRuXw5l1tg+pe4brfnEjKHUKrHz9NxqVy
oB2H8hDdA519JXdBcxR3CKXFpqKjdYiobSKxHaFr/IaoqLpDlACQWpYl4qZhJWpw
esRJt6QcFApq9J0hE2frHLXD21gaD2nAkCoodtHwmHZ2j1RjRqM=
=Y8fP
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
