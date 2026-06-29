Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5CF38E8C4;
	Mon, 29 Jun 2026 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715098; cv=none; b=L7nB4C1POHAFOtw+IUJIumpGYA1DfTRdrKnVUVgoTL5YQgQ0rXWJ6ZIzgZiJjhg8RhNbr2umj7wroU7N7akQAIve7RibWOmwrfsmk+h/JkWBLicBOn+KuNGVTbFVfXS5Y/dIhAHE/R4t+NTsLDySP0jrmGPW4TuZP4w/uHQU3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715098; c=relaxed/simple;
	bh=MQ65+xHViPlc4P9FmRdAyfzeyntnzrTzeKeP3cTEDzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZ5oH3XbyxPzYfjRc3pD0s6R7xLaqvDcbCFga/Jy8ev2qU01McZf27aRuwYdFo3Yj5u2VAS80FJbGSZqmMziXJHXNBqv7UYPCG7AHQ+D1Du1wc7svUiTD7WVrq8y9zxUorP3A5mrQ5gQoLh6Lz7xFzmvYMWDAX8s+wunhoZMZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llYEogHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llYEogHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE731F000E9;
	Mon, 29 Jun 2026 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715096;
	bh=9DG5vw/ziuqvimIbMEocUy0M4eBXI2/0uzMJbjcgw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=llYEogHQLmtCJcle00yDXQK2aP86/5ead2oMxDvDOoXOyHFCjQvKQWE4XMhq7f1Wh
	 MoYiscAmOCAxE2g6Xrd0eIN87Y6PqEAhVK8gApGDagpzFgh9GFzMtRzd5Q2LjPQd3S
	 NBtW3H0FfVKpohU2pUK+N17n0tztKpXkKMrZuX5W2O1k1aSkxrx2ZnOP5xamKFboQw
	 I/VgqQ9Cf5Z7V6bMmc7ywZKt70lDfZFqzBjonsXMoflcN03im/WkKN8Ay5ww8XdGaY
	 xxKFTlKq51bBh3tyKKNcB+3ulDI1/7DD5/GeejDJnSjDi8gWJFTQz5aZqlippfZi34
	 7sxhPIFEdXRUw==
Date: Mon, 29 Jun 2026 08:38:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 04/17] pinctrl: airoha: an7583: there is no mux to
 enable the second i2c bus
Message-ID: <20260629-prehistoric-unstoppable-galago-c519da@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>

On Sun, Jun 28, 2026 at 05:37:20PM +0300, Mikhail Kshevetskiy wrote:
> In the AN7583 case there is no mux bit to enable the second i2c bus,
> so remove it.

But you do not remove second i2c bus, but the i2c bus.

> Also remove i2c pin function from device tree binding schema.

Why?

> 
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
>  drivers/pinctrl/airoha/pinctrl-airoha.c                |  1 -
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> index f52802a3ad79..8d8ec6adb97d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> +            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>                     pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> @@ -117,14 +117,6 @@ patternProperties:
>                      enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
>                             uart4, uart5]

Best regards,
Krzysztof

