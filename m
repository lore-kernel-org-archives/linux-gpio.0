Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549991;
	b=fJgPslYmTQbdThlVU6+uASZbE021FgG/eJfwYotMbMZpob3JdnhoM7EfIpDrcvEuLBnF
	 /Jq7J9SbjugoTiP2geIvou0Ls3ZhXi2capSlE22HszT8sr6MuBNHkG0upnuBUZL1bmxGN
	 ziF2Fnyy9k5Z+6zTkSKhqONW2tFgtq0vFalZNWPxP4440u96gQLIuP9OU/+BYr8d14A1X
	 KLkWEkqHvgBNvKbB6PGNcZbp4uka3NFBffYnmWAfKcGR9LmZ8QcZwPmQ6FdKJcctZ35X5
	 SZo0LqNvuA9osE3yj+mn9/88ZG3mG2guZIAdn8xB6J7HKMAOmdqyjP1XDq7Ll2qTcTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549991;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vEOd70wPQKVuzeavm0lDpu4U6Zb0QOIFku0McWqjysQ=;
	b=em8J1hMS/71Ff7dPW21iAo7HENNK1nibiC67C02X9TvEg/3GxzRd2NuYkET53JKkcxoe
	 khO7sJdMrrPq8uPA62RH331lNyANpmd9Iqcj3M4N++E2J74XbZWaL6uEIb+mZIzA1o0Fu
	 mZKAw9TpdK36EXoN3UbsJw8QAOo1UpVxmY4kQbRP7qSrInU547gE7NVEgBMJk729SNOhR
	 TuFr+Pr9WPVWWgg09lMQIB/qvwrgz8yu3gFhvIaSxvyVopSqfy9qVXJjYYyr0P0HVVTBP
	 u4uAtpPa5CHJVW409FAeBOe8C01ZkQJsxegnZOtEQTowCRfmiZ+v9H5z2SuFYkCfXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpZjXHYV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B846606A321;
	Tue, 24 Nov 2026 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpZjXHYV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAEE1F000D4;
	Tue, 24 Nov 2026 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549990;
	bh=vEOd70wPQKVuzeavm0lDpu4U6Zb0QOIFku0McWqjysQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpZjXHYV1UV3WoUt/OHiFcSOSujpbTsujT/OkImGxNJBIhm98HSNOyTXfEfxU7o1a
	 co8/k2PeJVEqKoAE43OtQHt/MG0rsgwIddJJqdB5YYzJbykmlsxZ1usz6LVuos5z40
	 UV7aAuhNeWHQNQNOb8LdZhXZu3qGFtU95guAyzyI2B2cKhRrb03ATDiJ9v4yM2OmUH
	 4SR/VQkv7JmEZA37IkePnMYLg1DwkDcvIRom+zrpcla3O1V97m6eY9CFWLsH5n4vde
	 bx93F7mwmHlkfOMUDrng+9MJ4sNgNouzvcfGpINp5qV05En4HcbUfXqzGeBdgcDUBA
	 x2r9tXFoXJ9Uw==
Message-ID: <sashiko-outbox-231914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-5-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-5-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:10 +0000
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
- [High] arm64: dts: qcom: qcs8300: undefined gp_mn pinctrl function in
  monaco.dtsi
--

commit d516231f8cb52de8b0fc3f5d25658a1e90470e4e
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: qcs8300: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its gp_mn_active pin
configuration on gpio32 to monaco.dtsi for QCS8300.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 3541313a79bf4..3508869ed92b4 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4892,6 +4892,20 @@ sdhc_ice: crypto@87c8000 {
>  			power-domains =3D <&rpmhpd RPMHPD_CX>;
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0x1000>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm", "ahb";
> +			#clock-cells =3D <0>;
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			pinctrl-names =3D "default";
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +			status =3D "disabled";
> +		};
> +
>  		usb_1_hsphy: phy@8904000 {
>  			compatible =3D "qcom,qcs8300-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";
> @@ -6458,6 +6472,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio32";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

[Severity: High]
Does the QCS8300 TLMM driver define the "gp_mn" function for gpio32?

In drivers/pinctrl/qcom/pinctrl-qcs8300.c, qcs8300_functions[] does not
define gp_mn, and qcs8300_groups[32] does not map it:

drivers/pinctrl/qcom/pinctrl-qcs8300.c:qcs8300_groups[] {
    ...
	[32] =3D PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, =
_, _, _, _, _, _),
    ...
}

When gp_mn is enabled, pinctrl_bind_pins() -> pinmux_map_to_setting() ->
pinmux_func_name_to_selector() fails with -EINVAL before the clock
controller can probe.  "gp_mn" is also missing from the function enum in
Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml, causing
dtbs_check validation to fail for boards including monaco.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D5
