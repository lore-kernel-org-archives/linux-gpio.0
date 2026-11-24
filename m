Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549993;
	b=Kcap2g5MiHtlHBG4sHnqeLjMq8qbMcfxSX3rxHplkVLliiIaTjBK/KEapjt56Xirr7UK
	 eaNiG62wP+p47XKgCYiiopq/GhSJFOPFpe8XJaQjyn8eNQaCvBv3tKtVToe+uYfNh2qj/
	 I92gAO6WbMvhxz1Ts32MGWPSLXrkFlxaKY6GWPuC7+z2RmMJurOfl5+fRUHB+y0rdehAC
	 ECppE5CiAuuRnbTmX3acW0HnNFuTj7iQuACNPjSWFaCChStpGM2or1vaoQpPjVlLd19NC
	 fRnI9X6mCpzcMRQBMKjelpECQ7V9v88STygwTmM9Yz9dC+vNZHvCQUaFwFf8MOEij7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549993;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YIYFWuRLWL0vTPCOaOdnGUnLsgG8UlXiWPpjWyhViFM=;
	b=1+XYI8+Zu15I01JMLq5J0xAzV0xazEbiydYbM8zjcELhB/volmPBTN3cBCJmoGcnb7ef
	 QJdL2LO0KAtKaX1FMipVzbZfi0oDVcGsNAqt8gddQqE3lT+M8soKHCF4r8EiAhZ1bmHL2
	 NSpUifRn7Yh16lWRxNG4jMJuDQdeaOGxzmN2dgFA2SSmqOvIIPJHvfUnyuVdVtQcv8WGR
	 rm8LGU5ZMXe/S+V+rFrZjn3aDRux+Q5PPa4SuNQc4hFdsqs+DtN6QqOj6ziFJdSaKjejQ
	 qJI7TD41LgXgUd/e9k7XT/D1rgMPyKxO3FgS5EjCFvjN5YHzntaobyYd2tBNy/PX3ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YZ/dikqb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE0606A334;
	Tue, 24 Nov 2026 19:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ/dikqb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24F01F000F0;
	Tue, 24 Nov 2026 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549993;
	bh=YIYFWuRLWL0vTPCOaOdnGUnLsgG8UlXiWPpjWyhViFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZ/dikqbSGGdR+C6+Rq+pT88Qh1Ww80djz6Ec2HXycXqromXF8b730Ec9Q4KAB1Cs
	 oo+VcSAv1afQWXWALAlK1snLpxhrddVr8zjCuHC9FjFWI5pnLJT2nWqKDNL04B0KpR
	 JTEiUtLtqGz31CfRwSSt8ABigu3xvPlXEzk1dOmSo6o8dGPvGO02zn1fobrO7tJ+Ai
	 7PzgdpK5Q4kxEcMqUkd5mIPSEeV69C+1xQdiOdkVWcQ/DR7nbQ+L5NJHOpvAb/Rs/S
	 Flyzdc3ScduVVCqFgfKE3wvKw7Ag8DcTzJlez/nD1oAM2heSP2L3yIUUp1Kad4Xqju
	 77ISCmv3SFy/A==
Message-ID: <sashiko-outbox-231916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 19:53:12 +0000
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
- [Medium] arm64: dts: qcom: sc7280: undefined gp_mn pinmux function in
  kodiak.dtsi
- [Low] arm64: dts: qcom: sc7280: unsorted gp_mn_active pinctrl subnode
  in kodiak.dtsi
--

commit b17b6968e213c74fa5ead791ea18018b1292f1e0
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: sc7280: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its default TLMM pin
configuration on gpio60 for SC7280.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 10e9a5279ed60..773f4487d7830 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

[ ... ]

> @@ -6683,6 +6697,13 @@ mi2s0_ws: mi2s0-ws-state {
>  				function =3D "mi2s0_ws";
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio60";
> +				function =3D "gp_mn";

[Severity: Medium]
Is a patch adding the "gp_mn" function to the SC7280 pinctrl driver and
binding missing?

Neither Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
nor drivers/pinctrl/qcom/pinctrl-sc7280.c defines "gp_mn" (and
sc7280_groups[60] only lists qup17, edp_hot and phase_flag):

drivers/pinctrl/qcom/pinctrl-sc7280.c:sc7280_groups[] {
    ...
	[60] =3D PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
    ...
}

Because tlmm is enabled in kodiak.dtsi, this causes dtbs_check schema
validation failures on SC7280 boards, and enabling gp_mn will fail to
probe at runtime with -EINVAL when pinctrl_bind_pins() looks up "gp_mn".

> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
>  			mi2s1_sclk: mi2s1-sclk-state {
>  				pins =3D "gpio106";
>  				function =3D "mi2s1_sck";

[Severity: Low]
This isn't a bug, but the tlmm subnodes in kodiak.dtsi were sorted by pin
number in commit a732b12f1fcc ("arm64: dts: qcom: kodiak: Sort pinctrl
subnodes by pins").  Should gp_mn_active (gpio60) be placed alongside the
existing gpio60 states (such as edp_hot_plug_det) rather than between
gpio100 and gpio106?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-pdm_clk=
_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com?part=3D7
