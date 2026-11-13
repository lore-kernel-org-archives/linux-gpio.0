Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597097;
	b=j3YWGB/HAAknBrWazsEcjRcv9koUPf5NKAM2I0xSIlQjaUHXzsAYD0CG+iYHL9F72NEk
	 xCZOGHNho/q/tzos1j2VApirkhKrNQ3qi9XOqihWkd6ebUPZsf17AtYgvjGiDULFCSkpM
	 sFrWqxSAcDSnAgV3j9ZCjlYoIx+zx62DkXMUZqxIr5f2osmjk3QcpbxZIameUIulwSEue
	 EDZdwiObdVHiqzfPO+SmZvjA2FVJMLKqCCTJSWPdsuEZZp6uaPLw//AFisUY3cqe33VFw
	 X4shB19b2nLHoFeyS5xMcDC7HUGvFXaMb3VXa8USjGJDtw1BKm8vbLSnoN4I8+GRhVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597097;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/Fn5AMGufDVCq5y/GZxunO0haisibBhqc7pf8K6AEzA=;
	b=N73Xu0k9WMDVi1b04dheBi8Www7ob/X3BVQeI6zMl+PoC5KdGUdowqQ2PcvfLO9MxITg
	 ytXU9dsgbtQQPzTti1UpohoPQwi22li/2DyvqBORR+eQf2XKRMjiqx1F9k+fWrgNpsylk
	 b6ktlqJ8UjypOGXiv9JjXFmyL9eObGJeHQgkC299OfQVFYSKSnBxHNexdQQHGGdEUs65l
	 vUyVL5bTT3dPo11QKmKA+OL8TIwd+1LYNpuStWDfrswgXvysxng0RQsaU9i79hTe8Gp5E
	 T/WT3Xs+9yvzzkZ+BIyYve5kOrSUpjJZdo9JrotseeRwf1uopFKYOYwMx/iWCszaMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jggOCwcs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B5606A323;
	Fri, 13 Nov 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jggOCwcs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41771F000C4;
	Fri, 13 Nov 2026 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597097;
	bh=/Fn5AMGufDVCq5y/GZxunO0haisibBhqc7pf8K6AEzA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jggOCwcsuhTHK8j0/37y0H3CYk/b2k2SxF0UMaI0xY/S8J5AjJhc+NkPaVODYUVcC
	 P2NJDuUsyAEc8G4luyXMwpYTFLtwJlSnjvGBxvwM3pJx5vJtDYfS5X1+5oL4LEn8T0
	 AzK3KtiFYj0rSFmhaAz/aZOW2AHZwXOL+gIPWYD+f17i29QndNWp/w/LH/CDGK/rOJ
	 2UjHzPNZ99HjDJOL8wCP0ZIolDaI6wNQYmutpJCQwcNEd7tQV0GWAngq8MjWJKrdbB
	 D+iCPE31ATYf8LWxYbgQ148AvT6WxH6v6PSYRCs4SEE6ceB4dWsVELWkh7TjN/pg8U
	 9O0jXpK8yeLJA==
Message-ID: <sashiko-outbox-213519@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 20/23] arm64: dts: qcom: sm8650: move EL1 Gunyah
 nodes to sm8650-el1.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:11:36 +0000
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
- [Medium] arm64: dts: qcom: sm8650: lpass_vamacro left enabled with
  zero clocks
- [Low] arm64: dts: qcom: sm8650: leftover video_mem reference on iris
  in sm8650.dtsi
--

commit 6cf38f344aa0427c5afd87fe6828f76c27873b93
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650: move EL1 Gunyah nodes to sm8650-el1.dtsi

This commit moves the Gunyah EL1-specific reserved memory, remoteproc,
SMP2P, IPA, GPU zap shader, and q6prm LPASS clock nodes out of sm8650.dtsi
into sm8650-el1.dtsi, and removes the corresponding node deletions from
sm8650-valve-deckard.dts.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi b/arch/arm64/boot/d=
ts/qcom/sm8650-el1.dtsi
> new file mode 100644
> index 0000000000000..18b7c18ae3120
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi

[ ... ]

> +&iris {
> +	memory-region =3D <&video_mem>;
> +};

[Severity: Low]
Was memory-region =3D <&video_mem>; meant to be removed from the iris node =
in
sm8650.dtsi?

Now that video_mem lives in sm8650-el1.dtsi, leaving memory-region =3D
<&video_mem>; in sm8650.dtsi duplicates the property on EL1 boards and
causes an unresolved phandle build error on any EL2 board that does not
define its own video_mem label.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 86fbb0fd6472d..d88acdb8c7759 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi

[ ... ]

> @@ -4854,12 +4302,9 @@ swr2: soundwire@6d30000 {
>  		lpass_vamacro: codec@6d44000 {
>  			compatible =3D "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-ma=
cro";
>  			reg =3D <0 0x06d44000 0 0x1000>;
> -			clocks =3D <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_CO=
UPLE_NO>,
> -				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> -				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> -			clock-names =3D "mclk",
> -				      "macro",
> -				      "dcodec";
> +
> +			clocks =3D <0>, <0>, <0>;
> +			clock-names =3D "mclk", "macro", "dcodec";
> =20
>  			#clock-cells =3D <0>;
>  			clock-output-names =3D "fsgen";

[Severity: Medium]
Should lpass_vamacro also have status =3D "disabled" here, like the other
five LPASS macro and pinctrl nodes?

Because /delete-node/ &lpass_vamacro; is dropped from
sm8650-valve-deckard.dts and sm8650-el1.dtsi explicitly sets status =3D
"okay" on &lpass_vamacro, leaving it enabled in sm8650.dtsi with
placeholder clocks =3D <0>, <0>, <0> causes va_macro_probe() ->
devm_clk_get(dev, "mclk") to fail with -ENOENT at boot on EL2 boards that
do not override the clocks, and breaks dtbs_check schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D20
