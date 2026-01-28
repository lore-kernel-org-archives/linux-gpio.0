Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E02D63E8;
	Wed, 28 Jan 2026 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600315; cv=none; b=u5iXnwR9r+03mByIe7HQB+a2Wq7eoQKoz1wj6O2r8EATW+O9fHsS7snlLpGyCgYfBVVgPJid4oRsjSjl/KG6aTPTUR9l6ourm0+2gHeWz7+7aJY0ZILC54ZlpGC5Enz08pLI0pXLy+fuI25sn9D5GyhTcpXfW7h/6FVGl5RXU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600315; c=relaxed/simple;
	bh=4K7dezC17nXI3GH5AnFlNqIIA9NCEt09WT1rBUb85lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTb7k/v64onRLlwR15Y77aOtHXsTDBxWZzj5S2hnxPva0A5Nc1BP49Pvx3ia+IQdn1GsoGE7gZLsCe92reZr4NoL0ulr5LCRv+x+OI6JxMHDsStlY3Jiv/KXj0sO3lLUpvcZabFR2Lr3FLoY0xUFocoQdNCUOxw6ij8+NySqels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fY4qXDq4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fY4qXDq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6155DC4CEF1;
	Wed, 28 Jan 2026 11:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600314;
	bh=4K7dezC17nXI3GH5AnFlNqIIA9NCEt09WT1rBUb85lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fY4qXDq4+axHhKDTPqr8NFK3OGtzO57d3TBVBD3PC556uK5QAA+1SgK/IcOtr6kWG
	 uW9nlO4heBRliVC4s6k9bAWphXze/CZ4wOdac7WQ50fNXMYP5O67HxPNOFuaH8iE5z
	 RRUWrQlLYjI8BzoinZ7ACd4yXHDvTZXW8diT8kfVPSm6k97TC0yioTmQYHkDoI2lFl
	 Gk//mGiVvmQOsIJnUn9w0GExQRuMN4t5PXLUL4c11vidcYIs+0AiwHfzfTjJjzinOB
	 EJa01VD/7U/YeBjUZGTpajWKyPslQMZahnkhK62Ert6k0tGWgwqJeK5oDvLnXHIvhp
	 1QrC8A2cACNqw==
Date: Wed, 28 Jan 2026 12:38:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <20260128-hot-camel-of-acumen-eef9f2@quoll>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>

On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> Document the Top Level Mode Multiplexer on the Eliza Platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> new file mode 100644
> index 000000000000..d8b6591caf57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Eliza TLMM block
> +
> +maintainers:
> +  - Abel Vesa <abel.vesa@oss.qualcomm.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,eliza-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 84

93

> +
> +  gpio-line-names:
> +    maxItems: 185

186, your first GPIO is 0 and last is 185.

After fixing these two:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

