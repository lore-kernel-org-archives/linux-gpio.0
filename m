Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596271;
	b=zoN9zmt7v+dBmnAocNSRSkjZyZ/OqWelDLoPajIBayWieFyhk5aI9oPhIXC8B9J/fzhL
	 epAT+9GR1Eayv+xdhU5I0wHfJBs7h1PPRH1aN9W2wVAWzjAVQG8gdQa+u8zSwfYS+f6C7
	 A3waLrIK4leeJuALxXXe6m7uoMM611UdWjC3XT/AE+pP0MpqOgEmauPCiTptUjF32DKUV
	 JgtWKXhGtYg5EP0Pt02pT5ZdHcaPqg5YfOFv8y80r/bYdKmVyS14zJXkzwxoO17P8w/q3
	 dAJZ1IHEsqlDhJF2IsbZLHuuZO68wzvPIM4SlD3kMO27J8q376YRH6lowMsCTxSS+4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EOI7EcoMDFR1JLtT4B1tTONbkLbkYKJqeMvbtc3fv7U=;
	b=LYO1pfQLyiQMwYJwSytbyv6qopIz9+QvbPk6e47zNHV8cEcvFRHyYG76pWlEaOKmvlPK
	 V6/x4JP4pF3gWrKB1uHTc+HpA1K7X2tR54dkdFNEx7gXK8tuIkcPTt9phtjr/lslfknd8
	 Yq+XSFcbk0zaMnFonNgXG3TOuTn2a3K/x+nYjo9ok+FCi9XKfDqVMAVzxVEc0NUXWXsm9
	 pPlv9SQYLDM6l5yeCu5NgjsSqZJA1EYLMo42N6xp6UQdKsSNzN4MHgcG1BFFwmWmGDOJ9
	 NC6gu1p8SyTrqBeT6ngVj2d0dllmBN7PW9gDq4Ph3eGSlXR9X5YUw9X5RJxgt1Y441w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J13jsIkw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CFE606A32E;
	Fri, 13 Nov 2026 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J13jsIkw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9391F000C8;
	Fri, 13 Nov 2026 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596270;
	bh=EOI7EcoMDFR1JLtT4B1tTONbkLbkYKJqeMvbtc3fv7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J13jsIkw35TrYx2bmhYVQv2e7pQtL0RhNMGegBAHA8cMnl8kw8F2dxkGj5oD1qJjZ
	 Y4vVH37WgLbFsyCG8hinaAd54fjfNbHPAa6oothqaNtI9IVVmaKlv50fArKx/WmkVz
	 +fNpn+mWrs+9ud2+Tda5uZDLwHDP5oNBffchaZfw7Pow5z0IwxtXKdd9TPR/ifvjHP
	 I6u3gbmPMg3fdSwUJK3dydj30REPkM7kppsMKnvE3FTgThfPys66M+l1icvDndIdHY
	 1YrdJZ+mlIixakZykidGiRKgHEH4Hd0cpQuvPDAdNhHNohyB337UFbTbkZl6YVZiol
	 s3dHgj8WkhMXw==
Message-ID: <sashiko-outbox-213487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/23] dt-bindings: clock: qcom: add SM8650 LPASS
 core & audio clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-1-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-1-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 18:57:49 +0000
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
- [Medium] dt-bindings: clock: qcom: broken examples in
  qcom,sm8650-lpasscorecc.yaml
- [Low] dt-bindings: clock: qcom: unwieldy per-compatible conditionals
  in schema
--

commit 822c52dcc683f4949600245b7d9f62d13802e752
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers

This commit adds the Device Tree binding schema and header definitions for
the SM8650 LPASS HM, core, audio, and AON clock controllers.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscor=
ecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.=
yaml
> new file mode 100644
> index 0000000000000..9c5207ee02f15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpasshm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +      required:
> +        - power-domains
> +        - '#power-domain-cells'
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpasscorecc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +        required-opps: false
> +      required:
> +        - power-domains
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpassaoncc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: LPASS_CORE_CC_CORE_CLK
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: iface
> +        power-domains: false
> +        required-opps: false
> +      required:
> +        - '#power-domain-cells'
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpassaudiocc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: iface
> +        required-opps: false
> +      required:
> +        - power-domains

[Severity: Low]
Each of the four compatibles requires its own if-then block to override
clocks, clock-names, power-domains, required-opps, and
#power-domain-cells (which also leaves #power-domain-cells unconstrained
on qcom,sm8650-lpasscorecc and qcom,sm8650-lpassaudiocc).  Would it be
cleaner to split these variants into separate binding schema files instead
of using per-compatible conditionals for every entry?

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
> +    #include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    clock-controller@6bc0000 {
> +        compatible =3D "qcom,sm8650-lpassaudiocc";
> +        reg =3D <0x06bc0000 0x38000>;
> +        clocks =3D <&bi_tcxo_div2>;
> +        clock-names =3D "bi_tcxo";
> +        power-domains =3D <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
> +        #clock-cells =3D <1>;
> +    };
> +
> +    lpass_aon: clock-controller@6e00000 {
> +        compatible =3D "qcom,sm8650-lpassaoncc";
> +        reg =3D <0x06e00000 0x30000>;
> +        clocks =3D <&bi_tcxo_div2>, <&lpass_core LPASS_CORE_CC_CORE_CLK>;
> +        clock-names =3D "bi_tcxo", "iface";
> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <1>;
> +    };
> +
> +    lpass_core: clock-controller@7b00000 {
> +        compatible =3D "qcom,sm8650-lpasscorecc";
> +        reg =3D <0x07b00000 0x58000>;
> +        clocks =3D <&bi_tcxo_div2>;
> +        clock-names =3D "bi_tcxo";
> +        power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSC>;
> +        #clock-cells =3D <1>;
> +    };
> +
> +    lpass_hm: clock-controller@7e00000 {
> +        compatible =3D "qcom,sm8650-lpasshm";
> +        reg =3D <0x07e00000 0xa000>;
> +        clocks =3D <&bi_tcxo_div2>, <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +        clock-names =3D "bi_tcxo", "iface";
> +        power-domains =3D <&rpmhpd RPMHPD_LCX>;
> +        required-opps =3D <&rpmhpd_opp_nom>;
> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <1>;
> +    };

[Severity: Medium]
Does this example pass make dt_binding_check?

In lpass_hm, GCC_LPASS_CFG_NOC_SWAY_CLK is not defined in
include/dt-bindings/clock/qcom,sm8650-gcc.h, causing dtc to fail with a
syntax error.  In addition, lpass_hm specifies two clocks ("bi_tcxo" and
"iface") while the qcom,sm8650-lpasshm conditional schema only allows
"bi_tcxo", and clock-controller@6bc0000 (qcom,sm8650-lpassaudiocc) only
provides "bi_tcxo" while its conditional schema requires both "bi_tcxo"
and "iface".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D1
