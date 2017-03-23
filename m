From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH v4 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Thu, 23 Mar 2017 11:10:20 -0500
Message-ID: <20170323161020.GM10423@jcartwri.amer.corp.natinst.com>
References: <20170323105931.10455-1-john@metanate.com>
 <20170323105931.10455-2-john@metanate.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:56028 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756150AbdCWQK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 12:10:58 -0400
Content-Disposition: inline
In-Reply-To: <20170323105931.10455-2-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org

--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello John-

One quick question below.  Apologies if this has been covered, but just
want to be sure.

On Thu, Mar 23, 2017 at 10:59:28AM +0000, John Keeping wrote:
> regmap_update_bits does its own locking and everything else accessed
> here is a local variable so there is no need to lock around it.
>=20
> Signed-off-by: John Keeping <john@metanate.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
> v3: unchanged
> v2.1:
> - Remove RK2928 locking in rockchip_set_pull()
> v2:
> - Also remove locking in rockchip_set_schmitt()
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 33 ++-------------------------------
>  1 file changed, 2 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index bd4b63f66220..6568c867bdcd 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
[..]
> @@ -1185,17 +1177,14 @@ static int rockchip_set_drive_perpin(struct rockc=
hip_pin_bank *bank,
>  			rmask =3D BIT(15) | BIT(31);
>  			data |=3D BIT(31);
>  			ret =3D regmap_update_bits(regmap, reg, rmask, data);
> -			if (ret) {
> -				spin_unlock_irqrestore(&bank->slock, flags);
> +			if (ret)
>  				return ret;
> -			}
> =20
>  			rmask =3D 0x3 | (0x3 << 16);
>  			temp |=3D (0x3 << 16);
>  			reg +=3D 0x4;
>  			ret =3D regmap_update_bits(regmap, reg, rmask, temp);

Killing the lock here means the writes to to this pair of registers (reg
and reg + 4) can be observed non-atomically.  Have you convinced
yourself that this isn't a problem?

   Julia

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljT82kACgkQjNrC4UVN
dG9KTQf/YiH+8jCG2C2XT6MOMRQut9nFZIZ/YmDZ93pc3huvuW6CYCuegs/MFEmm
nQcfpOpoa2SjOwZYA+DWxiBqe3n1mZoiKbkzhU+rVnpMy3iZvLVfUyNIxakzpWLM
ccGTlIGnwksvx8CzDkfs1jEHxLssHEKPeng6zdxWpvRL4FL2X0v8rYP7E53znsM6
rmHxZFqIyFZz01dqAS8LWCSW4j8n0PjyHOK5wI+EFZeg4WOMgFNPu+Y60STlqI1W
389ZqhTBVZ5nmYwHK9xhAKB9Pn4M3khfPpH2rCMUka5r5Z77trcOIuFaAsPFzvDt
swMps+vL2KSIJBXoy2S2Tu7iZFsuJg==
=iffl
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
