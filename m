Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100681;
	b=CWduSiiIQCcqT+A3EIsxsFLUVGnx4kmK+3qGinaUiudPyrNWWjQmPfO6PtYaVelMI0Ia
	 2q/pi4pqYtSn57MIgtxK6JhSMzYrdegmHT5GsxbmrbWqISAomso7HDM3IIjVtfHeD4+ZT
	 1ya6EeUt8g0QDON+LIqGVikRYPsHkpN+SoUH0FOBgYNAENnMJgT/agGFj13aLGa/N59u0
	 wZSMGQeEjZr6NNc/Cry5PBB+erp0KkVnMibyQalGZFJkSW/cT4o7wJwW2FPyVzrxSJjhw
	 plRpyxAr3TfJpwqBlyDNQ9xbfx767u+8UqGSTBs+iVJtFpa/mX+Q/y0hN4Czm8nEC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zT2ox65hYWi/OvDC3GEmx4OPsZUV/KT9lVAWo7gAtJ0=;
	b=vUzA5gBLYkBHjtAhfpkzZW8u2jDYF0ScURCCaazu6CYuUbYXWmOqbJUp0a+FnFs/zAvf
	 nNgBcYq4cIHP5nmQnKs/KEtMXnyFrfVjLwdaAbOAFry15ulWg6xshRmh6PbQ2eZys6lET
	 3DgiHZ1HkyNcvb3tOVHbrKS193OQg8J1tBYlpyuLung44ZwtIeyHkUyx+ubNEmOGUo3C7
	 Sj8wNzRzVJXQnUbP6GA+BNLDcdNqdgtKj6d2qKrD6xd1J+OIE+5RYCxge87NdO57rQvjL
	 Yov9BWVzkhU5RH520KBjKsk0Q2vweF8sG7y/7SkXDYgM66veJvP9eHbii1hdbcbK+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FA+jX59t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAABE606A31D;
	Tue, 27 Oct 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FA+jX59t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C9E1F01828;
	Tue, 27 Oct 2026 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100680;
	bh=zT2ox65hYWi/OvDC3GEmx4OPsZUV/KT9lVAWo7gAtJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FA+jX59t/VBnjH9rVxgY9sudePKiCTDL7Gf81MZejhtIoJN2wwnZaUw8HieakkPOY
	 lQwFurcM48NXWImVLZxLjpExdhnD1JBujZPxtKxtbLXd2UctpO+Oco6uhTVl13jRvP
	 1ayOOKqvakXQhYnb3JEbo8S/ORUEFnLharY78kTRYYYBE5zhAzf/oqMh6B2LguA1tD
	 AzQ9DLX0Hhnm2oW+EedL9xweZAoRybyxGh3SQvO7q09j+CgpjzA59H3erGu4Yz9smn
	 6V2lUko52f9Bs//UEYm4RKbANZJbzW0MW+Y2Rp75e5L4vReV6cWjpQbolSoRgtjqPX
	 TsM4DD8g1IYnQ==
Message-ID: <sashiko-outbox-186446@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:31:19 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: clock: qcom: invalid required assigned-clocks in cl=
k-gp-mnd
- [Low] dt-bindings: clock: qcom: non-standard schema filename and clock-na=
mes suffixes
- [Low] dt-bindings: clock: qcom: unused gp_mn label in binding example
--

commit 6e14f976e140401abb92618c1275969f3fecf275
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider

This commit adds the YAML device tree binding schema for the Qualcomm
Peripheral Web's PDM GP_MN fractional clock divider.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> new file mode 100644
> index 0000000000000..8141f392c5d70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  The Peripheral Web's PDM GP_MN clock divider receives an input clock
> +  (TCXO4) with frequency Fin and generates an output clock with
> +  frequency Fout =3D Fin * (M / N) and a duty cycle controlled by D
> +  and routed over a gpio pin.

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,sc7280-gp-mnd
> +      - items:
> +          - enum:
> +              - qcom,sa8775p-gp-mnd
> +              - qcom,qcs8300-gp-mnd
> +              - qcom,qcs615-gp-mnd
> +          - const: qcom,sc7280-gp-mnd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PDM XO4 source clock
> +      - description: PDM AHB bus clock for register access
> +
> +  clock-names:
> +    items:
> +      - const: pdm_clk
> +      - const: ahb_clk

[Severity: Low]
Could the schema filename, compatible enum ordering, and clock-names in
Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml be updated to
follow Documentation/devicetree/bindings/writing-bindings.rst?

1. The schema filename and $id use qcom,clk-gp-mnd.yaml, whereas the
fallback compatible is qcom,sc7280-gp-mnd (and none of the compatibles use
a clk- prefix). Should the file and $id be named qcom,sc7280-gp-mnd.yaml?

2. In clock-names, pdm_clk and ahb_clk include redundant _clk suffixes.
Should these be named pdm and ahb instead?

3. In the compatible enum list, should the entries (qcom,qcs615-gp-mnd,
qcom,qcs8300-gp-mnd, qcom,sa8775p-gp-mnd) be sorted alphabetically?

> +
> +  '#clock-cells':
> +    const: 0
> +
> +  assigned-clocks:
> +    maxItems: 1
> +    description: Parent clock phandle used to set the input frequency.
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +    description: |
> +      Rate for the parent clock in Hz.
> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - assigned-clocks
> +  - assigned-clock-rates

[Severity: Medium]
Should assigned-clocks and assigned-clock-rates be omitted from properties
and required in Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yam=
l?

In dt-schema, assigned-clocks and assigned-clock-rates are standard optional
properties automatically allowed by the core clock schema whenever clocks or
#clock-cells is present, even with additionalProperties: false.

Defining them here with maxItems: 1 for the parent clock and listing them in
required causes dtbs_check to reject valid device tree nodes that either
rely on the default 19.2 MHz XO rate without explicitly assigning a parent
rate (which clk_gp_mnd_probe() in the driver also handles as a fallback via
if (!clk_get_rate(clk)) clk_set_rate(clk, 19200000);) or specify more than
one entry in assigned-clocks (for example, configuring both GCC_PDM_XO4_CLK
and the gp_mn output clock rate on the provider node).

Also, the description block and commit message describe the input clock as a
fixed TCXO4 clock, whereas assigned-clock-rates and the accompanying GCC
changes configure a parent PDM XO4 divider clock supporting 19200000,
9600000, 6400000, and 4800000 Hz. Could the description be updated to match?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    gp_mn: clock-controller@88d3000 {
> +        compatible =3D "qcom,sc7280-gp-mnd";

[Severity: Low]
In the examples block of
Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml, the gp_mn node
label on clock-controller@88d3000 is never referenced via &gp_mn, which
triggers an unused-labels warning when running scripts/dtc/dt-check-style in
strict mode. Should the unused gp_mn: label be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-b4-pdm_clk=
_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com?part=3D1
