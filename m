Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398308;
	b=x5g8uSC+HigRNA2BTlzqmy9hwfm0CzzvzzE1no7s2/Uyq6c7z/xItICp1XkS2a2Kqpqz
	 yhSb8jsXhwzbQ6WkJOAu2EE1h4LO1j8pL5mNSHQvMJc6G9trbp87cPNDTgKp0OtJ2zl1Y
	 henEPiTL4ux6nWvKVCG4nuEu/MCSxrmoCErsXx4GWYOdOKCJvoC5EIjr/asZ9EGkNj6Gi
	 aguuBcGHAWJ5uPdH2NXVO0ZtuFEA2PMtML6JWLxRPugvdynReJNDnPymh/UCSWFmFoEq6
	 s0K+WW+8YzI9uuP7O6TbE6sBqtpztsL3udS8hjdQ2z5bHnBoiv5lTMs55Nfd8KC7H9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398308;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oz5SlJgrGu4UhTOVmsH7I1R54EhLhnkLq2SixCKxJ1Q=;
	b=yC32v3edDmdlj2YLxO6pkTpD+H/O+uzVQNbIaM7GGL4cFC3HnCzgcRGPQAsNsjYwIGjN
	 RoVkZ/WJmoVjw9P6fdXkI0iX1vXQITsLQkGd1g3BmrNYV+uJJe41Gd4t3hbXaZbL7QCre
	 mmopUAgbkzg1aa2faBll2QP8oSmCGEIfK5pk16DYCpaHC8+2LHemExJHm/+3glmhbxE1T
	 1w8U1OgoL7OzlfzVA1CAyZdmRZL2azwz75Tjl60xFXl1JWnSkGf1tkWBqGxek1D4ujo/u
	 btjqZTRo61sSscoc5PHgrebcuvPGCui/HBkbybNbfkSC0OP6OpWd2krXfShDF1XB3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMafgIIO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF67606A32C;
	Mon, 23 Nov 2026 01:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMafgIIO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24361F000C6;
	Mon, 23 Nov 2026 01:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398308;
	bh=oz5SlJgrGu4UhTOVmsH7I1R54EhLhnkLq2SixCKxJ1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nMafgIIOQc2ObS3cJYVGC+ta6UK4/7Bq2rzDOorhFLAg7+Z3zzIQWrZ5PL99hPFGR
	 9lbzTXFCpbk/CMqK4yA8akAR4bL+p3E7HUVff9DeUSnFoowFLqDTVJjuvCgKKxypwZ
	 2st8ALrJu4MJv6B5f1kGe/8DSq2d3L+pUnfycwFXAvmQ0nhnZgxdiw4atK2uam1y8r
	 tf1nIximPMJ3l8A4i5A5ejU4Q53MmTOakJkfC62J1SduEVyNoAiWRHrLFkdyuxeEyf
	 pBc9JT7QhjCVV/tWXK6ND71pqJ6/y0OSeVp8O24ubK16qow+7A5QK/EViH7zPT0io5
	 Lmtk7Kr99IjZg==
Message-ID: <sashiko-outbox-228530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122-sf19a2890-gpio-v3-1-3a4857ebc84a@telaak.dev>
References: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
 <20261122-sf19a2890-gpio-v3-1-3a4857ebc84a@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:45:07 +0000
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
- [Low] dt-bindings: gpio: siflower: interrupts listed before clocks in
  schema
--

commit c75e336698c08299c54fb54d2e37ab281072dfba
Author: Chuanhong Guo <gch981213@gmail.com>

dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller

This commit adds the Device Tree binding schema for the Siflower SF19A2890
GPIO controller and adds a MAINTAINERS entry for it.

> diff --git a/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gp=
io.yaml b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.ya=
ml
> new file mode 100644
> index 0000000000000..830a049ae4f56
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/siflower,sf19a2890-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 GPIO controller
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +properties:
> +  compatible:
> +    const: siflower,sf19a2890-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: One interrupt per group of 16 GPIOs.
> +    maxItems: 4
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +
> +    gpio@19d00000 {
> +        compatible =3D "siflower,sf19a2890-gpio";
> +        reg =3D <0x19d00000 0x100000>;
> +        interrupts =3D <GIC_SHARED 246 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 247 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 248 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 249 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&gpioclk 0>;

[Severity: Low]
In DT binding schemas and example nodes, clocks should be listed before
interrupts (compatible, reg, clocks, interrupts).  Should clocks be moved
before interrupts in properties, required, and the gpio@19d00000 example
node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-sf19a2890-=
gpio-v3-0-3a4857ebc84a@telaak.dev?part=3D1
