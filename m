Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2D4848A6;
	Mon, 28 Sep 2026 21:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630892; cv=none; b=rDFUwmwxMwXBpCJc7cZIlOMsUP2KDTIYoI7iW98uQyGgAAC3NDDnNaYZCnr/EftMFojlazdd/z/IIgof/kkk+51EWvG/yjC5NFwjBgTvhIgtSvT3YgNiCykYFHa7NcrKR95S0kIKqmCO7Q7Qrvr2EU2EgRFx5Tun02BeodlbcCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630892; c=relaxed/simple;
	bh=5cY3Loxrz+aQoEE5dRtjAknUbuyx+/jkMLJCVs2R+0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUcJnokf1IFfaqSDlFWHqpArYcf+sIGKsDpaSzxtXV7+BzJlNDoKofO4E8FXALQNXrl/XAB02dEvK2IPC4cveBMzUfc89VtongKZcSB4OUasLQVf8xm0eVT8GzvvU1dAe/yf4dezovlKmHAAxkH28MAk5+04ZH1R5T4UVoyXssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LT6OLFBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LT6OLFBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20481F000FF;
	Mon, 28 Sep 2026 21:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790630890;
	bh=NwacZ9pPcRCMIBHxhyeWDNBEuogXcwr5zpJ51dE66kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LT6OLFBT6h/+I1tRgEjs5NFf6ABdzzof70WqRxhgSuqYRPpEbDIbDIJH9owX2EDRd
	 9JeKi+rDuk8EWdvrzI3/Xfe+A7KlA2niG844qWsNSYySpEOdORneodIq1rZG8fIhok
	 KZpJotf6EbMOUiwaqoDc8vsvpia3Iv8KSVPstTBGB+ahtvpnRdsfuSerWiWZ7Gaxlq
	 Lx7IO0nDUtmKnLnfNmP2lviN2rb8lOxjGukwDOBgbD7UKdDu9d08QHHXnirJtLtSb3
	 wA1VP5j4btkQRLBz7Hkd8a9TdoT0B8UlEqN9fZFVfIVd4Yp8+OzpB/or0lIhx2GbHa
	 CDtuRfJw1/2Ow==
Date: Mon, 28 Sep 2026 16:28:09 -0500
From: Rob Herring <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: convert nsp-gpio binding
Message-ID: <20260928212809.GA733508-robh@kernel.org>
References: <20260927212748.123558-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927212748.123558-1-rosenp@gmail.com>

On Sun, Sep 27, 2026 at 02:27:48PM -0700, Rosen Penev wrote:
> The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
> documented in the legacy text binding, so dtbs_check reported "failed to
> match any schema" for the gpio@20 node present in the bcm958625 and
> related broadcom boards.
> 
> Convert Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt to
> a YAML schema and drop the text binding. Keep the existing required and
> optional properties (reg, #gpio-cells, gpio-controller, ngpios, and the
> optional interrupt/gpio-ranges support), including the generic pinconf
> child nodes with pin bias and drive-strength.
> 
> Pin configuration nodes may be direct children of the controller or
> grouped under a "-pins" node; both forms are recognized, and each "-pins"
> node may group further pin configuration children. Child nodes named
> "-hog" are supported as GPIO hogs.
> 
> The generic pinconf and pinmux helper schemas end in
> "additionalProperties: true" and cannot close the node from an in-place
> applicator, so spell out the supported subset and set
> "additionalProperties: false" in the local pin configuration node schema.
> Without it misspelled or unsupported properties such as "bias-pullup" or
> "slew-rate" are silently accepted.
> 
> Controller children are matched with "anyOf" against the pin
> configuration node schema and against "not: { type: object }". The
> latter keeps non-node properties such as #pinctrl-cells or clocks from
> being forced through the pin configuration schema, while still rejecting
> pin configuration child nodes that do not look like one. A plain
> "additionalProperties: false" cannot be used here because it would also
> reject the directly nested pin configuration nodes.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v3: add additionalProperties
>  v2: don't drop gpio-hog
>  .../bindings/pinctrl/brcm,nsp-gpio.txt        |  80 ----------
>  .../bindings/pinctrl/brcm,nsp-gpio.yaml       | 144 ++++++++++++++++++
>  2 files changed, 144 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
> new file mode 100644
> index 000000000000..e5144da1bf57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,nsp-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Northstar Plus (NSP) GPIO/PINCONF Controller
> +
> +maintainers:
> +  - Ray Jui <rjui@broadcom.com>
> +  - Scott Branden <sbranden@broadcom.com>
> +
> +description: |
> +  The chipCommonA GPIO block also provides generic pin configuration for the
> +  pins it controls: bias, pull up/down and drive strength. Pin configuration
> +  child nodes may be direct children of the controller, or grouped under a
> +  '-pins' node. In both cases the pin configuration nodes are referenced by
> +  the consuming device through the standard pinctrl-0/pinctrl-names
> +  properties. Child nodes named '*-hog' are treated as GPIO hogs.
> +
> +properties:
> +  compatible:
> +    const: brcm,nsp-gpio-a
> +
> +  reg:
> +    items:
> +      - description: GPIO base registers
> +      - description: IO control registers
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      The first cell is the GPIO pin number (within the controller's pin
> +      space) and the second cell is used for the following:
> +      bit[0]: polarity (0 for active high and 1 for active low)
> +
> +  gpio-controller: true
> +
> +  ngpios:
> +    description: Number of GPIOs supported (58x25 supports 32 and 58x23 supports 24)
> +    maximum: 32
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  gpio-ranges: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - ngpios
> +
> +$defs:
> +  nsp-gpio-pinconf:
> +    type: object
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +    properties:
> +      pins:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        items:
> +          pattern: '^gpio-'
> +
> +      bias-disable: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +      drive-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  '-pins$':
> +    oneOf:
> +      - $ref: '#/$defs/nsp-gpio-pinconf'
> +      - type: object
> +        additionalProperties:
> +          $ref: '#/$defs/nsp-gpio-pinconf'
> +
> +  '-hog(-[0-9]+)?$':
> +    type: object
> +    required:
> +      - gpio-hog
> +
> +additionalProperties:
> +  anyOf:
> +    - $ref: '#/$defs/nsp-gpio-pinconf'

This is a superset of what '-pins$' allows in the first oneOf entry. Not 
much point in defining '-pins' if any name is allowed unless '-pins' is 
only for container nodes.

> +    - not:
> +        type: object

sashiko comment is correct here.

Rob
