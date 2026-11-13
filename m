Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597796;
	b=wE1fb6fcOMVHwqjU4OWezMulxayt4TXPr7BZhJD99wM9aOjGwdpjITw6xG2unLL7NJGz
	 9/8N87SaekeIA9ou4UhbrIgj21Y79KXTjqlaOx8HMeuYpBs3sVO+PTb/0TH6+DTv4bL9S
	 CiZDelHsDgqekikjiLAWY2gy70h0aqFLN4+/hRq92BvKgTPvjKERjXHInrOPwwBecdFJK
	 N++cVrlRbTRJhrgILlpuBH0lQtpA8+igCOd85sE3GlmGub6AZTjc+UJWrC4bfbDY0aaIS
	 CD1+3TCqzsO3oxAEqodpz66cgixpBrfSaL2iotPpT9FJiOkKbPqQvImkF5na4QkJZdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JXKKwHVxInsndtUs/0yvRQbzFzI58tKEJsLZA3ssRfA=;
	b=XqJtUdwn7tHpfrUD3ZUGTVHx7NktVgEePgm0yUyeBPDLzEszcZLd4viFLZyIWGGr6kzT
	 UD2CTpEwg+AngB72U7KuD7GWgr1KJiEz+uB0vHjZsg4gBPzLSospYEeDOSW+pWOtaC+t0
	 FcAbZNvPhEfFWnW8dUfYodDdzaLSDpHIv1yso/wi88uS38evIotzDx29v1AD0jSlMFbHX
	 1PWlQMZQinvZtLmyOK8zcsYcAEvshovdQXcoLz6Cdqv55Xy+C1oF2+k61CXZtn9KmUFCI
	 8+51oSLrK8p2eK3xUO8VehhIbwNkfX26drVrKCwmM61INWlUCV9uPbOE7A9wJlK4+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuK74rCK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837AC606A89A;
	Fri, 13 Nov 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuK74rCK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003581F000C4;
	Fri, 13 Nov 2026 19:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597796;
	bh=JXKKwHVxInsndtUs/0yvRQbzFzI58tKEJsLZA3ssRfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuK74rCKL99W77V5C9xYqkYm4TDaHkaYX5wZVVDjzfSmiL7X5AokKHbik1HwibV8O
	 mRlH/uTbkuUN5Bq+fVurRoJwRw4kaimBNd8j3j5YsSeWGBYDh+SYg9lYsjpCtKpWKq
	 AUJCmdcpALrpFA+CEipjtbqYuLGodCjtXwoEca70moEuXHMKFLyFId4PFfa5giAefq
	 k02DGmraLVweYJJJdY+D3m97Kmd8cGki6vmTrKYbYUKcr0sh6lax//VGsdqJ5c5O0J
	 GtnYJqJSHi3LRZUqarNXw7UUTABPeRu0z03vQa6GqwDEhgOPUFCv7uk/e1NKZ0wmos
	 +LCXgXOAMTHzg==
Message-ID: <sashiko-outbox-213545@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard:
 enable audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:23:15 +0000
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
- [Medium] arm64: dts: qcom: sm8650-valve-deckard: missing VA DMIC1
  route in audio-routing
- [Low] arm64: dts: qcom: sm8650-valve-deckard: unused lpass_rxmacro and
  lpass_txmacro enabled
--

commit 159b85c8d3e0dd02d73b32823f4b0aaab92103dd
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-valve-deckard: enable audio

This commit includes sm8650-lpass-cpu.dtsi and configures the SM8650 sound
card, lpass_cpu, and macro nodes to drive the speakers on Senary MI2S and
the DMICs on the VA macro.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm=
64/boot/dts/qcom/sm8650-valve-deckard.dts
> index a365caa28cee4..723f7911fc547 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts

[ ... ]

> @@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
>  		};
>  	};
> =20
> +	sound: sound {
> +		compatible =3D "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
> +		model =3D "VALVE-DECKARD";
> +
> +		audio-routing =3D "VA DMIC0", "vdd-micb";

[Severity: Medium]
Should audio-routing also include "VA DMIC1", "vdd-micb"?

lpass_vamacro uses dmic01_default and the LPASS_CDC_DMA_VA_TX0 DAI in
sound/soc/qcom/lpass-sm8650.c sets channels_min =3D 2.  In
sound/soc/codecs/lpass-va-macro.c, "VA DMIC0" and "VA DMIC1" are separate
DAPM ADC widgets, so without routing "VA DMIC1" to "vdd-micb", enabling VA
DMIC1 without VA DMIC0 will not power the vdd-micb regulator supply.

> +
> +		speaker-dai-link {
> +			link-name =3D "SPKR Playback";
> +
> +			cpu {
> +				sound-dai =3D <&lpass_cpu MI2S_SENARY>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&left_spkr_i2s>, <&right_spkr_i2s>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name =3D "VA Capture";
> +
> +			cpu {
> +				sound-dai =3D <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&lpass_vamacro 0>;
> +			};
> +		};
> +	};

[ ... ]

> +&lpass_rxmacro {
> +	status =3D "okay";
> +};
> +
> +&lpass_txmacro {
> +	status =3D "okay";
> +};
> +
> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>;
> +	pinctrl-names =3D "default";
> +	vdd-micb-supply =3D <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate =3D <2400000>;
> +};

[Severity: Low]
Are lpass_rxmacro and lpass_txmacro intentionally enabled here?

The sound card only uses MI2S_SENARY and lpass_vamacro, and nothing on this
board consumes DAIs or clocks from lpass_rxmacro or lpass_txmacro.  Probing
them registers unused ASoC components and calls lpass_macro_pds_init(),
which holds active runtime PM references on the macro and dcodec power
domains for the lifetime of the drivers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D22
