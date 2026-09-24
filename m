Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD283CF1EF;
	Thu, 24 Sep 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240867; cv=none; b=hVjQ3Ktz3txLrSgUUyoIsElhNlkELkLlqWMosfgcQBpR8PEOslL4GCu0W20sLeaJnH+ztS7ZqIQ+8MIbCg4ultwWufMhUBpvLkwpJIxAdtrPv3RI3BL6eGkqT0ppvuLSAtC94mWoJxFLPLrFMUDUZv7a2vaoQAA7htnPozINCcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240867; c=relaxed/simple;
	bh=KCpkwX3n9hDTqSNw48pPQoWBY0FYrWUGqdnZtj2ba/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5pS3YFHP9QsMH692gOPitoyB8gFK8796yCFy9hufZYwN8eYr4MEKk7j5lw251x55RzODzNOdAxbXgcNY5CGd5RGl5Sh8tEEIf3p/nRTsEhrew/RL2b1qgcKSqNA3wNkcJV1H8oEMXfggUPXZurn11aVG4rDtiuj9Y6xkIGhZWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Lg0Ij3N6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Lg0Ij3N6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6686B1516;
	Thu, 24 Sep 2026 02:07:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8609B3F86F;
	Thu, 24 Sep 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790240863; bh=KCpkwX3n9hDTqSNw48pPQoWBY0FYrWUGqdnZtj2ba/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lg0Ij3N6WVWS4N+OYN2hfyqo2WvEhy7KK3wQywFVE5UG/R8DywLrfxYuW45vNJY6d
	 pmPerYPn3hSU4jzj0AFR4h3OaxXAhFO0GypCth150WgOVAF2J9ECiv7wyAsOmGv/19
	 8+/thaVS4iiXGenDxi+2mBgVObYURDzgpxm1V9/0=
Message-ID: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
Date: Thu, 24 Sep 2026 11:07:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin
 controller
To: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-3-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923201701.43391-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pablo,

On 9/23/26 22:16, Pablo Mazzini wrote:
> One controller at 0x01c20800 with four external interrupt banks.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 ++++++++++++++++++

Why is this a new file? Can't you just add the new compatible string to 
the existing allwinner,sun4i-a10-pinctrl.yaml binding?

Cheers,
Andre

P.S. Since we have seen this a lot lately: please wait with a new 
version of your series for a few days, to allow other people to comment, 
and to allow discussions to settle down. Not everyone can respond quickly.

>   1 file changed, 108 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
> new file mode 100644
> index 000000000000..806da97ab708
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner B288 Pin Controller
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-b288-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      One interrupt per bank of external interrupt capable pins.
> +    maxItems: 4
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: High Frequency Oscillator
> +      - description: Low Frequency Oscillator
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: hosc
> +      - const: losc
> +
> +  gpio-controller: true
> +  interrupt-controller: true
> +  gpio-line-names: true
> +
> +  "#gpio-cells":
> +    const: 3
> +
> +  "#interrupt-cells":
> +    const: 3
> +
> +patternProperties:
> +  "-pins$":
> +    type: object
> +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      pins: true
> +      function: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      bias-disable: true
> +      drive-strength:
> +        enum: [10, 20, 30, 40]
> +
> +    required:
> +      - pins
> +      - function
> +
> +  "^vcc-p[bcdfg]-supply$":
> +    description:
> +      Power supplies for pin banks.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> +
> +    pio: pinctrl@1c20800 {
> +        compatible = "allwinner,sun8i-b288-pinctrl";
> +        reg = <0x01c20800 0x400>;
> +        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> +        clock-names = "apb", "hosc", "losc";
> +        gpio-controller;
> +        #gpio-cells = <3>;
> +        interrupt-controller;
> +        #interrupt-cells = <3>;
> +
> +        mmc0_pins: mmc0-pins {
> +            pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +            function = "sdc0";
> +            drive-strength = <30>;
> +            bias-pull-up;
> +        };
> +    };

