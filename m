Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583799;
	b=BO55aWP2L24WkE/ww5gPSoIw0Xp2JA9kvNr5cQI+qZ7SGFB0Sjj3fYBJECRRagKacV26
	 xJDjPrwbQ2el871YiHD3OV3gZLdGvxVVoCIyfREB6Rf3KRve+fKD3j7ZWBL79I7yZWTS+
	 fYdacyKrbHLqD/s2eVzA/xYYd1zis6/F8R2khkRVgfbHZnFKJ6IOTyOcZkfaxSInqTjdY
	 xDnc1ZVyVOUL0aD5drYEgMSCyox9FD/UzVhY4nJkCKcOrW5sgPVBOsz3XHTUbXfq0DENy
	 ESiOCE5ndFsdYqWXm8A2mELxAwzWpjmrkC7ErkTuLTsgATnD3SBFxYcuterujqlk2Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583799;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=y10UPbdNlDVF95qsQ4tRtVklD4BMc2Opox3gPoickLs=;
	b=T8bYGK3MHVYqTXDAF4bUwcZb44Oy7Hh3ZHyPyEwwt1ogKEEKwa2PGif9/GGDqCfxSNZN
	 SMj4Erzus7e/0eOs+BnqRQUyrPfx214kNXgNH1qKmqLH7VbK9UkEvmnHvKn/QPiRS99LR
	 4MgDJaR0/D9kBcoDUj9nDZ7oDLTd4PYh4vXgCscr9DHrnKJSpFVpL/jIlaEfmV77aYSrN
	 ch6zcPMITQ5Z6s6s6yYz22CCxSbx4VaC3RgbNIIWHCkK3/mhfuXawwF/OMhzekJKvYJ1M
	 rDaDD4NL49MniTlBw/rpDdIIulu7g8F3a6NzVn+P5WAS6Q0HfoNZoFstb7LqRJcHtQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LyXQkSWL;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6650B606A323;
	Fri, 13 Nov 2026 15:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6650B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LyXQkSWL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794583799; x=1826119799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4UoFfOdNoHzDW5dONAdVBVFBQ21o+FDPZlZ39D+M/k0=;
  b=LyXQkSWLkXSpZmjkqAGwTkch8UEk6OnCL9xTw7EnK0SvwLKvGPukBYsT
   JkfXthmXYkQ9KHGchoAbkZZNJWG31KHnvcpPc6c8+CR60omYCGtk53pVi
   +1uLNyhcO7zRmag2A9gh0g4dyqXOY7T1GyK23YDRqamBYGyo9KBX1HpOf
   wceVV39ut3KhGMpQDrJ7y72aXcNkJq504dWaFUGFqCzuj7FoKhEyT/LSO
   NSnJBMw3SGYtFe8jax9vdiGLclO/a8MIJIjbQ6f6gEXkXMQ4QlXCiC2mA
   csYFyahvxTBJZw55tggvV1OSlhmg8MZ53gQBgswTP2OjTos+ixNudU8Pv
   A==;
X-CSE-ConnectionGUID: GZJCfuq2RoWPoBYRSwSChQ==
X-CSE-MsgGUID: MlpmzjcIRaqGZG8Ez3NuXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3401913"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3401913"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:29:58 -0800
X-CSE-ConnectionGUID: 1OPjOIRmSl2FQ9IImJjirQ==
X-CSE-MsgGUID: KjPwKkavTLOuksIYEloHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8767460"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:29:56 -0800
Date: Fri, 13 Nov 2026 17:29:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, catalin.marinas@arm.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] gpiolib: fix leaked descriptor labels in
 gpiodev_release()
Message-ID: <avcs8emo3oWpYGBG@ashevche-desk.local>
References: <20261113-gpio-label-leak-v1-1-c6c00f8ebfff@debian.org>
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
In-Reply-To: <20261113-gpio-label-leak-v1-1-c6c00f8ebfff@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 06:38:28AM -0800, Breno Leitao wrote:
> We are seeing kmemleak report a leaked descriptor label on linux-next.
> 
>   unreferenced object 0xffff0005d420f280 (size 32):
>     comm "gpio-cdev-uaf", pid 21987, jiffies 4297166145
>     backtrace (crc 7ff222d9):

>       kmemleak_alloc+0x40/0xd0
>       __kmalloc_noprof+0x300/0x670

Unneeded in the report

>       desc_set_label+0x50/0x190
>       gpiod_request_commit+0x1e8/0x358
>       gpiod_request+0x88/0x290
>       gpio_ioctl+0x7e4/0x1b48

>       __arm64_sys_ioctl+0xc10/0x1360

Ditto.

As documented in Submitting Patches, leave only significant lines in
the backtrace.

> The test requests a line, removes the gpio-sim chip under it, and only
> then closes the request. By that time gpiochip_remove() has cleared
> gdev->chip, so gpiod_free_commit() skips desc_set_label(desc, NULL), and
> gpiodev_release() frees the descriptor array without the labels still
> attached to it.
> 
> Free those labels in gpiodev_release(). No reader can reach the
> descriptors once the device is released, so they can be freed directly
> rather than through call_srcu(). gdev->descs is NULL there when
> gpiochip_add_data_with_key() failed to allocate it.

Hmm... There are so many patches are flying in this area. Can you for the
starter elaborate which Linux Next tag you are using?

...

> +	unsigned int i;

It's okay do define it inside the for-loop.

...

> +	/* Lines released after the chip was removed still hold their label. */
> +	for (i = 0; gdev->descs && i < gdev->ngpio; i++)
> +		kfree(rcu_access_pointer(gdev->descs[i].label));

Sounds to me like something that Bart addressed very recently.

-- 
With Best Regards,
Andy Shevchenko


