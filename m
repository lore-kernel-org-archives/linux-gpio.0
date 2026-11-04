Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792825;
	b=0gDxqz5upB6M3XzhL9qPYcvG0nE7MxLaceFo9c2e5iDXRJZ0xLg8vR2E1BeIiIhsmWjC
	 gbFKiTRCgVEhkjgLNl3dRnN8E+F/6k3LImweH7nl3JiLr8sslF09zeXKMRbAIsoXphevK
	 oKWnTKym2bb+VZRh3VaYJVpPEeFmYCfMwF7dT7miO2/Tcai7Bkyop6YBQyNiYV33mzuJA
	 qycvG3Fty5+VDzAurt6/0EGrkjxPcqeqtHIUd4KEgbxztV/v7HcVwZFldk9CA8lJrAhrS
	 57D722ZzEIxPlIkUw+QbTSr/cMWdzON4DMur3bbFfBhzFVllQhuCxsHjhqXSNKf87Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792825;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HHRWFn0WSb68OC9ynIrbQ6H1Mr5GN09CNv3bMlQD558=;
	b=cnw1bIQX32lz5aBwFfpqJz55uiNdQO4nHhycvmFqcIMWADS2v4YeS9H7qai7W26e9rf/
	 +NTexTwuesPEXPcp9D/h9xRxUHRqIngSqs9ZQ/stOxIsPzTBssXEF7ynfIKOXzfyoIwee
	 fJJW2Hq563zMihObAHb8mwlDbtLjaai4Wy7+RWvWJCZ+lsu9tyXQJQavwn9A42TgdVoQK
	 C8rHSHBsHAn9ACuYT8Po1kcQUszes0YSi8iX4QB3aye5M+B1kyvgwXQOdd06Hfzavaejc
	 i9OYpfrgrBeMYloJQOlJwcAhxW2/8rt3FEHEAisYLoAyUiT/UMysc3djiyLNF7FNtnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJI0Ctd9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405DB606A329
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJI0Ctd9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83071F000C1;
	Wed,  4 Nov 2026 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792824;
	bh=HHRWFn0WSb68OC9ynIrbQ6H1Mr5GN09CNv3bMlQD558=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJI0Ctd9E9kdQwc+W1VmvXHO3pHPdZPM59Z+orxd6WzuON1V5XwD0ObBlCKTmDbR5
	 6JYQUOISLWTIbsSR+MYBkJz/71SCD+HGZdnCnT1o0sSwyIRs5T2aU80ZeXB8A6jQRT
	 9JrXZoLplhPmtzd783Uar/3Nth7kDwLWuS13kZp9R8VJmw6j/kW0QPNGfOp0rJJ5MO
	 OnMN/4CBOOKhAOkYk6D15sjiEzb2okEAzjppe99gieQ2N9BVINEjYFsfOD0MMFyu0Z
	 KaG7HGutSQTzmYz8oWji9Hab7WivbEOQL9JTuXqJE909elY4KUGqTZkWq9eto77Ck6
	 Odk7dBJLRLKWQ==
Message-ID: <sashiko-outbox-197210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:47:04 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] pinctrl: nxp: s32g2: broken COMPILE_TEST prompt with strict ARCH=
_S32 dependency
- [Low] pinctrl: nxp: s32g2: missing Signed-off-by and revision notes in co=
mmit log
--

commit d48093c09173ce7575fa22c4980bf4ece96a9965
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

pinctrl: nxp: s32g2: Enable by default on ARCH_S32

This commit defaults PINCTRL_S32G2 to ARCH_S32, restricts its Kconfig prompt
to COMPILE_TEST, and expands its help text.

>     pinctrl: nxp: s32g2: Enable by default on ARCH_S32
>    =20
>     The SIUL2 pin controller provides the pin muxing used by peripherals =
on
>     the supported S32G boards: the S32G2-based S32G274A-EVB and
>     S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
>     some peripherals never finish probing and a defconfig kernel cannot
>     boot to rootfs on these boards.
>    =20
>     As the driver is required by every supported S32G board rather than
>     being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
>     user prompt only under COMPILE_TEST.
>    =20
>     v2 -> v1:
>     - list the S32G boards that need the pinctrl driver
>     in the commit message
>     - drop the v1 arm64 defconfig change
>     - default to ARCH_S32 in Kconfig instead

[Severity: Low]
Should this commit include a Signed-off-by tag from the author, and should =
the
"v2 -> v1:" changelog notes be moved below the "---" tear line so they are =
not
recorded in the permanent commit history?

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
Does gating the PINCTRL_S32G2 prompt on COMPILE_TEST while keeping the stri=
ct
ARCH_S32 dependency work as intended?

In drivers/pinctrl/nxp/Kconfig, both PINCTRL_S32CC and PINCTRL_S32G2 depend=
 on
ARCH_S32 && OF without "|| COMPILE_TEST":

config PINCTRL_S32CC
	bool
	depends on ARCH_S32 && OF
	...

config PINCTRL_S32G2
	bool "NXP S32G2 pinctrl driver" if COMPILE_TEST
	depends on ARCH_S32 && OF
	default ARCH_S32
	select PINCTRL_S32CC

Because the "depends on" expression bounds prompt visibility in Kconfig, wh=
en
ARCH_S32=3Dn and COMPILE_TEST=3Dy, PINCTRL_S32G2 still cannot be enabled for
compile-testing.

Conversely, when ARCH_S32=3Dy and COMPILE_TEST=3Dn, the prompt and newly ex=
panded
help text are hidden, and PINCTRL_S32G2 is unconditionally forced to y.
However, ARCH_S32 covers non-S32G platforms in
arch/arm64/boot/dts/freescale/Makefile that do not use the S32G2 SIUL2 pin
controller:

dtb-$(CONFIG_ARCH_S32) +=3D s32g274a-evb.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32g274a-rdb2.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32g399a-rdb3.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32n79-rdb.dtb
dtb-$(CONFIG_ARCH_S32) +=3D s32v234-evb.dtb

Should PINCTRL_S32G2 keep its prompt unconditionally visible so it can be
disabled when building for other ARCH_S32 SoCs like S32N79 or S32V234, and
should PINCTRL_S32CC and PINCTRL_S32G2 depend on "(ARCH_S32 || COMPILE_TEST)
&& OF" if compile-test coverage is desired?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113905.9658=
2-1-khristineandreea.barbulescu@oss.nxp.com?part=3D1
