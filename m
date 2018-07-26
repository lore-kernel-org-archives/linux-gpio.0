From: Alban <albeu@free.fr>
Subject: Re: [PATCH linux-next] gpio: fix meaningless return expression
Date: Thu, 26 Jul 2018 10:42:33 +0200
Message-ID: <20180726104233.72a9584b@eos>
References: <1532433463-42508-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/DR5ElOMU3d801292d=RFp94"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532433463-42508-1-git-send-email-zhongjiang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhong jiang <zhongjiang@huawei.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

--Sig_/DR5ElOMU3d801292d=RFp94
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jul 2018 19:57:43 +0800
zhong jiang <zhongjiang@huawei.com> wrote:

> Fix the following sparse error:
>=20
> drivers/gpio/gpio-ath79.c:54:16: error: return expression in void
> function
>=20
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

Acked-by: Alban Bedel <albeu@free.fr>

--Sig_/DR5ElOMU3d801292d=RFp94
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAltZiXkACgkQdJSaS524
LbxbRg//ZWb6FC/NrRGIYBOvvRAuJiL0HBDbXi6RVwkK0Ls5tnxgJBvEiQkW0tBh
kNy8ecypuGB3QcDd4HXUnQ+Xq7YehRQeN8D/E6xcgb+dvkjhwMLaDsj4+8Lb/SOu
bD3Q3oZO8WAhnHCNqgt3kOykK1+wLGowzTZaXwKncV6eMMSSvCrrtIpC0yxOp8ak
b8HGxqqCS8/kv/HbxAMIwsWczwwsxEJ2sU3JV9puOBsxuQ1q45p+3lw8jJjQ2Hf7
pxofbs9pVdsHclVuTghmIz01pPF7OkuXAVzIeYTQ/iauZ3qnGbs3m5LnZLQEHKLz
L5x+DIf5eweNoxs0fhxBVan+uIqR8n6gDt9WZfTlj0EfOnGg0066KtTpxuI45Hua
5YsMDt+xMD313XGai1BVXiOdwOYkeWOPzkMdGsIb9b1tphr6103Tnbay4gD/3h4m
aSwLPdgLmdOj6BOb4pWIWPDRCn4NZFQqmzOgv+8tQlBn3IOC3cSriAX1yeUq3y/5
AaeIBCIeW/ruImcBEncL3xvtyhVym8qmAi/5CwgTjgAFYBIXvDLj/PjUb3jIfc4Y
3+Bgl4UcJQZ/CKXy177ymYqmWRb4IpZbBxf3UL/X/JyrzCehHGIrIbhPJQhIzxkt
6fXmxJx6fMNW6ndnE7jhZ+opiOKOevzGn1uShWkxn5UANRnXHr0=
=2YJL
-----END PGP SIGNATURE-----

--Sig_/DR5ElOMU3d801292d=RFp94--
