Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774878;
	b=X7Eqr9faaieKJ8afIN+iJkyvkmpOLfcTKfi2WLY90Qybi1fUWxUCEDUIiKtbjzbz6kpm
	 sTC/cwfaI35zY6ZqRbywWSwq8aEZsX5c0iX/0zIpVfFMMly9uvN7+fjqsFq4Ym6Y5k+/w
	 q40dwnZqiY1liYT/Q7noyDw0ku0Mic3CWDGcSbRH36mKBPqNbeOvIkK3RYoeefWXa1+X1
	 hbrrVrenMS9KEontJu+eIJQaXvZ008VVhHU9usbWYGIHGukA42ZqJuo8ASgXLLxibe08v
	 o2kRdwhhLg+u6VGjHGTEp+EDCmMEa5NUk/5Ah9uw+NYBLqc6rsSz8NfTuTC7taC2AVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1UHDhkEqdK++rwLlhl8eLG6Syd3cIRxnrRpxv/dyniQ=;
	b=CJOh2uoc5HPkREuYXYj746p1lhDcYRyidRNWY+5OX6Y5ZESOxDnlGcI4hxbmIVkYgpy4
	 5phb/RmeAMDotUXRmAj3bLtD1GHcyw1BawoNV21+PkjNdch+6dAJ1JE1/BSr0hiRsGJre
	 ro7d9CVoIpCz/PBh7XKszSRIioDlvwb9rDZwkS44WAL2x44cJRZovshvV5xXVoQLWudPZ
	 DdnKEPDHzdLiUPt+ezfCpvX/ReVbiMlY1+M24BnGfyVp5ndCno5vg9aB92cESTARlv/MR
	 ZTYt8o3Qy6sHNe/slBGI5UoyjT1viOb15xyw9YRAB8vCxJeK+lo/I3uvfdbis9xcIcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/rlcUep";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F2606A329;
	Sun, 15 Nov 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/rlcUep
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938C51F000C4;
	Sun, 15 Nov 2026 20:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774877;
	bh=1UHDhkEqdK++rwLlhl8eLG6Syd3cIRxnrRpxv/dyniQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/rlcUepXYArR011UCz4BoCVDttlX0CEbZOLOt1qomlgjvbX9rSACIqHleoEGSPD9
	 K6LeUnA7Oe2ykaBUgprFlNvrHLFgiU7moFNbZTLJH59nkoRXhma2BZMShvPya08KBa
	 iQU6cm/g9twVfz4jGe2TkcfZCJSYWE/xs/FLLZiitZlUvRc47422CXD14z9UBikpiA
	 SrQuIW7413wQEj7AsIU8GAI6AJHFeV3ZAiS5m5WUTUVogmO+y0M1zg8fn+3006WrOH
	 drzLDzwuOtBhzX0btvkRfA48Iz8j6wxb/6nmKHoN2cmkUySmw9wJOVdeD3AULDBULO
	 HjFh8yYkHXSYw==
Message-ID: <sashiko-outbox-215839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Molokai TLMM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-molokai-tlmm-v1-2-3ba4840002cb@yahoo.com>
References: <20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com>
 <20261116-molokai-tlmm-v1-2-3ba4840002cb@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:34:37 +0000
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
- [High] pinctrl: qcom: molokai uses MSM_PIN_FUNCTION() for egpio
- [High] pinctrl: qcom: molokai PINGROUP() omits intr_target_width =3D 4
--

commit e5d14e99015da685768f438aabdb5849901661b6
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

pinctrl: qcom: Add Molokai TLMM driver

This commit adds the pinctrl, pinmux, pinconf, and gpiolib driver for the
TLMM block on the Qualcomm Molokai (SM8845) SoC.

> diff --git a/drivers/pinctrl/qcom/pinctrl-molokai.c b/drivers/pinctrl/qco=
m/pinctrl-molokai.c
> new file mode 100644
> index 0000000000000..80763dce895be
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-molokai.c
> @@ -0,0 +1,1679 @@
[ ... ]
> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
> +	{					        \
> +		.grp =3D PINCTRL_PINGROUP("gpio" #id,	\
> +			gpio##id##_pins,		\
> +			ARRAY_SIZE(gpio##id##_pins)),	\
> +		.funcs =3D (int[]){			\
> +			msm_mux_gpio, /* gpio mode */	\
> +			msm_mux_##f1,			\
> +			msm_mux_##f2,			\
> +			msm_mux_##f3,			\
> +			msm_mux_##f4,			\
> +			msm_mux_##f5,			\
> +			msm_mux_##f6,			\
> +			msm_mux_##f7,			\
> +			msm_mux_##f8,			\
> +			msm_mux_##f9,			\
> +			msm_mux_##f10,			\
> +			msm_mux_##f11 /* egpio mode */	\
> +		},					\
> +		.nfuncs =3D 12,				\
> +		.ctl_reg =3D REG_SIZE * id,		\
> +		.io_reg =3D 0x4 + REG_SIZE * id,		\
> +		.intr_cfg_reg =3D 0x8 + REG_SIZE * id,	\
> +		.intr_status_reg =3D 0xc + REG_SIZE * id,	\
> +		.mux_bit =3D 2,			\
> +		.pull_bit =3D 0,			\
> +		.drv_bit =3D 6,			\
> +		.i2c_pull_bit =3D 13,		\
> +		.egpio_enable =3D 12,		\
> +		.egpio_present =3D 11,		\
> +		.oe_bit =3D 9,			\
> +		.in_bit =3D 0,			\
> +		.out_bit =3D 1,			\
> +		.intr_enable_bit =3D 0,		\
> +		.intr_status_bit =3D 0,		\
> +		.intr_wakeup_present_bit =3D 6,	\
> +		.intr_wakeup_enable_bit =3D 7,	\
> +		.intr_target_bit =3D 8,		\
> +		.intr_target_kpss_val =3D 3,	\
> +		.intr_raw_status_bit =3D 4,	\
> +		.intr_polarity_bit =3D 1,		\
> +		.intr_detection_bit =3D 2,	\
> +		.intr_detection_width =3D 2,	\
> +	}

[Severity: High]
Should PINGROUP() set .intr_target_width =3D 4?

Without intr_target_width, msm_gpio_irq_set_type() defaults to a 3-bit mask
(GENMASK(2, 0)).  In this TLMM register layout, TARGET_PROC occupies bits
11:8 and resets to 0xf (NONE), so clearing only bits 10:8 leaves bit 11 set
and writes 0xb instead of 0x3, misrouting all GPIO interrupts handled via
the TLMM summary interrupt path (the same issue fixed in commits
68ab4a6a84b9 ("pinctrl: qcom: nord: fix GPIO interrupt target width") and
1e7b04c12c07 ("pinctrl: qcom: shikra: Fix intr_target_width for summary
interrupt routing")).

[ ... ]

> +static const struct pinfunction molokai_functions[] =3D {
> +	MSM_GPIO_PIN_FUNCTION(gpio),
[ ... ]
> +	MSM_PIN_FUNCTION(dp_hot),
> +	MSM_PIN_FUNCTION(egpio),
> +	MSM_PIN_FUNCTION(gcc_gp1),

[Severity: High]
Should egpio in molokai_functions[] use MSM_GPIO_PIN_FUNCTION(egpio) instead
of MSM_PIN_FUNCTION(egpio)?

msm_pinmux_ops sets .strict =3D true and .function_is_gpio =3D
pinmux_generic_function_is_gpio.  Because MSM_PIN_FUNCTION() does not set
PINFUNCTION_FLAG_GPIO, pin_request() rejects any GPIO request on a pin muxed
to egpio with -EINVAL (as fixed across other Qualcomm TLMM drivers in
commits 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
function as non-strict functions") and e73fda2dcb0b ("pinctrl: qcom: glymur:
Fix the gpio and egpio pin functions")).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-molokai-tl=
mm-v1-0-3ba4840002cb@yahoo.com?part=3D2
