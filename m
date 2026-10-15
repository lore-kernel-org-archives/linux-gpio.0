Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC581BC08F;
	Thu, 15 Oct 2026 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093718; cv=none; b=mKiSB0iXGWAQvrts40Dc/ua6WojYCAMUwQsPiQ8npuoNDtFUUAX/R5kiFjP8Dr34PUsHy4PUPGepWEWbDIV3nl0TGvZVhOsFvLjoQmJeLEuM+1dCBjk6jBJiZ+OwBD4P5JIucAAxMcPFEaA+BeRPNP7wynZo0NtxQLX1ZaeOfbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093718; c=relaxed/simple;
	bh=6sHunXAyxmZ2TYd8+8FDfj1K6G2fOa6hilnkB8iHv10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQPxKUVQhbow6DQacAWGyzXVPefuNCojzJud3RlRwW8kdzDuIOQ+YR/n0YS6sOrWehaFLiRgg1AZNUVjKvHkoLj7rvJXtYuGrMTRpjw2NlGrOD+zZ6A0Zi9K5moLYmN9/d5LAeQ1B360WfwIqR2we51tYLquklnk3O+XZgTbqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCCQKQgi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCCQKQgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792093716; x=1823629716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6sHunXAyxmZ2TYd8+8FDfj1K6G2fOa6hilnkB8iHv10=;
  b=hCCQKQgiCdKLIWFA+DEt4bhtiOfvkd3QMq1LcjdIjLvoL8u23dRhVslt
   ANygzAVO1IwaAExlQV5L7u2D/n3RlCqRcsmpeqz5IbMBzUXNYR0/qT2dQ
   A/8hIvJVWO4rcK7QvBfW1lDg3yWnBnZSyh7GDoIDSrgpgGdSdu8d3sqUn
   CEGD3/W7ZyKJ2qRbr7aoVpZKcOSQLlOedTD9Ux2oqEdSGhfsL0lAOvAxx
   ZODXL7w4FqHylZURus3PdCc0w9g74F5N9BjFV2HSq7LfoOont0ACSBRHG
   V9Jk6L0Px06R1K1JB0U7bHhEnKcSwdK4jK+PbFaCH/AtwNbaJjMAU3UBz
   Q==;
X-CSE-ConnectionGUID: EjvpaxhaSpifRzcnNnXKRQ==
X-CSE-MsgGUID: OWbk80tKSfiDbizdfEiw+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="758626"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="758626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:48:36 -0700
X-CSE-ConnectionGUID: 5XxghNZuTy6V3lyP1s1whQ==
X-CSE-MsgGUID: wggUgsfvRZCp7DkrcjENWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1741093"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:48:33 -0700
Date: Thu, 15 Oct 2026 22:48:30 +0300
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
Subject: Re: [PATCH v10 7/8] gpio: pl061: switch data path to gpio-regmap
Message-ID: <atEuDjC9bXHbWyNZ@ashevche-desk.local>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-7-3fe3eb315a55@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-cv75-gpio-v10-7-3fe3eb315a55@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 06:53:34PM +0800, Long Zhao via B4 Relay wrote:

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

> -#define GPIODIR 0x400
> -#define GPIOIS  0x404
> -#define GPIOIBE 0x408
> -#define GPIOIEV 0x40C
> -#define GPIOIE  0x410
> -#define GPIORIS 0x414
> -#define GPIOMIS 0x418
> -#define GPIOIC  0x41C

> +#define PL061_DIR		0x400
> +#define PL061_IS		0x404
> +#define PL061_IBE		0x408
> +#define PL061_IEV		0x40c
> +#define PL061_IE		0x410
> +#define PL061_MIS		0x418
> +#define PL061_IC		0x41c

If you want this rename, it should be done separately, otherwise it sounds like
an unneeded churn (at least for now).

...

> +struct pl061_drvdata {
> +	const struct regmap_config *regmap_config;
> +	const struct pl061_regs *regs;
> +	unsigned int ngpio;
> +	unsigned long quirks;
> +	bool clear_irq_on_type;
> +	bool pm;
> +	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> +			      unsigned int offset, unsigned int *reg,
> +			      unsigned int *mask);

Split this logically

	int (*reg_mask_xlate)(struct gpio_regmap *gpio,
			      unsigned int base, unsigned int offset,
			      unsigned int *reg, unsigned int *mask);

>  };

...

>  struct pl061 {
>  	raw_spinlock_t		lock;

> +	struct device		*dev;

Why? Can't you derive this from regmap?

>  	struct regmap		*regmap;
> -	struct gpio_chip	gc;
> +	const struct pl061_drvdata *data;
> +	struct irq_domain	*irq_domain;
>  	int			parent_irq;
>  
> -	struct pl061_context_save_regs csave_regs;
> +	u32			saved_dat;
>  };

> -static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -	int ret;
> -
> -	ret = regmap_test_bits(pl061->regmap, GPIODIR, BIT(offset));
> -	if (ret < 0)
> -		return ret;
> -
> -	if (ret)
> -		return GPIO_LINE_DIRECTION_OUT;
> -
> -	return GPIO_LINE_DIRECTION_IN;
> -}
> -
> -static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -
> -	guard(raw_spinlock_irqsave)(&pl061->lock);
> -
> -	regmap_clear_bits(pl061->regmap, GPIODIR, BIT(offset));
> -
> -	return 0;
> -}
> -
> -static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
> -		int value)
> -{
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -	unsigned int mask = BIT(offset);
> -
> -	guard(raw_spinlock_irqsave)(&pl061->lock);
> -
> -	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> -			   BIT(offset), value);
> -	regmap_set_bits(pl061->regmap, GPIODIR, mask);
> -
> -	/*
> -	 * gpio value is set again, because pl061 doesn't allow to set value of
> -	 * a gpio pin before configuring it in OUT mode.
> -	 */
> -	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> -			   BIT(offset), value);
> -
> -	return 0;
> -}
> -
> -static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
>  {
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -
> -	return regmap_test_bits(pl061->regmap,
> -				BIT(offset + PL061_DATA_OFFSET),
> -				BIT(offset));
>  }
>  
> -static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
>  {
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -
> -	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> -			   BIT(offset), value);
>  
>  	return 0;
>  }

...

> -		dev_dbg(gc->parent, "line %d: IRQ on both edges\n", offset);
> +		dev_dbg(pl061->dev, "line %d: IRQ on both edges\n", offset);

To avoid this type of churn, introduce a local variable to keep parent

	struct device *parent = gc->parent;

and convert the lines in a separate patch. So this one will have much less
unneeded changes.

...

> +	if (irq) {
> +		pl061->irq_domain = irq_domain_create_linear(dev_fwnode(dev),
> +							     data->ngpio,
> +							     &pl061_irq_domain_ops,
> +							     pl061);
> +		if (!pl061->irq_domain)
> +			return -ENOMEM;
> +	}

We have devm_irq_domain_instantiate(). Can't use it? Why?

...

> +	for_each_set_bit(offset, &dir_mask, pl061->data->ngpio)

> +		regmap_write(pl061->regmap,
> +			     BIT(offset + PL061_DATA_OFFSET),

You have room. Please, check your editor settings and keep in mind that the
strict limit is 80 characters (inclusive), so lines may have 80 characters.
In some cases (when readability may be increased) even slightly more.

> +			     !!(pl061->saved_dat & BIT(offset)) << offset);

This is simply

			     pl061->saved_dat & BIT(offset));

no?

-- 
With Best Regards,
Andy Shevchenko


