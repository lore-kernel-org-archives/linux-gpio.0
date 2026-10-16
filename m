Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A75431499;
	Fri, 16 Oct 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161944; cv=none; b=AVzdSRqEv7FPsBzt61R6itD7pa2tZDNrmymi328gTg5+VXiZxXIyiY6tRHyUtVLPdmw4ZXe2JOirlsbIF5qWL4zxpzZOBFj2Pj3hGUgPauIivlBjFrn7KPIFJeOcD1D/QFQhPEmqaUCamfVto//sRJzMR2if1C9g+wNGJ4Abkb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161944; c=relaxed/simple;
	bh=3s5ugGRPbO0TrWCKkoYaqHn73Le4oxiDDewOm90/XfU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gX5+fpovY/SNu4rLXps1sdFJUnIUxtz/Bl+geGnPdNp7pQFoYv84vFYMJkFfnRFqhZME8smdnQFpHUE+WxMtQt0WpOMupSUSFxHw3monzipKjh5YZ/PCqynxDWAGKlMPApT0KVP6e7vqiPCW9dhBtcrhYzpTPo03GYKe9o+Du5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joTCJ4Hf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joTCJ4Hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BD51F000C4;
	Fri, 16 Oct 2026 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161942;
	bh=BLuW78A8ZTSAuFI0LxkA4dnHJ4ZWett+r3n9qpE08nA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=joTCJ4HfrbPROG0cdPf0ATpHeNgAeITmHlaxEpy16J2yuJl139FDGUAobY1EghwHn
	 hcEa3D0ICL0YcI+55KCDluEfYnOMGItTxXBhVBILSzDt+3SSpfw5lzs08TL1QgiK1l
	 0IttFQ9/MYxBgM441/jiW8sdusylTKRbOlYf4Ugdw7cdMx+xihu5atmFrIV+qc7tMB
	 o50kfpA3PuJdc2GGh14I2QxpmTcU1VLHKQsJi1D1EN1HHOIMf42KQBDHsa+B/kXj1a
	 8sEHYDmMfX9tBeHtF2XSSUdz5PS2ev/2Vfu2Mh+/BxMW1g7nixQK0om3mEXdoS6V+e
	 mYZQ9di/j4YIQ==
Message-ID: <sashiko-outbox-174481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:45:41 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: dm816x: PIN_INPUT/OUTPUT macros implicitly enable pul=
ldowns
--

commit adcfa5381ee4b63a7366410a6458384ec5d3b10f
Author: Ettore Chimenti <ettore.chimenti@linaro.org>

dt-bindings: pinctrl: Add devicetree bindings for DM816x SoC Pinctrl

This commit adds devicetree bindings for TI DM816x SoC pinctrl configuratio=
n.
It uses the OMAP2/3 definitions but attempts to handle the inverted
pullup/down enable macros specific to this SoC.

> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/p=
inctrl/dm816x.h
> new file mode 100644
> index 0000000000000..15aa15bca9bd5
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/dm816x.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * This header provides constants specific to DM816X pinctrl bindings.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
> +#define _DT_BINDINGS_PINCTRL_DM816X_H
> +
> +#include <dt-bindings/pinctrl/omap.h>
> +
> +#undef PULL_UP
> +#undef PULL_ENA
> +
> +/* DM81xx mux bit defines */
> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */

[Severity: High]
Does this implicitly enable pulldowns for all inputs and outputs?=20

Because the DM816x SoC uses inverted pull-enable logic where bit 3 being 0
enables the pull resistor, inheriting the generic PIN_INPUT and PIN_OUTPUT
macros directly from omap.h will evaluate them with bit 3 as 0.=20

This makes it difficult to configure floating inputs or plain outputs witho=
ut
pulls using the standard macros. Should this header also #undef and redefine
PIN_INPUT and PIN_OUTPUT to bitwise-OR the PULL_DIS flag so that pulls are
disabled by default?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-patch-ekto=
r5-dm8168-dts-v1-0-b4ce30217028@linaro.org?part=3D2
