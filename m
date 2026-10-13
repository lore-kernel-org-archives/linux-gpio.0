Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0730B49BD6D;
	Tue, 13 Oct 2026 06:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871756; cv=none; b=n0sF60ra2LJo7RswEyezp7BDeX+MkT7gF8/e125OJeIJ/BNn0TM0siFZ1ykbg/raXjffXO8MJxoJJjTckL095V4/RkirJ4TFp75EKL7tvX97WJW0A/fXVCCcEAusG/B50jB5VRujIife+fhLMHkRD8fpjeh2fyFKnbAVXhl12WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871756; c=relaxed/simple;
	bh=JoCgF10T3LuWBDLbQ1RSWy6OFMYQkw+69GiRmPEkbjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLCoDkfp3x1Curs42n0YMsbNUrK6iORVKrozIjTrAsMBGBujb3SoNK2Mw3GQMU4rDqt0fiBbRaju7y7FDvrJvTVRJwn4ypi1n2ESAjYpjFqg1GorJmrw5qGU0PTpIBf34A3P/ta5NxzK6M+oJO/UbiKv6P1VV3z7vMo8FSMdCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbrMLyRt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbrMLyRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2121F00893;
	Tue, 13 Oct 2026 06:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791871753;
	bh=NjXy9CG2vlvCP5Xs6RgbdKlfwUFJSEww4QMFQXFa4yA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kbrMLyRtl1IOW5tHZfFs0a/aFpLtfj083omI1v7u56DIq2LkfF2zikfM8AzM2QagE
	 4lnU1AD0EDTx4ls+5uUgkEzjmycs4AodxA0NqmwkSsEqX+v85p0YrvkTKLNesqwGo4
	 zm4/CS3ijWHkw3+wg9ahE3PjX12cZiedthj1bf5WiPS+39v4beFkXPiVPtvVrUueLy
	 DaNiuz52Ip+IXe1uPGctifHKK8QohJHypL5ZDuHYuksfH5iGyRhtHGQPuPW/u1yjxF
	 3PCqIOMZhBdQL2oDAC939Im6rQGIq43/Q/84XRXPKkX/nzHpI4JJQIQEfk7yL1gei8
	 caXnAuYiMwhbA==
Message-ID: <a3433655-c2b1-463b-85c5-9cc015393d44@kernel.org>
Date: Tue, 13 Oct 2026 08:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: gpio: Add NVIDIA LSTP GPIO
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Donald Shannon <donalds@nvidia.com>, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2026 19:35, Adrian Ambrozewicz wrote:
> Add the binding for a GPIO channel of an NVIDIA LSTP USB adapter. The
> node is a child of the adapter's USB device or interface node, matched
> to a channel the device reports by reg (the channel ID) and compatible
> (the channel type).
> 
> The device firmware reports the number of lines and their names and
> directions; the node adds line names, hogs and interrupt consumers. Pins
> the firmware reports as LEDs are LEDs, not GPIO lines, and an optional
> leds child node describes them.
> 
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  .../bindings/gpio/nvidia,lstp-gpio.yaml       | 276 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 283 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
> new file mode 100644
> index 000000000000..4ca5081e509d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nvidia,lstp-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA LSTP GPIO Channel
> +
> +maintainers:
> +  - Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> +  - Donald Shannon <donalds@nvidia.com>
> +
> +description: |
> +  GPIO controller channel on an NVIDIA LSTP USB device.

What is LSTP?

> +
> +  The number of GPIO lines and their default names and directions are
> +  reported by the device firmware.
> +
> +  gpio-line-names overrides the firmware-reported pin names.  The
> +  gpio-controller and #gpio-cells properties let consumers (e.g.
> +  gpio-leds, gpio-keys) reference the lines by phandle.

Why are you describing the binding? This is pointless. Describe the
hardware.

> +
> +  The channel is also an interrupt controller.  A consumer may reference
> +  a line through a *-gpios property and use it as an interrupt, or

What? Please read other bindings to understand what is here.


> +  reference it through interrupts-extended, or interrupt-parent and
> +  interrupts, using the interrupt-controller and #interrupt-cells
> +  properties.  An interrupt line must be an input; the firmware-reported
> +  pin direction is authoritative and is not changed at runtime.
> +
> +  GPIO hog child nodes are supported for boot-time pin configuration.
> +
> +  Pins the device firmware reports as LEDs are not GPIO lines; each is
> +  an LED instead, named after the firmware pin name.  An optional leds
> +  child node describes some of them: their names, initial state, default
> +  trigger, and a pattern the device plays on its own.
> +
> +  Because the controller sits behind USB, every line access is a USB
> +  transaction that blocks until it completes.  Consumers that need
> +  non-blocking line access cannot use this controller.
> +
> +properties:
> +  compatible:
> +    const: nvidia,lstp-gpio

What is lstp?

> +
> +  reg:
> +    description: Channel ID reported by the device firmware.
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Two cells: pin number and flags.
> +      Cell 0: GPIO pin offset (0-based).
> +      Cell 1: GPIO flags (e.g. GPIO_ACTIVE_LOW).
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      Two cells: GPIO line offset and trigger flags.
> +      Cell 0: GPIO line offset (0-based), same numbering as #gpio-cells.
> +      Cell 1: Trigger flags (see <dt-bindings/interrupt-controller/irq.h>).
> +
> +  gpio-line-names:
> +    description: |
> +      Optional list of human-readable names for each GPIO line.
> +      Overrides the firmware-reported pin names.  The number of entries
> +      must not exceed the number of GPIO lines reported by firmware.
> +    minItems: 1
> +    maxItems: 255
> +
> +  leds:
> +    type: object
> +    description: |
> +      LED pins of the channel.  A pin the device firmware reports as an
> +      LED is an LED whether or not it has a node here, and a node for a
> +      pin the firmware does not report as an LED is ignored.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[0-9a-f]+$":
> +        type: object
> +        $ref: /schemas/leds/common.yaml#
> +        unevaluatedProperties: false
> +        description: |
> +          One LED pin.  The LED takes its name from label, or from color,
> +          function and function-enumerator, instead of the firmware pin
> +          name.
> +
> +        properties:
> +          reg:
> +            description: Pin number, in the channel's own pin numbering.
> +            maxItems: 1
> +
> +          default-state:
> +            description: |
> +              Written to the device once, when the LED is set up, and "off"
> +              when absent, as in leds/common.yaml.  "keep" leaves the LED as
> +              the device firmware set it; the device cannot report its
> +              current state.  Not written for a node with led-pattern.
> +
> +          led-pattern:
> +            description: |
> +              A pattern the device plays in a loop once the LED is set up.
> +              Each entry is <brightness duration>: brightness from 0 to
> +              255, held or faded towards for duration milliseconds,
> +              depending on the pin's firmware-reported LED mode.  The
> +              pattern is sent to the device once and played there without
> +              further USB traffic.  It must fit in a single request, which
> +              for a device with 64-byte USB endpoints is ten entries; a
> +              longer pattern is not sent.
> +            minItems: 1
> +            maxItems: 255
> +            items:
> +              items:
> +                - description: Brightness
> +                  maximum: 255
> +                - description: Duration in milliseconds
> +
> +          active-low: false
> +          flash-max-microamp: false
> +          flash-max-timeout-us: false
> +          inactive-high-impedance: false
> +          led-max-microamp: false
> +          led-sources: false
> +          max-brightness: false
> +          panic-indicator: false
> +          retain-state-shutdown: false
> +          retain-state-suspended: false

Why are you repeating all standard properties? Drop.

> +
> +        required:
> +          - reg
> +
> +        anyOf:
> +          - required: [label]
> +          - required: [function]

I don't get why simple binding is made so complicated.

> +
> +        dependentSchemas:
> +          led-pattern:
> +            properties:
> +              default-state: false
> +              linux,default-trigger: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    required:
> +      - gpio-hog
> +
> +dependentRequired:
> +  interrupt-controller: ["#interrupt-cells"]
> +  "#interrupt-cells": [interrupt-controller]
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* Minimal: let firmware define pin count and names */
> +    interface {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio@3 {
> +            compatible = "nvidia,lstp-gpio";
> +            reg = <3>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> +  - |
> +    /* Override pin names and add a hog */
> +    interface {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio_ch: gpio@3 {
> +            compatible = "nvidia,lstp-gpio";
> +            reg = <3>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-line-names = "STATUS_LED", "ALERT_INT";
> +
> +            led-hog {
> +                gpio-hog;
> +                gpios = <0 0>;
> +                output-high;
> +                line-name = "status-led-hog";
> +            };
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    /* Act as an interrupt controller for a consumer via interrupts-extended */
> +    interface {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio_irq_ch: gpio@3 {
> +            compatible = "nvidia,lstp-gpio";
> +            reg = <3>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
> +    };
> +
> +    gpio-keys {
> +        compatible = "gpio-keys";
> +
> +        key-alert {
> +            label = "alert";
> +            linux,code = <143>; /* KEY_WAKEUP */
> +            /* Line 1 as a falling-edge interrupt source */
> +            interrupts-extended = <&gpio_irq_ch 1 IRQ_TYPE_EDGE_FALLING>;
> +        };
> +    };

Drop irrelevant. Keep only one complete example. Two if they are different.

> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    /* Name two firmware-reported LED pins; one plays a pattern on its own */
> +    interface {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio@3 {
> +            compatible = "nvidia,lstp-gpio";
> +            reg = <3>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +
> +            leds {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                led@4 {
> +                    reg = <4>;
> +                    color = <LED_COLOR_ID_GREEN>;
> +                    function = LED_FUNCTION_POWER;
> +                    default-state = "on";
> +                };
> +
> +                led@5 {
> +                    reg = <5>;
> +                    color = <LED_COLOR_ID_AMBER>;
> +                    function = LED_FUNCTION_STATUS;
> +                    /* Two short flashes, then a pause */
> +                    led-pattern = <255 100>, <0 100>, <255 100>, <0 700>;
> +                };
> +            };
> +        };

So that's the only example you should keep.

> +    };
Best regards,
Krzysztof
