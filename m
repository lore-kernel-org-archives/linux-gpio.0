Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741188;
	b=LwlmKAH058IBOqWehXFcmRiMJSSAZhGmcsbR49rqjjShiZ64A0IQW3lnrqU8wUf4J1Af
	 yfUhrRS4wSq7PqREBb/IHWiln2DYID3Odmpeg+T8SIGUjfVPlhQmuNyxo4n9hbypO9zwt
	 rW91CROXvIqsG2n87aibB+o3KOHG+OEDm9OPdweq8+6kKNjX14eMwl++CqlSdXr/uwmbP
	 h50sf8QRs24sRR2VeopBrPpBBeYO0Z1rfoz8p3caY0YSLc6l8X67Dj1lGGpAU6/dm6anB
	 4jTYBAdCwFg7GeNKIlGgIOnaY6o3z1FsM7igMZlZp/JHhMl4uUlXIFXnD1Cav/E9eBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZF/ACrdjw43KBD9DKhOAY0DkIDQhcMKSARbTFRto1ys=;
	b=y3m6ZwDDfQEfDp2xNvJ1RrBkaOHfe6yZyko+ufohDisB7CvaPhGFIV5GO5GGYD3Fd3Wt
	 xwdd7X9SGlXG56XlPV5MaosQsi8vW7Me6jMWXCpnvrDNCa7+eqgqMbfQI+K+vfBs/LEa7
	 7ZgOLgUaeJXnm7jBQeTjKQnoZFoAPVdG1co5Dy0dC6ASJefGvlgF/fxYj+qRjF9kZjvEV
	 9LEjcKoYs+mhVqoMcMN2oxVCOcXGOZimJ4odgQhyy9T0qYcX+lTfkewvoYIGI1aps4Aor
	 8k1B7lkZk4E1/exHyIVPLYt8//oC3dlruioql3+Z/RVHRp9g7PVW7I8G74RKTiYS6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UOOoUZGe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD8606A31F;
	Sun, 15 Nov 2026 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UOOoUZGe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159901F000C4;
	Sun, 15 Nov 2026 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794741188;
	bh=ZF/ACrdjw43KBD9DKhOAY0DkIDQhcMKSARbTFRto1ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOOoUZGe/sOPaYfKUeOOVupGlHqp77lOX9Nhr5wcYmmF2Ls4rqb2NQAHhYPKGz98J
	 SgCPI7wzt8CMYRokenKP8VkX+RezVoBO/LUjzNF1SVp/t6RgF1mEzYNaNs5c14BhFk
	 doYLUrKiZrBRvbTshnuM0ORpOHyk9/WedFNGrzn9lJNXIGvxWHsKgBL+GhREhX2b3b
	 jFm8LdRnfSTYKWvsw27KS7hAKMdbHWdg2a7DZIxK0HhdG764m0dJvLH47j+N0a0sl7
	 10hKtGmwhfoPgrjo7meyfBftErywrdqNBcRnvs0IHBX92XTuGsULtDJ9YTCPgl/A8c
	 JGbZBKjpVTXhQ==
Message-ID: <sashiko-outbox-215445@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] arm64: dts: synaptics: add SL2610 family SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-13-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-13-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:13:07 +0000
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
- [Low] arm64: dts: synaptics: missing root compatible property in
  sl2619.dtsi
- [Low] arm64: dts: synaptics: duplicated cpu1 and pmu nodes in
  sl2617/sl2619.dtsi
- [Low] arm64: dts: synaptics: optee node placed under root instead of
  /firmware
--

commit 9dec2dc5b8adc9799e77b0f1baf814fa359dd8c4
Author: Jisheng Zhang <jszhang@kernel.org>

arm64: dts: synaptics: add SL2610 family SoCs

This commit adds devicetree files for the Synaptics SL2610 family SoCs
(SL2611, SL2613, SL2615, SL2617, and SL2619), describing CPUs, GIC,
system controllers, and serial, I2C, I3C, SPI, and GPIO peripherals.

> diff --git a/arch/arm64/boot/dts/synaptics/sl2611.dtsi b/arch/arm64/boot/=
dts/synaptics/sl2611.dtsi
> new file mode 100644
> index 0000000000000..663fe6034ba05
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
> @@ -0,0 +1,457 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/clock/syna,sl2610.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/syna,sl2610-reset.h>
> +
> +/ {
> +	compatible =3D "syna,sl2611";
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +	};
> +
> +	optee {
> +		compatible =3D "linaro,optee-tz";
> +		method =3D "smc";
> +	};

[Severity: Low]
Should the optee node be placed under a /firmware container node?

Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
places optee under /firmware, which of_platform_default_populate_init()
looks up directly via of_find_node_by_path("/firmware") before populating
the rest of the tree.

[ ... ]

> diff --git a/arch/arm64/boot/dts/synaptics/sl2617.dtsi b/arch/arm64/boot/=
dts/synaptics/sl2617.dtsi
> new file mode 100644
> index 0000000000000..a0de686d1fae5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2617.dtsi
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include "sl2613.dtsi"
> +
> +/ {
> +	compatible =3D "syna,sl2617";
> +
> +	cpus {
> +		cpu1: cpu@100 {

[Severity: Low]
This isn't a bug, but sl2617.dtsi and sl2619.dtsi duplicate the entire
cpu1 and pmu definitions from sl2615.dtsi.  Could they include
sl2615.dtsi and override the root compatible property, the same way
sl2613.dtsi includes sl2611.dtsi?

[ ... ]

> diff --git a/arch/arm64/boot/dts/synaptics/sl2619.dtsi b/arch/arm64/boot/=
dts/synaptics/sl2619.dtsi
> new file mode 100644
> index 0000000000000..96bd58bbed3e1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include "sl2613.dtsi"
> +
> +/ {
> +	cpus {

[Severity: Low]
Is the root node missing compatible =3D "syna,sl2619"; here?

Unlike sl2615.dtsi and sl2617.dtsi, sl2619.dtsi does not override the
root compatible property and inherits compatible =3D "syna,sl2613"; from
sl2613.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D12
