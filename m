Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9937CD50;
	Tue, 21 Jul 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642717; cv=none; b=LZX5cGBritqlE3pG4T3oUC8H5xg/Xb/p8duGBv0RVglgYasopSsqHpfS9b0LCwfxCfV+i+bCti49ub849oAufEHrEHJwKl/CJhYlS9oFZeSAIzSi/L6FDknOAugE7QZL6i4NlqZauWQ8d5OQvYPKBDQHQg4IP7EiqSdvcVt4bGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642717; c=relaxed/simple;
	bh=YJHeXleh+u25Ur8MGu9GslfGrieSyw+AZ478FmkTprk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o32JzkT3wXx18UyCu7Rhya52gyxWFDhUhmsT99rW7nTafk66ysHRA3RBz2BsBDiA8ZGQ4LdTJ7oqErnKAStMlq9x5xOvcPqxt5c3zhHR4psDAzFwwcOWbeyFup6uYTA9NnxuOTRhjde/rlhQBRns6O0or+HqRfgsNdZ5nb75sYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnqgFPDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnqgFPDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E561F000E9;
	Tue, 21 Jul 2026 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642714;
	bh=NvXhyObv8Q4c5B9Uk+5YC91nxLpj1Zz/rAFCzWh3jVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PnqgFPDdGyZkAryChLv4E0lQPirWg2o7H4lZVzLESp7VnjEBpbzJdTC0EGoy3GeRt
	 s+EaNAItE5clhuLezLXjQ6PA92Qw/xQL3VAKnittfhvHxOEBOpREzURUKWl05ahm4X
	 FEOlRxcQQRGF8JSh75LEOxE5O/WUoFHFingp6xIlnF2z9yNr3L6rbwMyTOO4/1tkrL
	 YloxAEIHGMEdnmGl/pQFNoBoYPOfTYt9NLMaqv+/7G7ZSVovkOnKsUGAmIDf/6eDKT
	 5gwMO/ArLeNvOePbQ818RE6UG2jxmQBTZHIPDyqqy2WWfvPOrRf6J8aZBBZQHvYWQt
	 exG+kDGjb8I5Q==
Date: Tue, 21 Jul 2026 09:05:13 -0500
From: Rob Herring <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: linusw@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
Message-ID: <20260721140513.GA3492266-robh@kernel.org>
References: <20260719183431.124061-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719183431.124061-1-challauday369@gmail.com>

On Mon, Jul 20, 2026 at 12:04:31AM +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Pin Controller devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v2:
> - Add container node for grouped pin configuration sub-nodes
> - Correct regex patterns of direct and nested child nodes
> - Fix interrupts values in uart2 example
> 
> Link to v2:https://lore.kernel.org/all/20260707144223.120417-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Add interrupts and clocks to uart2 example to satisfy uart schema validation
> - Corect regex patterns to accept standard DT node naming conventions
> - Add function property to top-level pin configuration nodes
> - Remove restrictive enum from function property to support all mux functions
> 
> Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challauday369@gmail.com/
> ---
>  .../pinctrl/microchip,pic32-pinctrl.txt       |  60 -------
>  .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 153 ++++++++++++++++++
>  2 files changed, 153 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
> deleted file mode 100644
> index 51efd2085113..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -* Microchip PIC32 Pin Controller
> -
> -Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
> -../interrupt-controller/interrupts.txt for generic information regarding
> -pin controller, GPIO, and interrupt bindings.
> -
> -PIC32 'pin configuration node' is a node of a group of pins which can be
> -used for a specific device or function. This node represents configurations of
> -pins, optional function, and optional mux related configuration.
> -
> -Required properties for pin controller node:
> - - compatible: "microchip,pic32mada-pinctrl"
> - - reg: Address range of the pinctrl registers.
> - - clocks: Clock specifier (see clock bindings for details)
> -
> -Required properties for pin configuration sub-nodes:
> - - pins: List of pins to which the configuration applies.
> -
> -Optional properties for pin configuration sub-nodes:
> -----------------------------------------------------
> - - function: Mux function for the specified pins.
> - - bias-pull-up: Enable weak pull-up.
> - - bias-pull-down: Enable weak pull-down.
> - - input-enable: Set the pin as an input.
> - - output-low: Set the pin as an output level low.
> - - output-high: Set the pin as an output level high.
> - - microchip,digital: Enable digital I/O.
> - - microchip,analog: Enable analog I/O.
> -
> -Example:
> -
> -pic32_pinctrl: pinctrl@1f801400{
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	compatible = "microchip,pic32mzda-pinctrl";
> -	reg = <0x1f801400 0x400>;
> -	clocks = <&rootclk PB1CLK>;
> -
> -	pinctrl_uart2: pinctrl_uart2 {
> -		uart2-tx {
> -			pins = "G9";
> -			function = "U2TX";
> -			microchip,digital;
> -			output-low;
> -		};
> -		uart2-rx {
> -			pins = "B0";
> -			function = "U2RX";
> -			microchip,digital;
> -			input-enable;
> -		};
> -	};
> -};
> -
> -uart2: serial@1f822200 {
> -	compatible = "microchip,pic32mzda-uart";
> -	reg = <0x1f822200 0x50>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart2>;
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> new file mode 100644
> index 000000000000..7a36e5ff61dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/microchip,pic32mzda-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PIC32 Pin Controller
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: |

Don't need '|' here.

> +  PIC32 pin configuration node is a node of a group of pins which can be used
> +  for a specific device or function. This node represents configurations of
> +  pins, optional function, and optional mux related configuration.
> +
> +properties:
> +  compatible:
> +    const: microchip,pic32mzda-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1

These 2 aren't needed. No 'reg' in the child nodes.

> +
> +patternProperties:
> +  '^(?!pinctrl_)[a-z]+[0-9]*_[a-z0-9_]+$':
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +    properties:
> +      pins:
> +        description: |

Don't need '|' here.

> +          List of pins to which the configuration applies.
> +        items:
> +          type: string
> +        minItems: 1
> +
> +      function: true
> +
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      input-enable: true
> +      output-low: true
> +      output-high: true
> +
> +      microchip,digital:
> +        description: Enable digital I/O.
> +        type: boolean
> +
> +      microchip,analog:
> +        description: Enable analog I/O.
> +        type: boolean
> +
> +    required:
> +      - pins

Put all this under a $defs entry and then do:

additionalProperties:
  oneOf:
    - additionalProperties:
        $ref: $defs/pin-node
    - $ref: $defs/pin-node

Rob
