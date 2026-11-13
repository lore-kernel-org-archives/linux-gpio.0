Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597539;
	b=wRf2Nn605630aNTtCHtNykJYz2e6wZuCbSekQr0nyddGFM5p5pqM8+LtFKjZ15+Lr5XM
	 /wDF3tn49iUai9G8Y/SwdOJgfc9fq3sroGSvMBiM5+yXO2ZvPXXHm260dI0J7XSzloEc5
	 fkowohLdaaElW7OIPJmBFc5fLl669NkYLeDpbv8TO58Nv7dORSU+pforu6hK8oBoKuIUs
	 RT7s3vLeLIVHtuh6LmdhiSI0pfumznTruadxI+uPUOMjfOgjl6DkMk/zLS1QlwQ9kmB2w
	 bfQCfpbvAzfOgSmUmRcgwYZeOdsoyQPgoXuxlcvEsaAPq4Yg1j2W92CcPQyREKn46WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/SZZUB4imj0DCaiwX3SC+kOmypVCBifFyWOIoo60btE=;
	b=2GKfBJwMN9ZlbEmqdU8OMok/CONOdGosjPMAnRPHBedFu0BKLxB2mMKOBvad6BYelyz/
	 ZEqb79hUrpxJvvP0zGm4NH6i0zmAZmvC659ogB3zdpcDS3AH/LpEaAJ9/XEoqhzq4D4Ue
	 EiHPO/SKCHIumWD7/iwwe1WaL1+3c6zZjsu7BaP294mtZ7o4EA7LajzNdgJ2Ij0a+29qM
	 4/Axsj32BFZgEX4YfTy+3ZZnWhJHWuVr7X+m0njwe5dex/jbvd3bWKAdEmIW3FDQuAWjH
	 vzL66eOPkcQae4CyxLXyU0q6ZU88sendJRRZrrxuC0dtK+yz11Zxcu6nxpCuxpBMjyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYhWEQMM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31963606A333;
	Fri, 13 Nov 2026 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYhWEQMM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A893C1F000C4;
	Fri, 13 Nov 2026 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597539;
	bh=/SZZUB4imj0DCaiwX3SC+kOmypVCBifFyWOIoo60btE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYhWEQMM9Mg6uCNwwIGPt6BaY7GKmpmz4ZyDRVCV20Wk8/cA6VojXAboxS35H4NLG
	 MGkxhkNbn9bOHn/vJRD24J9ghkWucuQp0YthuXhkOVoDdUDtQdXSgAG7X+CDFS6gaS
	 rVgV+eHIUWFN4ud5p2FJmKXayLZBLHUsHWteyralcThF9sdDXC6RmZ60qC/FI0AKBO
	 b7WvLhB4xkBLWUpThg1tQpjhsjaGH1p9IYdoZ9kZ2uIQ3lguGX2GT+Osj8xmKtiZ0r
	 BrkoEMHG/J9lA1H4GGD9Ap9zEoT1vbqU26YgE7Fya6KFcEi3OrxVAB7eq+aBLU/Vqp
	 iAw2rOwkKyV7A==
Message-ID: <sashiko-outbox-213539@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 21/23] arm64: dts: qcom: add SM8650 LPASS CPU dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-21-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-21-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:18:57 +0000
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
- [Medium] arm64: dts: qcom: unsupported power-domains on WSA macros in
  sm8650-lpass-cpu
- [Medium] arm64: dts: qcom: unattached multiple power-domains on
  lpass_tlmm
- [Medium] arm64: dts: qcom: lpass_core clock count mismatches
  lpasscorecc-sm8650 driver
- [Low] arm64: dts: qcom: node and property ordering in
  sm8650-lpass-cpu.dtsi
--

commit 1f3d7332ea1210e666215d104062d22d42ebae2c
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: add SM8650 LPASS CPU dtsi

This commit adds sm8650-lpass-cpu.dtsi with the LPASS clock controllers,
lpass-cpu node, LPASS macro clocks, and I2S2 pinctrl state for SM8650
boards booting at EL2 without ADSP audio firmware.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi b/arch/arm64/=
boot/dts/qcom/sm8650-lpass-cpu.dtsi
> new file mode 100644
> index 0000000000000..43d0d8daa4fe2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi

[ ... ]

> +&lpass_tlmm {
> +	clocks =3D <&lpass_core LPASS_CORE_CC_CORE_CLK>;
> +	clock-names =3D "core";
> +
> +	power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSC>,
> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
> +	power-domain-names =3D "core",
> +			     "audio";
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Does specifying two entries in power-domains leave both GDSCs unattached on
lpass_tlmm?

genpd_dev_pm_attach() returns early without attaching any domain when a node
lists more than one power domain, and lpi_pinctrl_probe() only sets up PM
clocks without calling devm_pm_domain_attach_list() or
dev_pm_domain_attach_by_name().  As a result, runtime PM resume of
lpass_tlmm will not power on LPASS_AON_CC_LPASS_AUDIO_HM_GDSC before
accessing LPI TLMM registers.

[ ... ]

> +&lpass_wsa2macro {
> +	clocks =3D <&lpass_audiocc LPASS_AUDIO_CC_WSA2_MCLK_CLK>,
> +		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK>,
> +		 <&lpass_vamacro>;
> +	clock-names =3D "mclk",
> +		      "macro",
> +		      "fsgen";
> +
> +	power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSC>,
> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
> +	power-domain-names =3D "macro",
> +			     "dcodec";
> +};
> +
> +&lpass_wsamacro {
> +	clocks =3D <&lpass_audiocc LPASS_AUDIO_CC_WSA_MCLK_CLK>,
> +		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA_CLK>,
> +		 <&lpass_vamacro>;
> +	clock-names =3D "mclk",
> +		      "macro",
> +		      "fsgen";
> +
> +	power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSC>,
> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
> +	power-domain-names =3D "macro",
> +			     "dcodec";
> +};

[Severity: Medium]
Are power-domains and power-domain-names supported on lpass_wsa2macro and
lpass_wsamacro?

Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml does not
define power-domains or power-domain-names and sets unevaluatedProperties:
false, so dtbs_check fails when sm8650-lpass-cpu.dtsi is included.  In
addition, unlike the rx, tx, and va macro drivers, wsa_macro_probe() never
calls lpass_macro_pds_init(), while genpd_dev_pm_attach() skips automatic
attachment when more than one domain is listed, leaving both GDSCs
unattached during register access.

> +
> +&soc {
> +	lpass_audiocc: clock-controller@6bc0000 {
> +		reg =3D <0 0x06bc0000 0 0x38000>;
> +		compatible =3D "qcom,sm8650-lpassaudiocc";
> +
> +		clocks =3D <&bi_tcxo_div2>,
> +			 <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
> +		clock-names =3D "bi_tcxo",
> +			      "iface";
> +
> +		power-domains =3D <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
> +
> +		#clock-cells =3D <1>;
> +	};
> +
> +	lpass_aon: clock-controller@6e00000 {
> +		reg =3D <0 0x06e00000 0 0x30000>;
> +		compatible =3D "qcom,sm8650-lpassaoncc";
> +
> +		clocks =3D <&bi_tcxo_div2>,
> +			 <&lpass_core LPASS_CORE_CC_CORE_CLK>;
> +		clock-names =3D "bi_tcxo",
> +			      "iface";
> +
> +		#clock-cells =3D <1>;
> +		#power-domain-cells =3D <1>;
> +	};
> +
> +	lpass_core: clock-controller@7b00000 {
> +		compatible =3D "qcom,sm8650-lpasscorecc";
> +		reg =3D <0 0x07b00000 0 0x58000>;
> +
> +		clocks =3D <&bi_tcxo_div2>;
> +		clock-names =3D "bi_tcxo";
> +
> +		power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSC>;
> +
> +		#clock-cells =3D <1>;
> +	};

[Severity: Medium]
Does providing only a single clock at index 0 on lpass_core leave the
P_BI_TCXO parent of lpass_core_cc_core_clk_src unresolved?

In drivers/clk/qcom/lpasscorecc-sm8650.c, lpass_core_cc_parent_data_ao_2
looks up DT clock index 1 for P_BI_TCXO:

drivers/clk/qcom/lpasscorecc-sm8650.c:
static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] =3D {
	{ .index =3D 1 },
	{ .hw =3D &lpass_core_cc_dig_pll.clkr.hw },
	{ .hw =3D &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
};

Because lpass_core only provides index 0, of_parse_clkspec() fails with
-ENOENT for index 1, leaving lpass_core_cc_core_clk_src and its child
branch clocks (such as LPASS_CORE_CC_CORE_CLK and
LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK) without their safe XO parent when
clk_rcg2_shared_init() parks the RCG.

> +
> +	lpass_hm: clock-controller@7e00000 {
> +		compatible =3D "qcom,sm8650-lpasshm";
> +		reg =3D <0 0x07e00000 0 0xa000>;
> +
> +		clocks =3D <&bi_tcxo_div2>;
> +		clock-names =3D "bi_tcxo";
> +
> +		power-domains =3D <&rpmhpd RPMHPD_LCX>;
> +
> +		required-opps =3D <&rpmhpd_opp_nom>;
> +
> +		#clock-cells =3D <1>;
> +		#power-domain-cells =3D <1>;
> +	};
> +
> +	lpass_cpu: audio@7b87000 {
> +		compatible =3D "qcom,sm8650-lpass-cpu";

[Severity: Low]
This isn't a bug, but audio@7b87000 is placed after
clock-controller@7e00000 instead of in unit-address order, and compatible
is placed after reg in clock-controller@6bc0000 and
clock-controller@6e00000 above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D21
