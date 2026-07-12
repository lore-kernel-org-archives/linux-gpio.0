Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A233F5B3;
	Sun, 12 Jul 2026 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783875638; cv=none; b=b9rSanoylX0cfJFRk025ocLHTm6DX2LeDU53ZNNVtFiuhxCPlZvC/TjfgS7skPaYwJpN3xSWUqW4COO1kSQgFeaBxB/3VE9vS1l8WFjz3ogQFJCfT1iPUsgCc0b9unDVZXuxP8UE/zgmDs+OBhs4sIWmJBiQegl5mx2++UIim4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783875638; c=relaxed/simple;
	bh=/PLqj/FIB5HTtSo6gizl6/u5i+tTV2Mi1tQ/3VWekJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WV5srMksEL1k3TUSSyAATf6DV5AXxHW35RUSb401xZtEa8IVh89lHy7UnMuIAhGE5+oO5uhmNVMsakvddx5K5koUP1y4wTF1mmNqFfMvSCirsEFQwzcXK0ABjC+awDUtdDhiT2kePaJwqR28jEN7ZSqJHEKamUXnonF7AVNX8Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Gt1Rprs4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Gt1Rprs4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EYmNQeN1MMv3XCMLlgvSMjuvdlpxNtGkNTF/uC1tgH4=; b=Gt1Rprs4T9rS1j+zsV8bvuaMOJ
	t7HxPBa1j1m0JItJ5WHAaWmlGPpF6gFPbEzako2YaWKDyPn6RpFFl4wPFmJ1G2cHh/cWOFXV0pDy+
	7665P+rXo5HJU+a3PhPpKTFetM0t/Sa8R+4diZkHEP6hE1gveOaDX+bV/sKq6dazewNDTq8zDAvND
	gUrbd7EdSaUWOX1CMI34fTuWJRq1ENfwlklPur7u/lGYipW6uo+xYUVCTbBt2dGwB7W1/6Y4yOUUX
	m31AslFuztVTIFfri4hisKAwxoxiKZI/VKR9FTzI8FUf1R02FbZskhoHiVUbPb9ts/qLgc4If5Cif
	I0jf13Ig==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Linus Walleij <linusw@kernel.org>, huang lin <hl@rock-chips.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Sun, 12 Jul 2026 19:00:13 +0200
Message-ID: <13316226.iMDcRRXYNz@diego>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
References:
 <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-5-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 6. Juli 2026, 21:58:00 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Simon Glass:
> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
>=20
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>=20
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 209 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index 7e0fcd45fd26..f9cbcb955853 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c

[...]

> @@ -3310,6 +3470,7 @@ static int rockchip_set_drive_perpin(struct rockchi=
p_pin_bank *bank,
>  		ret =3D strength;
>  		goto config;
>  	} else if (ctrl->type =3D=3D RV1103B ||
> +		   ctrl->type =3D=3D RV1106 ||
>  		   ctrl->type =3D=3D RK3506 ||
>  		   ctrl->type =3D=3D RK3528 ||
>  		   ctrl->type =3D=3D RK3562 ||
> @@ -3482,6 +3643,7 @@ static int rockchip_get_pull(struct rockchip_pin_ba=
nk *bank, int pin_num)
>  				: PIN_CONFIG_BIAS_DISABLE;
>  	case PX30:
>  	case RV1103B:
> +	case RV1106:
>  	case RV1108:
>  	case RK3188:
>  	case RK3288:
> @@ -3547,6 +3709,7 @@ static int rockchip_set_pull(struct rockchip_pin_ba=
nk *bank,
>  		break;
>  	case PX30:
>  	case RV1103B:
> +	case RV1106:
>  	case RV1108:
>  	case RV1126:
>  	case RK3188:
> @@ -3843,6 +4006,7 @@ static bool rockchip_pinconf_pull_valid(struct rock=
chip_pin_ctrl *ctrl,
>  		return pull ? false : true;
>  	case PX30:
>  	case RV1103B:
> +	case RV1106:
>  	case RV1108:
>  	case RV1126:
>  	case RK3188:
> @@ -4623,6 +4787,48 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl _=
_maybe_unused =3D {
>  	.schmitt_calc_reg	=3D rv1103b_calc_schmitt_reg_and_bit,
>  };
> =20
> +static struct rockchip_pin_bank rv1106_pin_banks[] =3D {
> +	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU),

sashiko is correct here,
only pins 0-6 have drive-strength registers.

Some different setting starts at the 0x30 mark.

This should be easy to handle in rv1106_calc_drv_reg_and_bit()



> +	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0, 0x08, 0x10, 0x18),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x10020, 0x10028, 0, 0),

in theory only the first offset should be necessary here - same for the
other bank's offsets.

=46or offset-values of 0, the driver will automatically create the right,
offset increments. 8 for 4bit wide iomuxes.

See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/pinctrl/pinctrl-rockchip.c#n4344


So with the drive-strength thing fixed
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko


