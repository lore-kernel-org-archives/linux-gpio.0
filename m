Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E62594BD;
	Tue, 13 Oct 2026 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875745; cv=none; b=jS4KvjEcTx/nWbmflyBPPK7XCHLUwkPN69jJAca2qnEtjOTldOPsgRj/ntkbsLW/IqyxiU1u+hWqGD4JekX/gfFXHT/iqwYLrqaRqQ/q2hy/YuTJ72pkJrOXsJSiujmrdi3XxuJepGtDEafC/6UekXB25TFVQSxDDpov48hUqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875745; c=relaxed/simple;
	bh=gDqyjItqcFJs3+oth4ya+T936777FQ8zxquu4J6iUow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYH1IM7FLNIgh/VemrXtMnAAclux6QyxaytG8/5m+8RkEQ0C6hxe/MjfiGkPeQ2Q0W6RnQxTwiWYcXVs7m3vrApic1WHvXgTxfz7PzPlGhtF50D1iJw+2hFab9RdW3HTNTeF07ltumnnH4C6QkdrXFS3IohkABfDO8EW8i6Q/bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVrIf3YL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVrIf3YL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791875744; x=1823411744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gDqyjItqcFJs3+oth4ya+T936777FQ8zxquu4J6iUow=;
  b=cVrIf3YL6mHab1GPvWv0ttdDKtodQ41yzBIu3MAqobsJl4SrWRVPhp1F
   N4pm3cj/rTUTT4RTWrDPC32o6P3MWU+akiJKHxAJrXdNBfIf0O9x2tdL9
   F4pyi8hmox7RNcDP0CTN5Fb6D+uw64pVjXyPrYUQUHKs/F6e+B1BtxASU
   gM185ZMDiNV4dvIaT7cvxkuKPY9mfDKkBJtmjVjDTgYGs/bTS0csopZGr
   NaQu3OkKzYr+XIz+aezPAYhdEA0fjicldwsk9a8Xx93B49wdDoVp4lrGD
   Lm3iv8aaGC2gjpPBvKWzJ8Z0WqAv7Fi9N/PG5N/xjjftwQxPJUbfQyQay
   w==;
X-CSE-ConnectionGUID: +ohWW+4FREee2Ys232DLjw==
X-CSE-MsgGUID: HAmrjClATd68ESoRDykCdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="478203"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="478203"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:15:44 -0700
X-CSE-ConnectionGUID: Vb+1qpWmRleRzNBkDmQvwg==
X-CSE-MsgGUID: egUEnzGFTqmiMAh4/+Xqfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1420700"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:15:40 -0700
Date: Tue, 13 Oct 2026 10:15:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] gpio: pl061: switch data path to gpio-regmap
Message-ID: <as3amWxGvbUdwE7k@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 09, 2026 at 06:57:59PM +0800, Long Zhao via B4 Relay wrote:

> Move get, set and direction onto gpio-regmap. ARM PL061 sets
> GPIO_REGMAP_QUIRK_SET_AFTER_DIR so the output value is written
> after the direction change.
> 
> Keep a custom irqchip and irq domain. Create the domain with
> the PL061 private data and let gpio-regmap attach it.
> 
> Check the chained-handler regmap_read() return and always run
> chained_irq_exit(). irq_type still ignores MMIO write returns.
> 
> irq_set_parent() nests the GPIO irq_desc under the AMBA parent
> for irq_set_wake() and lockdep; checked with PROVE_LOCKING on
> CV75.

...

> -static bool pl061_is_data_reg(unsigned int reg)
> -{
> -	return is_power_of_2(reg) &&
> -	       reg >= BIT(PL061_DATA_OFFSET) &&
> -	       reg <= BIT(PL061_DATA_OFFSET + PL061_GPIO_NR - 1);
> -}
> -
> -static bool pl061_volatile_reg(struct device *dev, unsigned int reg)
> -{
> -	switch (reg) {
> -	case GPIOMIS:
> -	case GPIOIC:
> -		return true;
> -	default:
> -		return pl061_is_data_reg(reg);
> -	}
> -}
> -
> -static const struct regmap_config pl061_regmap_config = {
> -	.reg_bits = 16,
> -	.val_bits = 8,
> -	.reg_stride = 4,
> -	.max_register = GPIOIC,
> -	.volatile_reg = pl061_volatile_reg,
> -	.fast_io = true,
> -	.use_raw_spinlock = true,
> -};

No, I have already told you do not move these. If you need to rename, just make
sure it's named accordingly in the previous patch that introduced this.

...

I have a feeling that you ignored my last review. I stop it here, you need to
carefully read *all* the comments and act accordingly.

-- 
With Best Regards,
Andy Shevchenko


