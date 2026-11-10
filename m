Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286114;
	b=Q+CzIISf+7k4Zsk/GFw4/UIrpuck8Mq1GB+DZhhIkbs0RY8gGKfOdzfUL6ZWMSqJg5Hw
	 PEerMzpAM7kkleogbtzBcDy1PeKs6uQQ2sn/v6AF25x53J9krSVihdzdG3sS7Zf7LfFrQ
	 tejYbRrF+NGlqnNZWiggrYs8Mdzpqsu5p+yLHyBn06AK5hDGhWx5kKw8XznmcKr7fV3cL
	 mWYxb936Ayw9ydkLUJWiq4yEelXlZDMwtmvrALTovOKKDj1O8ZxYTcRclMOzQ0kA43Y/F
	 r1kNFM0DqEfbBaAridbVEa3O/ZlPdLSbLx3r7G5dZT+4EqDTnCJRiXBkV5VWA3LRiRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286114;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9VwxulyI4IYkj42ysC7mIKOm3hBg+WCrlXiC9fUfoWU=;
	b=CkioUYlVXIrzpc7EL3ODPJcHRBLgHTWrZMFhGTvrkx8NPmYVSSyy4VezhMQSGzvdIx25
	 U16DWkWeU98QR8XvbDHUCooajBAtPireyq1YavMNPK85cEBiNfPedQdbmU4+TZjzWR+i+
	 0cK6NBVxaQKptVbLan48Ern6zWmOL6+YvBg8dJ4zFEUYVDQnF6aykHZZPF2OqWhZKZqgW
	 4hqlaXMCveZGJrJ9DWJl8RK0MCo6cW2XyREOX4IoLB2jlrB+KwoT0Qil95KaNg6cTLp0b
	 CtES4//1+BCFULkBMVA3ml1rHvL/8Z/IJSeyMkYUKQRAYzbyAOjRhAklgPS7yWjcAYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTmc9DHh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E7606A32A;
	Tue, 10 Nov 2026 04:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTmc9DHh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6DB1F008A1;
	Tue, 10 Nov 2026 04:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794286113;
	bh=9VwxulyI4IYkj42ysC7mIKOm3hBg+WCrlXiC9fUfoWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTmc9DHhGgnvGimbmejmXJDMa02FQ4dZlfCb8WWJcf8m8p6fjk4GoYILEwJ5vwbTu
	 Ym68phclUp3zMSRh0sF2TdOSehyl0Gsamc9R37R88zCZhfpqbzdHD9WXgUY4Gyhfhh
	 7/GrDRxLLfIMJnipG0WesxSWsnj4IjMnaZCMazTX2zu9vH1lnNsuRZIOKw2dj/zikQ
	 oNxp0uOD9WPNV+epRBO8h1CzFGR7tfD7XlCN9fdiNH5u7yuRgbuSwQjO/gsqVZ0Rdu
	 P4yeZQuzYOuVxtUEbr1cIw4xEKt5lW+567r2tYZYEeRkrXlPBHGfL1dR58i1HEINQD
	 pL9qISCv416FQ==
Message-ID: <sashiko-outbox-206240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 01/14] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-cv75-gpio-v14-1-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
 <20261110-cv75-gpio-v14-1-e586aad0467a@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:48:32 +0000
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
- [Medium] dt-bindings: gpio: pl061: split incompatible
  ambarella,cv75-gpio schema
- [Low] dt-bindings: gpio: pl061: undocumented ambarella vendor prefix
--

commit 1c2d672e664996e2a994481958b71e50ae2d14df
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: gpio: pl061: add Ambarella CV75 variant

This commit adds the ambarella,cv75-gpio compatible string and its
required arm,primecell-periphid and gpio-ranges constraints to the ARM
PL061 GPIO binding schema.

> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Doc=
umentation/devicetree/bindings/gpio/pl061-gpio.yaml
> index 4d970e55104bb..c22dd8a1d2c18 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> @@ -15,7 +15,9 @@ select:
>    properties:
>      compatible:
>        contains:
> -        const: arm,pl061
> +        enum:
> +          - arm,pl061
> +          - ambarella,cv75-gpio
>    required:
>      - compatible
> =20
> @@ -25,7 +27,9 @@ properties:
> =20
>    compatible:
>      items:
> -      - const: arm,pl061
> +      - enum:
> +          - ambarella,cv75-gpio
> +          - arm,pl061
>        - const: arm,primecell

[Severity: Low]
As reported by Krzysztof Kozlowski on v1 [1], is the ambarella vendor
prefix documented in Documentation/devicetree/bindings/vendor-prefixes.yaml?
Using ambarella,cv75-gpio without a matching vendor-prefixes.yaml entry
triggers checkpatch (UNDOCUMENTED_DT_STRING) and dt_binding_check
warnings.

> =20
>    reg:
> @@ -64,6 +68,21 @@ required:
>    - "#gpio-cells"
>    - gpio-controller
> =20
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/arm/primecell.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ambarella,cv75-gpio
> +    then:
> +      properties:
> +        arm,primecell-periphid:
> +          const: 0x000e8061
> +      required:
> +        - arm,primecell-periphid
> +        - gpio-ranges
> +
> +unevaluatedProperties: false

[Severity: Medium]
Should ambarella,cv75-gpio be split into its own binding schema instead of
adding variant conditionals to pl061-gpio.yaml?

The CV75 controller has 32 lines per bank, adds extra registers, is not
register-compatible with the 8-line ARM PL061, and does not implement the
PL061 PrimeCell ID in hardware. Keeping it in pl061-gpio.yaml subjects a
32-line bank (where gpio-ranges is required) to the 8-line PL061 limits of
maxItems: 8 on both gpio-ranges and interrupts, causing dtbs_check
failures if a bank needs more than 8 disjoint ranges or interrupts.

[1] https://lore.kernel.org/r/a8b0729c-d6ff-4fa0-955e-deb0af0e726b@kernel.o=
rg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-cv75-gpio-=
v14-0-e586aad0467a@ambarella.com?part=3D1
