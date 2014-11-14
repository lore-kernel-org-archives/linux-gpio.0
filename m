From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] gpio-tz1090: fix error handling of irq_of_parse_and_map
Date: Fri, 14 Nov 2014 23:53:07 +0000
Message-ID: <20141114235307.GF1739@jhogan-linux.le.imgtec.org>
References: <20141114213256.GA24709@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:56415 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754111AbaKNXxK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Nov 2014 18:53:10 -0500
Content-Disposition: inline
In-Reply-To: <20141114213256.GA24709@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dtor@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 01:32:56PM -0800, Dmitry Torokhov wrote:
> irq_of_parse_and_map() returns 0 on error, so testing for negative
> result never works.
>=20
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>

Good catch, thanks!

Acked-by: James Hogan <james.hogan@imgtec.com>

A quick coccinelle script shows up numerous other cases of this error
around the kernel tree too...

Cheers
James

> ---
>=20
> Not tested, found by casual inspection of the code.
>=20
>  drivers/gpio/gpio-tz1090.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
> index 9e90177..e3024bb 100644
> --- a/drivers/gpio/gpio-tz1090.c
> +++ b/drivers/gpio/gpio-tz1090.c
> @@ -446,7 +446,7 @@ static int tz1090_gpio_bank_probe(struct tz1090_gpio_=
bank_info *info)
>  	bank->irq =3D irq_of_parse_and_map(np, 0);
> =20
>  	/* The interrupt is optional (it may be used by another core on chip) */
> -	if (bank->irq < 0) {
> +	if (!bank->irq) {
>  		dev_info(dev, "IRQ not provided for bank %u, IRQs disabled\n",
>  			 info->index);
>  		return 0;
> --=20
> 2.1.0.rc2.206.gedb03e5
>=20
>=20
> --=20
> Dmitry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUZpXjAAoJEGwLaZPeOHZ6bioQAJRIcyp/sgP0oL3+o+aRU+cj
yspDcDnZTDu1N6GXPLIRH11HLQ7bdxCiGiCTvEqZt2BWFd6I97l5XkcGmYr6Q7KB
RUg3y8tVXwWk8VG6x+TGN0jltRTUQ8GfhdjGiu19CLQ8gNVLvZzx0eiTdqDf0f+y
X1iGGZwDQghtWAbgT8Fr/VIW4XRexdDCIQylIQnfbKQ9RBnio5Hp7CUG9OPDItfK
tagdMnQkLEp1wEQqLQLTo6hp17df33JyJtSvxLXO/wIWCaB5zjemQQder79k5Vob
Eb5mYsEqSbKWnPs5cBEQGneI7TbV847vONjQclQblysZhxtcoTWT5Qd+3edaReKf
UMA0JrPyWQw+1KdifspRhCVPV8791IsVyB63juIZ6WNzaosxNK9zYlPox9kPPa/B
96YmVo2N8EV68rUureArGIAPufsrucuM8Rlp92RuN8IQYsuWapFIyIlBUIhB1qUn
nWGDheyfNYukgntcbGCzAf298jGkvJEVhB60znnMB06Hb7aOT3The24ALgZ17IjP
6/+UuU+jg2JxNSaZozXuJYPXhfG+9qdO1mErXSkEzgPF501jMpWU1h6i3HlaTAJg
1SO9cw69ipUsmnIzo1rRDNaG40WJPTsYcjwJ/WTpqbTfXSbMtmFHxSTOf//4zOf0
5V3m4BZKSa7GwS6dX1H+
=ywUA
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
