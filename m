Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710925;
	b=KKjuXmdFhmvwk/h+h7/9HPgMADrLhA7n/8KgrQVDDmr5PDAHVSPfZF4hHs/EEO3PKCwx
	 hQuzWdtjcxMtPHeRv8FSzp71JDIXAFN9OixwB2dxo/UEaY6ozc18DLm5Ilh5Nk1YuCMnT
	 K7Ls7G2nbDF1Oqp0xAIsq4YvZHrVDdDI1WiFcsne3x3/2iN6QtfpwxKg1NbT4bhvhtDt7
	 X9WbpjB0M1OrySGY5Yz18Cd7nySdDmR7r2qz9ztt1gX747PzO3Xepi9IaqZvj2KzF3wYh
	 DBlD6QrtCt4Z5xNZpJjx/M1e8gWS3b4qDswzMckL2SdX6U9LVPKhkBcQoXIf/WClW+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V+4edMS5OX89l0ykZp9yLyttA8LK26bm/zfyDaI8o58=;
	b=rj1e9J/+i1wp6MMwwFgv4O8SwVjqRIki3zK49lGSIsL03Se0Ywdrjiz+rYxOGqr54mPA
	 OxOkL8j48PBnVqEOpvBpI2vFTcXglajhopnm47/yRoN0RMDZQu6OkH5Ji7GfyBJNa/r3a
	 O6z7cYc49qXThuzOnPx/dNEFz5otTJMznDy2L8/CuqDfPRzR+f3TP3naWQt/UTIRbK5Z/
	 QJK4D/cT6RR8V9DfCqpBY3wYkXfluV9NOwgosOkW8tII0DIYrut7Bo/YqeT+pWmbGoOT9
	 B1QLTi2pKeEphSRVJAFlN2wj3VjvWJxD+VQlk6GcyVeC+8DtbkJJO3MvKXBwh0NEMGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbOWsC32;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF2606A31C;
	Thu, 26 Nov 2026 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbOWsC32
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C112A1F000CA;
	Thu, 26 Nov 2026 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710925;
	bh=V+4edMS5OX89l0ykZp9yLyttA8LK26bm/zfyDaI8o58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbOWsC322+lCU1BgMDt9GLpIJFkQxyLXqDbi3anjO71KeUyMTuT45cDP098E4opaS
	 PI73W8vJcHxqMy4UjlKf4zNM5r8H6jV9689x41N7wk6kvYCIxM6D9GqqL2n1Fkeczg
	 n6bjPWU3ul4FJmpOXbUIgXwhLxwmzhDk/G/PodDyMjYaNmgWnaqntL9R6m1R18Y8Xz
	 kyTo81KPrej26QSSqG/31Dn6bYY9hoAcq97Tb4hhKZNizuAMaE2e4IdntREsu7xgIL
	 uU9oSMga468JlR/AC68QKoDveDkQUtNOF0Rf+6gU8XWt/pnQe8P+traNGId1YMOE7C
	 A0tdJ5DjTaSFg==
Message-ID: <sashiko-outbox-235923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Netrani TLMM support
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-netrani-tlmm-v3-v3-2-3bf3f0bbe5df@krgm.moe>
References: <20261127-netrani-tlmm-v3-v3-0-3bf3f0bbe5df@krgm.moe>
 <20261127-netrani-tlmm-v3-v3-2-3bf3f0bbe5df@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 16:35:24 +0000
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
- [Medium] pinctrl: qcom: netrani: unadjusted 0x100000 wrapper offset in
  pingroups
- [Medium] pinctrl: qcom: netrani: unconsolidated per-lane pinmux
  function definitions
--

commit d9ae167fc0b9ebbc2ea8d3381996a68bd5e63e3d
Author: SignKirigami <prcups@krgm.moe>

pinctrl: qcom: Add Netrani TLMM support

This commit adds the Qualcomm Netrani TLMM pin controller driver, defining
pin groups, mux functions, and the PDC wake interrupt map.

> diff --git a/drivers/pinctrl/qcom/pinctrl-netrani.c b/drivers/pinctrl/qco=
m/pinctrl-netrani.c
> new file mode 100644
> index 0000000000000..75ecef4c8ad79
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-netrani.c
> @@ -0,0 +1,2093 @@
[ ... ]
> +#include "pinctrl-msm.h"
> +
> +#define REG_BASE 0x100000
> +#define REG_SIZE 0x1000
> +
> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
> +	{					        \
> +		.grp =3D PINCTRL_PINGROUP("gpio" #id,     \
> +			gpio##id##_pins,                \
> +			ARRAY_SIZE(gpio##id##_pins)),   \
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
> +			msm_mux_##f11			\
> +		},				        \
> +		.nfuncs =3D 12,				\
> +		.ctl_reg =3D REG_BASE + REG_SIZE * id,			\
> +		.io_reg =3D REG_BASE + 0x4 + REG_SIZE * id,		\
> +		.intr_cfg_reg =3D REG_BASE + 0x8 + REG_SIZE * id,		\
> +		.intr_status_reg =3D REG_BASE + 0xc + REG_SIZE * id,	\

[Severity: Medium]
Should REG_BASE be 0x0 and the UFS_RESET / SDC_QDSD_PINGROUP offsets in
netrani_groups[] drop the 0x100000 wrapper offset (using 0x9c000, 0x91004,
0x91000, and 0x94000 instead of 0x19c000, 0x191004, 0x191000, and 0x194000)?

Upstream Qualcomm TLMM drivers use offsets relative to the OS-accessible TL=
MM
register window (0x0f100000 on sibling SM4450) rather than the 1 MB wrapper
base.  Including the 0x100000 offset shifts all GPIO, SDC, and UFS register
accesses by +0x100000 when paired with a standard pinctrl@f100000 Device Tr=
ee
node, and breaks drivers/pinctrl/qcom/tlmm-test.c which computes GPIO
addresses as tlmm_suite.base + tlmm_test_gpio * 0x1000 assuming GPIO 0 star=
ts
at offset 0x0.

[ ... ]

> +static const char * const qup0_se3_l0_groups[] =3D {
> +	"gpio37",
> +};
> +
> +static const char * const qup0_se3_l1_groups[] =3D {
> +	"gpio36",
> +};
> +
> +static const char * const qup0_se3_l2_groups[] =3D {
> +	"gpio22",
> +};
> +
> +static const char * const qup0_se3_l3_groups[] =3D {
> +	"gpio23",
> +};

[Severity: Medium]
Should per-lane and per-signal mux functions such as qup0_se0_l0..l3 through
qup1_se5_l0..l3, phase_flag_status0..31, qdss_gpio_tracedata0..15,
cci_i2c_scl0..3, cci_i2c_sda0..3, atest_char_status0..3,
atest_usb0_testdataout00..03, cmu_rng_entropy0..3, tmess_prng_rosc0..3,
prng_rosc_test0..3, and qspi0..3 be consolidated into per-function groups
(e.g., qup0_se0..qup0_se5, qup1_se0..qup1_se5, phase_flag, qdss_gpio,
cci_i2c, atest_char, atest_usb0, cmu_rng, tmess_prng, prng_rosc, and
qspi_data)?

Every QUP SE in netrani_groups[] has at most one lane on any given pin, and
exposing separate single-pin functions prevents Device Tree nodes from
configuring multi-pin peripheral states under a single function name.  For
example, the companion binding example in
Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml assigns
qup0_se3_l2 to gpio23 and qup0_se3_l3 to gpio22, which fails pinmux mapping
with -EINVAL at runtime because qup0_se3_l2_groups only contains gpio22 and
qup0_se3_l3_groups only contains gpio23.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-netrani-tl=
mm-v3-v3-0-3bf3f0bbe5df@krgm.moe?part=3D2
