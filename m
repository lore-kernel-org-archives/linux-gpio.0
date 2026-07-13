Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC5336897C;
	Mon, 13 Jul 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930097; cv=none; b=nT6Zec71TGkdRCj+hOjXWUlGbks58GkKcKGwI/AWAyZLVj8lb7O0o6JR44dQwJSdBUxwcBzq0116opRcPfRfYL55eGv+ZqoMW46bXaolJlLdGnnHvu79Jpeek1LRBTqG/zLvFMcteB8M56J1NBOTynXiDAcWHg4P5YtMI7Ldzj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930097; c=relaxed/simple;
	bh=5Gulp6YHmUD9b3fvimUkpa5ZWbQVBzBtsKiZATPO1D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQyLF1yKic8cxj4gVuMOlHzjPVANP/bqEfyTKt8rZ17+QnQ2IgRT1xplHwx+P5zv67iNLoTyZXEYVHU6XJDJjJ07P7KB4ZGUIvSfZYbkIrlS4eAIvlnI6EqatILH6rBFBSWtijDmwYnY9U2YaOGcx8JQtTXXIHTlFFIhBdTLgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ks9TfYWc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ks9TfYWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783930094;
	bh=5Gulp6YHmUD9b3fvimUkpa5ZWbQVBzBtsKiZATPO1D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ks9TfYWcOMNtwHAMq9y2TshVKSqsPnTrzZLVu1MdLLeTHQhN2SD9OQ7jRtkwzMYO2
	 ernmPMaCIpBClv0WD5UNggmoRK7FkNXXJSchLPQpH2DVZiu+4mMjpUFaMWH9P2O4Kz
	 emLNvqkYYieQCrXPug3DIaeZhnS3R8AuE573trGH7vwjMepbGKeSCAz8EZB3oOM6Fy
	 HwVsqquKTuYgSi/RxKQxdMIBOmm3tq91tlxQ7RY/YnOjVDjF6n8kqRNoH+POANw3F/
	 2EF3WXoaiNyxJqi6PCQ/8kNw/sE2OoQznhXOg8MWWgjtoAJ+rld37FnZNB3APQjA4B
	 qAZq2iyUALtHQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 722CE17E05D3;
	Mon, 13 Jul 2026 10:08:13 +0200 (CEST)
Message-ID: <91800497-a452-40fb-9520-a9926b437eed@collabora.com>
Date: Mon, 13 Jul 2026 10:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
To: nikolai.burov@jolla.com, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 17:00, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> Add new DT bindings for the pin controller found in the MT6858
> (MediaTek Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>   .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
>   1 file changed, 190 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
> new file mode 100644
> index 000000000000..263830a6e9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6858-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6858 Pin Controller
> +
> +maintainers:
> +  - Nikolai Burov <nikolai.burov@jolla.com>
> +
> +description:
> +  The MediaTek's MT6858 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6858-pinctrl
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +      - description: lm group IO
> +      - description: rb group IO
> +      - description: bm2 group IO
> +      - description: bm group IO
> +      - description: bm1 group IO

bm group io
bm1 group io
bm2 group io

> +      - description: lt group IO
> +      - description: lt1 group IO
> +      - description: rt group IO
> +      - description: rt1 group IO
> +      - description: eint-s group IO
> +      - description: eint-w group IO
> +      - description: eint-e group IO
> +      - description: eint-c group IO

description: eint-south group io
eint-west
eint-east
eint-center

> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: lm
> +      - const: rb
> +      - const: bm2
> +      - const: bm
> +      - const: bm1

Obviously, same comment applies here.

> +      - const: lt
> +      - const: lt1
> +      - const: rt
> +      - const: rt1
> +      - const: eint-s
> +      - const: eint-w
> +      - const: eint-e
> +      - const: eint-c

eint0
eint1
eint2
eint3

P.S.: Don't forget to update the example too!

Cheers,
Angelo

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h
> +              for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +                description: normal pull down.
> +              - enum: [100, 101, 102, 103]
> +                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
> +                  defines in dt-bindings/pinctrl/mt65xx.h.
> +              - enum: [200, 201, 202, 203]
> +                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
> +                  in dt-bindings/pinctrl/mt65xx.h.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +                description: normal pull up.
> +              - enum: [100, 101, 102, 103]
> +                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
> +                  defines in dt-bindings/pinctrl/mt65xx.h.
> +              - enum: [200, 201, 202, 203]
> +                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
> +                  in dt-bindings/pinctrl/mt65xx.h.
> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/mt65xx.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #define PINMUX_GPIO149__FUNC_SCL5 (MTK_PIN_NO(149) | 1)
> +    #define PINMUX_GPIO150__FUNC_SDA5 (MTK_PIN_NO(150) | 1)
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt6858-pinctrl";
> +        reg = <0x10005000 0x1000>,
> +              <0x11b20000 0x1000>,
> +              <0x11c10000 0x1000>,
> +              <0x11d10000 0x1000>,
> +              <0x11d30000 0x1000>,
> +              <0x11d40000 0x1000>,
> +              <0x11e20000 0x1000>,
> +              <0x11e30000 0x1000>,
> +              <0x11ed0000 0x1000>,
> +              <0x11ee0000 0x1000>,
> +              <0x11b00000 0x1000>,
> +              <0x11e60000 0x1000>,
> +              <0x11e80000 0x1000>,
> +              <0x1c01e000 0x1000>;
> +        reg-names = "base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1",
> +                    "rt", "rt1", "eint-s", "eint-w", "eint-e", "eint-c";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 197>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #interrupt-cells = <2>;
> +
> +        i2c5-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO149__FUNC_SCL5>,
> +                         <PINMUX_GPIO150__FUNC_SDA5>;
> +                bias-disable;
> +            };
> +        };
> +    };
> 
