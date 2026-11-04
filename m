Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794652;
	b=lK7Do0eD1u45PH+P9tGXSfidsGSe5YCjghJN1/uCPHDcyVBnHpzZ7jtt/WDG45/h/vK+
	 5h8IX82E8iRBmBLW06gwxBBorM8jOY9FHzlC4mcYDa1KwlbpKdVAEcgGy80cxgD5VZs3N
	 4vWhcZLWrn5OeU9p39YcCUsa1ZsPwCTh4ksxeaJi1PUqOQwCg3cEqp/sG2rEnpkL9NXy2
	 E53TKjyF0P3Q0B1Qy7AXVqAjxOVgL/ODSKaCC4RXD1qPsew8wfzgXk6L23JIyl1wR+1Sf
	 nvULYviqBKBduU0PTsuJex7eyIuCsEotKg3oaM6VsAm14JNbE/VAljsPObo9x0/D/SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794652;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=qGgAi4/k2gUB+68tlbXGJ0xK+WiFh2LxTkPJz4i/8jc=;
	b=Wk6UZzRmUQT1mZDZfINLYX8O2WnG1EiuBccrq5Ah75tjBKgZ1FM44JxJhc7H+SGbJpXe
	 6iMXHK8bJQnpONK2QXHoRZibe82PV5X5BD1/LyNX4gj/j9WLXfD41bH92bG5eCNRBUfDF
	 cUwhOjdrneiJ5IjTeqK/xsIcqLaVmnatJTYbQXFuDFbbshEqVvZc1aaycUnJBoFO+EEqx
	 +UT/o0KnUVHUhQvM++Yfwty/kmAJtYABlsgeAGkqG4YzLLxcimIUMLVooqSlIfuAXy89p
	 sLJ6AB1ZoLoqJYw+E4wcV6Wql2RGcL/xacBGb9vOMRupAVyQdkQE8//QVq7nPebZG/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OFXAROH9;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB5606A326;
	Wed,  4 Nov 2026 12:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OFXAROH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794651; x=1825330651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yYDX73FPpd1V/RmBILNtuIN6mw/p7xPQnzxnfCGQbg0=;
  b=OFXAROH9WCsXmXqrYs9Jx5pH+DRPOP4Sj1i1/mjXprfxoxXMNUNnHzfC
   NGYY1JUcUiYQmIvz1maLgRTwRYs5TFh/AOZcybSmkcdvRF1SsADtquxdu
   5JLr5vBV9Ci1pav2vFYerQJcz5yj8bS4PShURsywnI3jkpWzAXiIhxW2b
   65pJVf0oT+kZGPfedkl2uoHIUvV8HpqS+wbiWIzVl5SIK4tLM5pUU3Uye
   ecBYqESJH2bZe2WEQX03yzkxaBn+nYapzpRb4Zz0uz2Jwnn25/rZRYpBC
   JP8BPo+GMpN/S3xTp/gvI2AIIbPT+mLuH9Chk4ivnZEnjGAH9BlsNfbzg
   Q==;
X-CSE-ConnectionGUID: fK5DUospRh2ud9ZQCb7Jqg==
X-CSE-MsgGUID: EcTU5Q6+SAuvvItC74NckA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2581838"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2581838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:17:30 -0800
X-CSE-ConnectionGUID: Rxvb3wLmSOG0vhLFwBfs6w==
X-CSE-MsgGUID: 8Y0TXO4HQMK37aEtQHrHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6761390"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:17:28 -0800
Date: Wed, 4 Nov 2026 14:17:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] gpiolib: use bitmap_zalloc() for fastpath bitmaps
Message-ID: <ausiVeLL7DxwJp2x@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:35PM -0800, Dmitry Torokhov wrote:
> Currently, struct gpio_array embeds invert_mask[] as a flexible array
> member, and gpio_descs_alloc() allocates the descriptor array,
> struct gpio_array, and all three fastpath bitmaps in a single kzalloc()
> call using manual BITS_TO_LONGS() calculations and pointer arithmetic.
> This exposes gpiolib to the underlying unsigned long representation
> used by bitmaps rather than respecting the bitmap abstraction.
> 
> Convert invert_mask in struct gpio_array to a pointer and allocate each
> of the three fastpath bitmaps individually via bitmap_zalloc(), freeing
> them via bitmap_free() on fastpath cancellation and array disposal.
> 
> Although this adds three slab allocations when the fastpath is active,
> packing all three masks into a single bitmap_zalloc() call would still
> require rounding the bit count up to BITS_PER_LONG and slicing the
> buffer with unsigned long pointer arithmetic, adding a second
> allocation and extra free paths without achieving bitmap API
> abstraction.

Yes, thanks!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


