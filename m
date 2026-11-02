Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602642;
	b=OYu9MI8OTMaTEWELzxjlgc19ivWSidw/qwU+MNt8MMIBaa23Jn5k6KSn4stOr5FEiLkd
	 UdnzLM7y+Uzl0UV+475GxZohzvwWXM558pF1xuVDDQX4dejgMY9KgADktGNnm986EzIGc
	 7IHFun51BKVqngi+p6MwJppmJgNff8dR2INAj8PjmrlUQy3n+/B+rRhjCWmewjUSDbXgF
	 /SVhm5XLV2333H7MjraCsRYb359sIYGINyP8nxycVZvDnkfdNzpftYVCLK8FySDyCKw3m
	 Zbhr19/wEoDm3Dp30nUtFEPHCsDZ4Ut2QdN+SOwqx5sP6MtbJPSkVlFBufJVTOyItnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602642;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0WXBppUmza4/JYqxNoquqcjhhNA0mSK9KkPkoaHyFwE=;
	b=wzFyoro/2Yo0fdjyoJeUJNznRCP5RNS5cVMGK2Qw3MDb+mI9B81tPZ6ECZ+QSBYAAf7S
	 ooMVpyfQJuEILg6G9MvWvWLsX/lqt+iIrYShf6fUOT3RZvXLt/lB11B+xYLYQ7CocTh9A
	 QTJogCEgv3UXTiCRu+rsjpNw/MmRSFpDbxGOEZaHbaTfHXw2fGk32Y5cKuI01VZw3o4sl
	 fTGmexgGj1vPt9a29zh/srJTWdar2GaaY6CK5PxNnmrOsn14P18EC0/DjwCNv6Ircaike
	 KOUOy5CWRCzSiMZUZZIFWi5xkfbqSTLAp3PwOR3m75j2ifhTjBnzoYLCugcEwGFL7qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnk6Or7e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C2606A324;
	Mon,  2 Nov 2026 06:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnk6Or7e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DEE1F000C1;
	Mon,  2 Nov 2026 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602641;
	bh=0WXBppUmza4/JYqxNoquqcjhhNA0mSK9KkPkoaHyFwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnk6Or7e2MRVo/8o3/vWFA6aHKxbeHkmQo2P1BHEg/umcYm1Za+iMFO1unR9QpEH8
	 FR6o8cJ6Xsw81GHII6tDBe7Vva50bzx+GOwOt+rTQ6Phn7pVnMPIiacHEo6we9FgJW
	 eah0yaE7AtgEzY/lq8wBLJPgBqrVizSiKrseN+i20ckJSPbl9oz4eatVSmHCwoL0SZ
	 GYHAGh9nGCrqL6umaZvo898Vq6ZJrBCJiQhAagFst0s7tOIsArkquGnkMn9IHIdqCX
	 Wo2sTyQMmaLSAyJHhFt4PsIAaOfxKSIH9yHvE26bL7/UXxNvxFpc03lXJounUKdaqV
	 9BxijmAhMlSiQ==
Message-ID: <sashiko-outbox-192986@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/13] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-cv75-gpio-v13-1-4f93114ea204@ambarella.com>
References: <20261102-cv75-gpio-v13-0-4f93114ea204@ambarella.com>
 <20261102-cv75-gpio-v13-1-4f93114ea204@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 06:57:20 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: gpio: pl061: split incompatible ambarella,cv75-gpio=
 schema
- [Low] dt-bindings: gpio: pl061: undocumented ambarella vendor prefix
--

commit 698f86de70b79c39ee77a80fb98df0823e4d3989
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: gpio: pl061: add Ambarella CV75 variant

This commit adds the ambarella,cv75-gpio compatible string and variant
constraints to the ARM PL061 GPIO controller Device Tree binding schema,
requiring gpio-ranges and a fixed arm,primecell-periphid of 0x000e8061.

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

[Severity: Low]
As reported by Krzysztof Kozlowski on v1 [1], does the ambarella vendor
prefix in ambarella,cv75-gpio need to be documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml first so that
checkpatch.pl and make dt_binding_check do not report an undocumented vendor
prefix?

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
Should ambarella,cv75-gpio be split into its own binding schema document
instead of adding conditional rules to
Documentation/devicetree/bindings/gpio/pl061-gpio.yaml?

As noted in the commit description, the Ambarella CV75 controller has 32-bit
registers and 32 lines per bank, adds MASK and ENABLE registers, is not
register-compatible with the 8-line ARM PL061, and does not implement a
standard PrimeCell ID in its hardware ID registers.

In Documentation/devicetree/bindings/gpio/pl061-gpio.yaml, the existing
properties are constrained for an 8-line PL061 block:

  interrupts:
    oneOf:
      - maxItems: 1
      - maxItems: 8
  ...
  gpio-ranges:
    minItems: 1
    maxItems: 8

Requiring gpio-ranges for ambarella,cv75-gpio in this schema leaves the
8-item limit in place for a 32-line bank, and arm,primecell-periphid is only
defined inside the conditional then branch rather than top-level properties.
Given these hardware and schema differences, would a separate schema file f=
or
ambarella,cv75-gpio be cleaner?

[1] https://lore.kernel.org/r/a8b0729c-d6ff-4fa0-955e-deb0af0e726b@kernel.o=
rg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-cv75-gpio-=
v13-0-4f93114ea204@ambarella.com?part=3D1
