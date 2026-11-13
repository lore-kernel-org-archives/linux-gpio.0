Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596559;
	b=dohaNP6qlFmRhtvLP442/4gVMfoyaJDeMqNF3VPat0RKcNstINuV0tw3rG8DlG3SD/W1
	 5V4Eh3fzQsVGOXr2ZnhpM6gGdnaTYNdZhse02qCpb35Ok7CX/aLGT9v8aviHg/WeBXSaK
	 WGjj0mvNrEqrdZTm+PZ7QeOp0UF6c3k3e6V0ZRpKrIvo2Un9dfO/1+NrdoYtpBTQ+qoZx
	 7wPHjhCdvmAfCJOZ3AaAalQZV72NsNP8VC3Cp4AgNPgSq6k1NSdL2mqZjIE8VYxZfSTsX
	 FvNJvNXI51+C0v6rPnvu5Apd/XygBbOcTloPe3rIv6ZrXm+CQ6WUB6WWs/vI3FmZBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596559;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KcymmraBkDaAXzH4Jcmsb96TAiK9ZZVzXmBjjM9wTlw=;
	b=EgxbAicIg+FdxJNS9vT1As8MMkZQ1xzLrHH2Rk6M7O0Wsq6B9dprrYpM0ctUXYqBjVl/
	 QK5zsNkIHRQN6DCWVbAe7WYstyNUSwkVLU/3uGz1ELG8c4oJO7yWGCqIg1VLp79gCVKsw
	 o1CEtVKVmCEz+h+4ivI0zWeWobsYTPkBZ7gqtewXVISWGEEaLWhDT3tEbLhHPMiz3cwAp
	 zU38IejeAwX/RdTc6HnvWIlHmkGePaiqeqgp3qEWKneCxsPyP5mkTAgtc7rUXseqZVljk
	 8IYwX+QEzBdYGZ2UEiyalpdEx2MOzCL6dTXX3YInP9za6E7/O66GRmqgOK/9DhGCNog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTmesqnh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0BE606A33D;
	Fri, 13 Nov 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTmesqnh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2A51F000C4;
	Fri, 13 Nov 2026 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596559;
	bh=KcymmraBkDaAXzH4Jcmsb96TAiK9ZZVzXmBjjM9wTlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTmesqnhd5z0cbPmBegHcn7wIqCqbvycZ9pp8SLA8s3TRm5k/Eh6EUdLjmlvwWGOU
	 QbR+y2TsJSIgw/8kfaJKBahtP0ffsnY75/jlNKTHmevrGYYOSGc6Obw9hhW81sFrZe
	 ITTTV1hQTrDOMcJueQowOsROk97pIjPoOKpP+RLCHnixoLT3XEU5xX8hFNQdijwhiy
	 xLbYb+9I00IM9LavKF5tmN2R0MEy5Ds9scyguzl4ZqZxOqHcD+9He7RjnqHHQZ85El
	 EGun0wLpMaLEgrvjLthzlZJLKj48pIjzWxJZKa9zwr9XoDTbL0YOnsGphRwH5GXQqp
	 D6CV6R3ymybJA==
Message-ID: <sashiko-outbox-213493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP
 is not used
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:02:38 +0000
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
- [Low] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: redundant
  oneOf in clocks
--

commit d8422bb265d6e088cce5d6024805eb9ced00d38a
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and po=
wer domaines when ADSP is not used

This commit updates the SM8650 LPASS LPI pinctrl DT binding schema to
allow a single core clock and add power-domains properties for platforms
where the ADSP is bypassed.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-=
lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lp=
ass-lpi-pinctrl.yaml
> index 1bf08860a4baf..4c54f873199cc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pin=
ctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pin=
ctrl.yaml
> @@ -29,11 +29,25 @@ properties:
>        - description: LPASS LPI TLMM Control and Status registers
> =20
>    clocks:
> -    items:
> -      - description: LPASS Core voting clock
> -      - description: LPASS Audio voting clock
> +    oneOf:
> +      - items:   # for ADSP based platforms
> +          - description: LPASS Core voting clock
> +          - description: LPASS Audio voting clock
> +      - items:   # for ADSP bypass based platforms
> +          - description: LPASS Core voting clock
> =20
>    clock-names:
> +    oneOf:
> +      - items:   # for ADSP based platforms
> +          - const: core
> +          - const: audio
> +      - items:   # for ADSP bypass based platforms
> +          - const: core

[Severity: Low]
Could clocks and clock-names set minItems: 1 alongside the two-entry
items list instead of using oneOf?  Because the single-entry ADSP bypass
list is a strict prefix of the two-entry list, minItems: 1 avoids
duplicating the first item in both properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D3
