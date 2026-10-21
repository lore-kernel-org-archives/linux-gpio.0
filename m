Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616086;
	b=lfztfNhHvgtHqw73BUKfD0orugsSPzlgKMCZM8g2pQU7j77nqPybhL5feCG+w/X5l/gX
	 7H2qtnee3RFPX+tChB1IsZc3jsXRzkKcfNK9SiRF4yX2wPmowAy4uDHEEbCemgZ5iyp0/
	 6wKiFfwKFyhcIbeJ3OsAO045lARdfjY8sdwUsKE+nxm2PNI3IQCgjducM5CW/TtVnW0cK
	 n8fyrdAw40DJJap0pP69RFXb4dgs684SmkDbG9R82zpbK19bVG+Y8yiE18jPdfL9+TAis
	 9PNZa7HXAYe329AEDbAW5E5ynoE+OGAxWWQhKsBROuNKH1mASNleIYV1unBrqjBDa1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=2xAYdS5rNAJ4rIyCLLru/W0tl/zJqtV8wra+ZAwrYho=;
	b=GUJtX48FxJYx7C2Cpe6rLldFeJAeBVP008ZTakl7GZXRXD0rApO1HfXT9tuo8ME3G/io
	 G6C3P325SmhfzudLYR7zyDIcMX6eBJvtktSlnQAVPmm9WNPH9kdU4bLJA0yTA7jtgKBL+
	 dG40JhztqHzlmt1v9mqldIpstki1X2UqdUdPOC0vnPQI6xeSpsNmPHt0s6MOZbgTUj60h
	 h5aw3S6WctetaOdTFxuv+o1bhFMj/Pf4gef8f2tGE3s6hW0FLXLrgHqvH80muv0YjEIfr
	 GrbsjlA4n7vecooYQplaKD7gXtPO9bEWAIRR8TI9mqLf1ry61qUsiYBbN+wwvq7nTbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=US8Xpj41;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759F606A319;
	Wed, 21 Oct 2026 20:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B759F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=US8Xpj41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792616085; x=1824152085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=71gP9fVJDqJQrZLznymovdUPBhL5VXBhYlzGRkvMXOk=;
  b=US8Xpj41UGYr3CY1hYiyJwDwEDqM/hDE1A3hOCp/kWlylFShINY3Mf9s
   KRfcG3bpAkWh35R/x4c4EMGMbqSK716rscQRSb+9vqBkMHrG4QGP7BJyt
   bcKFx4QcT2uSI6kQIzIjbcmk5TjWUi9KV7DQZ3zX3E0RwBfIYJWlx1uJC
   kaC3qQYGxi81PH4E8DyPKzbto0GngtdT5yOes2JhJnAPZDrQwlR79TzNj
   /FqTAkDHfxfqMes/n2UlB70aq4Z6MA6n/XmsrewEOHRgwvUiQRIjLo450
   5y0k+6AM4FcCW/oF2DBaBulDgoRG/G9OOlUX1tU8Fgrm44ixJZmFD+BwS
   g==;
X-CSE-ConnectionGUID: MZkTRwx1RQyBGhgFrgvfZg==
X-CSE-MsgGUID: w1b+cmfDTmaUc6y6Qd6pAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1243088"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1243088"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:54:45 -0700
X-CSE-ConnectionGUID: 7qQPC9n4QS2gnlPyM+tytQ==
X-CSE-MsgGUID: A0C/dKrQSTS8SuNQ3m7Gug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="5028645"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:54:43 -0700
Date: Wed, 21 Oct 2026 23:54:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atkmj6rxedA-XPf-@ashevche-desk.local>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
 <atkTqWUn-2tzRw69@ashevche-desk.local>
 <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
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
In-Reply-To: <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 01:39:49PM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 21, 2026 at 10:34:01PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:

...

> > > +	bitmap_set(array_info->get_mask, 0, count);
> > > +	bitmap_set(array_info->set_mask, 0, count);
> >
> > With the above being done, I would rather see bitmap_zalloc() for bitmaps.
> 
> struct gpio_array is defined with a flexible array member (invert_mask[])
> specifically so that descs, array_info, and all three bitmaps live in a
> single allocation. Switching to bitmap_zalloc() would turn one allocation
> into four or five separate allocations and require freeing the bitmaps
> both in gpiod_put_array() and when cancelling the fast path in
> gpio_descs_check_fastpath(), so I would prefer to keep the single
> contiguous allocation here.

Why? You can also allocate 3x bitmaps with bitmap_zalloc(). So I see only
a single additional allocation.

...

> > >  	count = gpiod_count(dev, con_id);
> > > -	if (count < 0)
> > > -		return ERR_PTR(count);
> >
> > Leave this and simply add
> >
> > > -	struct gpio_descs *descs __free(gpiod_put_array) =
> > > -		kzalloc_flex(*descs, desc, count);
> > > -	if (!descs)
> > > -		return ERR_PTR(-ENOMEM);
> > > +	if (count <= 0)
> > > +		return ERR_PTR(count ?: -ENOENT);
> >
> > 	if (count == 0)
> > 		return -ENOENT;
> >
> > The currently proposed code is less readable.
> 
> Looking closer at gpiod_count(), all of its real backends
> (of_gpio_count(), acpi_gpio_count(), swnode_gpio_count(), and
> platform_gpio_count()) return either a positive count or -ENOENT, and
> the !CONFIG_GPIO_ACPI stub for acpi_gpio_count() returns -ENODEV. The
> only outlier is the !CONFIG_OF_GPIO stub for of_gpio_count() in
> drivers/gpio/gpiolib-of.h, which returns 0 (and also causes
> gpiod_count() to skip the if (count < 0) fallback to
> platform_gpio_count()).
> 
> Do we actually need to check for count == 0 in gpiod_get_array(), or can
> we fix the !CONFIG_OF_GPIO stub of of_gpio_count() to return -ENOENT and
> leave the count < 0 check in gpiod_get_array() untouched?

I would fix of_gpio_count() stub. But I haven't check its users for correctness
of such a change. I think it would be weird for them to expect 0 when OF_GPIO=n.

...

> > >  	for (i = 0; i < count; i++) {
> > > -		desc = gpiod_get_index(dev, con_id, i, flags);
> > > +		struct gpio_desc *desc __free(gpiod_put) =
> > > +			gpiod_get_index(dev, con_id, i, flags);
> > >  		if (IS_ERR(desc))
> > >  			return ERR_CAST(desc);
> > >  
> > > +		if (i == 0) {
> >
> > This is almost invariant to the loop. Can we move it out?
> >
> > > +			descs = gpio_descs_alloc(count, desc);
> > > +			if (!descs)
> > >  				return ERR_PTR(-ENOMEM);
> > >  		}
> > >  
> > > +		gpio_descs_check_fastpath(descs, desc);
> > >  
> > > +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
> > >  	}
> 
> gpio_descs_alloc() needs the first descriptor (desc at index 0, acquired
> by gpiod_get_index() inside the loop) to check gpiod_hwgpio(desc) and
> gdev->ngpio so it knows whether to allocate space for array_info and the
> bitmaps up front instead of reallocating with krealloc(). Before the
> loop we have not looked up the first descriptor yet.

That's why I put 'almost' which means we might need to duplicate a few calls
outside as well.

-- 
With Best Regards,
Andy Shevchenko


