Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100683;
	b=jtwZvl+iCC0qfCon+EYgND7PUzf6tWtFDQaT5KSvZb2O7rlKSdgAZvYtLkToj20XgcYd
	 coWxLQX0qTFhzySXI1P0pD9pHQ9F7VIu5DAJ9Twqg26k0206NggTi55IhT0ojZQHTnl6e
	 TofiHmzvuGFnwB1ReHTVPFjnH0W6dWjCrmjiuGPRuHy7+bfmeVcCmZ+drkx7g6ZHl+Z+c
	 UE8cSWV5AsWG1TDysocADB3lEh0ZegaWiV+AhLLPojvzsodXB5pGnZoTMAIK3FbRlfAmX
	 kxRAmN94WutcJin6ZmF3SFzKmxHvovt/kEV01x8W/5N4WQAiW+Zr0ILZJiTlUr+I4nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V76EZNSaKtKFyZUsGhZCm3LufoisodOdHQ1zVLD5bmE=;
	b=3TH7LdHC+Bn6NiARoZ3MmVqQfYqotGLWumuhdXbf5T/wqvushpt2Gi6432iZrySGoIVs
	 R7Q94WLvzmPT9GCILhOcX8DaDhp9Vl0i1CaZvUj5BNbevfdPCRKSkQ9eutjMJ9/0ceV2Y
	 FFp1sv4x3nQXSmCytUj/kV1p9wQMaloi7fmYv/Z7s6OCEQ76Vc72it4qKoFVN69s6Wqax
	 iaE08tr/ue8j26PWjOKIGWMGlN9xHD/4NKvz0IXGfrskpA2Mm+HSlY8gVIEk6ePHSWuon
	 vvmRJudFopJQJJZOVtgdPLvbVIA81kjtswLpF/vlNZ3HetNPcn1ECvXgJqRbmPGpqwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFn2ctVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCC3606A333;
	Tue, 27 Oct 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFn2ctVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB1A1F031E0;
	Tue, 27 Oct 2026 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100682;
	bh=V76EZNSaKtKFyZUsGhZCm3LufoisodOdHQ1zVLD5bmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFn2ctVsYG6eYAc7AXFF6r9jJKiWQ0tI3LAzIwZKInQRL4av9WYtHSqKI8RvMHOen
	 /Q12XF/5LwZdxIT9Fhmr5WhQyD/8SmeO3miuWVKe5OuaS44zrEQjcHRVaBBsqlTAhL
	 SPomjL7/NPNhfO2UlnyJ2xpNjSYLILOfa7tAbWe1GJwK9SNmTn9+uNG8tCm1Tz+vZl
	 +FWkfbblZRY2RJdXoth6+jkrRYTAAVkUBWeaZ1iP7iw31nLtZ7Xw9cCF28UFPNyLnW
	 Zc3pSIJs9paQJrz7Kg8XYF3uhoMyqALKjDBpH4z+BNHCDclC5gvAvGv+Oappqcllgd
	 GI5gRh6rTM7EA==
Message-ID: <sashiko-outbox-186455@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-10-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-10-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:31:22 +0000
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
- [Low] arm64: dts: qcom: sa8775p: undocumented gp_mn function fails dtbs_c=
heck
--

commit 9948fe2f7eb49ef62f7a04802f3885fb43531ee3
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: sa8775p: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its pinctrl state
configuration on gpio35 to arch/arm64/boot/dts/qcom/lemans.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 1fdb72fa55184..4132d288e3a16 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[ ... ]

> @@ -6017,6 +6031,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio35";
> +				function =3D "gp_mn";

[Severity: Low]
Does adding gp_mn_active with function =3D "gp_mn" under tlmm cause a dtbs_=
check
validation regression for boards including lemans.dtsi (such as lemans-evk.=
dtb
and qcs9100-ride.dtb)?

While commit a907156da8b6 ("pinctrl: qcom: sa8775p: Add gp_mn mux function")
added the gp_mn function to drivers/pinctrl/qcom/pinctrl-sa8775p.c, the
qcom-sa8775p-tlmm-state definition in
Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml does not l=
ist
gp_mn in its function enum:

                emac1_ptp_aux, emac1_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3,
                gcc_gp4, gcc_gp5, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i=
3c,

Should gp_mn be added to the function enum in
Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-b4-pdm_clk=
_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com?part=3D10
