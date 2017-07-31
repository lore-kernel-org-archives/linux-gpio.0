From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl: sirf: atlas7: Initialize GPIO offset
Date: Mon, 31 Jul 2017 12:58:10 +0200
Message-ID: <20170731105810.GI26667@ulmo>
References: <20170720170107.14612-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZOudaV4lSIjFTlHv"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35019 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751018AbdGaK6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 06:58:13 -0400
Received: by mail-wr0-f195.google.com with SMTP id c24so27686495wra.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 03:58:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170720170107.14612-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Barry Song <baohua@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--ZOudaV4lSIjFTlHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 07:01:07PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The GPIO offset is never initialized, which means that it will end up
> being zero as per the devm_kzalloc() of the parent structure.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> I have no idea how the driver could've ever worked for anything other
> than instances with a single bank, but maybe it did and I missed some
> detail.
>=20
>  drivers/pinctrl/sirf/pinctrl-atlas7.c | 1 +
>  1 file changed, 1 insertion(+)

Any comments on this one?

Thierry

>=20
> diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf=
/pinctrl-atlas7.c
> index 36b5c8d5471e..a2ca4a9472c7 100644
> --- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
> +++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
> @@ -6078,6 +6078,7 @@ static int atlas7_gpio_probe(struct platform_device=
 *pdev)
>  		bank =3D &a7gc->banks[idx];
>  		/* Set ctrl registers' base of this bank */
>  		bank->base =3D ATLAS7_GPIO_BASE(a7gc, idx);
> +		bank->gpio_offset =3D idx * NGPIO_OF_BANK;
> =20
>  		/* Get interrupt number from DTS */
>  		ret =3D of_irq_get(np, idx);
> --=20
> 2.13.3
>=20

--ZOudaV4lSIjFTlHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/DUIACgkQ3SOs138+
s6Ef0BAAiYgxtQo1T18sC+KRykzsa767AEqoIAWcnmAeMho1E0BZsiPUa5Vl8DEF
z+ihPMQ2KryojgiwCKGCq7z1uaGTf+YB8CRbj6C6B3CFM/7KHz3sO+WQk5NkwYM7
EGWLNZ/M+BX6/HDuSNVJE0y3BgrA3TsNNbjkiq3U9zHzd7aqts/hB/muWsbwRsp5
MCuXzfziszodPqac6MAlSlkqKKAJ/GaM4jzV7arx6ys0X7S6MTasMuOVzndvWmpP
dAD2BgTbpjkaKMOqs0Fu1CRXyyZcN1IK7OHrcYTBgr1hrYZY2Mlthm6gMJl3VrCL
rCO6c+sbebiY3x4YF0d1h3cXRX6nDimrbgo5XdGMCqeOqRWEeBglipeTO6+CDJXX
GVR5EOVNRRgQdDr6u5MipRNkmN93OGlvM2E9ZP0TPdDpK5osK85nGZdnsrue6t1i
07LpgAGzx6C+Ms6C49jvEsPU1F8kKwpyK/iKdjSC/tfZFvUQxcvoN75cK+ZJsMZs
hgemlw56dAsOh081OFf+A9wX92h4RJFY0IU5wMsZ6KnErobD77nrMeDAQaqx9X0M
TsR2a4SzrpdZgJnys5OkF3R5tXvLce4tuAWYBOmiwsUjKlINGINZkYN3qHwTvvc1
M4/0+TWQpecJB2Bt4b0ruJfCrXv+ckED/Y+AS5WzQ+pKes+8YXM=
=FAX3
-----END PGP SIGNATURE-----

--ZOudaV4lSIjFTlHv--
