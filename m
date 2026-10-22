Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688202;
	b=vxPu3OKB34PEiZWtH8i6FFex4Yxq7otJd2a/RHDBAstglTZzcxFxosfuCrfwviQmZmIN
	 C3T9NIAbXIrOmR3vCO/GMOqk5KQ/8aFye8BCB8AHzZCobV19mZJKvCOAf23xYwOFb6w/5
	 JtBMYsTUmD4pCegQZWghJ8VURHR1QIAXC9Ay9Fb341m/SRRnK61/AJJuXZmZYmdiiEtFf
	 BSfabjjM/ns0NRcBOYCye7qElgVjcXIlh81W4nb4oxwO23j5XQGe5oLzQUmIJnX9Otr34
	 HvSaKICLaUHUnbZjtLWCVN1AnB+Dd6Fkzko0PZ1LAK7aJLNh9I9aH9FB4scdqjulIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=il28kZEu1J1N+magMxahRVyuOLNhpdSTnTMxXMXXMko=;
	b=o99n/1QIoZKmlaxcpW8JJ1JoifL/cMkKpt1vrNMQw+JC2UHyei4SDgndeJ3wXsHuR1XM
	 IdubnvLCGrFnLYgBivv1lPjXKeJEmDVMyWJ0DkFd2obLwOdAnt2AFxQP1SezTuiquZYGE
	 oLsa2HLBI5xpNvvV85STkJfZFiGYJl8pcCP9ZGzBKa3qUqtFNtcv075oXzxnaSgriI1S6
	 jHyYlnyNBBA+W7a+Z5n+A+E2cwsOs3qWrWM5p8b01cyOgptKRbAdHr+J5I7po5vo3aXGQ
	 dm6q14br6N4LDi36N8ANOssKXeFMpW7jP/Viht33fQm332mG1dL8tnEBOlqM8mm3hww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hD8uTPmE;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA4606A31F;
	Thu, 22 Oct 2026 16:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5CA4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hD8uTPmE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792688202; x=1824224202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hC0Qyh2g7Icwd/EcjcvpTpq/WQc4ueuC05RnQixe8sw=;
  b=hD8uTPmEpWT6UXStV8Y1L2ZgrK4n57cx9MtiAW0nZLHU3RcV4rUCoKeo
   kyGO5Ne+F0BsUYWF8XMsVPjHR6Fjj01lNhRA4uHl5bMcGyYQI5VhhgD/F
   BCVURqFGJQn4wg0MRod1S2XigZdrMzwc0oLScrEt69kj5Z6StLWBDQTzD
   clA5SqCOJX0/eIONZUmVJXa0EXcfd41S03RC4CJg1SYVRIIk6FgLqQhch
   jnNJGyiFVzbmkCcYXtaz/dpqejPuxiYdeBywq2gYbQrF/CwvYDPZzaQSU
   oTrM1JJ0TNe0aY7FIV9iVUNPj+RkayRlVMF26aVV/Vc7jAqxytz32zHlV
   A==;
X-CSE-ConnectionGUID: mhmjK1n1Td6ZucnDqQa+kA==
X-CSE-MsgGUID: pSZyk3wWRdum71Tjzd/owg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1445950"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1445950"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:56:41 -0700
X-CSE-ConnectionGUID: wHkTaDjRTnSigA5qAQwUFg==
X-CSE-MsgGUID: nD0U/ixbRAijSlpqq5kx/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3501791"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:56:39 -0700
Date: Thu, 22 Oct 2026 19:56:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atpARSOuQaWkY1Sr@ashevche-desk.local>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
 <atkTqWUn-2tzRw69@ashevche-desk.local>
 <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
 <atkmj6rxedA-XPf-@ashevche-desk.local>
 <atkp9edGVHRWrJCa@google.com>
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
In-Reply-To: <atkp9edGVHRWrJCa@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 02:17:56PM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 21, 2026 at 11:54:39PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 01:39:49PM -0700, Dmitry Torokhov wrote:
> > > On Wed, Oct 21, 2026 at 10:34:01PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:

...

> > > > > +	bitmap_set(array_info->get_mask, 0, count);
> > > > > +	bitmap_set(array_info->set_mask, 0, count);
> > > >
> > > > With the above being done, I would rather see bitmap_zalloc() for bitmaps.
> > > 
> > > struct gpio_array is defined with a flexible array member (invert_mask[])
> > > specifically so that descs, array_info, and all three bitmaps live in a
> > > single allocation. Switching to bitmap_zalloc() would turn one allocation
> > > into four or five separate allocations and require freeing the bitmaps
> > > both in gpiod_put_array() and when cancelling the fast path in
> > > gpio_descs_check_fastpath(), so I would prefer to keep the single
> > > contiguous allocation here.
> > 
> > Why? You can also allocate 3x bitmaps with bitmap_zalloc(). So I see only
> > a single additional allocation.
> 
> So the proposal is to continue combining gpio_descs and gpio_array
> allocation but split out bitmap allocations (still combining them into
> one, so needing to round up nbits).
> 
> This looks like worst combination of all. Why do you prefer
> bitmap_zalloc()?

It's proper allocation mechanism for bitmap. With k*alloc*() this sounds like
a (non-critical) layering violation. This also might add an additional churn
in case the bitmap APIs will get their own type (currently we use the knowledge
on how unsigned long:s is used for bitmap, but imagine the allocation that adds
some header or tail to it).

...

> > > > >  	for (i = 0; i < count; i++) {
> > > > > -		desc = gpiod_get_index(dev, con_id, i, flags);
> > > > > +		struct gpio_desc *desc __free(gpiod_put) =
> > > > > +			gpiod_get_index(dev, con_id, i, flags);
> > > > >  		if (IS_ERR(desc))
> > > > >  			return ERR_CAST(desc);
> > > > >  
> > > > > +		if (i == 0) {
> > > >
> > > > This is almost invariant to the loop. Can we move it out?
> > > >
> > > > > +			descs = gpio_descs_alloc(count, desc);
> > > > > +			if (!descs)
> > > > >  				return ERR_PTR(-ENOMEM);
> > > > >  		}
> > > > >  
> > > > > +		gpio_descs_check_fastpath(descs, desc);
> > > > >  
> > > > > +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
> > > > >  	}
> > > 
> > > gpio_descs_alloc() needs the first descriptor (desc at index 0, acquired
> > > by gpiod_get_index() inside the loop) to check gpiod_hwgpio(desc) and
> > > gdev->ngpio so it knows whether to allocate space for array_info and the
> > > bitmaps up front instead of reallocating with krealloc(). Before the
> > > loop we have not looked up the first descriptor yet.
> > 
> > That's why I put 'almost' which means we might need to duplicate a few calls
> > outside as well.
> 
> Yeah, I think doing it inside the loop rather than duplication
> gpiod_get_index() outside makes it cleaner.

OK.

-- 
With Best Regards,
Andy Shevchenko


