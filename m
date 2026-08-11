Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F663191D6;
	Tue, 11 Aug 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471583; cv=none; b=s4MRtkTPOcdjJfwdH1QdrTadZzjzxSXVr/HrLMze5askVpgQ0XGVkiAJuSYzdCOgW2Xojgi3U9C1PdlcA6/vDOGPiukfF/+Co5xJKb1278B0BDQjgES3f3L9Rh29OF72W0/sRcYsj6VHY+Nft9LElEYT7Jdzuohgn8xBVfk5WC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471583; c=relaxed/simple;
	bh=nd99Z4pJtO0i+uCTH03+wLTmvk9/IfbTPhhlmG34PeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqzXOzdZ/Mvl+a9UdN66+GEIa6JLYDJ/iym6e6SFehdO2kSHC9bbmaRyamu6G89qNS7ihljKuUfXOHgvKFp/BdPcy0AwfwoNRBj9EG/ubM8jcO8BqSiYhvQYDxyU332hwe5LHwi6lIMBQUpKX+r59nqWUjRR4nomVHEfl44b6V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3iajxeS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3iajxeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D962F1F000E9;
	Tue, 11 Aug 2026 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786471582;
	bh=r+Lco7GF88zMossTuKzj8okUfJziBvRaQI9EBiNO3gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b3iajxeSwUNjsxN+l3tirIcMplJj/rjjxjj0qN3gbZigQ49/pmBfmKKGD1FLklviV
	 R9OkpVPsCaB6KkTDaz+UhRZ5eFsqcR3Ybm24q4B3tFRQCrPPMAK1rDLUfeZuj2JxUZ
	 XskZCfQenqfHY8NysmmeaSnSkRP+b+q85Q7O+VWWCfLmkOkKGtpgqo5b8fc9+7qMHH
	 7kiGJ/qU7h8Sr70F+C6pmbJOa1rsOlHv5+uH0tRgpDMPYMylkTIjzXgdSAGO9A2C2S
	 noEtaCj/T7FGdA8BIt5pbPOLg/X3Jh085FXB8bzm/05v2m+hOkB7zh0PfLEf64Tj99
	 yIRJTxBO+WVBw==
Date: Tue, 11 Aug 2026 13:06:21 -0500
From: Rob Herring <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
	simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert TI DA850 pupd to DT
 schema
Message-ID: <20260811180621.GA2749647-robh@kernel.org>
References: <20260811111023.721262-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811111023.721262-1-egbostina@gmail.com>

On Tue, Aug 11, 2026 at 11:10:23AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
> controller bindings to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v2:
> - Excluded the 'phandle' property from the pin group node pattern so
>   it is no longer validated as a pin configuration node. This fixes
>   the 'make dt_binding_check' failure.
> 
> Link to v1:
> https://lore.kernel.org/all/20260811092057.687155-1-egbostina@gmail.com/
> 
>  .../bindings/pinctrl/ti,da850-pupd.txt        | 55 --------------
>  .../bindings/pinctrl/ti,da850-pupd.yaml       | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
> new file mode 100644
> index 000000000000..059da050e611
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DA850/OMAP-L138/AM18x Pin Configuration
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description:
> +  These SoCs have a separate controller for setting bias (internal pullup/down).
> +  Bias can only be selected for groups rather than individual pins.
> +  The controller node also acts as a container for pin group configuration nodes.
> +  The names of these groups are ignored.
> +
> +properties:
> +  compatible:
> +    const: ti,da850-pupd
> +
> +  reg:
> +    maxItems: 1
> +
> +  pinctrl-0: true
> +  pinctrl-names: true
> +
> +patternProperties:
> +  "-groups$":
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^(?!phandle$)[a-zA-Z0-9_-]+$":

Looks like '^(disable|pull-(up|down))$' would work here. Actual users 
only have 'disable'.


> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        properties:
> +          groups:
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            description: An array of strings containing the name of a pin group.
> +            items:
> +              pattern: "^cp([0-9]|[1-2][0-9]|3[0-1])$"
> +          bias-disable: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +        unevaluatedProperties: false

Better to use 'additionalProperties: false' here since you listed the 
only valid properties.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinconf: pin-controller@22c00c {
> +        compatible = "ti,da850-pupd";
> +        reg = <0x22c00c 0x8>;
> +        pinctrl-0 = <&pinconf_bias_groups>;
> +        pinctrl-names = "default";
> +
> +        pinconf_bias_groups: bias-groups {
> +            pull-up {
> +                groups = "cp30", "cp31";
> +                bias-pull-up;
> +            };
> +            pull-down {
> +                groups = "cp29", "cp28";
> +                bias-pull-down;
> +            };
> +            disable {
> +                groups = "cp27", "cp26";
> +                bias-disable;
> +            };
> +        };
> +    };
> -- 
> 2.43.0
> 
> 
