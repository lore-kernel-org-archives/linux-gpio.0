Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741143;
	b=4c59vBvxxfco/4ssUChbeRp2BOa1e3TI9H8L2LPhhZ0rTFa80cGNJ1kxG7ek86tEavrB
	 TCDYfw+Jy+nBR9n728J5vOYLKHd2zOxc55kQIMCIW99qh5u6AAppxYfM5KCQuYF4gcpj0
	 z1Q5jPga5xX3MAjS0btNxznLF6OjPrw/Ek53oLg9BeQYUSkk1N45NwpiQ0h7dxZrYWfjx
	 GUNG1CxHaZnNsql4qn4pPvhtdTYORyelZaePoR2YG+rESzcxbpDnXEE5clTq1aqzyZqqV
	 hySnEyVCTp8yLSXs0eDvqo5BYu07H34vmTe584sewqIPkcl1TLtVh5vITYxrlFleaPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pklar055obidRqD009+g7WLs9lSKG/2CW40h8YFs1Pw=;
	b=JKIltlUv+nz8lxi1LqBPm2FRnC3oj/eUnu/laTuYxeXqc0sRXBcrB/8m6s/W3nYbbb2W
	 uHjBVJZy7bRHjIUSRVWH/5xY6TQEbVqyOCEHdl940xyfKUH4Ato0+iehCONqtnHUmU8qz
	 xHQZ/XZiO5ATkmX1yE8dwWGf7LCRqWb973Ie/XvjMj60BaBm2OCDa35jSCAmd6d7HR+zg
	 zcGt6W2eFBMm37FAMQ4fw41Dd13v7TRiA/kOG6foG4PoQVEsPjdi9X4/dHVLWgUoIYLGY
	 HBF0z2KEdcqJh1zmXvYA415yexSoohJhBi0qCFmS2TcWKq7ECNQ9NedanFnC8s3ylqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNaEysRk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F42606A31A;
	Sun, 15 Nov 2026 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNaEysRk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E5E1F000C4;
	Sun, 15 Nov 2026 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794741142;
	bh=pklar055obidRqD009+g7WLs9lSKG/2CW40h8YFs1Pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNaEysRkURLv4tVuHz5G36R6tNKKXm/D0znBavC923KfL6d9o1V+bvk2blLsQLPgC
	 8zlXwkgEHPfOQ3UQoxOlhn9+opvkzIyoAqWxAxF+uO8LYlQgfj9SezE7dBVOTFGU/l
	 8dNWhUOmzWK8i/m4OR11FDFhhFF6GMb/M641aAP3bkYQae13Il6t8w+p6koC9RHbAU
	 0gygpmv2uGmkNZKNVW+wkaPuIoU/XGBuN9EHJLKxBocHFUOIGqM880GaRMthpHtI5q
	 wFRc6YETCksFR/fCeI+kxm7w6Vn3zb4Vi5LnyBo1X22PYM4SgvAlS2Tr+cfcAPlJmT
	 dip7sccsC9hsw==
Message-ID: <sashiko-outbox-215444@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/13] reset: add Synaptics SL2610 reset controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-8-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-8-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:12:21 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] reset: sl2610: wrong errno in sl2610_reset_assert() and
  deassert()
--

commit fd9868407ed20a422bf28d62579da17aa23dc9fc
Author: Jisheng Zhang <jszhang@kernel.org>

reset: add Synaptics SL2610 reset controller support

This commit adds a reset controller driver for the SoC and MCU system
control blocks on Synaptics SL2610 SoCs, supporting both pulse and sticky
reset lines.

> diff --git a/drivers/reset/reset-sl2610.c b/drivers/reset/reset-sl2610.c
> new file mode 100644
> index 0000000000000..1ca58d5a3e713
> --- /dev/null
> +++ b/drivers/reset/reset-sl2610.c
[ ... ]
> +static int sl2610_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct sl2610_reset_priv *priv =3D to_sl2610_reset_priv(rcdev);
> +	const struct sl2610_reset_cfg *cfg =3D &priv->cfgs[id];
> +
> +	if (!cfg->sticky)
> +		return -EINVAL;
> +
> +	return regmap_clear_bits(priv->regmap, cfg->reg, cfg->bit);
> +}
> +
> +static int sl2610_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	struct sl2610_reset_priv *priv =3D to_sl2610_reset_priv(rcdev);
> +	const struct sl2610_reset_cfg *cfg =3D &priv->cfgs[id];
> +
> +	if (!cfg->sticky)
> +		return -EINVAL;
> +
> +	return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
> +}

[Severity: Medium]
Should sl2610_reset_assert() and sl2610_reset_deassert() return -ENOTSUPP
(or 0 in sl2610_reset_deassert()) instead of -EINVAL when !cfg->sticky?

In drivers/reset/core.c, reset_control_deassert() treats self-deasserting
pulse reset lines as deasserted by default when .deassert() is not
implemented, and documents that .deassert() should return -ENOTSUPP when
deassertion cannot be guaranteed:

drivers/reset/core.c:reset_control_deassert() {
	...
	/*
	 * If the reset controller does not implement .deassert(), we assume
	 * that it handles self-deasserting reset lines via .reset(). In that
	 * case, the reset lines are deasserted by default. If that is not the
	 * case, the reset controller driver should implement .deassert() and
	 * return -ENOTSUPP.
	 */
	if (!rcdev->ops->deassert)
		return 0;
	...
}

Because this controller implements .assert() and .deassert() for its
sticky lines, returning -EINVAL for the 22 pulse reset lines in
sl2610_reset_cfgs[] causes consumer drivers that call
reset_control_deassert() during probe (such as 8250_dw) to fail probe, and
prevents consumers such as stmmac_dvr_probe() from checking for -ENOTSUPP
on reset_control_assert() and falling back to reset_control_reset().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D7
