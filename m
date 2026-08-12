Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C2305698;
	Wed, 12 Aug 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519336; cv=none; b=qNv0cP7YNCrvLI997p1FszdLooFVaWUaybDonguBkResYlkv+SoHwgdShzjhFhDJumbEAloLgl448ebt853g18qL40vRaXqArn6rmWxNqy9s8rU+dVewSIHxp0SwMcyHF+EZ3a6yQfo7muef8NPaM6plrcH1yWYHwp3MveiCUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519336; c=relaxed/simple;
	bh=fufZPUgDIsEd6X7EwYsM5/dvM04z7+1SxQKmNAHvc7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW9D5XcSRFjWizBn+ZQpU8tPd8ffr68T4epvwaPDY6p+TLPXjpgX/Mjer6o13BC6X1ArZg8wOchozJ2aNtbyatdTAp4qeREmHSWo6AB6LvJZiZynZ58tPFjn076NvLtkelaHKG+au7DI9+43i1kWybA5n7G4rII4M9X6+fxzAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQRcAwev; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQRcAwev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786519335; x=1818055335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fufZPUgDIsEd6X7EwYsM5/dvM04z7+1SxQKmNAHvc7U=;
  b=BQRcAwevALkKKiiTYBA/zU0kWNzF+gucRyGCRwmC/j5qQW1VCLHblWnv
   vd6rORoXPD8UhCfAPuHbBG/NeCTEMXskl6qsvynLMVQ88RJ5muVAyU3kY
   NnppF3Pb4TxxnmMzwsideX1rpUIp3YR8c7mmzzHnoOGXwFZdFESptBKya
   wZd+Pee6kW5TrNVjH5sny6RVEwiLk+RPMvzzRCwLZTh2vee6D8OAKqGT8
   6VFsYTJivdoDdm++3Ug3c1eI8GfAtd81j7fAKBEeh0UiZOOHXsSx5uJhf
   IADmfoeYkbCOU3VNjKT1V2sGU39Ynv5MsN61+r+OQqvYE3+JmYCMvEWb5
   Q==;
X-CSE-ConnectionGUID: BhSWlIHYTgKtEfDFB/JTgg==
X-CSE-MsgGUID: VLEw0Nk7TLSDGCGDeNeDJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87076276"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87076276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:22:14 -0700
X-CSE-ConnectionGUID: DEajM0HfS0Wj9YrRZV8BLg==
X-CSE-MsgGUID: MS06c8JcSu60SFv4KooasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="265560280"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:22:12 -0700
Date: Wed, 12 Aug 2026 10:22:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, tychang@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH] gpio: rtd1625: minor cleanups and log improvements
Message-ID: <anwfIsUcasA-juzv@ashevche-desk.local>
References: <20260812031929.3598364-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812031929.3598364-1-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 12, 2026 at 11:19:29AM +0800, Yu-Chun Lin wrote:
> Add minor cleanups based on Andy's feedback:
> - Store 'dev' in driver data to use dev_err_ratelimited().
> - Drop redundant 'ret' initialization and the line break.
> - Narrow the scope of local variables 'i' and 'hwirq'.
> - Use IRQ_TYPE_DEFAULT.

...

>  struct rtd1625_gpio {
> +	struct device *dev;

Can't this be derived from below regmap?

>  	struct gpio_regmap *gpio_reg;

Either this...

>  	const struct rtd1625_gpio_info *info;
>  	struct regmap *regmap;

...or this?

...

>  {
>  	/* Each GPIO has its own dedicated 32-bit register */

It's obvious that the comment is placed wrongly...

>  	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio);
> -	int val = 0, ret = 0;
> +	int val = 0, ret;

..and while at it you can make it reversed xmas tree order.

>  	*reg = base + offset * 4;

Putting all together, this should be

	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio);
	/* Each GPIO has its own dedicated 32-bit register */
	*reg = base + offset * 4;
	int val = 0, ret;

...

>  		for_each_set_bit(j, &status, 32) {
> -			hwirq = i + j;
> +			irq_hw_number_t hwirq = i + j;

Now it needs a blank line here.

>  			irq_type = irq_get_trigger_type(irq_find_mapping(domain, hwirq));

...

Please, split this patch to a few based on the nature of changes (something
like 4 patches in a series).

-- 
With Best Regards,
Andy Shevchenko


