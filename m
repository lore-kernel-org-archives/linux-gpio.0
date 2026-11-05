Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851779;
	b=zfRh86FGjFiYgmY3F6IcwOsEiBpW0i7VQiEFGSloM80596gQSd9VHMfHKKqJutWHeBzU
	 MhoGpu2tF514Zp5xMGipqiSwbyT/gkfm8Z6w89ZkfGyungoaamlIxPPNn4M6+191okpgr
	 mDQTnxK0wVMq954zL1SAAuulm5eQOZ8lzOdsfjv3/Ujoypp+OdwvbbaS4p3mHoNPE1yrs
	 WtS4J6B3aR7LEWgP+OuKxBTmBhTY/4pMg8UUT+N1ox9il0C4DUZdUHBMqjmPRJiiBeb07
	 QXKFiDhXtT6iHBS2T4ZkAE4181POX4vAQuMCvvnqEg9C9AFEXGZ6Vvynx+zmWqmUTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851779;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gILZcq9VEcz3UUom4qJ/yX8BZAhWIY+hh9gyo4CF+Yw=;
	b=CTWMsIYHrg2xgenT1d6ukDGvYB89ezWsGyW47zNun7wrgFXCPC6Fst2wxPXUQCPoaaNz
	 nyyAS8djYaNp5I3Bq915ZNpB86wFHmuMCiJrxuWKNsLbc6RQd73nWihF0LfI8MzUkFoG8
	 nuq3+beQ8liED3EK7jkN78b4sZiR0ofDuOGGXT7YcfIO4XYrbV5RSfXNy01v0Le91k4g+
	 xnC2P/ne5/5weM/PSP+Hz/qWU4fYmYn+JOUalA3Acy9fidXBwcoUr1QtmuVlRgaJ43Ph6
	 cHpvBSR1LtcsTXmXkMMpukWy9DxKaYIXZsnQJFQZIZShqcJl+RbtM8lW/3Hi8d7uxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FL1ExOEL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AD9606A326;
	Thu,  5 Nov 2026 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FL1ExOEL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D511F000C1;
	Thu,  5 Nov 2026 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793851778;
	bh=gILZcq9VEcz3UUom4qJ/yX8BZAhWIY+hh9gyo4CF+Yw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FL1ExOEL+gve6wWhxMpTqeBV+QlVI2GHgI0vuDRGndeiCnGT6PZ8JXYkFWsrePoCR
	 z8kswVxNKcRSy1LZQqZONqqu2XZwr7R4LYEsft9PflEqxQvlFmEdkAVAFIymDYahbj
	 lqYfMbY3Lo2PchQjQzqnBNzI5/5ih71KZL1YnlQpMJt3mKroYCpX3amzkHThUZKoS0
	 C/tQ0RIE4SMuK1jGTTIFd0W9QbLuSAsjZ7nTnJ5AizKij0QCAXt2zEjiAiY8v43Nep
	 9HtAvLW9tKxotMnpWhLeDSGL4rOrTI1XXVdJ2xpXKov/ab7PGUt1I12f20QCRa17gl
	 Nfszu95pOwKhQ==
Message-ID: <sashiko-outbox-198541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 04:09:37 +0000
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
- [Low] dt-bindings: gpio: vf610: unwieldy per-compatible conditionals in s=
chema
--

commit ea7be1f0505474b900ce5dd27177e80fd2222683
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: gpio: vf610: fix clock requirements per SoC

This commit updates the gpio-vf610 device tree binding schema to enforce
SoC-specific clock requirements for VF610, i.MX7ULP, and i.MX8ULP (and its
derivatives) via conditional blocks in allOf.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index a31f64b6d40b4..d1d5315ee1648 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -57,11 +57,13 @@ properties:
>      maxItems: 32
> =20
>    clocks:
> +    minItems: 1
>      items:
>        - description: SoC GPIO clock
>        - description: SoC PORT clock
> =20
>    clock-names:
> +    minItems: 1
>      items:
>        - const: gpio
>        - const: port
> @@ -117,6 +119,45 @@ allOf:
>            items:
>              - description: GPIO register base address
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,vf610-gpio
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - clocks
> +        - clock-names

[Severity: Low]
As reported by Sashiko on v2 [1], this isn't a bug, but in
Documentation/devicetree/bindings/gpio/gpio-vf610.yaml, the fsl,imx8ulp-gpio
family (including fsl,imx93-gpio, fsl,imx94-gpio, and fsl,imx95-gpio) does
not share a compatible fallback with fsl,vf610-gpio or fsl,imx7ulp-gpio, and
almost every hardware resource property now differs across the variants:

Documentation/devicetree/bindings/gpio/gpio-vf610.yaml:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,vf610-gpio
              - fsl,imx7ulp-gpio
    then:
      properties:
        interrupts:
          maxItems: 1
        reg:
          items:
            - description: PORT register base address
            - description: GPIO register base address
    else:
      properties:
        interrupts:
          minItems: 2
        reg:
          items:
            - description: GPIO register base address

Along with reg (2 items on VF610/i.MX7ULP vs 1 item on i.MX8ULP) and
interrupts (1 item on VF610/i.MX7ULP vs 2 items on i.MX8ULP), clocks and
clock-names are disallowed on VF610, require 2 items on i.MX7ULP, and requi=
re
1 item on i.MX8ULP.

Rather than relaxing the top-level clocks and clock-names properties to
minItems: 1 and adding three more per-compatible if-then blocks in allOf,
would it be cleaner to split the fsl,imx8ulp-gpio binding into a separate
schema document?

[1] https://lore.kernel.org/r/20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@n=
xp.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-gpio-vf610=
-fixes-v3-0-504e19de5ad5@nxp.com?part=3D1
