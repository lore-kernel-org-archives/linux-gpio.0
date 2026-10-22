Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695701;
	b=OP7RHL7SLzMMOPUwZj9RdZfFctvm/LE7RFBAPzpczNrQxDQOYG5WFBtviQmS1P63huQb
	 Jw6MO4AJv2fKxiy+SQspbbfDu36wKCfx0UuFgWyhTQ9Mqjh366Rqg9PW9h4PPc6Vl2S8T
	 OSm/xPB6WYgfnCpUvlZYwFxUwEFQFI0j0GVaw56IyH7nNQtpY/IVjw1rQX8/h6Av47SSP
	 eb1hFJt5lwNverLdgbKSjPBih5VknouZ29PRniFoGwrmOH0zgZQztZtWWLND05C+nyUTd
	 xSuM7c2cJvEa1u+Vi30rYQLrAC2FVPDP7DXSbdSqXLuUVS5sDhz+sDkymn5weglv+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695701;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rs0wUm4z/DbVk/Ptat8LwHiYek8GxKp3J9MUJ5meML4=;
	b=ZmQkKanOvMc6L5y6eLzF4DVX+j7tghX8rI1qnaRCGw0cSXTG9hgn214G8YLAwgpnnsfM
	 pQXawOUmb5qLpFTJRGhvngTZ4+Czu9eFHlKD5U6AuzPMLNhRMEtAM48SCljFieiE0aiap
	 bXAeFYyT7UuqC4eaJ4xQqu8ZO6nHswEGX4zy1fXi5LeeXuUTgRW96TJX735yzuN+c5SOa
	 3ecKeWLmAz2gfedoHDcD4t6PT9usr1kXhRl+iRCYVJLJDXo7t153/b0bXyMfLak16+oIN
	 TLuTJVdLa2FmCUuw2usFaszBt+O7jXm44Jwp2g2pTgWXDpsjv+0MU2IJhUuc4wVdpoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLfpY2NM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B6606A319;
	Thu, 22 Oct 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLfpY2NM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBDB1F01825;
	Thu, 22 Oct 2026 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792695701;
	bh=rs0wUm4z/DbVk/Ptat8LwHiYek8GxKp3J9MUJ5meML4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LLfpY2NM38Ectvk595i3sSkrIIB1Qa09Zn/6PYQFjtkZL9ZQByfimQ1AWSL4vLocN
	 nKgt84BXHt++6ODdDkpRfuYSCDxsE1n9A7wW5KQeyx9+IVEGOh6uFWPvDL9YrSjKvL
	 QKXQYYeLMM79aRZrQpnxqxYurg2Jl0WbXnRX75zfOFVWvhbgiGKbNkIv+ZNUBzEjZX
	 jqLk9qKhrdW8Gd4nBeIS5uxLXPPXBdeow0ZMeuc2CQjtdysldaBB/74jWGAofFIIg6
	 DlCc9R887q9NAkNtYHBDSVJxvRZ96nR6J4GpoWS5saz2dFGX4C2hVJBtS6iFtF+gS+
	 1TeiO25XLS88A==
Date: Thu, 22 Oct 2026 20:01:33 +0100
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>,
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 08/18] dt-bindings: pinctrl: add Zhihe A210 pin controller
Message-ID: <20261022-gyration-rimmed-98c5a8e1138d@spud>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-8-5e438f972d24@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="2O9Ps+gKElYzliia"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-8-5e438f972d24@iscas.ac.cn>

--2O9Ps+gKElYzliia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 03:53:28AM +0800, Han Gao via B4 Relay wrote:
> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>=20
> Add bindings for the four A210 pad controllers. Describe the shared
> PERI3 SDIO mux and per-pad bias controls.
>=20
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       | 206 +++++++++++++++=
++++++
>  1 file changed, 206 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
> new file mode 100644
> index 000000000000..51cbb0189f47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/zhihe,a210-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZhiHe A210 pin controller
> +
> +maintainers:
> +  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> +
> +description: |
> +  Pinmux and pinconf controller of the ZhiHe A210 RISC-V SoC.
> +
> +  The pads of the A210 are split into four groups, each managed by its
> +  own pad controller with a separate register range:
> +
> +    AON pad controller     -> zhihe,a210-aon-pinctrl
> +    PADCTRL0 (peripheral1) -> zhihe,a210-peri1-pinctrl
> +    PADCTRL1 (peripheral2) -> zhihe,a210-peri2-pinctrl
> +    PADCTRL2 (peripheral3) -> zhihe,a210-peri3-pinctrl
> +
> +  Each pad can be muxed individually to up to 8 different functions,
> +  though for most pads only a few of those configurations are valid.
> +  A few pads in the AON group do not support muxing or configuration
> +  at all.
> +
> +  AON, PERI1 and PERI2 pads support configurable drive strength, bias,
> +  input enable, Schmitt trigger and slew rate. PERI3 has a separate pad
> +  layout: its six SDIO pads share one mux bit. Select their function with
> +  the "sdio" group. Per-pad bias can be configured independently.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - zhihe,a210-aon-pinctrl
> +      - zhihe,a210-peri1-pinctrl
> +      - zhihe,a210-peri2-pinctrl
> +      - zhihe,a210-peri3-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: pclk
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +
> +    description:
> +      A pinmux group referenced by a consumer's pinctrl phandle. It
> +      contains one subnode per set of pads sharing the same pinmux and
> +      pinconf settings.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +
> +        description:
> +          A pinctrl node describing the pinmux and pinconf settings of
> +          one or more pads.
> +
> +        properties:
> +          pins:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins
> +            description: List of pads that properties in the node apply =
to.
> +
> +          groups:
> +            items:
> +              - const: sdio
> +
> +          function:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
> +            enum: [ aouart, aouart_ir, aogpio0, aogpio1, aoi2c0, aoi2c1,
> +                    aospi, jtag, reset, por, pmic, dvs, uart0, uart1,
> +                    uart2, uart3, uart4, uart5, uart6, uart7, uart8,
> +                    uart9, uart0_ir, uart1_ir, uart2_ir, uart3_ir,
> +                    uart4_ir, uart5_ir, uart6_ir, uart7_ir, uart8_ir,
> +                    uart9_ir, gpio0, gpio1, gpio2, gpio3, gpio4, gmac0,
> +                    gmac1, spi0, spi1, qspi0, qspi1, pwm0, pwm1, pwm2,
> +                    can0, can1, can2, i2s0, i2s1, i2s2, i2s3, i2c0, i2c1,
> +                    i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c7_smb, sdio,
> +                    isp0, dptx, usb31, sata_p0, sata_p1, hdmi, zmac,
> +                    bsel, dbgm, cdbg, pdm, tdm, pcie_x1, pcie_x4,
> +                    sen_vclk ]

These sorts of things always make me wonder: do uart4 and uart5 actually
need to be different functions, or can you just use a uart function
because no pin can potentially have more than one uart muxed to it?
Ditto for spi, i2c, gpio etc.

> +            description: The mux function to select for the given pins.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23,
> +                    25 ]
> +            description: Drive strength in mA.
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            maximum: 1
> +
> +        oneOf:
> +          - required: [pins]
> +          - required: [groups]
> +
> +        additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: zhihe,a210-peri3-pinctrl
> +    then:
> +      patternProperties:
> +        '-[0-9]+$':
> +          patternProperties:
> +            '-pins$':
> +              properties:
> +                pins:
> +                  items:
> +                    enum: [SDIO_CLK, SDIO_CMD, SDIO_DAT0, SDIO_DAT1,
> +                           SDIO_DAT2, SDIO_DAT3]

Where do these SDIO_CLK etc come from?

> +                function:
> +                  enum: [sdio, gpio4]
> +                drive-strength: false
> +                input-enable: false
> +                input-disable: false
> +                input-schmitt-enable: false
> +                input-schmitt-disable: false
> +                slew-rate: false
> +              if:
> +                required: [function]
> +              then:
> +                required: [groups]

Can you please explain why this uses a group for sdio when the binding
would be more straightforward if you just used pins?

> +    else:
> +      patternProperties:
> +        '-[0-9]+$':
> +          patternProperties:
> +            '-pins$':
> +              properties:
> +                groups: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@2026000 {
> +        compatible =3D "zhihe,a210-peri1-pinctrl";
> +        reg =3D <0x2026000 0x1000>;
> +        clocks =3D <&clk 0>;
> +        clock-names =3D "pclk";
> +
> +        gmac0-0 {
> +            gmac0-pins {
> +                bias-disable;
> +                drive-strength =3D <13>;
> +                function =3D "gmac0";
> +                input-disable;
> +                input-schmitt-disable;
> +                pins =3D "GPIO0_0", "GPIO0_12";

This is confusingly ordered. pins then function, followed by config
properties please.

> +                slew-rate =3D <0>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    pinctrl@542000 {
> +        compatible =3D "zhihe,a210-peri3-pinctrl";
> +        reg =3D <0x542000 0x1000>;
> +        clocks =3D <&clk 0>;
> +        clock-names =3D "pclk";
> +
> +        sdio-0 {
> +            cmd-data-pins {
> +                bias-pull-up;
> +                pins =3D "SDIO_CMD", "SDIO_DAT0", "SDIO_DAT1",
> +                       "SDIO_DAT2", "SDIO_DAT3";
> +            };
> +
> +            sdio-pins {
> +                function =3D "sdio";
> +                groups =3D "sdio";
> +            };
> +        };
> +    };
>=20
> --=20
> 2.55.0
>=20
>=20

--2O9Ps+gKElYzliia
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpdjQAKCRB4tDGHoIJi
0srGAQD8Wmx4MSx/QsFYOVhzBdh5CqeN76etlocPbBI1pNK9IgD/TU0qur/KGsux
BhBTt6yZ/hpnHcUVC8fuGBwPAx1ltQs=
=DM3s
-----END PGP SIGNATURE-----

--2O9Ps+gKElYzliia--
