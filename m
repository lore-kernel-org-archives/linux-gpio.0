Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549993;
	b=JHv3ObREPEpuVMX+nY9TwYjppnR5hkX69uhXeUO7Y3z+qFuobcHj944x/I4zkutDHc/2
	 dLzmeBV4fdg2yZqfWScoBDU185+JBjMaEdNScdQtNDV2WJFTQ798tw3ah2peFdp39ZGwC
	 bffGJErQZDTYLZtYEVT9XF4DSdbtWE4NnB+NoYVqlAJF9A8JqMOfFG9acg8ezN35WlMBd
	 6gyszNAsKz2kM7zawWbN44MfNfUVWJIt9wB3Si8KMHhZGv//Zhjlp9oTptzJ46FiUy4Ml
	 mOhCODYF8MwPy7QI/iISlTwf6EBayYWycIu1UP4d4GSgEMtX9tnIN1Y9y1a1kE1FD/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549993;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YW/+6/w0vkzA0mZi6tXKisnSsrAfx2YkPceqac221Cs=;
	b=Kj3A2usXdOEODLDsfXbxl6hlFURHeUErbh1iXu5BVjPx4DIKWfD091T3OQZoZSGHPPph
	 A1ItsTVCk0s+jEKlJeXKdvuVjv/risuDupK5ZuEF98nbJCLcxq32dQclInZH3vKYT7FZH
	 p8pR9HfLJofrxxvgriiitiQ/aMtyy/MvbXzNG+QdzQMAKT1hNqaR1Meb6dvpObxFdJMar
	 Wb2/cfG/oZoE1Aev/V3dBePrZ+qQmW1bByOUzFLWcF5P+9loVxhDR2jEo1wXWLEGEq2uH
	 nWWMB+rF/Xb8+LBflncsNqvDxksFtpvyW9x7wVDCrQ0Tjn/8daPOOEBVOyJ2uHFRlDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lid+xWiF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE41606A321;
	Tue, 24 Nov 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lid+xWiF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A537E1F000CF;
	Tue, 24 Nov 2026 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549991;
	bh=YW/+6/w0vkzA0mZi6tXKisnSsrAfx2YkPceqac221Cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lid+xWiFp3q++kwXexC1A24zp0skeYUzc1vada6Z8f5VnRxGkCBtlyBYDfnSqEozk
	 pp99lSp+GqLzHF9UTfKZ4r2kTDrifS27SSZzmBDOue+qZJrk/u0h8Sa/hcToDWJaLF
	 xw5jU/Frm1cY159jC3Omf3sKW6fHm0axjEwrRpkYMTzdcQZ9DhXh4lPC7vy9v/TUVW
	 ikP1v5eXyuDsCkjwMiIH17RYhhEp+ieM0ifAuiFAdOEYgteOjQ/TJ1ShV6106aLs0U
	 Cngdk4elbajsoiy/fS5Qp7dMU0eG9I3GG6BA6XF2M4GnM2HepbRD9IA3r8bLqNwzrq
	 S2XptuCyNcICw==
Message-ID: <sashiko-outbox-231915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-6-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-6-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:11 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: sa8775p: undefined gp_mn pinmux function on
  gpio35
--

commit 2bb0f9c69aa222be884a221ac0040d31c8953968
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: sa8775p: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its gp_mn_active
pinctrl configuration on gpio35 for SA8775P.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/b=
oot/dts/qcom/lemans-embedded.dtsi
> index 0be39bb9de1e1..4bba23df8a95d 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> @@ -1849,6 +1849,20 @@ lpass_ag_noc: interconnect@3c40000 {
>  		qcom,bcm-voters =3D <&apps_bcm_voter>;
>  	};
> =20
> +	gp_mn: clock-controller@88d3000 {
> +		compatible =3D "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
> +		reg =3D <0x0 0x088d3000 0x0 0x1000>;
> +		clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +			 <&gcc GCC_PDM_AHB_CLK>;
> +		clock-names =3D "pdm", "ahb";
> +		#clock-cells =3D <0>;
> +		pinctrl-0 =3D <&gp_mn_active>;
> +		pinctrl-names =3D "default";
> +		assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +		assigned-clock-rates =3D <4800000>;
> +		status =3D "disabled";
> +	};
> +
>  	usb_0_hsphy: phy@88e4000 {
>  		compatible =3D "qcom,sa8775p-usb-hs-phy",
>  			     "qcom,usb-snps-hs-5nm-phy";
> @@ -2515,6 +2529,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
>  		bias-disable;
>  	};
> =20
> +	gp_mn_active: gp-mn-active-state {
> +		pins =3D "gpio35";
> +		function =3D "gp_mn";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

[Severity: Medium]
Is the "gp_mn" pinmux function missing from the SA8775P TLMM driver and
binding?

In drivers/pinctrl/qcom/pinctrl-sa8775p.c, sa8775p_functions[] does not
define a gp_mn function and sa8775p_groups[35] has no gp_mn mux entry:

drivers/pinctrl/qcom/pinctrl-sa8775p.c:sa8775p_groups[] {
    ...
	[35] =3D PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
    ...
}

When gp_mn is enabled, pinctrl_bind_pins() -> pinmux_func_name_to_selector()
rejects "gp_mn" with -EINVAL and aborts probing before clk_gp_mnd_probe()
runs.  "gp_mn" is also absent from the function enum in
Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml, which
causes dtbs_check validation to fail on boards including
lemans-embedded.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D6
