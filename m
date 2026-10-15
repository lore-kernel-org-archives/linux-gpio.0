Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523542E004;
	Thu, 15 Oct 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092719; cv=none; b=MLBNZNq6OfkOjrhNRtc0nvCGMZBxD8cw95TGQr1CMV064Dw3D/KzwJYxgNrIP/EDYWjYi3qEtZQiEsXkKznXhJKwoyGgcO/MJHPrQ+tC/8OrpYXi2wEKGOENwn09PpENHYJbBZAvAJ3t5Zy0ykpDBb3jSTdB1CB1PJOJME2H09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092719; c=relaxed/simple;
	bh=Ngs/Tlwvue/Rh7tCII2BsxPB+XVNtzb8hwcJJWq4QEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJM+/WVsqUFYQSZLbfll73NouYvdwIdHKoiyWc9pxFxpK13zwe+1KCqRELztm2LTUglWmpD5CJa7HfBEnyLmxBJNeClYTqdtwrfZpUFySMWQyVkPiTkYmYC5Z1cOzeK3VYs2mopDgq777ZFNeaMAG5IBmQvYR7a5OefgEXOUokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pwmlp53E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pwmlp53E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792092717; x=1823628717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ngs/Tlwvue/Rh7tCII2BsxPB+XVNtzb8hwcJJWq4QEs=;
  b=Pwmlp53EQHPPnBaXxjENQ/w60C3eBiE+J2SKTfbLo9FJZa4cnLDAAYLv
   9buDzX6T8hke1XFKjGymFMRQ4bDoXDU7uK3T6Tfq3eI4VXBuvaVMXn4SG
   zHCOMZB1vA7Jl2i5MWkk9rSKJQXW8xqniwiwBTD42gDa8qgBUatAOMy+g
   Edhs//CfybJMuSJwJ0DRoHblAD4+7puTkxbJcURo4TYnJUjfLNyIzFapb
   VU/iVZui8QxVQMMm1ARupk+o85MnEdxvoiDHkybGRdpmqcll6FFSixzQD
   W57S9vfHc/tD4FNc++ni+GA8ikpFNTE982wxmTqIHVJlte48CPHTXlPNk
   g==;
X-CSE-ConnectionGUID: AA4A95ljREaNeHCOeTmtzg==
X-CSE-MsgGUID: 4dAtbxVPRrCTQntpN9Lwuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="885817"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="885817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:31:56 -0700
X-CSE-ConnectionGUID: tDk2IHswT/K1vPnA71p70A==
X-CSE-MsgGUID: BIZ9XlNaR1OqqM0HmJIQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2120946"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:31:53 -0700
Date: Thu, 15 Oct 2026 22:31:50 +0300
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
Subject: Re: [PATCH v10 6/8] gpio: pl061: use cleanup helpers for locks
Message-ID: <atEqJqIWsZYd750M@ashevche-desk.local>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-6-3fe3eb315a55@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-cv75-gpio-v10-6-3fe3eb315a55@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 06:53:33PM +0800, Long Zhao via B4 Relay wrote:

> Convert raw_spinlock critical sections to guard() from cleanup.h.

guard()()

...

> @@ -270,9 +265,9 @@ static void pl061_irq_mask(struct irq_data *d)
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
>  
> -	raw_spin_lock(&pl061->lock);
> +	guard(raw_spinlock)(&pl061->lock);

Should be scoped_guard() in this case.

>  	regmap_clear_bits(pl061->regmap, GPIOIE, mask);
> -	raw_spin_unlock(&pl061->lock);
>  
>  	gpiochip_disable_irq(gc, d->hwirq);
>  }
> @@ -285,9 +280,9 @@ static void pl061_irq_unmask(struct irq_data *d)
>  
>  	gpiochip_enable_irq(gc, d->hwirq);
>  
> -	raw_spin_lock(&pl061->lock);
> +	guard(raw_spinlock)(&pl061->lock);
> +
>  	regmap_set_bits(pl061->regmap, GPIOIE, mask);
> -	raw_spin_unlock(&pl061->lock);
>  }

Otherwise will be asymmetric with the unmask().

-- 
With Best Regards,
Andy Shevchenko


