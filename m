Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831953B19B2;
	Thu,  4 Jun 2026 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589816; cv=none; b=XeNvghB0rAe1g17Z4p+3KKglrKREcCJgxoOpu8Tc8cpfBQU2tnXnERIsaDUrsshqHrISM2F9StPdIPxNuf7zD+ybCvq/uAKHbX0bDXwMDeekKqnPY8Pp1qgk76TIgJt8rSlmK9mHCtuu7crxoSvIxWKZnMdLzM9Wd3fjFQfPjb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589816; c=relaxed/simple;
	bh=R8A4y6fAt+/rGJRYaXr6lryymuJyjvoP8YzwbFbFBfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cCQtZOpw8s8zBuH1akOdJpUlz3Zin5JJ1ALObTw1pA+z3Qt2a3tLiCaIg6EcfpA14INFvhiRKTfdC6M7j9ZKNbYiMB8/WjwSvqS99Zhy+Cgy/hwf1ZahGY/Gu6d5lqSc6mDSE11hw0aADJD3Op6UEgIwSDO0oW4AAV98lbljK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvJF/1yG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvJF/1yG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9DB1F00893;
	Thu,  4 Jun 2026 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780589815;
	bh=K2gTdGqeWQGOtaG+ilrpEBWckxkrsv+W6qkg6Sctvwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hvJF/1yG1XBu/K1o5Van8/R29t0hjvN6UK73WdFPAWIBQRbzgDf6IMMlRCY1/oRJJ
	 ymKdiIiVoGnG0Q5e0r5augl4QYSwcTAAN0USPUavLbLYXW7IMqkDrPvD1VkgPmNMZI
	 6zLNL3lnYeSgd+fzJBLYnZURLAC3YiZJ06p1BLu1F0ckRe6UdJ9JPcPRkP4KFCX8WA
	 FAgImivvlr4NFgte2uRi/9o+110jq8aPIVqUgXSKx3npwrqo6z+mNnKrLFuCzsVziG
	 CahWhFZUc8/T+K6dyonjTQXjiREXe8yUy9tBQWKnD5F65R7IN6h8MNyb330PBh7Iza
	 giMd6Vyi9eDWQ==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: patrickw3@meta.com, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 BMC-SW@aspeedtech.com, openbmc@lists.ozlabs.org, 
 Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
References: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
Subject: Re: (subset) [PATCH v5 1/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Support AST2700 SoC1 pinctrl
Message-Id: <178058981070.94985.5862783114211800915.b4-ty@b4>
Date: Thu, 04 Jun 2026 17:16:50 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 21 May 2026 17:17:44 +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
> 
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
      commit: e78aa289e86e3e5da6fd115e6a0faf1623bacb05

--
Lee Jones [李琼斯]

