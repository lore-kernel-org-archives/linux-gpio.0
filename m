Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100685;
	b=tPLJFdabBTitFdH6c1j0amlMihBUtLvHwkgNgIqPK5H2Ln1GjHwMW3Se46wzu5MITh6+
	 rCcPWDtDbBitVM/wXIkooPQnDYHDsHOrMLhf7qVvJWTU8my7wcZJXp8DLdhr1tI6AXJwS
	 T/iu1F80680YNvBPqIQ7pLnZmqyJEeE9H7URrZlU0EfYe5qjFayuVXExvVN7L5gnGwadr
	 tXZh2vCVsOc0yW8k0uqaOdt0xSZXhem8cNruwp0KsvFuIx8YFtk0FN//C/tRyEPn2ExqU
	 33/3iwDyIhRdTacFpqR3dUzTk7oBvRkZUJIgNrHAi+Q/D3hvsYkEAluzVeOUvbpjybg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NVpHCNZW/C7KH8NLxeUT9lOY+xUkZJvI1gwvyB0y/4s=;
	b=YVGnTy0xJzTa2fzrHMWQWkcOxfpoBekqNSRlAWJycp86XcrmGckFO5s1r4uj66zmMXaB
	 GgdSCwjD7GC7Z8jBYxXRlxG5EnKTGbhW9KaRu3H3/DtXutRoqtHTjoRbONfmX1+2wbit0
	 xQ9RIsC5XTIsnTI4eexixtC9JqWrKpgATK0K561/XYOzLP2kS3/Q5rYe/rBeYqCeHE+65
	 33VjvMVW15GpR+zqRQN5LZgTcyIvgib01FgGjtmfmtUkpHl1hIK/s2NakDSgcx+yWLlN4
	 66rOlYZzaAxm4Kh361ZZ1k4H6JHw6OeETT1ywaH4mFOiaKGwAcR1kc7g9RLaAfazmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kq0KBD24;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B03606A33A;
	Tue, 27 Oct 2026 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kq0KBD24
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3AD1F031EB;
	Tue, 27 Oct 2026 11:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100684;
	bh=NVpHCNZW/C7KH8NLxeUT9lOY+xUkZJvI1gwvyB0y/4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kq0KBD24Agz4iuDY371ofPMan2HeWm49QNMSZQfnh27FuXp4MWGtxlOIuWz/aujY4
	 q+TX1J9TL3fHOMCI4bgKetwPkqTtD9BQ1Q3K2Uqj9Dhbmz0bjub2ME2XFRlTpS6OCW
	 naj2qJetKZN7lAwizhYBJ6vtJ/9siOGZcsTmqV/zzUiefdDc+wu2Glfz7n07JdQ5vz
	 ncYRDqN53WxHtwxHQgKjd53zUGNnZ+oiPYs0ixqg0WhXi2Zq84kyb0ycl88EhpsVuo
	 sgKdQQCMMuA62gsov3Amf9wcOTtYux4mfGEd5Dprt4zbMou3rzuBRh7oiPGZ9YC08Y
	 XN6p755tiwe2g==
Message-ID: <sashiko-outbox-186457@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:31:23 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: talos: Undocumented gp_mn function in qcom,qcs615=
-tlmm
--

commit 80bf224325113e6fa5a7296e11cbe281f6b0c0e8
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: qcs615: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its gp_mn_active pin
configuration state to arch/arm64/boot/dts/qcom/talos.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index 8ed6f2755705c..c415e782804ca 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio29";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

[Severity: Low]
In arch/arm64/boot/dts/qcom/talos.dtsi, gp_mn_active is added under tlmm
(compatible "qcom,qcs615-tlmm") with function =3D "gp_mn".

While commit 110a5e6a912b added gp_mn to enum qcs615_functions in
drivers/pinctrl/qcom/pinctrl-qcs615.c, Documentation/devicetree/bindings/pi=
nctrl/qcom,qcs615-tlmm.yaml
does not list gp_mn in the function enum under qcom-qcs615-tlmm-state:

Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml:
      function:
        description:
          Specify the alternative function to be configured for the specifi=
ed
          pins.
        enum: [ gpio, adsp_ext, agera_pll, aoss_cti, atest_char, atest_tsen=
s,
                atest_usb, cam_mclk, cci_async, cci_i2c, cci_timer, copy_gp,
                copy_phase, cri_trng, dbg_out_clk, ddr_bist, ddr_pxi, dp_ho=
t,
                edp_hot, edp_lcd, emac_gcc, emac_phy_intr, forced_usb, gcc_=
gp,
                gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,

Should gp_mn also be added to the function enum in
Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml (as well as
the corresponding pinctrl schemas for the other SoCs in this series) so that
make dtbs_check does not fail validation on gp-mn-active-state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-b4-pdm_clk=
_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com?part=3D12
