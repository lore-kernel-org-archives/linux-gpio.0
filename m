Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304616;
	b=4tqU76+mr5vu8WxEMwFet2x0C9GwmODztjYd/9atv8dUtg+5xPoOzEvYCV4UHAPlYUsf
	 DjXYYpHdH99qwE7YpbzQ+jdFbNaAdlzfK/AAkLd3dF8TBDgNDp+AWoCWnZp97iJcsa2G/
	 EYk2RhbF/yBpqZVnkYjtiB0CSKHhsQTbz9V2v5VtttxocyUNyCdGNPRD1n/a7dG3IC0LD
	 wOYfIQ4fe6TO1Pg5p2pPU5OrMO+hRQ16q/whbkyHBYyJ9QQMTtEyo/tnf6CKWJdtN622o
	 Jcq65/rZxk+TRdCIuVzIrpyr6ZOl6sx+Lve0zWe3/zbPx5ZGP1ZNsNwbTqWxN8szs5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304616;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MmApFl/EdakFe/J6Jq/qqJaBPYKJuT4fn/xgzNIUQAo=;
	b=F4i1FRDm7BZa2yJPGxPDaw8zg2rbWPBZ2xmqcLh5CIozTTuiu8r6qBnc/ILpDjihy00u
	 26u16k/GNkqV6osXNfHXCJnqwp/JVDB3RRjU2bit1i10rVxYEWLxQdbgQIYspFDs7W+XW
	 JrzP3VCVssS4GFFsmVkRxEBT8jfhnWK3zqBjYTFQ211dQ11cIMhCG5otlsMA05mB5uyUN
	 ohwD8ZJyGIaKDVjQtIsVgSQ+ZNbhXvi8EESa85NhSZIlhU4TVO/EoEdocTZFc6fFQdhkg
	 WcHQKRqqXMmDndZJ8LnLmkGDcCWqWIMxXTk/l2mks6X8egWpV9hu29iFxaUTKCwCqBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kWy/87aN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C360606A331;
	Tue, 10 Nov 2026 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWy/87aN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A91F008A1;
	Tue, 10 Nov 2026 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304615;
	bh=MmApFl/EdakFe/J6Jq/qqJaBPYKJuT4fn/xgzNIUQAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kWy/87aNswIcXsuXHFNdakqUNyCnNxdQPL/Kh67cq8xh9a52w6WD2pDM6//Ck86NE
	 6SPUaPBGN3VLv0cvKyNIn1KQf2Yew9H+Vgn1B4YsRlJu7wVMkQrEtqJYq2GC5GGu2z
	 KLL7Oq0uO8QxthBMuo39x8pkp8s2COVyCCcd4Vt9GSDbDQk9M7h2oMYXNA+SoLnnnX
	 1fH65GG1Izmnhm0eV+1br5Ui2mhav3DeAljfdQaf/iLs/eIHe4916w/qW2OZ+0vVLs
	 OCLfin0LUIwUVgjhtcRtGef4V1y139MqRIqEh1fRa0KehqM77zspHR7MbTq0cHn7TL
	 xbcClESMTkong==
Message-ID: <sashiko-outbox-206817@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/12] pinctrl: airoha: an7583: use force GPIO mode for
 GPIO requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhengping Zhang" <zhengping.zhang@airoha.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110094339.749110-10-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-10-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 09:56:54 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] pinctrl: airoha: an7583: hsuart and hsuart_cts_rts mux
  conflict
- [Low] pinctrl: airoha: an7583: redundant regmap[2] in PWM_EXT_SEC and
  unused macros
--

commit f7d089a2abc89c3f0877be6d6eb92f87952452c6
Author: Zhengping Zhang <zhengping.zhang@airoha.com>

pinctrl: airoha: an7583: use force GPIO mode for GPIO requests

This commit enables per-pad force GPIO overrides, shared GPIO request
handling, and mux conflict checking on AN7583, while updating peripheral,
PWM, and PON pinmux groups accordingly.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 74628a03ca909..e2f629d9d43cd 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c

[ ... ]

> -#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
> +#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val, force_reg, f=
orce_mask) \
>  	{							\
>  		.name =3D (gpio),					\
>  		.regmap[0] =3D {					\
> @@ -299,10 +308,14 @@
>  			(smux_val),				\
>  			(smux_val)				\
>  		},						\
> -		.regmap_size =3D 2,				\
> +		.regmap[2] =3D {					\
> +			AIROHA_FUNC_MUX, (force_reg),		\
> +			(force_mask), (force_mask)			\
> +		},						\
> +		.regmap_size =3D 3,				\
>  	}

[Severity: Low]
This isn't a bug, but AIROHA_PINCTRL_PWM_EXT_SEC() already sets the
per-pad GPIO selector bit (smux_val) in REG_GPIO_PON_MODE via regmap[1],
and all 13 callers (gpio39 through gpio51 in pwm_func_group) pass 0 for
force_mask, making regmap[2] a no-op entry.  In addition, replacing the
entries in gpio_func_group with AN7583_GPIO_GROUP() leaves
AIROHA_PINCTRL_GPIO() and AIROHA_PINCTRL_GPIO_EXT() unused.

[ ... ]

> @@ -745,7 +840,14 @@ static const struct airoha_pinctrl_func_group uart_f=
unc_group[] =3D {
>  			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
>  			GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
>  		},
> -		.regmap_size =3D 1,
> +		.regmap[1] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_FORCE_GPIO_EN,
> +			BIT(30) |
> +			BIT(31),
> +			0
> +		},
> +		.regmap_size =3D 2,
>  	}, {
>  		.name =3D "hsuart",
>  		.regmap[0] =3D {
> @@ -754,7 +856,14 @@ static const struct airoha_pinctrl_func_group uart_f=
unc_group[] =3D {
>  			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>  			GPIO_HSUART_MODE_MASK
>  		},
> -		.regmap_size =3D 1,
> +		.regmap[1] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_FORCE_GPIO_EN,
> +			BIT(28) |
> +			BIT(29),
> +			0
> +		},
> +		.regmap_size =3D 2,
>  	},
>  	{
>  		.name =3D "hsuart_cts_rts",
> @@ -764,7 +873,14 @@ static const struct airoha_pinctrl_func_group uart_f=
unc_group[] =3D {
>  			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>  			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
>  		},
> -		.regmap_size =3D 1,
> +		.regmap[1] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_FORCE_GPIO_EN,
> +			BIT(26) |
> +			BIT(27),
> +			0
> +		},
> +		.regmap_size =3D 2,
>  	}, {

[Severity: Medium]
Does enabling check_mux_conflicts in pinctrl_match_data cause selecting
both "hsuart" and "hsuart_cts_rts" to fail with -EBUSY?

On AN7583, hsuart_pins covers only the TX/RX pins (30 and 31) and
hsuart_cts_rts_pins covers only the CTS/RTS pins (28 and 29), and their
regmap[1] entries clear the force-GPIO bits for those disjoint pin sets
(BIT(28) | BIT(29) vs BIT(26) | BIT(27)).  Enabling HSUART with flow
control therefore requires selecting both groups, just like "uart2" and
"uart2_cts_rts".  However, unlike "uart2" (whose regmap[0].mask is only
GPIO_UART2_MODE_MASK), "hsuart" includes GPIO_HSUART_CTS_RTS_MODE_MASK in
regmap[0].mask with value 0 while "hsuart_cts_rts" sets that bit to 1, so
airoha_pinmux_check_conflicts() rejects combining them.  Conversely,
selecting "hsuart_cts_rts" alone leaves the TX/RX pins unclaimed and their
force-GPIO overrides (BIT(28) | BIT(29)) uncleared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110094339.7491=
10-1-zhengping.zhang@airoha.com?part=3D9
