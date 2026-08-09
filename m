Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3426126C02;
	Sun,  9 Aug 2026 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268394; cv=none; b=Lg5whf5W73g81wmejURlm1pEuQuVIKCYZLaydMlZcj1+hRcds3QXMi1OJ8UdtmvKQDqaVDtiBwjyUcpwSzaCtyvBaqzTX/CFarnpxYdK0iEyzofnR7kPH080gOll1OIpQ5xO7Cd2qBqsYDNXFVoFO9aba2AfNkN9WTzTmH3jCgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268394; c=relaxed/simple;
	bh=GpGoRv5Gng6idSQQ/GKKmkpu3kEexlF6rSrPbCiC/rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9n6JKvsTsBpOnAMSvKezuLKNh95q2QeF6VLf/u8YW10NkOQ/bgK+G1ivWMeD3is7Bx+EFaeLIJNwMtFxuAXblErqjj5KDRM+1rVVAYQ46Op21gOwS/Ox8mOql/C+SZtVNFpZ67OH0pA8JhS/gfoaR/JW9KDy9X8dqgrCs6JHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zZEPnCMz; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zZEPnCMz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e2tV2waLfrz+hH7M5PM5u39hRzN3D90MNpx1km/idhU=; b=zZEPnCMzwhtm9l/12WM55pnpXJ
	aXqeg/pf8AM+3OfOkQm9xRDfhU877IiEfaiycVhVXjJXKgtO9/vshQht/ubQcimNW1RFBwadzEPx8
	gcFFCrOWc4XUdKhMQkNiX7tRF/K1utYsd18M/xf2uapKYbsXdu/GKDsUq+oKhOT6HCCXgOTgTm9V2
	3NPXNTMiFx5s91rKAyXPEyulaFJ8X/gPnklIxGSmFz6ype0gW9/xoR4OQqO6kNiaP4MB5RhLhZV43
	KjE36/0/e2HHZ0lO6K2JNMrgNf0OVSrNJJq8Vz7CrQPKFKNbHNpd8lHblTOy4WNvIdBpd4s42FsR6
	NXdMd7hg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the get
 function
Date: Sun, 09 Aug 2026 11:39:33 +0200
Message-ID: <8942531.Sb9uPGUboI@diego>
In-Reply-To: <20260729132736.3807082-2-sjg@chromium.org>
References:
 <20260729132736.3807082-1-sjg@chromium.org>
 <20260729132736.3807082-2-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 29. Juli 2026, 15:27:25 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> The decoding of the 2-bit and 8-bit level drive-strength values sits in
> rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
> banks declare these drive types (RK3506 and RV1103B) take the early
> ctrl->type branch in the set path, and the read-and-decode logic in a
> set function has no purpose. Meanwhile rockchip_get_drive_perpin()
> lacks the decoding, so pin_config_get() and the debugfs output report
> -EINVAL for these SoCs.
>=20
> Move the two cases to rockchip_get_drive_perpin(), where they belong.
>=20
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>=20
> Changes in v3:
> - Add new patch moving the drive-strength decoding to the get function
>=20
>  drivers/pinctrl/pinctrl-rockchip.c | 38 +++++++++++++++---------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index 7e0fcd45fd26..08a46a04a815 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3267,6 +3267,25 @@ static int rockchip_get_drive_perpin(struct rockch=
ip_pin_bank *bank,
>  	case DRV_TYPE_IO_1V8_ONLY:
>  		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
> +	case DRV_TYPE_IO_LEVEL_2_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +
> +		return data & 0x3;
> +	case DRV_TYPE_IO_LEVEL_8_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +		data &=3D (1 << 8) - 1;
> +
> +		ret =3D hweight8(data);
> +		if (ret > 0)
> +			return ret - 1;
> +		else
> +			return -EINVAL;
>  	default:
>  		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
>  		return -EINVAL;
> @@ -3390,25 +3409,6 @@ static int rockchip_set_drive_perpin(struct rockch=
ip_pin_bank *bank,
>  	case DRV_TYPE_IO_1V8_ONLY:
>  		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
> -	case DRV_TYPE_IO_LEVEL_2_BIT:
> -		ret =3D regmap_read(regmap, reg, &data);
> -		if (ret)
> -			return ret;
> -		data >>=3D bit;
> -
> -		return data & 0x3;
> -	case DRV_TYPE_IO_LEVEL_8_BIT:
> -		ret =3D regmap_read(regmap, reg, &data);
> -		if (ret)
> -			return ret;
> -		data >>=3D bit;
> -		data &=3D (1 << 8) - 1;
> -
> -		ret =3D hweight8(data);
> -		if (ret > 0)
> -			return ret - 1;
> -		else
> -			return -EINVAL;
>  	default:
>  		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
>  		return -EINVAL;
>=20




