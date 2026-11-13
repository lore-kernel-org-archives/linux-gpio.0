Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563130;
	b=nCACkzUOPL9HQ2c+hys2VZ+hl+SBJh0/8DYErEJXTj5Of4+uYrgpFmYaFa2BmgbSPuz4
	 aWDGY9bQDWv+slg/3DCW3l5lzmt8qNS6v0dAtGG2cGNWe6s2OWC/OPjIvkjQ/heQuFx4j
	 HqcE9rIg0/4mZidBjK28KRFpgFhVyD/Y7oAdrt9Nvv+of5P/S48UDTPrU4/SU7C5aNEy2
	 3ISR6yPDR/80LsmhtjvXljuNb4ia7ZJicW7CequPcBOp6Y9sCeAUn9QBV7+iGO3vPmf7i
	 lVXRV7KCtzSHVapGUIYPRXCKx/2xzc8kZspIsrFE32n5xbdH/sJ3lZMYGn216w5LXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563130;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2mn/wWIxYDd41vuRYClthy3/DhOFNQ4eNSSOfNesclE=;
	b=y9GlZ3DILyXVeShJ4hIm12KarcbMlcol4RngwIbsmTzlM08sDx5L5D7b9Q91NgwJoAOm
	 C9mPINb+2DFpZdoYDP8y5eTb9xtZvxyfgwFqmhrAYgPz3VTTXXoD9CwEwP5rWjUpDLPAn
	 Hk1UQzss3pWOzfQfkon1y3tTO03XjIUF4QqpG9Tm97YLLRylGSfW2eht0ViwjIPBw/R5s
	 1Kp1SlNjsyRIOijqsyZ2QSp0ANteknuIpz4FSFRxno2ozX2McH9PPrrW7ezK3Uu5ZfliA
	 j971XJEvhglGJsl4bAfeV3djX9z3g1cUCIVvdtkpP7tggYnTxAliHZ98uaLfx8qHIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBtXndxH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F650606A337;
	Fri, 13 Nov 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBtXndxH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA89B1F000C4;
	Fri, 13 Nov 2026 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563129;
	bh=2mn/wWIxYDd41vuRYClthy3/DhOFNQ4eNSSOfNesclE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IBtXndxHlGkjyB5i4NQs6sxJd///W8Z30QfbmDgSBK/7uC8zoc2DLv+VjiqscP3Ap
	 He5oizKwIQa0tzlCpzLyE/NBkxTYtzAG1whQh3JCPmLD95dD3qmUZNdJXzD2KCm7YU
	 TWrhSOoDMLGzAiWe2+f+P198b8u99BhANE0HbZ1CnEBleqnbUsDMGQ3dhDEe94JZyJ
	 wS5wtH9lBzb5v2XBxNmblowhH9p0aGoqE6BdVtlWeiqX/uPv0FveqHSp/k59CpbVhw
	 pTt9psksH4OiywyT7vF3SQJreG2c2zk8KuPHVmMnKSemg8vugTwk7vg2F58pbfw9M/
	 uEoOv+g8M6Kiw==
Date: Fri, 13 Nov 2026 09:45:21 +0000
From: Lee Jones <lee@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
Message-ID: <20261113094521.GF6323@joneslee-macbookpro.roam.internal>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112185941.1316112-6-john@phrozen.org>

On Thu, 12 Nov 2026, John Crispin wrote:

> Document the AN7589 pin controller and the GPIO system controller it
> lives under. The pin controller selects functions through a separate
> IOMUX syscon, referenced by the airoha,iomux phandle, and every pin is
> a GPIO in mode 0.
> 
> The AN7589 has no chip SCU dependency and the vendor SDK carries no
> pull or drive registers for it. Groups follow the SDK naming without
> its _grp suffix. As in the other Airoha pin controller bindings, a
> function names a block type, such as uart or i2c, and the group selects
> the instance. The PON groups keep the working mode only: the SDK
> encodes the driver reset sequence as extra pinctrl states, which
> belongs in the consumer driver.
> 
> The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
> one group per pin. The pin also needs its GPIO output enabled, so conf
> nodes allow the GPIO direction and output level. Pull and drive
> properties are not allowed, as no registers for them are known.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
> Changes in v2:
> - One function per block type, with the group selecting the
>   instance, as in the other Airoha pin controller bindings (Conor).
> - List the valid groups for the groups property (Conor).
> 
>  .../mfd/airoha,an7589-gpio-sysctl.yaml        |  66 ++++
>  .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>  .../pinctrl/airoha,an7589-pinctrl.yaml        | 354 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +

Split the MFD parts out please.

>  4 files changed, 423 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
> new file mode 100644
> index 000000000000..0785b61bdda3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/airoha,an7589-gpio-sysctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7589 GPIO System Controller
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +
> +description:
> +  Airoha AN7589 SoC GPIO system controller which provides a register map
> +  for controlling the GPIO and pins of the SoC.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: airoha,an7589-gpio-sysctl
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  pinctrl:
> +    type: object
> +    $ref: /schemas/pinctrl/airoha,an7589-pinctrl.yaml
> +    description:
> +      Child node definition for AN7589 Pin controller
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    system-controller@1fbf0200 {
> +      compatible = "airoha,an7589-gpio-sysctl", "syscon", "simple-mfd";
> +      reg = <0x1fbf0200 0x100>;
> +
> +      pinctrl {
> +        compatible = "airoha,an7589-pinctrl";
> +        airoha,iomux = <&iomux>;
> +
> +        interrupt-parent = <&gic>;
> +        interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        mmc-pins {
> +          mux {
> +            function = "emmc";
> +            groups = "emmc";
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index dae706ca7642..e87158d42e87 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -24,6 +24,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - airoha,an7589-iomux
>                - airoha,en7581-pbus-csr
>                - al,alpine-sysfabric-service
>                - allwinner,sun8i-a83t-system-controller
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
> new file mode 100644
> index 000000000000..57e79e550caf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
> @@ -0,0 +1,354 @@
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
> +              A string containing the name of the function to mux to the group.
> +            enum: [uart, i2c, spi, pcm, pcm_spi, i2s, mdio, mdcs, mdios, emmc,
> +                   pcie, pon, sgpio, watchdog, shiftmux_spi, tod, sync_e, jtag,
> +                   pwm]
> +
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a group.
> +            items:
> +              enum: [uart1, uart2, uart3, uart3_alt, uart4, uart5, uart5_alt,
> +                     uart5_full, uart6, uart6_full, i2c0, i2c1, i2c2, i2c3,
> +                     i2c4, spi0, ext_spi0_full, ext_spi1, ext_spi1_full,
> +                     ext_spi2, ext_spi2_full, ext_spi3, ext_spi3_full, pcm1,
> +                     pcm2, pcm_spi, pcm_spi_cs, pcm_ctrl, i2s, mdio0, mdio1,
> +                     mdio2, mdcs, mdios, emmc, pcie0_rst, pcie0_clkreq,
> +                     pcie0_wake, pcie1_rst, pcie1_clkreq, pcie1_wake, pcie2_rst,
> +                     pcie2_clkreq, pcie2_wake, pon1, pon2, sgpio0, sgpio1,
> +                     watchdog, shiftmux_spi, tod, sync_e, cpu_jtag,
> +                     cpu_jtag_alt, npu_jtag, ibex_jtag, pma50eth_jtag,
> +                     ainpu_jtag, pma50pon_jtag, gpio0, gpio1, gpio2, gpio3,
> +                     gpio4, gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> +                     gpio12, gpio13, gpio14, gpio15]
> +
> +        required:
> +          - function
> +          - groups
> +
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: uart
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [uart1, uart2, uart3, uart3_alt, uart4, uart5,
> +                           uart5_alt, uart5_full, uart6, uart6_full]
> +                  maxItems: 10
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [i2c0, i2c1, i2c2, i2c3, i2c4]
> +                  maxItems: 5
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [spi0, ext_spi0_full, ext_spi1, ext_spi1_full,
> +                           ext_spi2, ext_spi2_full, ext_spi3, ext_spi3_full]
> +                  maxItems: 8
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcm1, pcm2]
> +                  maxItems: 2
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
> +                  const: mdio
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [mdio0, mdio1, mdio2]
> +                  maxItems: 3
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
> +                  const: pcie
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcie0_rst, pcie0_clkreq, pcie0_wake, pcie1_rst,
> +                           pcie1_clkreq, pcie1_wake, pcie2_rst, pcie2_clkreq,
> +                           pcie2_wake]
> +                  maxItems: 9
> +          - if:
> +              properties:
> +                function:
> +                  const: pon
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pon1, pon2]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: sgpio
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [sgpio0, sgpio1]
> +                  maxItems: 2
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
> +                  const: jtag
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [cpu_jtag, cpu_jtag_alt, npu_jtag, ibex_jtag,
> +                           pma50eth_jtag, ainpu_jtag, pma50pon_jtag]
> +                  maxItems: 7
> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> +                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> +                           gpio14, gpio15]
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
> +              An array of strings. Each string contains the name of a pin.
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
> +      compatible = "airoha,an7589-pinctrl";
> +      airoha,iomux = <&iomux>;
> +
> +      interrupt-parent = <&gic>;
> +      interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +
> +      gpio-ranges = <&pinctrl 0 0 74>;
> +
> +      mmc-pins {
> +        mux {
> +          function = "emmc";
> +          groups = "emmc";
> +        };
> +      };
> +
> +      pcie0-pins {
> +        mux {
> +          function = "pcie";
> +          groups = "pcie0_rst", "pcie0_clkreq", "pcie0_wake";
> +        };
> +      };
> +
> +      uart5-pins {
> +        mux {
> +          function = "uart";
> +          groups = "uart5", "uart5_full";
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
>  
> -- 
> 2.34.1
> 

-- 
Lee Jones
