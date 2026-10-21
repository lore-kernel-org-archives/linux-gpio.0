Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611545;
	b=ve4eBKyplIXmZiHUJhgXlifKxuMW3HS9EVmok9pmTrkjgYMM+EErugq5jg6OngR93F1K
	 MdLJ2Ql8VizPIsTbHKjLFbRz49UIs19WikrBEd9Ft1Bw/tPIadvi+h9T9O0pEgXkac6l0
	 wBrGDofAHblic2EeCgm7yEzbiNSeUWb9biUmGuVA+ob/P/VaWlEQmHqJS50yWSlAqZ6we
	 EPp1tHj1szRFrj/y6hSH0wtPrRChUbHVJbgDm9+Tw22MkE6VDgralnAyUfifcaS7tDX6m
	 IA6XukOMLwIy0CS+3qhgW576CKz/cMYOYlMi+y9idvcVd6utBNAoyUeXNyKPBc7Ul8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611545;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=EAudJtfIl2mHFM3jFtcJt/aQq4b9shbjJE2uG6/SfJI=;
	b=15iyLikkZHJbHRPpWUQtrZukiCmZMsrM1PaUXagDYpaUThszjzuindnfYJehTqQdf3jg
	 7q/z6KddE/HY+J9NFF6+ODqVA47rQy5GARfgs4m3K9AwiL3cuCGjTeJsCE5can9ihNn8w
	 LvyzBKw3XC1+/aaSo72sKkkDK1wsZ6bAXpQEymLiSMRRrlzaeTI594Umb/SwZdAh5BM3m
	 hYLL7QlOPyN7gJHjQ9nSBumUTMelXVaLO+itItXyvaTynnLzRr578AfXVhvEMXGu5HDe6
	 F7eTkxvRCKoDwWahJH3+lwmAiDMGdU5HwllEqypa1NIP1/2km7okxMXZbj5S9TN+FvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKhWRu3A;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34A3606A31A;
	Wed, 21 Oct 2026 19:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKhWRu3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611545; x=1824147545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WdvXq+M4q0WutpSz5CeVBuDiF9vCDXwxpaim1fX+7aI=;
  b=cKhWRu3APmvnRXP2snIIIyV2hnAOQCfJNy8mbSUnbl9R8Q6KD9ji624f
   X+rbpEe4t/AvOShLIc5X/LZSV7pT/yzmPuslomrlI/VRqdWv60nlA4qnN
   h5m97TvA/9l4RdlGg4oce7glCZbNoQSlgT2B5E7Acb9QnsJNaP5VQMhyq
   TIDzz9bjSn5/S/Z2S1nnWzNqNoaKE3IQQ1sVj0pc2l4wXt1jsA/eoRAiv
   uVileq2PK/WIs8qGDwNwyPtR41Mhk2YnuOaV1SGVKYmB6SWRkPWBPUuBT
   QBKDOIguEf9TPeAAjWYawIw/2Hynx7Bq2vUZiehqnar9tJd+huJcLbvkb
   g==;
X-CSE-ConnectionGUID: awBlGOObQbK7hdde9Ed7fQ==
X-CSE-MsgGUID: EyjbDwMqRHmh3/UiJpiUYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1228968"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1228968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:39:04 -0700
X-CSE-ConnectionGUID: 7PucqCaBRwSC4CF/lB3Z8w==
X-CSE-MsgGUID: lmCgCVdpTgyhczMJGAwPpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3089203"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:39:03 -0700
Date: Wed, 21 Oct 2026 22:39:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atkU1BKblQsuCPSn@ashevche-desk.local>
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

> +static void gpio_descs_check_fastpath(struct gpio_descs *descs,
> +				      struct gpio_desc *desc)
> +{
> +	struct gpio_array *array_info = descs->info;

Split the assignment. It's robust for long-term maintenance to have assignment
coupled with a validation check.

> +	unsigned int idx = descs->ndescs;
> +	unsigned long dflags;


	array_info = desc->info;

> +	if (!array_info)
> +		return;
> +
> +	/* Unmark array members which don't belong to the 'fast' chip */
> +	if (array_info->gdev != gpiod_to_gpio_device(desc)) {
> +		__clear_bit(idx, array_info->get_mask);
> +		__clear_bit(idx, array_info->set_mask);
> +		return;
> +	}
> +
> +	/*
> +	 * Detect array members which belong to the 'fast' chip
> +	 * but their pins are not in hardware order.
> +	 */
> +	if (gpiod_hwgpio(desc) != idx) {
> +		/*
> +		 * Don't use fast path if all array members processed so
> +		 * far belong to the same chip as this one but its pin
> +		 * hardware number is different from its array index.
> +		 */
> +		if (bitmap_full(array_info->get_mask, idx)) {
> +			descs->info = NULL;
> +		} else {
> +			__clear_bit(idx, array_info->get_mask);
> +			__clear_bit(idx, array_info->set_mask);
> +		}
> +		return;
> +	}
> +
> +	dflags = READ_ONCE(desc->flags);
> +	/* Exclude open drain or open source from fast output */
> +	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
> +	    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
> +		__clear_bit(idx, array_info->set_mask);
> +
> +	/* Identify 'fast' pins which require invertion */
> +	if (gpiod_is_active_low(desc))
> +		__set_bit(idx, array_info->invert_mask);
> +}

-- 
With Best Regards,
Andy Shevchenko


