Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518179;
	b=D9+7ZYy64FdimioDSEDBsmaNuAJzEE+TvRYpqREBcOnb83P6P73mktUYGDM6j23lDD5K
	 yS7z0VCtASoP3vqMxiwkP7SQHGkQmlAgBPSQ4fBM5aDNM0yBhs7oq6S1/1WXRRKGnSdJo
	 PiOp8m2NY4mJvwPiIiUVPrPLDXqDpFaKjSEYH81wDn9076DFyfxqh7itPoq7x1+32QAqU
	 0L9vcgs9pdw5enuT/wb7PnZ2rii5QS/OhGViVTD2zBSYy8XDtq9bUiEJf6vn7fnDzA5d0
	 3nnP1i7lckdAGNdun3vEj7x8t6hIOg0tKyrDqSjPGrr9RxcqRak2HLvrNv9VnvyOdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BUI3QrQB1BJUGPwa+N4mF3mOXvaMkqHim7L200GYNiI=;
	b=zlKyuwoGEWk8aI99lcm7iDHdL6CNKGPOQVCBP0OLR0D7x6Oc5BKKd7afYcAFReJCm4vU
	 n4+47AFAqD4UijHigvLcomlB2254n+8s/O5VLDsib+x0264bxMC6mTjbr4mW7DgZmI4QU
	 N1CqGi89VVVye6avXRx7fe/QuZWIw9zay4EHSiJXhBfUDxv/QVCoNCkNPdR3vaalMsgal
	 2q5x10YfCMTpD/JUInkMP3ZUgqOdzb+v8BsI/VYXk8tvlWj9Qv2vXT7semZjbMsdtZieG
	 oZID2sNyJWchXLomgR0FHsU4eQVDQGn9QePXXxpta8CSdFdb5uZQnGIX2amFrazdKCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NtlFJNY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61E606A31E;
	Tue, 24 Nov 2026 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NtlFJNY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4212F1F000C0;
	Tue, 24 Nov 2026 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518178;
	bh=BUI3QrQB1BJUGPwa+N4mF3mOXvaMkqHim7L200GYNiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtlFJNY3F8BsVxy8D4gYycy0J06korYr/cIukIHv5P1w3NhWckY0UXjQliG388OU3
	 UsyzIFpnLjUCTb/q9UnBalhh+stm4LSLyS2HptwWIUe03Gbqy6ZZa8Zx9j5x1oVUL2
	 wjAQtcmgdbvrvE4DrCbIuwrthV4nL+CG+WwwuKAuQdPVOVDwxG5KNacVdKqkmw1Dmc
	 mvz78vWJcPfJ3KvM+zuR7z/O/zHGt03b/1B9ZReNOfMWSY9YL9Rnpu0SeKeqI9LyR8
	 z0AY4tpIFh4WxP9QZstvrKcm2v7+axiVoY1Ne9UMw/2PZ12EAiP0Oce44CiKhz7By3
	 kuwSzu64fM/dg==
Message-ID: <sashiko-outbox-231014@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-tlmm-v1-v1-1-0f84fa251b89@krgm.moe>
References: <20261124-netrani-tlmm-v1-v1-0-0f84fa251b89@krgm.moe>
 <20261124-netrani-tlmm-v1-v1-1-0f84fa251b89@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:02:57 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Low] dt-bindings: pinctrl: qcom,netrani-tlmm: minItems/maxItems under
  pins.items
- [Low] dt-bindings: pinctrl: qcom,netrani-tlmm: inconsistent GPIO
  counts in schema
- [Low] dt-bindings: pinctrl: qcom,netrani-tlmm: top-level
  additionalProperties false
- [Low] dt-bindings: pinctrl: qcom,netrani-tlmm: unconsolidated function
  names
--

commit e2f036cf198020ec46f2156c3d6bb3823fad96ba
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: pinctrl: Add Qualcomm Netrani TLMM

This commit adds the Device Tree binding schema for the Top Level Mode
Multiplexer (TLMM) pin controller on the Qualcomm Netrani SoC.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.=
yaml b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
> new file mode 100644
> index 0000000000000..f9af05dc86aea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
> @@ -0,0 +1,190 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,netrani-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  "#interrupt-cells": true
> +  gpio-controller: true
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 68
> +
> +  gpio-line-names:
> +    maxItems: 142

[Severity: Low]
Are the maxItems bounds for gpio-reserved-ranges and gpio-line-names
consistent with the 141 GPIOs (gpio0 through gpio140) matched by the pins
pattern below?

With 141 general-purpose GPIOs, the maximum number of discontiguous
reserved ranges is ceil(141 / 2) =3D 71 rather than 68 (which corresponds to
136 GPIOs), and sibling Qualcomm TLMM bindings with a dedicated ufs_reset
pin set gpio-line-names maxItems to the general-purpose GPIO count (141)
rather than including ufs_reset (142).

> +
> +  "#gpio-cells": true
> +  gpio-ranges: true
> +  wakeup-parent: true
[ ... ]
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|140)$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk=
, sdc2_cmd, sdc2_data, ufs_reset ]
> +          minItems: 1
> +          maxItems: 36

[Severity: Low]
Should minItems and maxItems be indented under pins rather than under
items?

Placing them inside items applies them to the per-element string subschema
instead of the pins string array, leaving the number of entries in pins
unconstrained during dt_binding_check validation.

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Low]
Does using additionalProperties: false at the top level reject properties
and child nodes inherited from qcom,tlmm-common.yaml, such as GPIO hog
subnodes matching -hog(-[0-9]+)?$ and pinctrl client properties?

Using unevaluatedProperties: false allows the definitions inherited via
allOf, makes the re-declarations of interrupt-controller, #interrupt-cells,
gpio-controller, #gpio-cells, gpio-ranges, and wakeup-parent redundant, and
interrupts can then be constrained to maxItems: 1 instead of interrupts:
true.

> +
> +examples:
> +  - |
[ ... ]
> +        uart-w-state {
> +            rx-pins {
> +                pins =3D "gpio23";
> +                function =3D "qup1_se2_l0";
> +                bias-pull-up;
> +            };
> +
> +            tx-pins {
> +                pins =3D "gpio22";
> +                function =3D "qup1_se2_l0";
> +                bias-disable;
> +            };
> +        };
> +    };
> +...

[Severity: Low]
Should the function enum and example use consolidated function group names
(such as qup1_se2, phase_flag, and qdss_gpio) instead of raw per-lane and
per-index signal names (such as qup1_se2_l0..l4, phase_flag_status0..31,
and qdss_gpio_tracedata0..15)?

In addition, uart-w-state assigns qup1_se2_l0 to both rx-pins (gpio23) and
tx-pins (gpio22), whereas a two-pin UART cannot mux both RX and TX to lane
0, and in the accompanying driver gpio22 and gpio23 only support
qup0_se3_l2 and qup0_se3_l3 while qup1_se2 is on gpio18..gpio21.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-tl=
mm-v1-v1-0-0f84fa251b89@krgm.moe?part=3D1
