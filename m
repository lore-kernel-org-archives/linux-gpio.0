Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611246;
	b=gIgnuK1wlcwmbBWOurdAOoVPjuKorGTVecAPW6qqUGtG1C+0sqbkAi34kBWWeQg3VKz/
	 OzO/PeAFWPI2LnFCxxrnFO0V2t7qEe4RgS+d1/ywwBwIUleGjAH+c1F7uwAaiDwIhff0m
	 zsR9S+fgPpy8pmsReHVBPnYmD/GwbSpIcJrmcgTunNXD5NcTp8A+sdWKb0FILqUqRZgTI
	 rFxICRowsDGXsJJyiOK6F/umIwXLPbDtOhFOxJrgAXffzkSI94G+3RR4IFohOxZApN14N
	 2sBPcEhRX9A47n9Pi2ztHcDXAka94J2wzPUGLcVn3wz17xb/grgKWrgO6yttCIqslNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611246;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=xgjjvMcj+/SEphMyf29PqBcaIf1/jtjvKrod8J12SlE=;
	b=1VR9o5ntajefaTHqFTbXgQ1083d7FiOwE7xTBwDkjChWzmfd4v8sNTqHNCPkCafKsiOy
	 8fBLADo8L5MCUE9YGnzQqAFqbJyf5ms6td6k1luKYWEEiox6edsgGAoca+uthX35OYbrK
	 V+dO/ILLbmrk+3/jiMWjo1QQsozHvnIBeZTS19JGlZ8mW8Ig6IInyX9QIdYLJ0M3kh8T/
	 5lT2xXmjrC5Ha/nml2JSc5tjvVPxX67VV/7jJIYkd9prR5Ln6Bi7UJUBsKTyqpyclnmev
	 FsmwTrxzNJAA47DpodNUu1ycqhlOo4YRnqgbNWPzveRfYYdT0kZLzyC4fpfdzZUzxlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmOfVYrR;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC397606A31B;
	Wed, 21 Oct 2026 19:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC397606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmOfVYrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611246; x=1824147246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g074VJ2zsRyfbcPLhiVF6ww/zRqj2WDgDiYthX+xHcI=;
  b=jmOfVYrR0AK7gw3sJzf2eA5IpmQ78QZEZCTho/V88CDryKQv5gp2uOYK
   fZA2ubbu30fngxuRNEgbMrlmyuCvuI7aI8B6PP2UYjB+uTSMw2n7DNkGV
   s6KptEeokIPC6HOsj0pt+PxW0pVighUpOU0EsPXPJ+i3GI9jGeMKSee2q
   OEvUIV4kc/Lw4PZYte1XWP2NJDRMelb0E24ZfUwS8OTX3iBRFAYv8Q1vN
   AZiTNRSYCsJzEKUwpC2pQBKQBNw7AAZ26lM8sM36JQ2dQeoALcN7ryJ3i
   zlSw83rogy+pBQ2bdV2Rq6u52pjKOYEp7VDqEalcVwMqWZp2LVWXqR3yV
   Q==;
X-CSE-ConnectionGUID: eEpgEj4ORzaXDwHRCznLwg==
X-CSE-MsgGUID: gxE2WDPeQ82gJc1yXWB8fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1382755"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1382755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:34:05 -0700
X-CSE-ConnectionGUID: uAfhMxmxQ2GngWwt2x8PbQ==
X-CSE-MsgGUID: 3DVvLgvrTPeDVOY4x0WQTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3170729"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:34:04 -0700
Date: Wed, 21 Oct 2026 22:34:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atkTqWUn-2tzRw69@ashevche-desk.local>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
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
In-Reply-To: <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:
> Instead of allocating descs before the loop and reallocating it via
> krealloc() when candidate hardware array matching is detected on the
> first iteration, defer allocation of descs until the first descriptor
> is retrieved.
> 
> Factor descriptor allocation and fast-path validation into helper
> functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
> the loop, acquire the descriptor using __free(gpiod_put), allocate
> descs once on the first iteration, check fast-path candidate
> suitability, and transfer descriptor ownership using no_free_ptr().

...

> +static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
> +{
> +	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
> +	struct gpio_array *array_info;
> +	struct gpio_descs *descs;
> +	size_t descs_size, alloc_size;
> +	unsigned int bitmap_size;
> +
> +	/*
> +	 * If pin hardware number of array member 0 is also 0, select
> +	 * its chip as a candidate for fast bitmap processing path.
> +	 */
> +	if (gpiod_hwgpio(first_desc) != 0)
> +		return kzalloc_flex(*descs, desc, count);
> +
> +	descs_size = struct_size(descs, desc, count);
> +	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
> +	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
> +
> +	descs = kzalloc(alloc_size, GFP_KERNEL);
> +	if (!descs)
> +		return NULL;
> +
> +	array_info = (void *)descs + descs_size;

> +	array_info->get_mask = array_info->invert_mask + bitmap_size;
> +	array_info->set_mask = array_info->get_mask + bitmap_size;

> +	array_info->desc = descs->desc;
> +	array_info->size = count;
> +	array_info->gdev = gdev;
> +	bitmap_set(array_info->get_mask, 0, count);
> +	bitmap_set(array_info->set_mask, 0, count);

With the above being done, I would rather see bitmap_zalloc() for bitmaps.

> +	descs->info = array_info;
> +
> +	return descs;
> +}

...

>  	count = gpiod_count(dev, con_id);
> -	if (count < 0)
> -		return ERR_PTR(count);

Leave this and simply add

> -	struct gpio_descs *descs __free(gpiod_put_array) =
> -		kzalloc_flex(*descs, desc, count);
> -	if (!descs)
> -		return ERR_PTR(-ENOMEM);
> +	if (count <= 0)
> +		return ERR_PTR(count ?: -ENOENT);

	if (count == 0)
		return -ENOENT;

The currently proposed code is less readable.

...

>  	for (i = 0; i < count; i++) {
> -		desc = gpiod_get_index(dev, con_id, i, flags);
> +		struct gpio_desc *desc __free(gpiod_put) =
> +			gpiod_get_index(dev, con_id, i, flags);
>  		if (IS_ERR(desc))
>  			return ERR_CAST(desc);
>  
> -		descs->desc[descs->ndescs++] = desc;
> -
> -		gdev = gpiod_to_gpio_device(desc);
> -		/*
> -		 * If pin hardware number of array member 0 is also 0, select
> -		 * its chip as a candidate for fast bitmap processing path.
> -		 */
> -		if (i == 0 && gpiod_hwgpio(desc) == 0) {
> -			struct gpio_descs *array;
> -			size_t descs_size = struct_size(descs, desc, count);
> -
> -			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
> -						    gdev->ngpio : count);
> -
> -			array = krealloc(descs, descs_size +
> -					 struct_size(array_info, invert_mask, 3 * bitmap_size),
> -					 GFP_KERNEL | __GFP_ZERO);
> -			if (!array)
> +>  		if (i == 0) {

This is almost invariant to the loop. Can we move it out?

> +			descs = gpio_descs_alloc(count, desc);
> +			if (!descs)
>  				return ERR_PTR(-ENOMEM);
> -
> -			descs = array;
> -
> -			array_info = (void *)descs + descs_size;
> -			array_info->get_mask = array_info->invert_mask +
> -						  bitmap_size;
> -			array_info->set_mask = array_info->get_mask +
> -						  bitmap_size;
> -
> -			array_info->desc = descs->desc;
> -			array_info->size = count;
> -			array_info->gdev = gdev;
> -			bitmap_set(array_info->get_mask, 0, count);
> -			bitmap_set(array_info->set_mask, 0, count);
> -			descs->info = array_info;
>  		}
>  
> -		/* If there is no cache for fast bitmap processing path, continue */
> -		if (!array_info)
> -			continue;
> +		gpio_descs_check_fastpath(descs, desc);
>  
> -		/* Unmark array members which don't belong to the 'fast' chip */
> -		if (array_info->gdev != gdev) {
> -			__clear_bit(i, array_info->get_mask);
> -			__clear_bit(i, array_info->set_mask);
> -		}
> -		/*
> -		 * Detect array members which belong to the 'fast' chip
> -		 * but their pins are not in hardware order.
> -		 */
> -		else if (gpiod_hwgpio(desc) != i) {
> -			/*
> -			 * Don't use fast path if all array members processed so
> -			 * far belong to the same chip as this one but its pin
> -			 * hardware number is different from its array index.
> -			 */
> -			if (bitmap_full(array_info->get_mask, i)) {
> -				descs->info = NULL;
> -				array_info = NULL;
> -			} else {
> -				__clear_bit(i, array_info->get_mask);
> -				__clear_bit(i, array_info->set_mask);
> -			}
> -		} else {
> -			dflags = READ_ONCE(desc->flags);
> -			/* Exclude open drain or open source from fast output */
> -			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
> -			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
> -				__clear_bit(i, array_info->set_mask);
> -			/* Identify 'fast' pins which require invertion */
> -			if (gpiod_is_active_low(desc))
> -				__set_bit(i, array_info->invert_mask);
> -		}
> +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
>  	}

-- 
With Best Regards,
Andy Shevchenko


