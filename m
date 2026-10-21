Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604491;
	b=GDh9XY7HedTPnyQaNsl1/P6hbOPz+4VMSsudq4NaYW7Wj+fC/8x5wpOIPtYbWfgWf/Cj
	 CABlBskWF5RtYK21mgg1GsFnvSIzQKKyxY+5NmmPH9Ja1SBv/+Hlum60svSDIVRRtXHjV
	 9ysNJBQ5eOtAsUr9T0B6q3M62dam1GkajNbhuwAKginK3+AnzBY2YjS0YLE2N1bfQsKDs
	 K4R9RAk0tjXf9VSFcg86T1PcJo94BDIl/gvWcaqXXXl8sBMXXzjHyQvliCL/5aDFEmyM1
	 hOVE5TgOf1mwr89lcVmqruUgiqJEzGgNbhKf56Tw3EXe86WeAWG1hhb+w21P4b5NALA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604491;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=31A+vvUI+/mjMgLa5nWHlVLak6X9Yu0IaOYyy2oqFGU=;
	b=xcMwfjt3SsNvOBf5zl1Xpo3EpbkxkwCnNHPL+UFt/YQtL/5FZfpTKnafzj4sn9A962oE
	 Hy4C41RRKN/S/CKmsUE46Nhw8NbIVLnhN0u+vEfhFOqO3uoa0mQ8EGVnBbOTIXTm0+gES
	 kcsHNOagxOwymHamrRQZtFWs2EZ5greskBT9CbkBSXvTVPp28OXrhS+2bAhUHiWg9KUXI
	 m7wwnXC8DcyHPnTYTNBIFq+DxSoGp8GaWtqbQ+vmgUqGhdq3RGVCDuYlAI+5ZL5sihqUh
	 u4j8k8+gYo6kRH58dxy3VhXwwg3sj7+R5B6EzYsCCEJOWcUMugR5YhvNUhd8zagmzNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i1Sv4UWD;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C81606A31D;
	Wed, 21 Oct 2026 17:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C81606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i1Sv4UWD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792604490; x=1824140490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5MS9GXLpLSTODjQqUTACMJmzZE3sGUUfPahrizDhqAY=;
  b=i1Sv4UWDCLYu2m3b3LM7U624n2d5vwsEBj61jeS8T2aKbcLcbWf99Jgl
   xGeE2fd/Pv7MJy113SgTXM9NnHQsPML1X0l1isVoFe1R8EhReyS0NWiT/
   c8nyhSsqpBz/oIPnvZQ5QDeF6o8i15AIakROBaKTNGA0qOD35kQzXuq9p
   5I+c2cxckeBDUbSuhCC/dsLFRJ/L+LKBHaF0SqZlevlOxwALqkAcmUROA
   c7x6x6qsgU2+gd3d2/u9tI4q85xlo+Q4/2ZAzFpqQQF43L1iO6W4kA2+W
   QBv++SvNGreU1u0/RNLaWGooFnC9Vpazr1uWikMqX5a307Xms/Yc3aPii
   g==;
X-CSE-ConnectionGUID: gctCK4u2RtGqA9wSOW5OkA==
X-CSE-MsgGUID: BYjozIvMRPerv0r9IGCX8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1235460"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1235460"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 10:41:29 -0700
X-CSE-ConnectionGUID: rAW/3EovRT+kctHLtA29rA==
X-CSE-MsgGUID: gMw39dsyQAuDvaIpg1ISSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3167147"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 10:41:27 -0700
Date: Wed, 21 Oct 2026 20:41:24 +0300
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
Subject: Re: [PATCH v11 8/9] gpio: pl061: switch data path to gpio-regmap
Message-ID: <atj5RLO6PYLiFgOs@ashevche-desk.local>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
 <20261020-cv75-gpio-v11-8-e058bae19571@ambarella.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-cv75-gpio-v11-8-e058bae19571@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 03:54:12PM +0800, Long Zhao via B4 Relay wrote:

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

>  static void pl061_irq_handler(struct irq_desc *desc)
>  {
> +	struct pl061 *pl061 = irq_desc_get_handler_data(desc);
> +	struct irq_chip *irqchip = irq_desc_get_chip(desc);
>  	unsigned long pending;
>  	unsigned int mis = 0;
>  	int offset;
> -	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -	struct irq_chip *irqchip = irq_desc_get_chip(desc);
> +	int ret;
>  
>  	chained_irq_enter(irqchip, desc);
>  
> -	regmap_read(pl061->regmap, GPIOMIS, &mis);
> +	ret = regmap_read(pl061->regmap, pl061->data->regs->mis, &mis);
> +	if (ret)
> +		goto out;

I think error checking is not required as we have mis = 0 still, so
the failed regmap_read() shouldn't change that.

>  	pending = mis;
> -	for_each_set_bit(offset, &pending, PL061_GPIO_NR)
> -		generic_handle_domain_irq(gc->irq.domain, offset);
> +	for_each_set_bit(offset, &pending, pl061->data->ngpio)
> +		generic_handle_domain_irq(pl061->irq_domain, offset);
>  
> +out:
>  	chained_irq_exit(irqchip, desc);
>  }

...

> +	for (unsigned int i = 0; i < pl061->data->ngpio; i++) {
> +		unsigned int virq;
> +
> +		virq = irq_find_mapping(pl061->irq_domain, i);

> +		if (virq)

Unneeded checkm it's already inside the below call.

> +			irq_dispose_mapping(virq);

So, altogether

	for (unsigned int i = 0; i < pl061->data->ngpio; i++)
		irq_dispose_mapping(irq_find_mapping(pl061->irq_domain, i));

> +	}

-- 
With Best Regards,
Andy Shevchenko


