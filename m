Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35257336896;
	Sat,  7 Mar 2026 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772880357; cv=none; b=SbkbN/R3LRX4PICRE9+AF1gt+xwes3YiaL82qEI7VuEOJOQMYh5N1d/igjM2dxFPosUsvr+owGKKfL56MYZ/0D8zJSpNi/PtTIsMjIXx7rLYjvsRyzy6L7zr8SKSk7v2BnTXGmkt6RoZr0gm0Xcu8p5idxUqKl/nQlYerY1qFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772880357; c=relaxed/simple;
	bh=DdRhW/Ebu6ObLgaVXVQOgiAe0HAEyztDCaZQo72MRmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9C3MatM03rpijZ41ZKSCF7f/pwxnQBTRbuwCH8jce+C1u69dYo0XL+aOvxP/2RK6mbJG6bEc9m7yFfGUMynkN+Jbgb39SIrXkSuPCi5xJ73MEPJZFYB/ffUDnpn5ZYbR0dCKl9Kta0ZBQcbmHJ8TZVSHbN6ekVtZNnEJDZ2oJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6nmCR95; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6nmCR95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4530EC19422;
	Sat,  7 Mar 2026 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772880356;
	bh=DdRhW/Ebu6ObLgaVXVQOgiAe0HAEyztDCaZQo72MRmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6nmCR95KNIU0YfUVfVzt1d+1ZQjl5pVhYcgMjKgohKJHpjb9WFjWanAK5qtZ7ZqG
	 JAUCPGRvJuleUn82VWHgAFg25omEtmz2BBpK1AxLe1h7sK6TmygsY7SwES1hREY7YC
	 EhDXMJTNqC7EHd1VfYve4FtCGkvANhJJbYaF6l8e65/eXeklpF/g67ZV795i4Z0N/2
	 /oDO3aDgR3xgB169FQGWRnywm7yMlf3DBOkRlJM+ju3C/aDnbqNPWtdv01onOZOvxM
	 dHmoze+vlwLGbnUOmvZJTs6a2Qa82+xqt6/Wpb03E9M05nfNKe80zePYqQlH2m7TK3
	 TzosQHpKI+YSw==
Date: Sat, 7 Mar 2026 11:45:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC0 pinctrl
Message-ID: <20260307-dexterous-resolute-camel-cbae39@quoll>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com>

On Fri, Mar 06, 2026 at 08:40:25PM +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
> 
> Allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
> 
> There are no functional changes to the SCU binding beyond permitting
> the AST2700 SoC0 pinctrl compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

