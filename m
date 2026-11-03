Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664318;
	b=pmDnt0+6m48HDfT/W0IZUm9bt6yDXGRuqkd9DWxvC2vAfytEU+k/LOTP8FmoOfFv9WeB
	 TVdHMsLfb/tPy3zNhIGy+OjcTavcNVy/akYVMigcjwFBJz2oTVURfWwAt8RqUIGDD2q47
	 e/1QYNuRiP/kM19OysVwS8lnPw73MngqNGmO0aRhkcKVz84aESp53PGDG4DmJOiyTyu0H
	 sSIStA1pRQmqXeX0CaBos5yuAub0E8YCN3dR5SXfF03lbCDkfPzfxNgEqmbaSIZa6K8Er
	 j/OckrzESRa6VkwSt7Nvjs/8Lo+AY9LW6OO2IZBTR/BuDc2aNpOLohFKmkPv0OfBRQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qeB2TLU5FfiVlcNQvlfLjI69C5+H9lKLzqIcjDo7DDU=;
	b=BTOq3Auz8NBXEQ1as2rFHyQOidZUurqrHje6AMqEEsEdAxp8NM6d6ar5n+hnweN9Rnk+
	 jSWA8VZrYvkKeBKM5NloopQOL7aVF8R8da5EAcsgHteAiQ0+ydALRRMJT25T7haxY0jzJ
	 oeDdenDBrrRJE3qYLDkGnGKNQtDF7b4M1Edh89lHDgKKd7sTub9vjFX0I0Aq35gIgU4B2
	 tOU4oQFDu26kA04YyXbEsubft1TMKV10BnBD8z9qGlkPPaY+eWgP204tjoctEKi5ZKeyi
	 hzmoQ7dxKcZ/hkldBUKjyUVILCHyKfZYAejnj+mHhtEtBvi4C4NdIaEmyF/rMvr99zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUkB65Zm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD0606A326;
	Tue,  3 Nov 2026 00:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUkB65Zm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DC91F000C1;
	Tue,  3 Nov 2026 00:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793664317;
	bh=qeB2TLU5FfiVlcNQvlfLjI69C5+H9lKLzqIcjDo7DDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bUkB65ZmM+b03Vv0bwC73U5LqIorwsGMth5a59X9fT41EaRUkUHuqgl/ZgFwkKTzf
	 d5gKl26U52jc74M+B/rlU97lzO81Hg9DRbVtePt+BHYB+uFdWHkij8iaB2BoKXLkP+
	 ONjAMqLa3gdoM7N6RtUtL6vDWBEPwn+hZ3DbK4sJ7Z3NPIZGrTHnJOsB4v7SJS9N8h
	 zPL3AetKNv9FBKUrAz2r0fsYh33cLNSpHMqhHupy8PQ58Jyu1K5ipxXOpg/jfozdW9
	 xFkdaAoi5XCePfr5o5Ndb2IVWoStCtf9Snb4HGt0M8AOK3lF5HnQ4eiAkwvwTsWcBf
	 mWnfhNwrr+YMw==
Message-ID: <sashiko-outbox-194355@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
 <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 00:05:16 +0000
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

commit f45327f7512fd2e644abcea33601844cbc02415b
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: gpio: vf610: fix clock requirements per SoC

This patch updates Documentation/devicetree/bindings/gpio/gpio-vf610.yaml to
set minItems: 1 on clocks and clock-names and adds per-compatible if-then
rules under allOf requiring two clocks for fsl,imx7ulp-gpio and one clock f=
or
fsl,imx8ulp-gpio.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index a31f64b6d40b4..822fa11d18d97 100644
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
> @@ -116,6 +118,36 @@ allOf:
>          reg:
>            items:
>              - description: GPIO register base address
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks
> +        - clock-names
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
This isn't a bug, but in Documentation/devicetree/bindings/gpio/gpio-vf610.=
yaml
nearly every hardware resource property now differs between the
fsl,vf610-gpio / fsl,imx7ulp-gpio dual-module PORT+GPIO controller and the
fsl,imx8ulp-gpio family (including fsl,imx93-gpio, fsl,imx94-gpio, and
fsl,imx95-gpio), which does not share a compatible fallback with
fsl,vf610-gpio.

The existing conditional in allOf already splits reg and interrupts between=
 the
two hardware families:

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

With clocks and clock-names also diverging across variants, would it be
cleaner to split the fsl,imx8ulp-gpio binding into a separate schema docume=
nt
(or at least fold the fsl,imx8ulp-gpio clock constraints into the existing
else branch above) rather than adding more per-compatible if-then blocks to
allOf?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-gpio-vf610=
-fixes-v2-0-7c71fb36e184@nxp.com?part=3D1
