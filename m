Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943611;
	b=E1LmbbfYlTJmwmFVlY5jDt8C4JZeaLT53VOJ5rZ5c2jy5Miw1nGvJTKV6yLQ3HG7eLq+
	 CbwMR0yInVlfId4e6aSooEdaXQI4IpEZ6l8zpYVvTZRLO6kuzy3kBi/g0qyFMG7K9K3L/
	 Jd2fMWhOajxEbEUqCXPX0PTpTwMWVm1o8OXxOB99elREC5j2l7Zj5B29CxDg5TJFIHGai
	 iRlLTfKR+xKVXio9kP91ZfAJWyu+MVlUKKp9oogK/n65ZzNyA9oqr020xiv9RImI/A3ts
	 XhVVS2JKMBGSU6I6q4AjrSCm0dZ+i8gYfmXd9rwCkSB7RZs2sRdsyT3oHjSjpeipp7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943611;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:X-Debian-User;
	bh=u88fbpQRWU0gi5f9B6H4Dl7cSbrdFLw+0yIC+/vimvA=;
	b=oOS+vcArJg0q8CE2sAO7l+EP+O4p7yBqnLvgZxJ7YPiKuKB4LdPSddA9yK0tDm+jq+4v
	 4cYMtKGO4ph9crM/ADIOoK9twqqNPh3G2Y3YathdQVmrPjg22lDxtxnBuMEbewG/ee07s
	 ofTkmdq9kkLbakYcAJZ+frVVD/HvqhYudgyJ86KNzQ9PXr+caI6f4Vr63ZqH7uIWpu7r4
	 LnX5Rz6uoI4+e9e9gdPTsIMD6iQkKmNcn/l5k4m8XzCz2OOKCnyK9AztPhXp5mGqqAv/x
	 YrQTEUGaw9DSunmEw11P8QA8BhlIJodLmNscGlL/cAPCBKZ2xDjm55IdxQcUPC4FNwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=YQE4kacW;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C07606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 15:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=YQE4kacW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:In-Reply-To:References:Cc
	:To:From:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u88fbpQRWU0gi5f9B6H4Dl7cSbrdFLw+0yIC+/vimvA=; b=YQE4kacWeaU82xmvhLcv/SyTip
	XQKtm6TQkPbnM6jXpCzOs/rLyblbwXX/CSV+CDMaocrJgcFs+gAH818N5A29Mk+lMChVvJ/rCYev9
	AgBTleKYkZu+m7pZmlkc2ogvAbaxeZYNQVXJ8SyIiqj8Ev5Uw5KsJ2efVXHqkK9muhJxL0F5x5SI9
	crvDkgbXK/qoCdeKVCYwOWTERcWWYiZk48edQEocLSnCWWir9/RB5w+qzd3KmO47IA3yV5M7lqvPA
	Q98ZlehWXcX7x1psuLD+0oo7SraDiGe0AyLtxU0GjmM2hEDMKGv530MY5bmnW4i8+HFu/QZxs8PgB
	FfQstMQw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <ukleinek@debian.org>)
	id 1xL0XA-0000qP-2K;
	Sun, 25 Oct 2026 15:53:21 +0000
Message-ID: <f7865dbf-0584-463a-91d2-ac3dfb78b9ac@debian.org>
Date: Sun, 25 Oct 2026 16:53:14 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: pca953x: Add support for MaxLinear's XRA1200 /
 XRA1200P
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
References: <20261025154840.657888-2-ukleinek@debian.org>
Content-Language: en-US, de-DE
In-Reply-To: <20261025154840.657888-2-ukleinek@debian.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XEYd2NPV1dq7C5T0v3tH1STk"
X-Debian-User: ukleinek

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XEYd2NPV1dq7C5T0v3tH1STk
Content-Type: multipart/mixed; boundary="------------osIBL49vKgTZemdbobQMhXnj";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Message-ID: <f7865dbf-0584-463a-91d2-ac3dfb78b9ac@debian.org>
Subject: Re: [PATCH] gpio: pca953x: Add support for MaxLinear's XRA1200 /
 XRA1200P
References: <20261025154840.657888-2-ukleinek@debian.org>
In-Reply-To: <20261025154840.657888-2-ukleinek@debian.org>

--------------osIBL49vKgTZemdbobQMhXnj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2026-10-25 16:48, Uwe Kleine-K=C3=B6nig wrote:
> These are documented to be compatible with PCA9534 and PCA9554
> respectively. The difference between the two is, that the XRA1200P has
> the configurable pull-ups enabled upon power-up.
>=20
> Datasheet available at https://www.maxlinear.com/ds/xra1200.pdf.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@debian.org>
> ---
>  drivers/gpio/gpio-pca953x.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index afec5ec23696..ea01fd152ac2 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -124,6 +124,8 @@ static const struct i2c_device_id pca953x_id[] =3D =
{
>  	{ .name =3D "tca9538", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT }=
,
>  	{ .name =3D "tca9539", .driver_data =3D 16 | PCA953X_TYPE | PCA_INT }=
,
>  	{ .name =3D "tca9554", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT }=
,
> +	{ .name =3D "xra1200", .driver_data =3D 8  | PCA953X_TYPE },
> +	{ .name =3D "xra1200p", .driver_data =3D 8  | PCA953X_TYPE },

Argh, after seeing that patch in my inbox I saw that the two lines lack a=
 `| PCA_INT`.

I'll wait a bit before resending ...

Best regards
Uwe


--------------osIBL49vKgTZemdbobQMhXnj--

--------------XEYd2NPV1dq7C5T0v3tH1STk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmreJeoACgkQj4D7WH0S
/k6+Ogf6AoUnL0rYXyQEB9vvE6uQTxZHBbjYtubb21eMlqUWcwvjISGXpfA8ht2y
p5f0QIEs/aEiZyMU4jfuQrSz3Ie4FZzlIp8O9E2Kc6pP+rmzF2RhO+VyWdzwPb80
TPaI3pZiKICwF24h+zILKfFViiQoPd5oB7VliyxeAyqU6BkqGJctATyxsdz31EJ9
P5iGbbe0jkIzy2jSxYebVFap6R+NmTXVNJ/nMuuabP4RmG3qplvu+xP+ZfKHg6OG
uf+afwY1YEpUjn36x3nvbLJwD3oHhtIea+5t3+LZaptfT0wgoI0pCa2tr9J6FW0E
9cywWcgEQD2DSzdavhzb/XcAa4wccw==
=DIkf
-----END PGP SIGNATURE-----

--------------XEYd2NPV1dq7C5T0v3tH1STk--
