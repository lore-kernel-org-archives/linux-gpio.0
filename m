Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794860;
	b=DFqcCti5E1DuXHdYfGEFmJx23EmbPmpb9UPChs0uYjSE4sXhyDpOVCVSba6oMFRzYT+R
	 UbL1UskbUqXTYV9KeSubSxvojc8h5ILKKK5uzVfuIBpLT+z09OMwy19oLN5YP9PMvSN3/
	 oXc2688TCzIJaJFOFpsYpU124cqCDa6OywcO1HS9kF6fEMj5nmtZtMKQzsRZPlMPdAQEg
	 MY72OheEDN3v07nVM2Pfjo1paqHtCkPMuU0jcSVaWZHN9m6/s39ea4rtTF2XsiyTrWVU4
	 QmcKCJko6Rc2QpDZex78kAvh0SqP3JKh6Xc18LKDknYmICKOALvc4Q/DAARQNbm9GOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794860;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=R24GRRZu2LF+oL5dCCC8BQMX1wvtB7tGR8sHbNkvTSw=;
	b=r9auYnCOC2/OVWR0zWGYVGkcAJ0KeGKDgLYXI57wquNlHS1A3xPR5/xszpAbvkyrox1e
	 ekIHkDukS7oQ3J0g15vbQJwRsyQV3hqGWiSLP2rNFG7n2ZvD5ogRa1WnzYcpCPuo5iJ6a
	 hwzO2XUmmlas5omMboO7nOs/Oel++OnPkPY+MxykSAwl4V1p3u8YS+sPPu2GFnuX5h9IA
	 dG/E01PCJZrowKVYrCGHfA3OLIgTeHCF/9HTsFi7E01+Y5/k4fpQHNyTf/wnK38P1tJmo
	 EHlQJBkSPZtR7sDo4dz+psoYLsGD+GJ/WrTtoFKHNVya4SkQ+IzRhgyCgLTqaIH9xpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VjxjkGcC;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C1606A31B;
	Wed,  4 Nov 2026 12:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18C1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VjxjkGcC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794860; x=1825330860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yeYq/ODyobia1D69bQ2AZ+dU2Nd8e6D32JryTlAQh+0=;
  b=VjxjkGcCPDAl+5cXYMM/PWVbXwZefWtuuqQHdE83LIXYtML1RWQjKYht
   bmCtCedOMVAnkTt7VASjpaocyFBl5IkcnB4qgLdi8id6oy/nkQ01M5VAH
   GM05hB4pw6jgsKM6MaaYpNhkoXOu/LlBQAGclhGucceG29c+CSD8WP+Ry
   ohnvZXMLgLxuIzwFP2UnGn+SSz2uLGvqXMp/qYcRa3sRio7u+p7PsIxRd
   sLBPeCHjnSN/H3REv7sgU1m5y38nGVAquQWZOm+lz+0HrxxGWxWl2nznm
   J/46QTTJECSNB8kNX3kjPTqKpxzx2/WCI5/U5yfuSU/lls7HJqNwqkNqN
   Q==;
X-CSE-ConnectionGUID: gDl3wu1NT1qIB09MIGErpw==
X-CSE-MsgGUID: UTpXjTD7R0aoITMqgL2L0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2575221"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2575221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:20:59 -0800
X-CSE-ConnectionGUID: nFnuP8uNTdCiwy6ZosAOTw==
X-CSE-MsgGUID: 9e6dJ04kQeG1ediuW4fRHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7022818"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:20:57 -0800
Date: Wed, 4 Nov 2026 14:20:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <ausjJSZkaGKNfykE@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:
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
> +
> +	array_info->desc = descs->desc;
> +	array_info->size = count;
> +	array_info->gdev = gdev;

> +	bitmap_set(array_info->get_mask, 0, count);
> +	bitmap_set(array_info->set_mask, 0, count);

You don't need these, as memory is nullified.
Also note that we have bitmap_clear() IIRC.

> +	descs->info = array_info;
> +
> +	return descs;
> +}

...

>  		dev_dbg(dev,
>  			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
> -			array_info->gdev->label, array_info->size,
> -			*array_info->get_mask, *array_info->set_mask,
> -			*array_info->invert_mask);
> +			descs->info->gdev->label, descs->info->size,
> +			*descs->info->get_mask, *descs->info->set_mask,
> +			*descs->info->invert_mask);

Why not using %*pb for masks?

-- 
With Best Regards,
Andy Shevchenko


