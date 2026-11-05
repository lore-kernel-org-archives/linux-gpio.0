Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888573;
	b=s8ehPvglDAlw32V7cVo926AzzJWEfClHiVuhMY4mWRudh2EEAoSar52qhtEfp25HxIzU
	 SQMKUpPmIsPJq+hF5xk8n2SdhVLT62lCj6+5pU360lTDPftxcQdiQgT7Z1oGcwAceNS2j
	 Q3RxdXVlcH2J6Rdn7dkQaGb2Oke5KBlipZOUfnujPRUMs4lCAyUj17DDee0+jgAAD4GK1
	 Aqp9wiOHEfI9RDBgtwOVwUT2He+/4mqcM4cy6wGidoFRoJ5Kf0IGYAV/pOCcCqqUfwFE4
	 xYghfgbzugfkzFaFNpMqu9lL+WuCqO6IK7wxkI+/D3yF1dvDKVzCqOvc1wNBK1IkgKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888573;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XjrY8UgRoVN4jYQCQ78HAcD/mxdonyUgWpg8s0a/R9E=;
	b=jBA14KYGz79fGHZ62SxpTNApWkiZwYd8JwzTLSaNbae2Nq/CQ3qTHIENOrOOJw0XOFPC
	 0Vw27aQjJLc3aP1Hj4SiGVQ564iNv47liprvl3V5RpSd7mpG31ufMNsIjGbC9dECvuPeA
	 SVL3abujiqId+ImhgnfEe+1K3PEv1azQemz3eLukiG4isBeJJtUjazfJ7l6vL4SzJbvzi
	 3z1mdC/dYvMXuGTclSW3ACN+O6/ahxaLXeQJuPWsgXL5srDxoWVh5kEFHzrA2c7ZYXO6N
	 yn/4z3dzs7BMKL4HPTZmQzMkaAOm2Q7EHRjvCTvYLYmMjL3NsfJ0RadU0y69VR3rR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjggjMSz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27045606A332
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjggjMSz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8A61F00919;
	Thu,  5 Nov 2026 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888572;
	bh=XjrY8UgRoVN4jYQCQ78HAcD/mxdonyUgWpg8s0a/R9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjggjMSzFXFC+Nz6Tupdco/I51JZM1iLktg9TNAPmu385TxPP5Wh5fzZd7j0dwEco
	 ZHVuAo2n5Corp160ipF01g5O/pNIZ3FEpP/iHLRWX44Wa16M7hfXdUvOf2VNGAQlVP
	 /GgkwxA4eqYpLJq24FpzOQZq5D0t5695rmWFIL5Hxm8Wxb2WNlA6Py3q8/Ss37G7Mt
	 mz0TaV7iO7SB2XyN3tpjx2loKtpci+CV1VuGaJvbDsbhpaVWWkuedMDwzhci8NxBaZ
	 0y1kDYnoBQ6ZioelAhSlkTg5r4h7Cg23lwauNmwJc5r3Y0iZtxMgLQj3L22FFLFBC4
	 QZzGQu6rStsrQ==
Message-ID: <sashiko-outbox-199237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:22:50 +0000
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
- [Medium] pinctrl: nxp: s32g2: broken COMPILE_TEST prompt with strict ARCH=
_S32 dependency
--

commit 065380d0c7f62b7d0370fd1bcacf175935178d8a
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

pinctrl: nxp: s32g2: Enable by default on ARCH_S32

This commit enables PINCTRL_S32G2 by default on ARCH_S32 and restricts its
Kconfig prompt to COMPILE_TEST so that S32G boards have the SIUL2 pin
controller driver built in by default.

> diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
> index abca7ef97003d..d6d97c944b94e 100644
> --- a/drivers/pinctrl/nxp/Kconfig
> +++ b/drivers/pinctrl/nxp/Kconfig
> @@ -8,8 +8,14 @@ config PINCTRL_S32CC
>  	select REGMAP_MMIO
> =20
>  config PINCTRL_S32G2
> +	bool "NXP S32G2 pinctrl driver" if COMPILE_TEST
>  	depends on ARCH_S32 && OF
> -	bool "NXP S32G2 pinctrl driver"
> +	default ARCH_S32
>  	select PINCTRL_S32CC

[Severity: Medium]
As reported by Sashiko on v2 [1], does gating the PINCTRL_S32G2 prompt on
COMPILE_TEST work as intended when both PINCTRL_S32G2 and PINCTRL_S32CC keep
a strict dependency on ARCH_S32 && OF?

In drivers/pinctrl/nxp/Kconfig, PINCTRL_S32CC also requires ARCH_S32:

config PINCTRL_S32CC
	bool
	depends on ARCH_S32 && OF

Because a symbol's depends on expression bounds its prompt visibility, the
prompt and help text for PINCTRL_S32G2 are only reachable when ARCH_S32, OF,
and COMPILE_TEST are all enabled simultaneously.

When ARCH_S32=3Dn and COMPILE_TEST=3Dy, depends on ARCH_S32 && OF evaluates=
 to n
on both PINCTRL_S32G2 and PINCTRL_S32CC, preventing the driver from being
enabled for compile-testing on non-ARCH_S32 builds.

Conversely, when ARCH_S32=3Dy and COMPILE_TEST=3Dn, the prompt is hidden and
PINCTRL_S32G2 is forced to y with no way to disable it, even when building
for non-S32G platforms in the ARCH_S32 family found in
arch/arm64/boot/dts/freescale/Makefile:

dtb-$(CONFIG_ARCH_S32) +=3D s32g274a-evb.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32g274a-rdb2.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32g399a-rdb3.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32n79-rdb.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32v234-evb.dtb

Should both PINCTRL_S32G2 and PINCTRL_S32CC instead use depends on
(ARCH_S32 || COMPILE_TEST) && OF (or keep the prompt visible so non-S32G
ARCH_S32 builds can disable PINCTRL_S32G2)?

[1] https://lore.kernel.org/r/20261104113905.96582-1-khristineandreea.barbu=
lescu@oss.nxp.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105141347.4888=
50-1-khristineandreea.barbulescu@oss.nxp.com?part=3D1
