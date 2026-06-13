Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B5263C8F;
	Sat, 13 Jun 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781369333; cv=none; b=XO4TeijJ9LCJnqSaKKDsl/JfL4cagaF2hSYTyZpvPNawCS5iU//Y95oL22C7CoylimU2ZVJ6XN20017EWWoHvteZkST6xA/nriEgbIj/2TEtvLgLzlt/IwwuxSqw5qiHK+5fFlJ/yXLRfyW3a84uKTp3lfR0XIXb1TuFUNSJg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781369333; c=relaxed/simple;
	bh=u18l/tEe4VipANnKG2MxfkxQ+FFaXOgq5noVLMuBeTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de2qjcRBSbnRfffSS9edfnkkjh05TTXDiqwoXnEuKwCSZPbNFcjuGKfLGPJjPlla4lBZz1lrQqfo1GOd2NZrzVJONrWV7ePiHMPX4zXAJ4mlbpssJjYwiPHoCGUAwVr+DgNeAeS+dhUG/fx0c+bWpBUDiw9/xXehleRYhOBewpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPBm6DbR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPBm6DbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4701F000E9;
	Sat, 13 Jun 2026 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781369332;
	bh=LVBnyWkL2409t5kbHwLTU6uhwAAVAlV9g1CqOb0LOcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPBm6DbRE1k0T7fGnKCHKz0da1JpXeBiGifUPNrTt6HWQ4OV2OpvCJjogPVNtWwBF
	 O+ra2mqYG6V8v7EkkWo3rnupvm1l1+FShOdChM9+ZG5vtWjlvgxtamWLGn6C8MGiDe
	 H6Y8H4Gav87X4AsxK6uquK/MUGdMhztce/HTsiUo4KEeo+kde+k6mTERTpsldoq8Pq
	 XrEBWkPyWYdGY1ZygqtqW1OZd8P5kQlDjDkDyg0hgVxKsbWhFY1bd1vRFoiorKma7e
	 U5ittcyxp5BgM1+d6VmC5rRJBP7a2G3q6Z1xjdeQ3LXEz9B/BIwQWQBVMnibur1XAz
	 FqInFbyPkG6hQ==
Date: Sat, 13 Jun 2026 12:48:47 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>, Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Message-ID: <20260613164847.GA3152104@ax162>
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
 <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>

On Wed, Jun 10, 2026 at 01:29:56PM +0800, Jia Wang wrote:
> diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
> new file mode 100644
> index 000000000000..8fb5b0ea5b93
> --- /dev/null
> +++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
...
> +static bool ur_function_is_gpio(struct pinctrl_dev *pctldev,
> +				unsigned int selector)
> +{
> +	const struct function_desc *function;
> +
> +	function = pinmux_generic_get_function(pctldev, selector);
> +	if (!function)
> +		return false;
> +
> +	for (u32 i = 0; i < function->func->ngroups; i++) {
> +		const char *func_name;
> +		int group_selector;
> +
> +		group_selector = pinctrl_get_group_selector(pctldev,
> +							    function->func->groups[i]);
> +		if (group_selector < 0)
> +			return false;
> +
> +		func_name = ur_get_group_function(pctldev, group_selector, 0);
> +		if (!func_name || strcmp(func_name, "gpio"))
> +			return false;
> +	}
> +
> +	return true;
> +}

The usage of pinctrl_get_group_selector() in this function breaks the
build when this driver is a module because pinctrl_get_group_selector()
is not exported for modules:

  ERROR: modpost: "pinctrl_get_group_selector" [drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.ko] undefined!

Also reported by the robots:

  https://lore.kernel.org/202606130210.ytVPxHlm-lkp@intel.com/

-- 
Cheers,
Nathan
