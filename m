Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026693;
	b=Uo/Gi1oUwGaUm5poc8IKSudEGqRSEzPYhiCWpIaamR0NqqY+nNbMNffOLTM6YondEs8E
	 RItSjDPlFYvmf8tsr+wO5w7Q1Gl0aXCW+HV0OEI2GXahiJ1Shw79fsQINhP8vsODN2gta
	 7BMCaFRHuC+aDqzdK2JaqnTnj88fYf+ZG5Kfp5R8NERlCj6T83kvF/3sazjZBpvWmyJlv
	 JoQ/Yyh3e0KSfY7bXDOTHWtrVtVxxYiJYXpZrXr7VV05ftzT8RmAe+edq92+GhbruRsYK
	 lUBlYykLGE1eSpLqs5MX+DE26tjcb3T6qFM3GM58f8FKwVdXbiaKeHVdY+PO+rkbjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026693;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=opYCkF33tcGrVsW2YPyOPeVMNu5s2FEtuvNfzwpXQBM=;
	b=HJuadzz27Z6/NkHK+Te6LkBega5/vVwDSP9OQTCTd1rD5vtlTbvlqfj7BxJtJH3U+j7T
	 BJt33/068VIz5Zlf9qm/fYueqlIuxiqo9Co+XDefp80FLvYzI4+cBkuuf7wVZSEYVMrRG
	 xoK7Gm0hhsxaSyosxxD+Np3VsCo5noOAWaabdmV49M32zP5MmUtxc2GrzIbK0Hhd8AaeE
	 cXyz48Bss6pYEBeCi0DL6IlRuq/8ltMryCQZK4eL0Uk5VBN45Sf135V0Y7CBduyvpi675
	 mJ8Zy2d4Ay76I5bfsK6OPrSKeTtR/R0LaRa5bkxABo1eH5cPiCjA14v0qi4d5htuxzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mxbzf9vr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A1606A324;
	Mon, 26 Oct 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mxbzf9vr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B3C1F01825;
	Mon, 26 Oct 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793026692;
	bh=opYCkF33tcGrVsW2YPyOPeVMNu5s2FEtuvNfzwpXQBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mxbzf9vr8R/5OViEqYtQ4WB7JxEcwL78geVMaEm4xPadM6toNw+aZHR9NnvMqnZ+n
	 nLW4/F8hfkqhjjG18oUemDppUTSHCOG0H7uz6vd3oe0UMN+utCCBgQ5z7rbQEe8GpM
	 oexQ3lX1ii0juigCEu8UGQlwa49Rclj5e973K4jMPVqJs0vIwRvZ0z0VFRl3wXBlPT
	 lny2ezMnnrv2FFr7f12HrCM9sLKjktSjuGyWHIzFFAhI47PyNHh7iwlk1l79761kda
	 q4ky5o3G7sljebnJzjK1S/W8xKb6QwnsSxNmF+/r12K6egRqmq6O9NLTAt3vSfm9TC
	 De1/w5M+CHHqQ==
Message-ID: <sashiko-outbox-185417@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: skip unused per-bank supply on
 controllers without IO bias
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyysy@163.com
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261026144751.1392715-1-hsyysy@163.com>
References: <20261026144751.1392715-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 14:58:12 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: sunxi_pmx_request() skips enabling per-bank power =
supplies
--

commit 9182c2f5356e50617749f1a17d156851c7683cd0
Author: Yang Siyuan <hsyysy@163.com>

pinctrl: sunxi: skip unused per-bank supply on controllers without IO bias

This commit skips requesting the per-bank "vcc-pX" regulator in
sunxi_pmx_request() and freeing it in sunxi_pmx_free() when
pctl->desc->io_bias_cfg_variant is not set, in order to silence missing
supply warnings on controllers without IO bias configuration such as the
H616 R_PIO.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 31cd142ce0f79..4b877ec1e1836 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -924,6 +924,15 @@ static int sunxi_pmx_request(struct pinctrl_dev *pct=
ldev, unsigned offset)
>  		return 0;
>  	}
> =20
> +	/*
> +	 * The per-bank supply is only used to configure the IO bias voltage.
> +	 * Controllers without bias configuration (e.g. the H616 R_PIO) have no
> +	 * supply to request, and asking for one only makes the regulator core
> +	 * warn about the missing regulator for every bank in use.
> +	 */
> +	if (!pctl->desc->io_bias_cfg_variant)
> +		return 0;
> +
>  	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
>  	reg =3D regulator_get(pctl->dev, supply);
>  	if (IS_ERR(reg))

[Severity: High]
Does returning early in sunxi_pmx_request() when
!pctl->desc->io_bias_cfg_variant break per-bank power supply enabling on
SoCs without software-configurable IO bias registers?

In sunxi_pmx_request(), the per-bank "vcc-pX" supply is not only passed to
sunxi_pinctrl_set_io_bias_cfg(), but is also enabled via regulator_enable()
to power the physical pin bank while its pins are requested (originally
added in commit 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank
regulators") before IO bias configuration support in commit 402bfb3c1352):

drivers/pinctrl/sunxi/pinctrl-sunxi.c:sunxi_pmx_request() {
	...
	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
	reg =3D regulator_get(pctl->dev, supply);
	if (IS_ERR(reg))
		return dev_err_probe(pctl->dev, PTR_ERR(reg),
				     "Couldn't get bank P%c regulator\n",
				     'A' + bank);

	ret =3D regulator_enable(reg);
	if (ret) {
		dev_err(pctl->dev,
			"Couldn't enable bank P%c regulator\n", 'A' + bank);
		goto out;
	}

	sunxi_pinctrl_set_io_bias_cfg(pctl, offset, reg);
	...
}

Most Allwinner pinctrl descriptors leave io_bias_cfg_variant as 0
(BIAS_VOLTAGE_NONE), including sun4i_a10_pinctrl_data in
drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c (used for A10, A20, R40, V40),
a64_pinctrl_data in drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c, and
sun8i_v3s_pinctrl_data in drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c:

drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c:
static const struct sunxi_pinctrl_desc a64_pinctrl_data =3D {
	.pins =3D a64_pins,
	.npins =3D ARRAY_SIZE(a64_pins),
	.irq_banks =3D 3,
};

However, boards using those SoCs wire physical per-bank VCC-Px rails to
switchable, non-always-on PMIC regulators via vcc-pX-supply in Device Tree,
such as arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts:

&pio {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&clk_out_a_pin>;
	vcc-pa-supply =3D <&reg_aldo2>;
	vcc-pc-supply =3D <&reg_dcdc1>;
	vcc-pd-supply =3D <&reg_dcdc1>;
	vcc-pe-supply =3D <&reg_eldo1>;
	vcc-pf-supply =3D <&reg_dcdc1>;
	vcc-pg-supply =3D <&reg_dldo1>;
};

&reg_aldo2 {
	regulator-min-microvolt =3D <2500000>;
	regulator-max-microvolt =3D <2500000>;
	regulator-name =3D "vcc-pa";
};

Similar non-always-on per-bank supplies are used on A64 boards (such as
sun50i-a64-pinephone.dtsi, sun50i-a64-pinebook.dts,
sun50i-a64-olinuxino.dts, and sun50i-a64-teres-i.dts for vcc-pd-supply,
vcc-pe-supply, and vcc-pg-supply), A20 boards
(sun7i-a20-olinuxino-lime2.dts), and S3 boards (sun8i-s3-pinecube.dts).

If sunxi_pmx_request() skips regulator_get() and regulator_enable() when
!pctl->desc->io_bias_cfg_variant, won't these per-bank regulators remain
unenabled (or be disabled as unused at late_initcall by
regulator_init_complete()), cutting power to active pin banks and attached
peripherals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026144751.1392=
715-1-hsyysy@163.com?part=3D1
