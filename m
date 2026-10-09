Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928944252A0;
	Fri,  9 Oct 2026 06:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526209; cv=none; b=NYsblugduhTINGdVwbdopOIRK7aWmQVQqm0GFYTr4Ha7XH5zdvH6W4+d4tl1pKcMSmr4DuHELd1TLjW1Ernd5mVNbNLttl5hR2ZkloaMzwMAJJ4k4otXkT6GWKuOfoyAxYlL1cjiXlfGwg6LduFjcItES0G39b1FjavZ0YdjUyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526209; c=relaxed/simple;
	bh=eUmpRoTCt+2QLRgUkxx48SRPgHQaJ2nlhPBN+4rB0X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NazFY+Hd6KgIveNm3Dv35t8Mfp4c/jvVKxjVf/Ia9yJ7316jGwGUJfFFnaqnzA5CaMtRmnV812z1x0NML4yKe9kZXK9bsvmZKpUX24grkIQXQ6YoLOCCjauj2FHRMoeyxKNoQHRp/Otxcyc9UERbR+WDMjNVo4+TMvW0DYzuUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1+U/T1D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1+U/T1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA501F000FF;
	Fri,  9 Oct 2026 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526208;
	bh=cpB4oW+VzOYkr7heF4ZAZX4wxYt/dyntVxClV6LD6MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D1+U/T1DTXrKOdz8Lv6py/jO8w8IHJBD8IPmHKS0E1Y8KxayrpNP93hBJoSFgfSPV
	 /hFFwtE9RsEYzqPbhs7yhLo8/6lkM9Bjp5autcvT5leBDIChFixFTFlbSGDXnWpkxx
	 /pTSOAXNetSTkdVNPSCMinflG3TKFFJelcPyPyp4Hpm+GZGBogw9k0JTSNhHdFHwQ/
	 JjQxCB0VsSVQq0J8BqxdMSsL/2LaAVfOY6POPlb+YWaldn7Cspw6fs6qIufLRsKsul
	 Y5mb/3mUFgH6wo1ZSBQ8bJAbyVTqxVDIWixETHkd6GJqsb/SBGKHlbdlkxQtRy1+h4
	 IWjOkCneuMW2g==
Date: Fri, 9 Oct 2026 08:10:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, 
	Linus Walleij <linusw@kernel.org>, openbmc@lists.ozlabs.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, 
	linux-gpio@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed-g5: fix device node leak on LPC
 compatible mismatch
Message-ID: <20261009-practical-malachite-scorpion-0be0c5@quoll>
References: <20261009041435.3096107-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009041435.3096107-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 12:14:35 +0800, Haotian Zhang wrote:
> aspeed_g5_acquire_regmap() takes a reference to the LPC device node with
> of_parse_phandle() and then returns -ENODEV if the node's parent is not
> compatible with "aspeed,ast2500-lpc-v2", without dropping that
> reference. The function is called for every pin configuration, so the
> leaked device_node reference accumulates on such systems.
> 
> Release the node with of_node_put() before returning from the error path.
> 
> Fixes: eaffd32bea0c ("pinctrl: aspeed-g5: Adapt to new LPC device tree layout")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




