Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA87E34EF05;
	Fri, 16 Oct 2026 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162146; cv=none; b=YRZJWRr3KP5aru1q92gftEkRbtBiO6EinZN6LOgX9vV/1zrzlNb2v8d/bjaVcSVVb1qvdTVqSVDffGgASNuUfCuW8UO9W9eqsiOMPPDgbG+aa6VrE+Q8tWqcXpkN42cXYNwqEFmFDq4+/T247IsfJGdlDdmHY9wg/fBJl3SOSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162146; c=relaxed/simple;
	bh=ISUrIXIirbsXlKjdYejyZY4Th/OcH7C6LuywOyGI9kQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=u2g3QBf9bFFl3ePLmJZXAKyp0781g/rx0tY8rpij/mYXakTZ+q81MPWZjhKPe4kIqxGQ2RKAAg2DPXFeRZfbnoyjOoTyxFnlmEWJkGvOegy1SmX/nncPeeUnMVVXlead6WinTXozaH3DQiX/2iCMRf49eGLzvz2swgYxikAKwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCKAM1uy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCKAM1uy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263731F000C4;
	Fri, 16 Oct 2026 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162145;
	bh=Z686EOQZ3a6HMTVPVej/OuMtWjj0vl6ySbGyQjIf7Rw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UCKAM1uyxX5KGVqwfmo74WhfbR+Nvc6htCHQFbktjOMyWm4qlm1Xch3byUQm664Bo
	 Cg1Tl3+WcK7U4VwtzVMw6/+dehSl/2t4wVKJFUlN4HhvPNxoNx2/s4G0QCo+ZCUvQo
	 kXNT7WVjctNkuZEAj8JbL3K2yieOT4TCuIQsLE0Flv1AFQ3t34A66hjrb+tWwkndwR
	 5TYwsH5PlzEpQDHF9FVItMk+/UZuXmc/sppdmNC1qX6Sa/VJqZ4Ci+LNhq86/Mv/XQ
	 S3a9gpyhQj/oI/IwmZycqhCjLs3NcHUHxlx6mSBHdje8wP9v6BbfdPkPpfKK9Wclle
	 Ux0BfhdwuglVQ==
Message-ID: <sashiko-outbox-174489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-3-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-3-b4ce30217028@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:49:04 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pinctrl: dm816x API provides broken PIN_INPUT/PIN_OUTPUT macros =
and omits DT fixes
--

commit 8bc3ab0228d1fbf7757bd0740351d9face4c0e7c
Author: Ettore Chimenti <ettore.chimenti@linaro.org>

ARM: dts: omap: dm816x: use dedicated SoC pinctrl

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.

> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti=
/omap/dm816x.dtsi
> index ee0090f7aa64e..de4d48babf778 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -3,7 +3,7 @@
>  #include <dt-bindings/bus/ti-sysc.h>
>  #include <dt-bindings/clock/dm816.h>
>  #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/pinctrl/omap.h>
> +#include <dt-bindings/pinctrl/dm816x.h>

[Severity: Medium]
Since dm816x.h inherits macros from omap.h, will using PIN_INPUT or
PIN_OUTPUT unintentionally enable an active pull-down on DM816x?

include/dt-bindings/pinctrl/omap.h defines:
#define PIN_INPUT        INPUT_EN
#define PIN_OUTPUT       0

Because neither includes bit 3 (so it remains 0), and DM816x has inverted
logic where bit 3=3D0 enables the pull resistor, these macros now actively =
turn
on pull-downs. Should dm816x.h #undef and redefine PIN_INPUT and PIN_OUTPUT
to include PULL_DIS?

Similarly, does this inclusion leak inapplicable off-mode macros like
PIN_OFF_OUTPUT_HIGH into the DM816x namespace, where they might write garba=
ge
to inapplicable padconf bits if used?

Additionally, while this commit changes the header to allow fixing the pull
logic, does this leave pins in arch/arm/boot/dts/ti/omap/dm8168-evm.dts with
unintended pull-downs?

For example, SPI_SCLK is defined without a pull flag:

arch/arm/boot/dts/ti/omap/dm8168-evm.dts:mcspi1_pins() {
    ...
    DM816X_IOPAD(0x0a94, MUX_MODE0)    /* SPI_SCLK */
    ...
}

Under the old OMAP rules, omitting PULL_ENA disabled the pull. But with the
new DM816x rules, omitting PULL_DIS leaves bit 3=3D0, which enables the pul=
l.

While follow-up patches in the series fix the SD card pins, do other pins
like SPI_SCLK and SPI_SCS0 need to be updated to explicitly include PULL_DI=
S?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-patch-ekto=
r5-dm8168-dts-v1-0-b4ce30217028@linaro.org?part=3D3
