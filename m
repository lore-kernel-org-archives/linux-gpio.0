Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466275;
	b=CM4fwUIMgSs5JkVGLGmcZS0x1mXtArd362wws6ysgAHBCEL3Gvv3dNQH3Thft9fVc0GY
	 CLoV5qJjghVUpWZirp5gfwFKQyjFEt6VL+v6e3O7z1ytFvROK6bYosUAcWjuohv/ZPYFo
	 iBksH2uB3hP/qJz9/BIgarA7rJ43TaA/zEwJdgHC38xmz4of0t9yDoUeY7sdJSm0HzXlm
	 MopMHxQLp8o6nUB8dpP4r/6zHWeFKn1sJZ6i1tbEepP2sfZK6DkjnW1Vk98kSpQDEDazk
	 BvMEkuR1UAEHREtwKSmQuImtvIXMV+VSrVJYXMGGxqhXRwEysrHoVe50kuf8BTh9a5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cT4+26bw+nlveyk1ygYZKPWMBO4GitGR/GIbG7Vg2kQ=;
	b=XyVjxuPx8oBhgi5Cl6HBvZcceLjW/ht0/I1lTaoUf9ruG7FOO5GeY1yTPoki0BBm8BeS
	 Nx8oFB3qpakLzw3wSujQG2HMqoBAOUb08OitYdh147DmSuI+bNJJZWnOcjYnJcCsgj6yL
	 CCENilCjb4hK812knAq4YrzbNbiUz1rLLy7BtNIxw8ww11dmauZEK+JWP+0RRfJ3bcgA0
	 GBIDYFPYfSuRiLj3AWZAPtdqmCyqlK8gPUYMKf36Ost9zJtWdau0DG3ZBUZ5yHjnvjHwX
	 yMi1sYW96vMcR2IUiO9ViOWOEys5IwqsTAJUUN4sZ/AJByrvAany8vIe5jrcvxCFIwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1IoA2ND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875BA606A31E;
	Mon, 23 Nov 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1IoA2ND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2232A1F000C4;
	Mon, 23 Nov 2026 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466275;
	bh=cT4+26bw+nlveyk1ygYZKPWMBO4GitGR/GIbG7Vg2kQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d1IoA2NDSb6KAhysDhHG/JnTv2/xpGMeVXp2B9HXXQiAOq2IDJ7HIFK6D/jBxpU3p
	 AhKxGO/ojDSwzAcEwLBhfKDspjkJB7IzLSMfreWxXV+9k6jnXXX1NrLCDixkjvLSva
	 l0cmq2bGNFn95OPbYJB/tZ9ciYaE3mfvRclL3QF2/1qthBSP3Uf+Yg7YUO38+kjE5m
	 lnZLpTiH9dsJPlRoKQXjg2t1xH5EN4umskF7sjtnDMxSLD3HkJVX1d2aLNqwbRJ5XY
	 Gpcy5zxDsL2/wT53C5XwPViqbc64TFQX4+7+sFjdsRWbTWIxttdL9UxhnBa8B07b/c
	 BouglJ5apHtuQ==
Message-ID: <sashiko-outbox-230006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: Add Cortina Systems CS7542
 global control block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-cs7542-syscon-v2-1-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
 <20261123-cs7542-syscon-v2-1-1cd74b2522f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:37:54 +0000
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
- [Low] dt-bindings: soc: cs7542-syscon references missing
  cs7542-pinctrl schema
--

commit 07450862dd3e19e1c7ed8329f2ae5067c2a63e4a
Author: Fil Dunsky <filipp.dunsky@gmail.com>

dt-bindings: soc: Add Cortina Systems CS7542 global control block

This commit adds the devicetree binding schema and clock specifier header
for the Cortina Systems CS7542 global control block.

> diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542=
-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542=
-syscon.yaml
> new file mode 100644
> index 0000000000000..fb074de870bd4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon=
.yaml
> @@ -0,0 +1,49 @@

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: cortina,cs7542-syscon
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  pinctrl:
> +    type: object
> +    $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#

[Severity: Low]
Does referencing /schemas/pinctrl/cortina,cs7542-pinctrl.yaml# here break
dt_binding_check at this commit?

Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml is
not introduced until the following patch in the series, commit
"dt-bindings: pinctrl: Add Cortina Systems CS7542 pin mux", so running
make dt_binding_check on this commit alone (or if the soc and pinctrl
patches go through separate trees) fails with an unresolvable schema
reference.  Adding the pinctrl property to cortina,cs7542-syscon.yaml in
the patch that introduces cortina,cs7542-pinctrl.yaml would keep each
commit self-contained.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-cs7542-sys=
con-v2-0-1cd74b2522f9@gmail.com?part=3D1
