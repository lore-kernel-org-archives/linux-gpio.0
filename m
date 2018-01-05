From: Alban <albeu@free.fr>
Subject: Re: [PATCH -next] gpio: ath79: Fix potential NULL dereference in
 ath79_gpio_probe()
Date: Fri, 5 Jan 2018 15:06:38 +0100
Message-ID: <20180105150638.2e483d0d@tock>
References: <1515047483-168600-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YpmcGkF=0q7WgTmM4ggtPo."; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:39184 "EHLO smtp2-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751254AbeAEOGx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jan 2018 09:06:53 -0500
In-Reply-To: <1515047483-168600-1-git-send-email-weiyongjun1@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Aban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

--Sig_/YpmcGkF=0q7WgTmM4ggtPo.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Jan 2018 06:31:23 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> platform_get_resource() may return NULL, add proper
> check to avoid potential NULL dereferencing.
>=20
> This is detected by Coccinelle semantic patch.
>=20
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
>=20
> res =3D platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when !=3D res =3D=3D NULL
> e =3D devm_ioremap(e1, res->start, e2);
>=20
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-ath79.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index a757171..0bebcba 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -258,6 +258,8 @@ static int ath79_gpio_probe(struct platform_device *p=
dev)
>  	}
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
>  	ctrl->base =3D devm_ioremap(&pdev->dev, res->start, resource_size(res));
>  	if (!ctrl->base)
>  		return -ENOMEM;

This fix is needed, however this patch is not against the current
version. The current version use res in a call to devm_ioremap_nocache()
and not devm_ioremap().

Alban

--Sig_/YpmcGkF=0q7WgTmM4ggtPo.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaT4ZuAAoJEHSUmkuduC28p2IQAMaSyYbCz+aM0MVre5rFRBcW
h4sBuz1V59S3W+zKG+HdfDBhsmzf7o1PGHeA6pvvWni/EkptjsLe/frfMw1FvQ/6
uxgrFIt+vwgVNvzgKNgZetl3FMcbbZ79TwtaucfZS3cFtdvJxNhe4qJcnOEaWmwd
nPeg0qJWLzrpFkUSB0i257OH2bh0BhWiaVZgvNYeiPpCmyfLAKQP7mwLPJ6QoguK
rDU6tT5f3W1O45eCy3zZ5TFDNP32Yj+sIHRTMVB4wKv1EFG3j5B6e4+SpRjExbM6
kBE2Xw3RHLUfCTeAJ8zeb6le3Hqo0111YQCv53ARKyluJe44Pr9vqdQ/8AqNhzLb
XadDYg9kdJg2ql2ue7ifS/48MfCji83GdYWwXXSBYli1Pz4KDq/IxRzP9uUcV1Uu
6RuUaZ0NWmKnKvZeziO2ypgN5dma4JyLkN/QNuLQXXkG1BYmyBj3GpANLhO7L8Dd
q2vBsnOHDdbrEVvZN9ucuiLi5KJpgeew9XgD6BoJhJcGhogMIEVMvhM0dhahDnSE
mba/mRBuZN2ml0TEH6RbPxf3XQ33ocqzKEwooknBrlZ9y7wFmTbQ17X215YX44T+
PXouCulraoQHuJhTgDAg1PGgIpH7n1/jFv58lp5BvJ2as1yDge91CEeMz2RRpTdB
2l4WYRA7hgpXVP9Ihgrd
=n4hm
-----END PGP SIGNATURE-----

--Sig_/YpmcGkF=0q7WgTmM4ggtPo.--
