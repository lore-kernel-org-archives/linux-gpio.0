Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740755;
	b=AdbGR9NDfkSsqALLaffh4cI2/hEcvBZdVxgiVtlWM+kWQ+5/kqchmqlPHXwxMsRQuEMX
	 S2bznwrUoT1qQ94RV6cL58teSRr9e/CqNAqOxGKrUhR84sXOxrDS/HK+J/zezWwKdEYVW
	 YoT0X7CePDSWGmieipYILqylYseRs5MVUuxUlTXMCAa9n9WgJ4nB+LDCKbKxVJyvJoGEd
	 IJuv54SqZ8BZPB8jTZs5ZZqlmYnN3PtR0XW7y7Y6bn67QdqNQNe/4AKJlYyTJUQbljNTW
	 Y+oO8WnoS6iQAIx+ZeZ8jwntbsdF8fTYXWMeC4rnG2eNYkqIlEJC2VDJAYcSVqKIWGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740755;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lUVrEEup0iduKm2ysaKvaC3+0aRICQZ5+uk49T5xxiw=;
	b=zsvdLSsCKeQoEqZEyQhkdUd+VykMcEh33wu2Vy3Y9Q1Rege43tzeNNbD7KdLXqCpPXDd
	 FHVIKVLYhPiU0McsKGXAaCcXtBZt3XS5ZNUjaywGqVZ2FcbpppTQkrcN+NryUGV0WyVB1
	 vfC59fn0nGtr17Hqdbs83+DmQEwYjbzdWrJeEa5y4reWXGJHIqj4dTvmPCZiQSsXPUtFG
	 JVlnSSv8P5Kq+IFmAZcbG5rwlFBCP6VCa86UGGvHfcdCDKnTFGNRRN/TlGOJOGeTqv9gG
	 h04MQ8tGtbK7C/wGPI2NJvzFQDzpD9sg5XCaioB+r2qrjEu3evcAz3WYapvR7MI066Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+paqQmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CF606A329;
	Sun, 15 Nov 2026 11:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+paqQmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECFC1F0093B;
	Sun, 15 Nov 2026 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740754;
	bh=lUVrEEup0iduKm2ysaKvaC3+0aRICQZ5+uk49T5xxiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+paqQmIPpBb+l7FrPRKHvwyvu2J3lXL8UJLHBYhX0yerIiho5tvO+HVxHewXUYgq
	 FepWyXJX401wWC6v08lrLsYos6u+tMfBkewYpVZyn0x+JdShL2/jTHSot7YYybOuo+
	 BdBtl3JbHFiEDfy6J/rs2uSs+l4kyGvFCVgqkm+gNOKVdkBofWVaoZU9ffpHfDa2GL
	 CqKlot1WbuBkTMzPVExJJv1eF1ZwuxRpCePv0tyLpk+LWEfYwZsz0IBlMlO8clbg4l
	 2JqQlURjaF/psGX+2PtvFFbG3t0HhUkPdvLwMGUFenkVyjEflinXjWHfxmTYkLy1o0
	 4YKMFSUIG0c6w==
Message-ID: <sashiko-outbox-215438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-14-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-14-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:05:53 +0000
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
- [Low] arm64: dts: synaptics: deprecated cpu0-supply used in
  sl261x-rdk-common.dtsi
- [Low] arm64: dts: synaptics: underscore in soc_i2c0-pmux node name
- [Low] arm64: dts: synaptics: unused linux-event-codes.h include in
  sl261x-rdk-common.dtsi
--

commit f1ba81aeb15547b6a1942dc7df6778c88410e949
Author: Jisheng Zhang <jszhang@kernel.org>

arm64: dts: synaptics: add SL2610 family RDK boards

This commit adds device tree files for the Synaptics SL2611, SL2613,
SL2615, SL2617, and SL2619 reference development kits along with a shared
common dtsi.

> diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/=
arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> new file mode 100644
> index 0000000000000..78a9b28fdf99e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>

[Severity: Low]
Is the dt-bindings/input/linux-event-codes.h include needed here? Neither
sl261x-rdk-common.dtsi nor the board dts files that include it define any
input nodes or reference event code macros.

[ ... ]

> +	cpus {
> +		cpu@0 {
> +			cpu0-supply =3D <&vcore>;
> +		};
> +	};

[Severity: Low]
Should cpu@0 use cpu-supply instead of cpu0-supply?
Documentation/devicetree/bindings/arm/cpus.yaml marks cpu0-supply as
deprecated in favor of cpu-supply, and the dual-core SL2615, SL2617, and
SL2619 variants also define cpu1: cpu@100.

[ ... ]

> +&pinctrl {
> +	soc_i2c0_pmux: soc_i2c0-pmux {
> +		groups =3D "GPIO23", "GPIO24";
> +		function =3D "tw2";
> +		drive-strength =3D <7>;
> +	};
> +};

[Severity: Low]
Should the node name soc_i2c0-pmux use a hyphen instead of an underscore
(for example, soc-i2c0-pmux)? Using an underscore in a devicetree node
name triggers a dtc node_name_chars_strict warning when building with W=3D2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D13
