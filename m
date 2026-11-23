Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431956;
	b=jM9aE2psAuQ8ZYueBDcRiJXCsBUrh36idRriipUNkD/eMA7LADdstf43hz+RMO5zVu8l
	 GwANxx6ZchlQhcA184BHa35kzxk206ttTHTYexc0E0F2gVA0PWTaiqZoyZMuP7Deeq372
	 eZp+CQoPklnvfIEj3LJg+tHvPbDtaH0YhZxwjw9y6k/5IYhE8Q2CliTgQ/B3V88+tH9PP
	 rBVbg9q1g1XPNSoTwSDkOhJMuOIIUTDAjid2SNqvt23y1sEj48NXixLJ3gAZrrB+d6Gu9
	 VgCJIz9R6ESoRkN3gQk8LmwlorL6rix9rQqFbodaiIxAQ+WpoJktHKIzFfh+JVCCZPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431956;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cuMhs9MxlBL0fy/9YlMvcsamK52UjZ9Dphft59nHtEs=;
	b=zeTQOHxFVdzBJBz51G7yjaJpi8ZHV8u922QtxUFouPHVqg0YxWc9jyU5Qc2fH/3CxGKk
	 2YRxiTkPYCOSeG64v1zPhVDXNWfnP0Np0VEV/2degY/Isn2mOEaZTWdgUvuuC52n4U83q
	 XKu4mL/X68FjPGhsd9jZOjTwDeCDbPVAdSK2RvgxVgQEL2xpxQx8/GpCC7XX3nKqfjmXz
	 6qcVSHD3lvd0OM0ow6GNSOWiGl3x1QFskhvWcRJXQLXZBRKceqMqFxXQ1KUS5rIx2W4Rn
	 AclMazHiZ34KUlZpJww7aS/Hze7zaQn5a1sv/BZakhh0yhqw7m2OWJDZ8qsogwkwCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHNtcvsw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606DD606A31A;
	Mon, 23 Nov 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHNtcvsw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD22D1F000D4;
	Mon, 23 Nov 2026 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431955;
	bh=cuMhs9MxlBL0fy/9YlMvcsamK52UjZ9Dphft59nHtEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DHNtcvswe64wykBGCeW18mWpGkl5J31TaQlJDSYsljjsQSlAlqW4S1kJd/QUBMQ49
	 aiAOrYJPmKynqnBJllf8+kYBvp9pvVJ/eSkNDASO1PSRMr8lMkcCi5kvJyWBuZAgTB
	 wA0NxtWGTm/ouxLscqW655BM+hHYNkEDMACxGTDvGBrPc/KMIAZ1KQ9j5TZNto+ClG
	 DyjpOOjFVEGD56gpCGnk83vrrTxowHEJiAOTEbG8RqcH3PH6SMroHMmcRZSaEGpMay
	 NB1gWkMYa/ILJklSlZ930outO6MNL49mTQvHMEm4VzFEpeecafoShWZxNhyVoFPzes
	 GJFPX6jiLyJIg==
Date: Mon, 23 Nov 2026 12:05:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: CL Wang <cl634@andestech.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Add support for ATCGPIO100 GPIO
 controller
Message-ID: <20261123-precise-funny-wildcat-5bbbf8@quoll>
References: <20261116040914.368298-1-cl634@andestech.com>
 <20261116040914.368298-2-cl634@andestech.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116040914.368298-2-cl634@andestech.com>

On Mon, Nov 16, 2026 at 12:09:12PM +0800, CL Wang wrote:
> Document devicetree bindings for the Andes ATCGPIO100 GPIO controller.
> 
> ATCGPIO100 is the name of the IP, which is integrated in the Andes AE350
> platform and in SoCs such as Qilai. As in the ATCSPI200 SPI controller
> binding, the compatibles follow the platform and SoC rather than the IP
> name: andestech,ae350-gpio is the fallback, and an SoC that integrates
> the IP adds its own compatible, such as andestech,qilai-gpio, in front
> of it. Drivers can then match on the fallback and still add SoC-specific
> handling later.

Do not paste here LLM. LLM should not be used for writing commit msgs,
because this is a test if you understood what you did here. You explain
heer basics of DT and driver, which is exactly what LLM would do.

> 
> The controller has up to 32 lines, and ngpios gives the number of lines
> implemented. The debounce logic can run from either of two clocks: pclk,

Are you saying that SoC has multiple controllers with different number
of GPIOs? Where is the DTS, can you link it?

> the APB bus clock, which is required, or extclk, an optional external
> clock that allows longer debounce periods. The interrupt is optional, as
> the controller also works as a plain GPIO controller without it.

SoC routing is fixed, no?

> 
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---
>  .../bindings/gpio/andestech,ae350-gpio.yaml   | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml b/Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
> new file mode 100644
> index 000000000000..01badd2a1342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/andestech,ae350-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes ATCGPIO100 GPIO controller on AE350 platform
> +
> +maintainers:
> +  - CL Wang <cl634@andestech.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - andestech,qilai-gpio
> +          - const: andestech,ae350-gpio
> +      - const: andestech,ae350-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> +
> +  clocks:
> +    minItems: 1

Why is this flexible?

> +    items:
> +      - description: APB bus clock
> +      - description: External clock for debounce

Best regards,
Krzysztof

