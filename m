Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A13CE4B5;
	Tue, 13 Oct 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875538; cv=none; b=sCCkAA6FPDs+7BuBUgq2dRVSdID+/2YE0YgncaqQ2/HMR5FMOOvvYTfThxzPC0KEGew3OCOw6IDnx45rdvl8Px0h4fJJftWZqadnzdtYejuXe8maZWB5h73uDJnuHxIk6/OpUqlgrxqwDNN8yIo2SafSPUAWA+qwVW0rWyPVzGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875538; c=relaxed/simple;
	bh=gEX9eV3PZvzWxENLWmjUyzQEL5HEfUKrLDmucElwGQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VH5yCypyp/vt9Sm+fyDo4ldvMQOGaytqopnBeqCqIs75r8hByvZimPZDrezap7LPzoPUtrkAvg1YyJRsnUlngA7DJy4Tv7LGlR5okSbdDu1ZIP8JqPpoWsD/N8s/PnB1xZyMGwOXW7ayKG0xCOOzJNd80MqZFW1WYJ0b8wrjak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILK85kwJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILK85kwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791875536; x=1823411536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gEX9eV3PZvzWxENLWmjUyzQEL5HEfUKrLDmucElwGQI=;
  b=ILK85kwJzfZ64fC1HkS8aKrD9m9tehlibIUK03Uxez99ZWoONPYgbvuq
   RIMGOQLJagQWXybEFLpMMu8XR0QwLFwVdxmsv3pWQeivrf7+70gfduuO9
   RB1+1P0P8sabamAjMwcSUualEjgM+miUnqlWp9Pq6IIJUj950cBLFXvfO
   wZ0NyDlUO73LN1IjS47+XAAXyUQfNOEBKzxQLerv8ZyfYZ+oT9c99/btc
   jMdA3qxoqSNyUoZrGl08Jc1LLntQM1Sh1M7YfVrWPgG7xM5A5pExfdZkn
   Brlj7D5PKUHdAwJIF9Y3IO+8jl12de+8E5bOMBRaQXri4GANB9Yin3fSn
   Q==;
X-CSE-ConnectionGUID: Z8JB3NcXRKmgIDGv88J2vw==
X-CSE-MsgGUID: NsLbQ1QVS4ukl95Tp1zDlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="491855"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="491855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:12:16 -0700
X-CSE-ConnectionGUID: EUJowzJ1T7S9XSX4CPgtXg==
X-CSE-MsgGUID: rBuxNhFbTVSOhcp7M4IQHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1410068"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:12:13 -0700
Date: Tue, 13 Oct 2026 10:12:10 +0300
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
Subject: Re: [PATCH 5/7] gpio: pl061: use cleanup helpers for locks
Message-ID: <as3ZyjCdMRYpTbPP@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-5-5836bd438423@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-cv75-gpio-v1-5-5836bd438423@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 09, 2026 at 06:57:58PM +0800, Long Zhao via B4 Relay wrote:

> Convert raw_spinlock critical sections to guard() from cleanup.h.

...

>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
> -	unsigned long flags;
>  
> -	raw_spin_lock_irqsave(&pl061->lock, flags);
> +	guard(raw_spinlock_irqsave)(&pl061->lock);

+ blank line. I guess I already pointed out to this.

>  	regmap_clear_bits(pl061->regmap, GPIODIR, BIT(offset));
> -	raw_spin_unlock_irqrestore(&pl061->lock, flags);
>  
>  	return 0;
>  }

...

>  		int value)
>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
> -	unsigned long flags;
>  	unsigned int mask = BIT(offset);
>  
> -	raw_spin_lock_irqsave(&pl061->lock, flags);
> +	guard(raw_spinlock_irqsave)(&pl061->lock);

Ditto and so on...

>  	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
>  		     !!value << offset);

...

> static int pl061_irq_type(struct irq_data *d, unsigned trigger)
>  	}
>  
>  

While at it, drop the redundant blank line here.

> -	raw_spin_lock_irqsave(&pl061->lock, flags);
> +	guard(raw_spinlock_irqsave)(&pl061->lock);
>  
>  	regmap_read(pl061->regmap, GPIOIEV, &gpioiev);
>  	regmap_read(pl061->regmap, GPIOIS, &gpiois);

-- 
With Best Regards,
Andy Shevchenko


