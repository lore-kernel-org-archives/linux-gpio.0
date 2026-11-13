Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596265;
	b=HI1f8iXhmwTdBjs54A0KP1HqcihDNIXM81VUdd7FFRtvl0mgdkLqcmrGShGyRJUngQpt
	 UtgOe8haR5n8ohe1LOLYgQ6nn/+WjZcl1UaRsRxz5gV+PDv0qGQQHTT2OE6bSetIU0ooF
	 /GJHh3D98gyiDVJcHiVxt+cWa0/F3z4IO38AfHtbmTrfw+jKIU5GmEoQMXDsTpHWnTOQA
	 feMdGI4CjB+KL+jKcGt/uxjuRMcZU6XQLpg24+FslI2YHRZfCJ+PNxRZQCCUF7r9qoLl1
	 gNk2yFLXlpWdBWWfz+ghofPcLTPDdpieoQRUerwAH6Yr0sC8VGH13omlIv18U75JTHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596265;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P0vDlfUEgp19oAyPGa2aSEKT9gUbabutfM6+fvEzzt8=;
	b=qHPa9WceZJKr6iPAfRluRWOh8nqZpuPAIsZGKUVSocpynMpXFYNAcDoOb4Fbw+lIRH6s
	 wgoUiY5g4PZISXdZHNPwNhfMjSiLXrBbmmA9AXbwC7hT2/wut27fRLakCCs4nzHW+cKwp
	 oaaSHBqPJ1S6BFuDsH3Lz1AON2owMTIi+TrhUJgSBomOusAViavH83+CFVJplicaTuVQ3
	 BqDnDoAzbdNf2UOItAu2ZFm29J6YEBNt/u44cXqpvAHzvTkhLCaXEHnM/ZeMLozKt3U00
	 dLUHLBmn6Ln9bo0nhbFSn7Kl4wOjhxTmH+cUfIn7qCo51cs0i6MuQaW5jiljJjHZb5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTvX3ayb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C99606A338;
	Fri, 13 Nov 2026 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTvX3ayb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2B81F000C4;
	Fri, 13 Nov 2026 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596264;
	bh=P0vDlfUEgp19oAyPGa2aSEKT9gUbabutfM6+fvEzzt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTvX3ayb9btVItIyMMHbSVMcS84GLbnpAOVQPAM207Y5JBHAiA4S5ZYnh3NKX6nJG
	 l/K5ErrrMVjuIoqJyKtPM7NilXuj1mIZcSblxyTOqA2R/iFHGoVAwp4MnkbdJniaVC
	 ivQlRtu2TnBwGMlAhrQ9VbvFuOzTPy7FhpmP+QVOHHu19moWppu+4BZlYJAQz8oiub
	 jnEa55NLEfQwZaCLg8WMSTA7ObsWdIubCwNU4zanb0qcmLWXReUW+haT5VBoRf+fSB
	 iDRknZvkCJCY0SGxPXcB6gWRUAdIDgUUbHE888/1cnAYx1tp7RlzjMoJNCzWsRpOy8
	 n0QTZNggzkIqw==
Message-ID: <sashiko-outbox-213486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/23] ASoC: dt-bindings: qcom,lpass-cpu: document
 the SM8650 LPASS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 18:57:44 +0000
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
- [Low] ASoC: dt-bindings: qcom,lpass-cpu: split unwieldy per-compatible
  schema
--

commit f17c7c8f20845c2d15f821f60a13b5f93656ae8d
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS

This commit adds the qcom,sm8650-lpass-cpu compatible string and its
register, clock, and interrupt definitions to the qcom,lpass-cpu binding
schema.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml =
b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 3a559bd07a79b..f431173a0e880 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -23,32 +23,33 @@ properties:
>        - qcom,apq8016-lpass-cpu
>        - qcom,sc7180-lpass-cpu
>        - qcom,sc7280-lpass-cpu
> +      - qcom,sm8650-lpass-cpu
> =20
>    reg:
>      minItems: 1
> -    maxItems: 6
> +    maxItems: 8
>      description: LPAIF core registers
> =20
>    reg-names:
>      minItems: 1
> -    maxItems: 6
> +    maxItems: 8
> =20
>    clocks:
>      minItems: 3
> -    maxItems: 10
> +    maxItems: 16
> =20
>    clock-names:
>      minItems: 1
> -    maxItems: 10
> +    maxItems: 16
> =20
>    interrupts:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>      description: LPAIF DMA buffer interrupt
> =20
>    interrupt-names:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
> =20
>    qcom,adsp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -59,6 +60,8 @@ properties:
>      maxItems: 3
>      description: Phandle to apps_smmu node with sid mask
> =20
> +  dma-coherent: true
> +
>    power-domains:
>      maxItems: 1
> =20
> @@ -241,6 +244,65 @@ allOf:
>          - iommus
>          - power-domains
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpass-cpu
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 16
> +          maxItems: 16

[Severity: Low]
Should this binding be split into separate schema files (sharing common DAI
definitions via a common schema ref if needed) instead of adding another
large per-compatible if-then block to qcom,lpass-cpu.yaml?

Each SoC variant here has substantially different reg, clock, and interrupt
counts and names.  Fitting qcom,sm8650-lpass-cpu into the same schema also
widens the top-level maxItems limits and enables dma-coherent at the top
level, which relaxes validation for older compatibles like qcom,lpass-cpu
and qcom,apq8016-lpass-cpu whose if-then blocks only constrain clocks and
clock-names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D7
