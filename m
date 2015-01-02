From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 2/2] gpio: tz1090-pdc: Use resource_size to fix off-by-one
 resource size calculation
Date: Fri, 2 Jan 2015 10:25:22 +0000
Message-ID: <54A67212.8060105@imgtec.com>
References: <1419746439.4496.1.camel@phoenix> <1419746510.4496.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="HJlg7pxrMKUqmNjFt10DagwHP9uWRNQjT"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:14200 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750761AbbABKZd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jan 2015 05:25:33 -0500
In-Reply-To: <1419746510.4496.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-metag <linux-metag@vger.kernel.org>

--HJlg7pxrMKUqmNjFt10DagwHP9uWRNQjT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/12/14 06:01, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Thanks, both patches
Acked-by: James Hogan <james.hogan@imgtec.com>

Note that the previous off-by-one behaviour should be harmless since the
SoC IO memory region is unmapped on Meta (i.e. the ioremap becomes a
no-op as the whole of IO memory is accessible with normal memory
accesses regardless of MMU).

Cheers
James

> ---
>  drivers/gpio/gpio-tz1090-pdc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-=
pdc.c
> index d753622..ede7e40 100644
> --- a/drivers/gpio/gpio-tz1090-pdc.c
> +++ b/drivers/gpio/gpio-tz1090-pdc.c
> @@ -190,7 +190,7 @@ static int tz1090_pdc_gpio_probe(struct platform_de=
vice *pdev)
> =20
>  	/* Ioremap the registers */
>  	priv->reg =3D devm_ioremap(&pdev->dev, res_regs->start,
> -				 res_regs->end - res_regs->start);
> +				 resource_size(res_regs));
>  	if (!priv->reg) {
>  		dev_err(&pdev->dev, "unable to ioremap registers\n");
>  		return -ENOMEM;
>=20


--HJlg7pxrMKUqmNjFt10DagwHP9uWRNQjT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUpnIZAAoJEGwLaZPeOHZ653kP/3E9XwTTmkTC77kTrOxCKzS5
0/m9pR1MLFQZQIXqN9EWJTH8Y8nA8XOPyAoJ82uAzkUizYmmvWda2st6CLJ/nlfd
UYXfFdK1ClzDEhi7QjzG49xmWI59rTy69ch4B8NhH/mmgGpf9ef/ucnVT6m7IYd1
oSY7JIDHaJ2FfTVmN/7dPrlv0AFLdI7j1DpsD/deqE+FXAVQPz/hDUnGJRvj/1hv
W4YqHXovJaFE/AgqL28b0GtUIt9EMaY1GNbNPWAVmGM08b+UMU/TRiuEeBtNfSck
J3MM0XfwomOp42AMfHEeqqI14woo2MK+5GdW2cgzjpBerWo2GyD5l8vdQjcj0qid
1KQ1EREtOGyNEslzOB1qi3agWuhFAjx5Zm6tIFvR2Rm/+z+XEa2SxSoyo4ovD76h
RavXWfmA2rHqNrM0cG9ZmSl1LeleD6UCSwxPprd6CX1k1hzHFcKWweRWrBRXW8Xa
xCluogE98ry9VRFUnB07lL5UEXZmEGl4LxRuxQuW1ZWhS4DJz/5tvTBprpyoBvKf
0wGiTIaPRDjzh5+vX0/5fUBVLr9G4qhJN8Uf189aNhK+K+YUqCkQYIt+klaCNEHP
sZGzO6mwbz1pMprxcu99LadGr5zWdQZgzaH9sf3w/kv4NMmR7SeIEde1/AJSWMd1
ChltYH7g6BIF2QrH/iKm
=xKIG
-----END PGP SIGNATURE-----

--HJlg7pxrMKUqmNjFt10DagwHP9uWRNQjT--
