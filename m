Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B147CC96;
	Wed, 21 Jan 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008886; cv=none; b=uaAS1EEl/Srq87jzjs71kopQwD0WJ3wg1tY05gJ8nCykvo9MPgmkiA/+wyCj4P1+c8w9zA2nBP1XKAbzFKqypbAkMviekWumXGf+F7t26+Wy3lm2I9oVniGzT9njN2qvWPCV/77Fr8JmSKuA0kEezr3VmcEhNoBJpipV5kaP0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008886; c=relaxed/simple;
	bh=L9QnTSalVdaocEzIxFlwNpJxuLWUieZvADC7B/XVsmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stunDuuvOG3ViGcE2YM5IX9/txz8IDZEZIO+594arwSo+Sc/KVzdwrDo+93xioS1txpeLUOvJ+n+C5PKAB4zviL2BneoSyDQplL/CJ+nE0NxNK/DMrROHq3QBjR3YTiucyawg1To2TO9fJmxhMiJ6fS182/7+HxDQiuTcYgzYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlPOVgmA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlPOVgmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50F2C4CEF1;
	Wed, 21 Jan 2026 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769008885;
	bh=L9QnTSalVdaocEzIxFlwNpJxuLWUieZvADC7B/XVsmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlPOVgmAQL1Y8YIv7RMBVbBMLYq3hBniGba1bc2IbnBR/Hk7L/Jcn0hDwLB2RDcFK
	 7jU/KKFJvhfMSEFh+qPuG2hTytqVt8IN4OMovEGVS7wD6Om/EiK09GFW3xvuZfFXAs
	 ruLkpeMhVP8wCNQM1Wx4f/7ylOYluz8sqDWNKLLLdBln7gvJqY3WkNC5L3wisN2SPh
	 rf6g/yrraiPiKEgtDOsWgajeENFKWg/B4BcP9bjHzqf2JWmEL9oim61rUFtfGMYX3V
	 ILiqiQ2KqoWkm7XyRq+hXm8wu6NpjDN6RB5AuUw+vx0eOTi2a17VaditwevoGqSoqv
	 pThQymOXNrnFg==
Date: Wed, 21 Jan 2026 09:21:24 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <20260121152124.GA3179930-robh@kernel.org>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
 <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>

On Wed, Jan 21, 2026 at 01:34:37PM +0100, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> new file mode 100644
> index 000000000000..2db35e41e76c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Coresight bus
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description:
> +  The STM32 debug bus is in charge of checking the debug configuration
> +  of the platform before probing the peripheral drivers that rely on the debug
> +  domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stm32mp131-dbg-bus
> +          - st,stm32mp151-dbg-bus
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the debug profile necessary to access the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Debug related peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - "#access-controller-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - ranges
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    dbg_bus: bus@50080000 {
> +      compatible = "st,stm32mp131-dbg-bus";
> +      reg = <0x50080000 0x3f80000>;

That's a lot of registers... Yet the bus driver doesn't access any. 
Looks to me like this belongs in ranges instead if there aren't any bus 
registers. Or its size should be just the registers and then the whole 
region size goes in ranges.

> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #access-controller-cells = <1>;
> +      ranges;
> +
> +      cs_cti_trace: cti@50094000 {
> +        compatible = "arm,coresight-cti", "arm,primecell";
> +        reg = <0x50094000 0x1000>;
> +        clocks = <&rcc CK_DBG>;
> +        clock-names = "apb_pclk";
> +        access-controllers = <&dbg_bus 0>;
> +      };
> +    };
> 
> -- 
> 2.43.0
> 
