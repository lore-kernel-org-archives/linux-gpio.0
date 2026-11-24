Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549995;
	b=N2oBO3WxrF/85MbzPTzndCJ3XdW9nKp7uFdLI6dAG9a7DEP727/HC8Uq03Sn4nCqy+Bd
	 /N5gacFTIboC27qN2NG48Kw3AUqL/pu47ywE5iv2XmaW8EW1V8u/LPtk9mvgT0OGmDPir
	 AMK+9RLdIvr/bPLGYMaYL+7cLnz3OHPZwcOmAHgWv4TIfwxFt0vbnpoakteWNTyJ4JCJf
	 Q/RzRvTb01FdEt1J3HAw0AWFQuGOeMUKVdx8lJ1J+Pi7Mc5ix/ZaSklsaeMy9jTuFVjak
	 h84FwbVKspN/jgGsr1BnJ6XatopJiM3sHDUbeHPSaACRN005T31NROye+oQtH2CVeIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549995;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DiZDxPkJ8OwnqYVAEXaL9gsNCNC45ImThbHs+AqPIeA=;
	b=f6KdbMad/dZQ3BEkb8UFTFxaLBR1QQDqGmXNoVKR8GAyUg07OjB2pe36LCr/R/55f9vs
	 Hh3wsI9pA4Ela5KcWtqTmvNKTN/DawkiD//MG/OTA62k0wiBhMNErXi5yITqobL8Ygf0d
	 5ybOZ3GWl7tMgarQ/Z68yXGqtOf14bEavWgxSn0ctGl4YPzVvxwbOJlkCGdO25yD6ut/i
	 wlYijkAtgM3ulUcokfFnxZRXg1KYqaB/3oTpSYZsdjk3tQAKgZp8iYYBR77MvIwmr8smE
	 xRqyraWtxfcVcxC9DbIoBiSYXe4kU7QlEncLBRsMYmv56NUwcqAKzIaQ8HNYYirZPVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKad+vuC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2325606A31E;
	Tue, 24 Nov 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKad+vuC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1831F000CF;
	Tue, 24 Nov 2026 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549995;
	bh=DiZDxPkJ8OwnqYVAEXaL9gsNCNC45ImThbHs+AqPIeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKad+vuCNI612MndHMVeEG+dNNY60qX8vAQthDIYzZCm7izo+BiEeFR7HUshMfsBe
	 2U5PFsuvkFy2S/LEpAEfEVeNQ+BTe/+2FLpflAa5UtwXjuu/ezbXJAi7GgncBXpzl9
	 1s+pEWoUJpiyHgaTZgo45up3USlt6Q+PLeSwWzy8MZr04OseCSq6DBftJSW3yb1dfo
	 D4ciRnkuV+JSv++MDq12H2YBbdfE4ejzH9O0d08AihiaVlpkkNK4iqT8jPHnnPrXN/
	 MvBbemV3OXbqXb26LIhI32yUTiMfv+kwebkdUyo+i6Prn10AyAzXLSBXBgBbfXZ+6N
	 Se92EL8bz/Dew==
Message-ID: <sashiko-outbox-231917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-8-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-8-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:14 +0000
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
- [High] arm64: dts: qcom: talos: Undefined gp_mn pinmux function on
  gpio29
--

commit 7cbf99e3ead65681675a71473e402d0963a6bc63
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: qcs615: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its gpio29 pinctrl
state to the QCS615 (Talos) devicetree.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index 1d74e459f892e..a6f195509ac2e 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1626,6 +1626,13 @@ cam_mclk3_default: cam-mclk3-default-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio29";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
>  			cci_i2c0_default: cci-i2c0-default-state {
>  				/* SDA, SCL */
>  				pins =3D "gpio32", "gpio33";

[Severity: High]
Is the "gp_mn" pinmux function defined in the QCS615 TLMM driver and
binding schema?

In drivers/pinctrl/qcom/pinctrl-qcs615.c, qcs615_functions[] does not
define a gp_mn function and qcs615_groups[29] leaves mux slot 2
unpopulated:

drivers/pinctrl/qcom/pinctrl-qcs615.c:qcs615_groups[] {
    ...
	[29] =3D PINGROUP(29, EAST, cam_mclk, _, qdss_gpio, atest_tsens, _, _, _, =
_, _),
    ...
}

Because gp_mn binds gp_mn_active as its default pinctrl state, enabling
clock-controller@88d3000 causes pinctrl_bind_pins() to fail with -EINVAL
before clk_gp_mnd_probe() runs.  The function enum in
Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml also omits
"gp_mn", causing dtbs_check validation to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D8
