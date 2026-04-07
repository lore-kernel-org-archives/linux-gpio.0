Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781C30F55F;
	Tue,  7 Apr 2026 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578477; cv=none; b=GYZ0C/AP6/qRVGbrGOYVQczrPswK99R7mm4NO9W6qEwKQVlt0NtXWMxXTJ6UTbNGvP59Eg0U9fwWkhXJnDGiTu8RzrHSDsnaYJ0pJGk6KmxG3Nf4Ziymku7fw6RJICA/FpVX3J3zG1iGO0nweCoCBB64whglcQuzjTzr3P/nwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578477; c=relaxed/simple;
	bh=no4UEZFQcYB0LKd9v3lZJDFUspSbil4sfM/5uLMFUEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uy0MgCVWsjSKNyaqB7QaH6hJX4Cw+QXIqe/MKPHHw8bGfDFH3YXLO8G8w99K0htDb3Ws3I1zC66uWJcEDYLF+WZurKztqZWUL1d3OITkK2QQT5p4hgdTKm+bqwmMo8ujfGnHe8zqcca6xfXywyKEyWpHiZAwR2nI3pfGf8cuuSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXIKxyDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXIKxyDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13B4C116C6;
	Tue,  7 Apr 2026 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578477;
	bh=no4UEZFQcYB0LKd9v3lZJDFUspSbil4sfM/5uLMFUEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXIKxyDg8FURhlgtTqowsilbqLkXsYuAZuqFYFabH7q74VuTTjAvFmqxNqrigBf63
	 rRDNOa89wXQBvJZ3oEA57XyewxylOZxKs38xDAGTaiqmj0/0LHbXBa/yTdN0Resa8b
	 GcnL1cJ832IIXHXIphQsF1WooppBcw0pBH9sRvsDylhROfDNssZzI/2wsq1nCu8JZ0
	 4QdvDnNetX76aLhQUnT9EPsbwk2GB+oDscNDni37HTQergtnXCjPp5pXHhH7jmB7uZ
	 hlBr2mXYmfpLyRQxPlORm+54m9IMCRgoeGyw+NB5yPd4bzamisojoJ4rjPRjRUC3RG
	 fhhrk+Fl18dRQ==
Date: Tue, 7 Apr 2026 11:14:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank
 number
Message-ID: <177557847448.2708408.13454310555266452178.robh@kernel.org>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
 <20260323110151.2352832-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110151.2352832-4-andre.przywara@arm.com>


On Mon, 23 Mar 2026 12:01:49 +0100, Andre Przywara wrote:
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 11,
> to be able to assign the correct interrupt number for each bank.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

