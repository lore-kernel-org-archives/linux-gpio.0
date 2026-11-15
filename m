Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740288;
	b=V6nbO6yei2l5NrhjX3arXS3j+KD91ZxftvFblHLUvwPvLzWYmHyO0ST26QFzh+13nG3K
	 wTnIsJeow5wX+EKOdTQ2THWdcJW/vEBU+q+x0+xyrrnlcpSICnJzzfO/u7rc06H5rr1D9
	 MfiyQpJQdpeP9S1zhEc8DVy6dl5nLnjYjdyD/4AwSpRjqYFXrB6lsBIzasjXSklbggUp1
	 mlXDy5yalLPeDxeMjlPaoRJwCO19H0BehucogYAcFKzBAka9gRlxCuovWEx5BOG9Rulj8
	 SAgpUV/ULjQzi+CVNpBoZO9A0P30ZigOnC7i+1ML0h/K+zs2/JKiBteia1wkjhD+4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740288;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vDPrFVPd8/nJy34hCxf/DjJxWDPxL4dSqyBmRFn67pg=;
	b=VBcdXxftU4Ho+ClJ+cTTRnFz5r+rh2MnYUN0tnGarN+nr33LPFBXdaPeeJm2YHPZwRPx
	 UOJjPsOM0M3w/Kim0LGVWLVxZieKPpG/AsK0gQq4QsHpcTek19KIlDInZw69vn7iNvrkK
	 I5JTLc16/ZC/UEfdlb3Iw6nbtaZBlEGblavSWEO6aKZlHRLS5bklHqrrUMVBdi98i8TMV
	 8W+iGYiSnl+osqihs2Fq10ILGR+aAaZlFxcYFsPC/u3U4j4UUSYvxLz5eA48+Pz/U9joq
	 Sq5Q3KVedYehDsgGdSNSvITnW5RiiIyLtqtnpPcM/CPMBeBAGMQiUAm7MNGlel7nXUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9iG0c8W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C493F606A31A;
	Sun, 15 Nov 2026 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9iG0c8W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DC21F000C4;
	Sun, 15 Nov 2026 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740288;
	bh=vDPrFVPd8/nJy34hCxf/DjJxWDPxL4dSqyBmRFn67pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9iG0c8WlakZvK3hzovpGqY/blVRuCvTbXsj+5vSgylWqs9ymJ2Wuk2rXCt+1n1Wa
	 4WoIkPKsKV0gUISzxYDuVMijAukMKv/Sc9p5YLj426uQiFf29KcYwO+nWtiHN1KBbP
	 FQ4JoOxnYVNImwx1TzazhJJRKTw2uOKC1zok1OCskBwijDtGVomCHr21qR+eKHsHFZ
	 N1J8Ba+kpS0HMvi5I7TZ/NnJrVDtNN4Jvo0Gkbhy0VOWGm7zCwHRVZaj1tEONgJ1iE
	 F0i5V8M/OydeMgJooqaEBcpL/mw+QjeDHkw2OyUPMOiFalPZJbJoOZszEr8xdJbsxV
	 EubsSHQHB+h2g==
Message-ID: <sashiko-outbox-215431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] dt-bindings: soc: synaptics: add SL2610 system
 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-6-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-6-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:58:07 +0000
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
- [Low] dt-bindings: soc: synaptics: split dissimilar SL2610 syscon
  blocks into separate schemas
--

commit bc8ce74277532ebd4eaa1fb7ce6d4be07d8dfe52
Author: Jisheng Zhang <jszhang@kernel.org>

dt-bindings: soc: synaptics: add SL2610 system controllers

This commit adds a Device Tree binding schema and clock/reset header
definitions for the Synaptics SL2610 SoC, MCU, AVIO, and CPU system
control register blocks.

> diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-=
soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl26=
10-soc-syscon.yaml
> new file mode 100644
> index 0000000000000..cdf947cb3e0f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-sys=
con.yaml
> @@ -0,0 +1,178 @@

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - syna,sl2610-soc-syscon
> +          - syna,sl2610-mcu-syscon
> +          - syna,sl2610-avio-syscon
> +          - syna,sl2610-cpu-syscon
> +      - const: syscon

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - syna,sl2610-soc-syscon
> +              - syna,sl2610-mcu-syscon
> +    then:
> +      required:
> +        - '#clock-cells'
> +        - '#reset-cells'
> +    else:
> +      properties:
> +        '#reset-cells': false
> +      patternProperties:
> +        '-(pmux|pins)$': false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: syna,sl2610-cpu-syscon
> +    then:
> +      required:
> +        - '#clock-cells'
> +        - syna,gbl-syscon
> +    else:
> +      properties:
> +        syna,gbl-syscon: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: syna,sl2610-avio-syscon
> +    then:
> +      properties:
> +        '#clock-cells': false

[Severity: Low]
Should these dissimilar system controller blocks be split into separate
binding schemas instead of combining them with three per-compatible
if-then-else blocks in allOf?

Only the SoC and MCU blocks provide resets and pin mux subnodes, only the
CPU block uses syna,gbl-syscon, and the AVIO block exposes none of these
providers.  Splitting the schema by block role would avoid toggling most
properties and patternProperties per compatible.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D5
