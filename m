From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] pinctrl: ret needs to be an int for -ve return value
 from regmap_update_bits
Date: Mon, 12 Sep 2016 11:30:55 +0930
Message-ID: <1473645655.10397.44.camel@aj.id.au>
References: <20160911083625.7451-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-TVDIlhFdDAc9HvGckkqI"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36114 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755307AbcILCBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Sep 2016 22:01:03 -0400
In-Reply-To: <20160911083625.7451-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>


--=-TVDIlhFdDAc9HvGckkqI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-09-11 at 09:36 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Macro regmap_update_bits can return a -ve on an error value so ret
> needs to be an integer rather than a bool type.
>=20
> Fixes warning found by static analysis with cppcheck:
> [drivers/pinctrl/aspeed/pinctrl-aspeed.c:192]: (warning) Comparison of
> =C2=A0 a boolean expression with an integer other than 0 or 1.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin. Arnd independently discovered this bug and Joel and I
have CC'ed you on our responses there - the intent is to take Arnd's
patch.

Cheers,

Andrew

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index 7d461fc..75935ab 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -166,7 +166,7 @@ static bool aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> =C2=A0				bool enable, struct regmap *map)
> =C2=A0{
> =C2=A0	int i;
> -	bool ret;
> +	int ret;
> =C2=A0
> =C2=A0	ret =3D aspeed_sig_expr_eval(expr, enable, map);
> =C2=A0	if (ret)
--=-TVDIlhFdDAc9HvGckkqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX1gxXAAoJEJ0dnzgO5LT5nGwP+wYzb9TraKoWdldkR+5sY5bK
n2f/6rKUpiKlf282E4sF9ZGRmimWROGXXwRHmxRyn5n4wwu17f2ve56GpD74eOf9
2xuy9gCvDH2NMi0o3egM+WIlH6RHaX7u7MF5a8cRMB1KiNJUgLKsKBuSbiDwEbOQ
gaENyQpnoXMaClQkp4IkkGQILEsLSKYx0ejtsDVz0v/kCi3ECuKRlUi/Bza+3xh2
k2FYghQPEFQvmbUsqK71BiYEEBF/C0uB05UOXF9AZE9tQLlnjemzHidBJpaiBWlT
1Chhz8l0WJAMjEL77mxHDMBl3ZgsMVK76fPw/5f4OWJD9Kq2bnKpvpMJPEtC7L9w
wI2Z+5XAUGmF0mLGeh1zq9IjYeiMk+xQpWwyncsfjuHgkBM6iCKclrzL5quxVc9r
wcl+rtnS8mbVBui7fGVEK0T/YukV6ch7qaWnCzpWPa31n02BEi87pXih8kUE4j3m
W3BRhyeCpfBzoE9UsRGXq8lvA1CO6tRDYqfwX5toyXQT6Mxc/yKZarFtCP8C4TRd
yCp9it/JsiJFRlEvXZxGR+hlQbc1/BCM/lFNENjYCnbAOuhxHGOFKUNSXKpSp8YY
KOaw7EsVTTtV8UA4UxPHmqk+aYsVKvjSzlNw6P+qGLgpHxKhr0iiQFYCjSsjwy6s
OfQOQQ8XLHXwpWpkY2oU
=GoYT
-----END PGP SIGNATURE-----

--=-TVDIlhFdDAc9HvGckkqI--

