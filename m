Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447712;
	b=KysPaJZac/4RUnUYpusm6IX6B+kPHE8TcZDnHw1EsYeobh6/1ZYM+kDdraOpf/nhZedT
	 BejJH9sfrFkzsyW5qCXJ9Y4sVFS00D7qwJtgV9ZBL4Y88cDAsecBLzMqEQ4QaH823t+Qc
	 Muvz1mCZiFsd3zImJ+48V45Vh8VwOrhS9Z4m3oz6c4DtTdB/9xU6TMX+F2uBrxiMo6e6O
	 +O6X7yyZYlbZiSNUvLZvEFmU4R1D19a5voqXPq2X/MzTjjoSk9sZhtXFXHL6wW7Qsc6yn
	 64Idn9eus6YhbJfQzgi5CzaBVCOoyVg9dDVyVDGs9gGJ5hk+D6ciNA7REBLXrXVO1CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447712;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f7P/rJXWlfBojlFvZtjI/9xpJ30DsN9snvq3yyr6v6E=;
	b=308DLx+ZSKDbNOeD5O7vZF3TSEbJ+O1s5ku4UGguHimq1wFiKo4dqy12yEXRWxbkkan9
	 fhOfeA3j/5G+qqSP9q2LtGBQAH5KAe/mJ/7zHcDp++vr1610IRUn6O4yz4s8udZoGxX0s
	 /eGNj0y1WFqozX09XoJs0jB0VCzzg4UY/JNBCWHKjjpP33vZai1JFEj4EmvXvlZoVjmd0
	 4PVomTfGZylN7/ZvhDa2TPz13gvB7lptV8CxG8znCgLHmrmeGTCFF1nSwvTWRWQ2I6vEo
	 ZUK+1en/wKeJTeKYVI1uUGQT4i+ahlBlNyQj2i8/MGHFkGUSoDNtMI+/MH++GO6c+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9xFX2f+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ABA606A688
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9xFX2f+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430961F000ED;
	Mon, 23 Nov 2026 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447712;
	bh=f7P/rJXWlfBojlFvZtjI/9xpJ30DsN9snvq3yyr6v6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W9xFX2f+IBkpanScfbDXCwCd/O5OjJbt/ZHHxxw+kPBFMrifrHidiTJSk6m1P3rXK
	 dN2MIUsib0cycVDglLRwwbzjb//DesnlzqmG2XRzRa2pjUiEqRY15tuNvxaptCNstC
	 A+Q1VVJzVhwBLDZILDCJog3DWbUxZ2WM0doWw5VCR2PJvkapf2ZcA5dbbxVEgHC0oZ
	 fgESyJZzEpZAN+uC9oCJWsoaPqAXmtT7pfY+soQDrHJXfyQCUR2PqBm4Pc/Q2/eda4
	 rHlLyTAJjXpE94iFwSjajyBoTGjD8SwG38f5EuJMuMp/sbbugESplJ2elPXuOv922l
	 8r5dtZwq9mBDA==
Message-ID: <sashiko-outbox-229563@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057
 & INTC105E based UP boards support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-5-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-5-f2322a91686d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:28:29 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] pinctrl: upboard: missing Signed-off-by trailer in commit
  message
- [High] pinctrl: upboard: wrong function for ish_uart_grp in
  pinctrl_map_upsadlp
- [High] pinctrl: upboard: wrong functions for ish_i2c groups in
  pinctrl_map_upnadln
--

commit c65242f8e95e0139e8717628a668ae12feb887dd
Author: Gary Wang <is0124@gmail.com>

> pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP b=
oards support
>
> Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
> "UP Squared i12","UP 7000" and I2C/PWM/UART/SPI pins mapping data.

[Severity: High]
The commit message is missing a Signed-off-by: trailer.

> diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-=
upboard.c
> index 66c1c3e3bfe08..232678fb811ec 100644
> --- a/drivers/pinctrl/pinctrl-upboard.c
> +++ b/drivers/pinctrl/pinctrl-upboard.c
> @@ -930,9 +930,61 @@ static const struct pinctrl_map pinctrl_map_adl[] =
=3D {
>  	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp",=
 "ssp2"),
>  };
> =20
> -static const struct upboard_pinctrl_map upboard_pinctrl_map_adl =3D {
> -	.maps =3D &pinctrl_map_adl[0],
> -	.nmaps =3D ARRAY_SIZE(pinctrl_map_adl),
> +static const struct upboard_pinctrl_map upboard_pinctrl_map_upxadlp =3D {
> +	.maps =3D &pinctrl_map_upxadlp[0],
> +	.nmaps =3D ARRAY_SIZE(pinctrl_map_upxadlp),
> +};
> +
> +static const struct pinctrl_map pinctrl_map_upsadlp[] =3D {
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp",=
 "i2c0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp",=
 "i2c1"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp",=
 "pwm0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart_g=
rp", "uart1"),

[Severity: High]
Should the function for "ish_uart_grp" in pinctrl_map_upsadlp[] be
"ish_uart" instead of "uart1"?

On INTC1055 (tgllp_functions in drivers/pinctrl/intel/pinctrl-tigerlake.c),
"uart1" only contains "uart1_grp", while "ish_uart_grp" belongs to
"ish_uart".  When upboard_pinctrl_probe() calls
devm_pinctrl_get_select_default() on UPS-ADLP01, pinmux_map_to_setting()
will reject this mapping with -EINVAL and fail the probe.

> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp",=
 "ssp2"),
> +};
> +
> +static const struct upboard_pinctrl_map upboard_pinctrl_map_upsadlp =3D {
> +	.maps =3D &pinctrl_map_upsadlp[0],
> +	.nmaps =3D ARRAY_SIZE(pinctrl_map_upsadlp),
> +};
> +
> +static const struct pinctrl_map pinctrl_map_upadln[] =3D {
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "i2c0_grp",=
 "i2c0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "i2c1_grp",=
 "i2c1"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "pwm0_grp",=
 "pwm0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "uart0_grp"=
, "uart0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_spi_gr=
p", "ish_spi"),
> +};
> +
> +static const struct upboard_pinctrl_map upboard_pinctrl_map_upadln =3D {
> +	.maps =3D &pinctrl_map_upadln[0],
> +	.nmaps =3D ARRAY_SIZE(pinctrl_map_upadln),
> +};
> +
> +static const struct pinctrl_map pinctrl_map_upnadln[] =3D {
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c0_g=
rp", "i2c0"),
> +	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c1_g=
rp", "i2c1"),

[Severity: High]
Should "ish_i2c0_grp" and "ish_i2c1_grp" in pinctrl_map_upnadln[] map to
functions "ish_i2c0" and "ish_i2c1" instead of "i2c0" and "i2c1"?

On INTC1057 (adln_functions in drivers/pinctrl/intel/pinctrl-alderlake.c),
"i2c0" and "i2c1" only contain "i2c0_grp" and "i2c1_grp", while
"ish_i2c0_grp" and "ish_i2c1_grp" belong to "ish_i2c0" and "ish_i2c1".
Because the groups do not match the functions, pinmux_map_to_setting()
returns -EINVAL and causes upboard_pinctrl_probe() to fail on UPN-ADLN01.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-upboard-pi=
nctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com?part=3D5
