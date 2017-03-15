From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH v2 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Wed, 15 Mar 2017 13:01:37 -0500
Message-ID: <20170315180137.GB682@jcartwri.amer.corp.natinst.com>
References: <20170315174654.15128-1-john@metanate.com>
 <20170315174654.15128-3-john@metanate.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:43682 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751100AbdCOSCL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Mar 2017 14:02:11 -0400
Content-Disposition: inline
In-Reply-To: <20170315174654.15128-3-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello John-

On Wed, Mar 15, 2017 at 05:46:52PM +0000, John Keeping wrote:
> This lock is used from rockchip_irq_set_type() which is part of the
> irq_chip implementation and thus must use raw_spinlock_t as documented
> in Documentation/gpio/driver.txt.
>=20
> Signed-off-by: John Keeping <john@metanate.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
> v2: unchanged
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index 128c383ea7ba..8c1cae6d78d7 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -163,7 +163,7 @@ struct rockchip_pin_bank {
>  	struct irq_domain		*domain;
>  	struct gpio_chip		gpio_chip;
>  	struct pinctrl_gpio_range	grange;
> -	spinlock_t			slock;
> +	raw_spinlock_t			slock;
>  	u32				toggle_edge_mode;
>  };
> =20
> @@ -1295,14 +1295,14 @@ static int rockchip_set_pull(struct rockchip_pin_=
bank *bank,
> =20
>  	switch (ctrl->type) {
>  	case RK2928:
> -		spin_lock_irqsave(&bank->slock, flags);
> +		raw_spin_lock_irqsave(&bank->slock, flags);
> =20
>  		data =3D BIT(bit + 16);
>  		if (pull =3D=3D PIN_CONFIG_BIAS_DISABLE)
>  			data |=3D BIT(bit);

This should be lifted out from under the lock.

>  		ret =3D regmap_write(regmap, reg, data);

How is this legal?  The regmap_write() here is going to end up acquiring
the regmap mutex.

   Julia

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljJgX0ACgkQjNrC4UVN
dG/4twf/Z8OCa6Le/ZNz9vxMvwhXCBk36Ls6Hg6jcYLkhuSUzMYS9jw2FyVatgQx
XpHIdGK7HBsAYVrWU2ZLehXPKVC64JpW+TcGz4hnI2RNIVFKKl9DpdGI9lApbleU
MTktBlOzr/Duxx5RN9EbdtcSOFzhIUbCO8ktTVIVGeorCmNFRNT7aeBxB1pzhnH5
GpvwA2yb1iOmNaAPnJ6epjTtvcZaxWeUmXDpEBqfu1cBtpsbyGwe/eebEiWt/+5W
9qDUTv6bdcqOS3BDtnbErkDsyuaVUYng27tsfNXgpnXgEqtRDhhqJb8FWHZflxBX
ECo199Ay3k2EM1Iz9J+/JOkCADF4mg==
=TQGC
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
