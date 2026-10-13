Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411B3E5A1F;
	Tue, 13 Oct 2026 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875424; cv=none; b=cVyu2FJsQZHgaOrR5tvRNK/xIowzfOhOx/8UNc410hWVDyS12wYTJTrZmR8gQ/PSwStNzyZdk2NemkUpsbyNmuVE+udUoG1//AIifX5CqKxiWnKdO3usOHqQIMHjkmfE1731CTLtpNSGe3S1oczLH6hcWPk2ud3sevk4I85d9ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875424; c=relaxed/simple;
	bh=40UxKO6+x+fC3YVsdc6BFyvhZNRTxQba4nAox1wImeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdhN/N1TJXJPrzcRSuhRBDbmmgzLFitMTDhrt1obbORAAtBOKj0YmslD4ulPArRtsSnXthPQ8JCOPFvrrnWGzIf+HjGNXQFc/yH/Z62xpFKPVxrBV2NTB//VAs0v0XIePtjLxqOBR0WAEGhrBnoNFxrE5RVFPo9EqUcM+3bJurE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCbX5wNo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCbX5wNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791875422; x=1823411422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40UxKO6+x+fC3YVsdc6BFyvhZNRTxQba4nAox1wImeo=;
  b=PCbX5wNoYcAiylQDo1OfObH0UOGieWz0wsjFNpU0n/rxIMm5J07hCY6i
   DvLU1Vn92Z2QYzTOhVmP7pmmWS4/519hx9QB3ZiX7Yqyo2gpJ8JRsK9w+
   sLafMpQjWOsxizkrSx8lbFgcgRTqo1fYi2hs2WRSIhgh3o4njnlHpIVsv
   QAw08x9RP/frertG1XKuC9sSLM7WKPfeLX4y1DUzB6mH6GciuUMsHve6H
   /HFAAOT3SMtgIYVHXQhjgLMnE98jzYRU2y1PqwBixYnE6lJ96DnMOZhXN
   Ev/Yn16NYHDCo5BpPy1bT5y6CsIgarDlXDH0yNd7ZYsg/l6XMGS3U633e
   w==;
X-CSE-ConnectionGUID: GJES+LywRNuVl8XaEyDxxA==
X-CSE-MsgGUID: TAA7S5EWSjyyBcHmzUl3Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="488229"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="488229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:10:21 -0700
X-CSE-ConnectionGUID: 1W9NQU1kQm6uPTwR4G1eDA==
X-CSE-MsgGUID: yTGA8lL0QdqXc4qqXsqUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1065334"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:10:18 -0700
Date: Tue, 13 Oct 2026 10:10:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Chanho Min <chanho.min@lge.com>
Subject: Re: [PATCH 3/7] gpio: pl061: convert register access to regmap
Message-ID: <as3ZUgUkZbqw40e6@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-3-5836bd438423@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-cv75-gpio-v1-3-5836bd438423@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 09, 2026 at 06:57:56PM +0800, Long Zhao via B4 Relay wrote:

> Replace readb()/writeb() with a MMIO regmap while keeping the existing
> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> under the irq descriptor lock.

...

> +static const struct regmap_config pl061_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.reg_stride = 4,
> +	.max_register = GPIOIC,
> +	.volatile_reg = pl061_volatile_reg,

But this might be a dead code as long as there is no regcache defined.
Should we specify the cache type here?

> +	.fast_io = true,

No need, this is provided by struct regmap_bus::regmap_mmio in regmap-mmio.c.

> +	.use_raw_spinlock = true,
> +};

...

> static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,

>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  	unsigned long flags;
> -	unsigned char gpiodir;
> +	unsigned int mask = BIT(offset);
>  
>  	raw_spin_lock_irqsave(&pl061->lock, flags);
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> -	gpiodir = readb(pl061->base + GPIODIR);
> -	gpiodir |= BIT(offset);
> -	writeb(gpiodir, pl061->base + GPIODIR);
> +	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> +		     !!value << offset);

regmap_assign_bits()

> +	regmap_set_bits(pl061->regmap, GPIODIR, mask);
>  
>  	/*
>  	 * gpio value is set again, because pl061 doesn't allow to set value of
>  	 * a gpio pin before configuring it in OUT mode.
>  	 */
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> +	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> +		     !!value << offset);

Ditto.

I already pointed out twice to this...

>  	raw_spin_unlock_irqrestore(&pl061->lock, flags);
>  
>  	return 0;
>  }

...

>  static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> +	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> +		     !!value << offset);

Ditto.

>  	return 0;
>  }

...

> static int pl061_irq_type(struct irq_data *d, unsigned trigger)

>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  	int offset = irqd_to_hwirq(d);
>  	unsigned long flags;
> -	u8 gpiois, gpioibe, gpioiev;
> -	u8 bit = BIT(offset);
> +	unsigned int gpiois = 0, gpioibe = 0, gpioiev = 0;
> +	unsigned int bit = BIT(offset);

Since these are long lines, try to move them up to follow the reversed xmas
tree order.

...

>  static void pl061_irq_handler(struct irq_desc *desc)
>  {
>  	unsigned long pending;
> +	unsigned int mis = 0;
>  	int offset;
>  	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>  	struct pl061 *pl061 = gpiochip_get_data(gc);

>  	chained_irq_enter(irqchip, desc);
>  
> -	pending = readb(pl061->base + GPIOMIS);
> -	if (pending) {

This is a dup check, please, add a precursor patch that just drops this
redundant 'if (pending) { }' check.

> +	regmap_read(pl061->regmap, GPIOMIS, &mis);
> +	if (mis) {
> +		pending = mis;
>  		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
>  			generic_handle_domain_irq(gc->irq.domain,
>  						  offset);

-- 
With Best Regards,
Andy Shevchenko


