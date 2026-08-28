Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ACA3D5C3C;
	Fri, 28 Aug 2026 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900404; cv=none; b=fspMjQzCw/xKzm9Z4hw/UsjjyRsm7CZ24eaVeP6P1jFeSQNZlBKjCoWJ1HA0328RrLQYiRMM3LHXkbkOTBLwrPqcxxayflwZ92i/EWDiHo7Tq0Lb5G1S25U+kwno5tUEDPk9qDp6KFBNFCPGebYRL63LghlRaESTcog6LkM/9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900404; c=relaxed/simple;
	bh=oyA3xK/3QayanvmoSu85s0Sx5Hri2ay2g0Fl7G7Sqbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2v4b6AFszEN7sXUmjZFZ+h5z137U9fC/qD3YjVdxtNtPoQM6V9etIsJzmT8V2073xoOJ5RoSoo/My5e8oRhLc7MYEL2d2Im4UasKPyHsi3myHz/jJRx015erGLhcDMKC6UHrNRLH3sU6ZEIp/yqPFQcES//+gwwXMKzcJah/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnh/OCul; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnh/OCul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2DE1F000E9;
	Fri, 28 Aug 2026 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900402;
	bh=DCV/soKd0vC4UfcJ2C13p0eqWOyka0Ke2GoaHDqUKuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gnh/OCulUL6Y3OsVq70tRyEABuXlC6JyBU4IJKIYTSOBfZ4+/6Bw7WXuVzHK+5kJ9
	 03Fo2Di1VsmhoduwYEANkeHL5cWrnSRdAgdIYvdL2mF58MEB/q5IUZVFiRkZ41JsGr
	 sI3EwmZ1IfP/DvHgkLvTA0kw1htpNhDjSaMWk1JShxcz5Ar1wZFOhyow0nT1TXVe2l
	 6ERo7Djcf79D4tKnYExFkWm5mk4ugUonqSvW89QFZHD51BHVjhiodkIwKcJMANtxpD
	 16guQSlCYZKwa8HhCjaW0ScVuhRTDLGkEQhgF20qpmUnxkOend2YTjk3N43msi+UoB
	 aerprC3a/iqLw==
Date: Fri, 28 Aug 2026 08:59:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <20260828-adorable-bug-from-arcadia-fcad00@quoll>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>

On Sun, Aug 09, 2026 at 12:04:59PM +0400, Ahmed Naseef wrote:
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> +  registers have a different layout.
> +
> +properties:
> +  compatible:
> +    const: econet,en7528-pinctrl
> +
> +  airoha,chip-scu:
> +    description: phandle to the chip SCU syscon
> +    $ref: /schemas/types.yaml#/definitions/phandle

If the entire address space is part of the SCU, then this device should
be part of the SCU, e.g. its subnode.

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

This goes to the end of the file, before the additionalProperties.

> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - airoha,chip-scu
> +  - interrupts
> +  - gpio-controller
> +  - gpio-ranges
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +patternProperties:
> +  '-pins$':
> +    type: object

"patternProperties" should follow "properties"

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
> +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]

Best regards,
Krzysztof

