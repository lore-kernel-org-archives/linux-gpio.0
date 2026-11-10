Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335286;
	b=m4J/L3O9k4m226n61W0HUGThQBRadF+kmPn6IQZm1CV64IWCuyP8crFiJrAyuwkeEEFx
	 MBZNOveQwh/7rMiWG0jLakIFw4Av+2TWEIf7gyLoweM+AbiMS7wEUMffM09T5VNaBIQWW
	 /KVUqgmLVQ7LrQg1SAqrRIXDU68lQiFtt3Pb5ThAwlJWKxk4BGtTNQI2GTXayk4Q2T2iH
	 NdfXcekXtPolaZmWQhrTwH8XB++ZMptHSuJdxrPP2U+4tqZyofqBBhekpF0C0sk9V2JTa
	 mkONLJMb1+O6JAphoZG5/f5gXQmeQQBbqxeh6cCrjIvFvf5jFJHCYAuXtCZFM8E4FGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335286;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M+aCGpxDDWKZIbUP3XUcpN5E3gNDE7DhU6lbG83ghVo=;
	b=dMFPqIHCYtWDKI8O52aXugy5Lv7HXrUg7qH6M/QiarySzsgOYDzFFcAkKE5YiCXXLGB7
	 POxj5LGwlA1GmwHl5kDmBBeoT8FEXCzgblBe796keQie2rdWuisll03X4jv8Zrsc0fdii
	 VKUoGKoMnEmEHoyC9LHQT33oehUhV1byoyw3AcbCHPQ8EOxZNXSrQdrB7ikRZp87pAfDE
	 NMYeubwqfHsVoKXH2yfaTFzArIuYncfrFbj76FxA6UZyYip0+hWonvNy2pGaJPtIoObNO
	 owhcoNTd4cydMku2oe+vSP6VccW/2aSQe5xttyHVpU6hXiO29r17TAO9jTyElzsYSAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EY9kJahW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B369C606A32D;
	Tue, 10 Nov 2026 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EY9kJahW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C161F008A3;
	Tue, 10 Nov 2026 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335285;
	bh=M+aCGpxDDWKZIbUP3XUcpN5E3gNDE7DhU6lbG83ghVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EY9kJahWhBIo3O2c6Q4lTUWY2m/RnZbkKJNkfNxFljL2jk5FKQRCeqik38Kv77NK5
	 p67iQ0PAGL+ADzPe0jDDiYOHRUEAODloSbk8zE4dXswLYFFg939oc3PlCFEdjyxlqj
	 ORSmkuT74lUcn80ghySpjuViW8AFoAfK33acVN6tVoVLVtL3BmOi/xuKuGSQBEj8A3
	 AeseLMpCHf9N7x/Sa7ym7UdJdytkxEDIwcPqyZmVeyD2yL+IBUlPXJRuVmAn+FzaQ3
	 K2mRYmteaH18alwG7y8tckf4GTEIMNqGJPdCA8XcP/gFg7lmheNqUpIyNe5MUy/PiQ
	 gkacUho5DcANQ==
Date: Tue, 10 Nov 2026 18:27:58 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: airoha: add AN7589
Message-ID: <20261110-attribute-animosity-720536bc561a@spud>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-6-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FyZVtBqZ4S/8tzNc"
Content-Disposition: inline
In-Reply-To: <20261110173941.301478-6-john@phrozen.org>

--FyZVtBqZ4S/8tzNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 06:39:39PM +0100, John Crispin wrote:

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.=
yaml
> new file mode 100644
> index 000000000000..546e333f3467
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
> @@ -0,0 +1,533 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/airoha,an7589-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7589 Pin Controller
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +
> +description:
> +  The Airoha AN7589 pin controller is used to control SoC pins. Pin
> +  functions are selected through a separate IOMUX register block, one
> +  mode field per pin. Every pin is a GPIO in mode 0.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7589-pinctrl
> +
> +  airoha,iomux:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the IOMUX syscon holding the per pin mode fields.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - airoha,iomux
> +  - interrupts
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +
> +    patternProperties:
> +      '^mux(-|$)':
> +        type: object
> +
> +        description:
> +          pinmux configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pinmux-node.yaml
> +
> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the=
 group.
> +            enum: [uart1, uart2, uart3, uart4, uart5, uart6, i2c0, i2c1,
> +                   i2c2, i2c3, i2c4, spi, ext_spi1, ext_spi2, ext_spi3,
> +                   pcm1, pcm2, pcm_spi, i2s, mdio0, mdio1, mdio2, mdcs,
> +                   mdios, emmc, pcie0, pcie1, pcie2, pon1, pon2, sgpio0,
> +                   sgpio1, watchdog, shiftmux_spi, tod, sync_e, cpu_jtag,
> +                   npu_jtag, ibex_jtag, pma50eth_jtag, ainpu_jtag,
> +                   pma50pon_jtag, pwm]
> +
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a gr=
oup.
> +
> +        required:
> +          - function
> +          - groups
> +
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: uart1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uart1]

This stuff here is a signal to me that the functions are too detailed.
Each group here can only be one uart, so all you need is a function
called "uart"?

That said, you need to define the groups as you've done for the
functions.

> +          - if:
> +              properties:
> +                function:
> +                  const: uart2
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uart2]
> +          - if:
> +              properties:
> +                function:
> +                  const: uart3
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [uart3, uart3_alt]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: uart4
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uart4]
> +          - if:
> +              properties:
> +                function:
> +                  const: uart5
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [uart5, uart5_alt, uart5_full]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: uart6
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [uart6, uart6_full]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c0]

It's the same ehre, seemingly i2c0 can only go to the group named i2c0,
so there's no point having each i2c as a different function.


This seems to apply to every function here, so the binding can be
simplified significantly.

pw-bot: changes-requested

Thanks,
Conor.

> +          - if:
> +              properties:
> +                function:
> +                  const: i2c1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c1]
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c2
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c2]
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c3
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c3]
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c4
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c4]
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [spi0, ext_spi0_full]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: ext_spi1
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [ext_spi1, ext_spi1_full]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: ext_spi2
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [ext_spi2, ext_spi2_full]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: ext_spi3
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [ext_spi3, ext_spi3_full]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcm1]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm2
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcm2]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm_spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcm_spi, pcm_spi_cs, pcm_ctrl]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: i2s
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2s]
> +          - if:
> +              properties:
> +                function:
> +                  const: mdio0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdio0]
> +          - if:
> +              properties:
> +                function:
> +                  const: mdio1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdio1]
> +          - if:
> +              properties:
> +                function:
> +                  const: mdio2
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdio2]
> +          - if:
> +              properties:
> +                function:
> +                  const: mdcs
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdcs]
> +          - if:
> +              properties:
> +                function:
> +                  const: mdios
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdios]
> +          - if:
> +              properties:
> +                function:
> +                  const: emmc
> +            then:
> +              properties:
> +                groups:
> +                  enum: [emmc]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie0
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcie0_rst, pcie0_clkreq, pcie0_wake]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie1
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcie1_rst, pcie1_clkreq, pcie1_wake]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie2
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcie2_rst, pcie2_clkreq, pcie2_wake]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: pon1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pon1]
> +          - if:
> +              properties:
> +                function:
> +                  const: pon2
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pon2]
> +          - if:
> +              properties:
> +                function:
> +                  const: sgpio0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [sgpio0]
> +          - if:
> +              properties:
> +                function:
> +                  const: sgpio1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [sgpio1]
> +          - if:
> +              properties:
> +                function:
> +                  const: watchdog
> +            then:
> +              properties:
> +                groups:
> +                  enum: [watchdog]
> +          - if:
> +              properties:
> +                function:
> +                  const: shiftmux_spi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [shiftmux_spi]
> +          - if:
> +              properties:
> +                function:
> +                  const: tod
> +            then:
> +              properties:
> +                groups:
> +                  enum: [tod]
> +          - if:
> +              properties:
> +                function:
> +                  const: sync_e
> +            then:
> +              properties:
> +                groups:
> +                  enum: [sync_e]
> +          - if:
> +              properties:
> +                function:
> +                  const: cpu_jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [cpu_jtag, cpu_jtag_alt]
> +          - if:
> +              properties:
> +                function:
> +                  const: npu_jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [npu_jtag]
> +          - if:
> +              properties:
> +                function:
> +                  const: ibex_jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [ibex_jtag]
> +          - if:
> +              properties:
> +                function:
> +                  const: pma50eth_jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pma50eth_jtag]
> +          - if:
> +              properties:
> +                function:
> +                  const: ainpu_jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [ainpu_jtag]
> +          - if:
> +              properties:
> +                function:
> +                  const: pma50pon_jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pma50pon_jtag]
> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpi=
o6,
> +                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
> +                           gpio13, gpio14, gpio15]
> +
> +        additionalProperties: false
> +
> +      '^conf(-|$)':
> +        type: object
> +
> +        description:
> +          pinconf configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pins:
> +            description:
> +              An array of strings. Each string contains the name of a pi=
n.
> +            items:
> +              pattern: '^gpio([0-9]|[1-6][0-9]|7[0-3])$'
> +            minItems: 1
> +            maxItems: 74
> +
> +          input-enable: true
> +
> +          output-enable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +        required:
> +          - pins
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,an7589-pinctrl";
> +      airoha,iomux =3D <&iomux>;
> +
> +      interrupt-parent =3D <&gic>;
> +      interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      gpio-ranges =3D <&pinctrl 0 0 74>;
> +
> +      mmc-pins {
> +        mux {
> +          function =3D "emmc";
> +          groups =3D "emmc";
> +        };
> +      };
> +
> +      pcie0-pins {
> +        mux {
> +          function =3D "pcie0";
> +          groups =3D "pcie0_rst", "pcie0_clkreq", "pcie0_wake";
> +        };
> +      };
> +
> +      uart5-pins {
> +        mux {
> +          function =3D "uart5";
> +          groups =3D "uart5", "uart5_full";
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa647f5d37dd..2041a8aed28f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22137,6 +22137,8 @@ PIN CONTROLLER - AIROHA
>  M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
> +F:	Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
>  F:	drivers/pinctrl/airoha/pinctrl-airoha.c
> =20
> --=20
> 2.34.1
>=20

--FyZVtBqZ4S/8tzNc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNiLgAKCRB4tDGHoIJi
0iYAAQDOSVgdOB003hKGiPNMIS5sPE6yEAqTn2joBxcrwLQn7AEAqtd04bIgGsZu
SXSSHtx+Ip54oDxfQTfyPM7lWuNkqQo=
=kaEI
-----END PGP SIGNATURE-----

--FyZVtBqZ4S/8tzNc--
