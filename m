Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100684;
	b=TmlDowZfP+VP4dM3LmCyoXdwbq6TocC3B5U3585dujfxEe1bguBMwqMTElzbAq0tcyec
	 lu1uRsDwU5vWg7kLpwbGr34PFf6pvIh5/t8GI+y5FQx100MP1DTpgf7U8AqHAq9EUXMZF
	 BwD9lICCbCytJ77QUCD7ufhlBZAECMc5mkBuRqBGZlEmyN2hgy/elDPV/oeFpcGTF3PsX
	 vasVzLQve5YKgtYg8Cm5bvfA94pN4qjWv3Ipy2P8LAJjSzz+aNnalMFp9omBbR6qrVj6E
	 BzRIagN3sLLnQ9vU7svfmZP0diQ6+PcZGvtHRL6pYTXP42ONmSu7CpGLdzDCpDjT7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100684;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LIThLV2eN5CkFwy9AFB/FmWQ60vYU4a7X7WBKNjqqms=;
	b=EK/OvxX4+I+/g27NhhhW9JxO2etGgFt6ijtF6ozwxaHmKPesvksTZ2pM5g1Yp6fDTL7D
	 CQFZ3xhWc2te8uuLMxVzZEaOM+2+AccFjlctPyUF0UQjymJjnTbxNls8lH3qtGbFIVl0x
	 4X/FmvmhFPec8FeBCLOHCs1SrwfGlg4epSc5z3cNQtlaICMT5vtF6zlpoun7M6E7YMSPO
	 vBnjl3wyF8N2Y+NlZoswhHGg6sPUyqxXSpB7PVstv3YCirKAqsUsISgNRA5sbhQNj568Z
	 lsmE5p2LSVVizOboartFRvj8Wc6SqV98EWPW/GjNkflkQpQUWGTEkiUEc/haE4z8s0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBm0+YaR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97B606A324;
	Tue, 27 Oct 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBm0+YaR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579561F031E2;
	Tue, 27 Oct 2026 11:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100683;
	bh=LIThLV2eN5CkFwy9AFB/FmWQ60vYU4a7X7WBKNjqqms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBm0+YaR3jJ6NxD3ZxVoE+0+bxOTww6GxaZ7TqIXvAP/y35Rj7RML0zhvNsH3rcAv
	 UvaP3EsKDESu4bhJpj9drKxR6a7iJlIpYCMkNeD8Lja3WqZESehTYu/4a2UdKwv6rN
	 SFLwbHzz6R4K3GoQop1x48ChoMp+YfTkjxGO6KzRm6wEM6zG71JQdpdg1l7KsIeUEc
	 wzK151xuH8qhqpVbyGt8hFHlBleWgStQq1yt4yPbXF5342qROZhtD6zReg9OUPrtUM
	 AQIBpqFIbbVwuyDFXC+HLUQ6gPxKJ6DIXKRAd5uZbxuUombytFl3IijjmvqhfnvvkF
	 xqphP3K/6NKDg==
Message-ID: <sashiko-outbox-186456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
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
- [Low] arm64: dts: qcom: sc7280: undocumented gp_mn pinctrl function in ko=
diak.dtsi
--

commit 6f351e80c2c30a91b38cd18e71e46fa837dba70a
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: sc7280: Add GP M/N clock controller

This commit adds the GP M/N clock controller node and its corresponding
gpio60 pinctrl state to the SC7280 (Kodiak) device tree.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 8c7523602d271..de27a051ee3b0 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

[ ... ]

> @@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
>  				function =3D "mi2s0_sck";
>  			};
> =20
> +			gp_mn_active: gp-mn-active-state {
> +				pins =3D "gpio60";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

[Severity: Low]
Does adding gp_mn_active with function =3D "gp_mn" in
arch/arm64/boot/dts/qcom/kodiak.dtsi cause a dtbs_check regression for SC72=
80
device trees?

While commit 3f5919ddb9c9 ("pinctrl: qcom: sc7280: Add gp_mn mux function")
added support for gp_mn to drivers/pinctrl/qcom/pinctrl-sc7280.c, the
function enum under qcom-sc7280-tlmm-state in
Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml still
omits gp_mn:

    function:
      description:
        Specify the alternative function to be configured for the specified
        pins.
      enum: [ atest_char, atest_char0, atest_char1, atest_char2, atest_char=
3,
              ...
              dp_lcd, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
              gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,

Should gp_mn be added to the function enum in
Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml first so
that validating DTB files including kodiak.dtsi does not fail schema checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-b4-pdm_clk=
_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com?part=3D11
