Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794163155;
	b=1NsAqkOAQws4SijlucVkOVEHBUM8+HPhRkuLSIpTjQVFrVBqkMxbiIxLp/4DNev+EaRD
	 k/uoCC90FA0GPgpJ/nKD1csxuWWZJ71p2q3RaBCcwYlaaIV8YZFoNBtikd+SjBuOSnA89
	 9Yfq98Cz+g9OTJk9anX1LaZIsEgDqAJOFlBwIM8zcT22FYNU/8fjRC1XyTMgYab135pZM
	 xxgOh+lx23qVs4vLxrxA1mg0ISgekY4PApLDNTFLShSZb18VGK3ne5B+bvJWGw2Gt0E55
	 CqKkJdzurNkImNA4T8tMerE1UNsq4g/RY9dbifNq3VhsEaktCI5ZdI0L+/Rbze+X+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794163155;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7U4z84wQkTSCveb7tZObQiszQrcU19hyBoCQ62+2gEw=;
	b=aYXv0YkXRCacrMy1pNOHFiuIeoPZolPefnhiGt7ykltLoaQ8W5WTTkB4WFVAAjWaqmt7
	 VffeEzmU4h0NJ7erDIDD2xEYrzF/pPCZ6du0UT0yzuQr8YAx1HQC8FqCbOb4f+a45oF6x
	 wOmPc2TUgK4GJ3Oi5OzC5HDgkw2Lvc0DnO/WOb01FVXIv4AnGalO7l15IVDEKRSg4NCFg
	 8JNcoJ/7e4Qo2nr3I0U7/p6s/qEu/fT7uo/imj+GWME63aMxXDO738l/jXFbOG9eLpwEH
	 KQcUBR0dPyaErzjzbndKrD5ZfZaKcmSlgL7QGIBHOJUNdN6aMdJzfKwFS450JTJ6iCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KS9NoP5j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C19606A31C;
	Sun,  8 Nov 2026 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KS9NoP5j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EC51F0089F;
	Sun,  8 Nov 2026 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794163154;
	bh=7U4z84wQkTSCveb7tZObQiszQrcU19hyBoCQ62+2gEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KS9NoP5j2hfEn39RJmf5Ejw3pt5c7RM6kA3/smvDH1jjlPLbmvWCYnK2TrGydZ56z
	 SH5PFsiCvVFeH7Tx3zX3taYDhkLPazh0GvmfS1j268UkxABCk3M4+pj6IMArKWab0B
	 m23NM98502g21Y0ZZ/XSarE/+SITYIWT7K+HgBAje1nS+1osC+BhoZ9Ud7LkS3CHQp
	 s0VgvuuuIoNmqtcUgnCRYZrQ0cjmq4kDucqv5aq7t4Zfh0OmRIeNcm9UaHsycub9I0
	 SASqZ50B8nkfZOxHKIC7VP/b2WEq9/BhFUnyCgNQOnxPy8VsokuLca48EGyREHYjtI
	 tDj1nOurVsV6A==
Message-ID: <sashiko-outbox-203909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Letuchiy" <asalde.le1@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 18:39:13 +0000
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
- [Medium] pinctrl: mediatek: mt6895: out-of-bounds read of
  mt6895_pull_type[]
--

commit 60c606b2dae303929573f6abbd4f0ebf7a610aff
Author: Alexander Letuchiy <asalde.le1@gmail.com>

pinctrl: mediatek: Add support for MT6895 pinctrl

This commit adds a Paris-based pinctrl and EINT driver for the MediaTek
MT6895 SoC, defining 227 physical GPIOs and 20 virtual EINT lines.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6895.c b/drivers/pinctrl/=
mediatek/pinctrl-mt6895.c
> new file mode 100644
> index 0000000000000..1eb8792912301
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6895.c

[ ... ]

> +static const unsigned int mt6895_pull_type[] =3D {
> +	MTK_PULL_PU_PD_TYPE, /* 0 */
> +	MTK_PULL_PU_PD_TYPE, /* 1 */

[ ... ]

> +	MTK_PULL_PU_PD_RSEL_TYPE, /* 225 */
> +	MTK_PULL_PU_PD_RSEL_TYPE, /* 226 */
> +};
> +
> +static const char *const mt6895_pinctrl_register_base_names[] =3D {
> +	"base", "rm", "rt", "rmm", "bl", "bm", "br",
> +	"brr", "lb", "lm", "rtt", "tr", "tl", "lt",
> +};
> +
> +static const struct mtk_eint_hw mt6895_eint_hw =3D {
> +	.port_mask =3D 0xf,
> +	.ports     =3D 3,
> +	.ap_num    =3D 247,
> +	.db_cnt    =3D 32,
> +	.db_time   =3D debounce_time_mt6878,
> +};
> +
> +static const struct mtk_pin_reg_calc mt6895_reg_cals[PINCTRL_PIN_REG_MAX=
] =3D {
> +	[PINCTRL_PIN_REG_MODE] =3D MTK_RANGE(mt6895_pin_mode_range),
> +	[PINCTRL_PIN_REG_DIR] =3D MTK_RANGE(mt6895_pin_dir_range),
> +	[PINCTRL_PIN_REG_DI] =3D MTK_RANGE(mt6895_pin_di_range),
> +	[PINCTRL_PIN_REG_DO] =3D MTK_RANGE(mt6895_pin_do_range),
> +	[PINCTRL_PIN_REG_SMT] =3D MTK_RANGE(mt6895_pin_smt_range),
> +	[PINCTRL_PIN_REG_IES] =3D MTK_RANGE(mt6895_pin_ies_range),
> +	[PINCTRL_PIN_REG_PU] =3D MTK_RANGE(mt6895_pin_pu_range),
> +	[PINCTRL_PIN_REG_PD] =3D MTK_RANGE(mt6895_pin_pd_range),
> +	[PINCTRL_PIN_REG_DRV] =3D MTK_RANGE(mt6895_pin_drv_range),
> +	[PINCTRL_PIN_REG_PUPD] =3D MTK_RANGE(mt6895_pin_pupd_range),
> +	[PINCTRL_PIN_REG_R0] =3D MTK_RANGE(mt6895_pin_r0_range),
> +	[PINCTRL_PIN_REG_R1] =3D MTK_RANGE(mt6895_pin_r1_range),
> +	[PINCTRL_PIN_REG_DRV_ADV] =3D MTK_RANGE(mt6895_pin_adv_range),
> +	[PINCTRL_PIN_REG_RSEL] =3D MTK_RANGE(mt6895_pin_rsel_range),
> +};
> +
> +static const struct mtk_pin_soc mt6895_data =3D {
> +	.reg_cal =3D mt6895_reg_cals,
> +	.pins =3D mtk_pins_mt6895,
> +	.npins =3D ARRAY_SIZE(mtk_pins_mt6895),
> +	.ngrps =3D ARRAY_SIZE(mtk_pins_mt6895),
> +	.eint_hw =3D &mt6895_eint_hw,
> +	.eint_pin =3D eint_pins_mt6895,
> +	.nfuncs =3D 8,
> +	.gpio_m =3D 0,
> +	.base_names =3D mt6895_pinctrl_register_base_names,
> +	.nbase_names =3D ARRAY_SIZE(mt6895_pinctrl_register_base_names),
> +	.pull_type =3D mt6895_pull_type,
> +	.bias_set_combo =3D mtk_pinconf_bias_set_combo,
> +	.bias_get_combo =3D mtk_pinconf_bias_get_combo,

[Severity: Medium]
Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
past the end of mt6895_pull_type[]?

mtk_pins_mt6895[] has 247 entries including virtual EINT pins 227..246,
while mt6895_pull_type[] only has 227 entries for pins 0..226.  Reading
debugfs pinconf-pins (which queries all 0..npins-1 pins) calls
mtk_pinconf_get() -> mtk_pinconf_bias_get_combo(), indexing
hw->soc->pull_type[desc->number] out of bounds for pins 227..246.

Adding 20 trailing zero entries to mt6895_pull_type[] for the virtual EINT
pins (as done in mt6735_pull_type[]) would avoid the out-of-bounds read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-pinctrl-mt=
6895-v1-0-f704c443b31a@gmail.com?part=3D2
