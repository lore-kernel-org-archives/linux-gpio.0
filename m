Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599196;
	b=Z8IYG/N7h9rwxBmQbhwFf3ikMkvaHgyo5qiKlm00LVmV6Ng+CW0PrXI4VorE31qNJLrr
	 XeC+ILNYKFyZJtfaJM7IMOW4lKWzRyIeioet2mPl3jsEdkDi1YUgzHNtVOuRST7U+LflS
	 RM1UZlE47BMJyBurTqjNN40rhzpMbLf550YT0S8EE6C6krOAdV0wWbQLlBzOITV7PWZ2R
	 OOZa9nCMng7xs3DD5CmpAzcjbu2L7FIUouUV/2B3o1vw9wOWxtTb38WliJXfuyOxb3WHm
	 74jH05j3ZdD5s5+toIXvCcvJoLFaiU8CgPksknb661/+rOwUQD4WlEIDyWpdgE2/rpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599196;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=SBUhpJwPyx539tg5tTswMTfypWOD0WD++vHCNQFR7hA=;
	b=xiQaqRfuVWKFz2nFirg+mg3ZLWJefUJl8+XzvtmFTtmsUJ5o/XmVBRmVOdMVu45voWRo
	 0Q30zljARGvnSYQ0osFK4GWlGU9o7fxUaVD93/2y9Nml8RVzKOvcs0pRvGbMxWy94B286
	 pYEIchTUeVeHbQ4uyqnq3XxSsSatYFrN9Vc/ADqy5n8j1Fjf83rLtABFyzB7i15tjAeF8
	 EBKiY8P2DAsMgftZzbaKT0fbZa0S13KXc4tBs3moWd9LKqI5Irn5FklbAUNkM7sqd72b7
	 jHvrnAJ0dCCXgtI3JkrBQA4VYx44yaQI5BdPOZMQtcIMAOrwdMGuM8mD/zSfhJUthWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtfZlCR1;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83052606AD0C;
	Wed, 21 Oct 2026 16:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83052606AD0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtfZlCR1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792599196; x=1824135196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VoBRcmhCewvCf2btxHohNGP7ldHIxTyNyMa0RxxDTvE=;
  b=GtfZlCR16d0IxBxo1oftiJUP+x0OOuX0IhUXsMFK+cFMIzOPiF9lYF3w
   pym1yV13gBYx+hupsx8n0+rdmqK2b7FHbnQlM+fYr8blpvU0LQHmIluHU
   2ezre67I4YPiWRxe8PxWQQ8T5YyiLr7o/qordJpcwkUSdtZVLmxG4Al4X
   GJaPpdnMDiFW0Zdh9yXDKXxMX2BG9aJPPFbU9bro9XwU3KVr0fY0fq2ko
   9QfdtdU08JCyePKZwqAVoSLdeXQT2Op73EAy8G//xSwLXFXUGhiO50twz
   nPxupvPmlJkspqTAgWYYbUzVL/+eM8wkZSPfjdrY8qVt0ArRvyJqb2VPM
   g==;
X-CSE-ConnectionGUID: zNQxyV3mTRWHkRGtKuR6Eg==
X-CSE-MsgGUID: FU4pb9uYTla0AHK2vNwKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1329818"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1329818"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:13:15 -0700
X-CSE-ConnectionGUID: 7p4EFM2aSKG+rCnbzv8Mmg==
X-CSE-MsgGUID: uE6f9u57SnuuIYBMhUbf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3544656"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:13:12 -0700
Date: Wed, 21 Oct 2026 19:13:09 +0300
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
Subject: Re: [PATCH v11 6/9] gpio: pl061: use cleanup helpers for locks
Message-ID: <atjklW87q911Jdno@ashevche-desk.local>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
 <20261020-cv75-gpio-v11-6-e058bae19571@ambarella.com>
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
In-Reply-To: <20261020-cv75-gpio-v11-6-e058bae19571@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 03:54:10PM +0800, Long Zhao via B4 Relay wrote:

> Convert raw_spinlock critical sections to guard()() from cleanup.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> @@ -267,9 +262,8 @@ static void pl061_irq_mask(struct irq_data *d)
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
>  
> -	raw_spin_lock(&pl061->lock);
> -	regmap_clear_bits(pl061->regmap, GPIOIE, mask);
> -	raw_spin_unlock(&pl061->lock);
> +	scoped_guard(raw_spinlock, &pl061->lock)
> +		regmap_clear_bits(pl061->regmap, GPIOIE, mask);
>  
>  	gpiochip_disable_irq(gc, d->hwirq);
>  }
> @@ -282,9 +276,8 @@ static void pl061_irq_unmask(struct irq_data *d)
>  
>  	gpiochip_enable_irq(gc, d->hwirq);
>  
> -	raw_spin_lock(&pl061->lock);
> -	regmap_set_bits(pl061->regmap, GPIOIE, mask);
> -	raw_spin_unlock(&pl061->lock);
> +	scoped_guard(raw_spinlock, &pl061->lock)
> +		regmap_set_bits(pl061->regmap, GPIOIE, mask);

Strictly speaking guard()() will work, but for the sake of consistency with
_mask this is fine.

>  }

-- 
With Best Regards,
Andy Shevchenko


