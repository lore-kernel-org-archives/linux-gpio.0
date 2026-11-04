Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794412;
	b=H0FgEga5WW7ATl0VLKQoL6XND81k6iHyLGnx1RQooBS5Eoyt3IBUXC9GWrZP78ubLpUw
	 TGvDZ1b/iHbtdllYOOU3VPHjacIAzBV62SzO2VY+CnREHeUgJUD835lsHS1aIo8es3buG
	 vkteENQkulcrzKFPbV6msMzlom0GiRg2tOZ9Zdyicnr2J+Qo+q/GQD+xMVwI2KkwpbOOp
	 7GvjovAt5T+Grh5Igro/dpbKj1+MhEythGSnjTLHspev8lzJg5L7uTWtpLpZnXStiLa/L
	 lM1Dco3CZdbp1rIk2VJ7ChCl51/Xoh1BXNhsLUBgPUSZC7LaebmT1ReN3L652JcYc2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794412;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=AeYVJX5tfRvbp/AEWfYF8xWqbqGtS5WJ9Eh8ZKqwqd0=;
	b=cnjtf5pPid9JjX9riPr2/rTU0tNv27RnpDvJHLyXOM+IHoRIf1DrhLngGrxw2n/yCLxr
	 Eb6YK8pZd/asq7GDQnJd/NByi+LWasynWbak62Jr/1XPEQ5kJ1zO/gstAw2Sp3V+dmAwl
	 Osr3UgUegYqdN80LQfIaMOmD2CuKnKdRag/YTDxasigCcSR770b3m3JmguBZUcq58dZg8
	 OE+fibBetnnWISsGhp0a8tUR/Yo1akrwnU5gvc8SSNdKHEKF1RTVW1MLS3h27u8EebH54
	 lAjJGs7tnjVVnxi6WBMDoCHfij+ymTEU0ycJcOSjcqxY8n5T+TzIGUrxvUdCk8n4hSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WdBVSscq;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2428606A32F;
	Wed,  4 Nov 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2428606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WdBVSscq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794411; x=1825330411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tZgGqzxXFoY4JHMgg+OYm9ErqS2m/vCzocnAsDoa9qk=;
  b=WdBVSscqdU4t/e1ASFJI+GPn21UiCZ+rpILIAb3Vgwthmmq9LafbrApt
   qufFLhzYOYnI18nf6ctywQluEyzY6jgAKKEMuTBwomCrIrWfRRr4QqTey
   tZ9qIQtENM/DB/iSia37Mep3Bpp/ptBruAkcLbiGkvqVrwN9eYtHNYM7k
   IAM6a8/EK5FeRL0GA9Yq6Fkhv6vQH62rb+8BOE+wXWbT9gQuapzJIjD0T
   QKfNiWGCH0N/39tmcGGIzrKgrA2ARRVCzzZ4XKjQlDY+yksx5B/1oW0mC
   E5bh7BrMnS5E2HIQCtIzRIAoQx4tBpD4FKkdP2zwb6zIzL5kmxh+evO4H
   Q==;
X-CSE-ConnectionGUID: GOgR/uDvSFqYoTCIbZHUAw==
X-CSE-MsgGUID: mlMFhM15T3OAGsN7Kqcv8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2446236"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2446236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:13:31 -0800
X-CSE-ConnectionGUID: yxxE5fcIS3WsDXJ4z6xMBA==
X-CSE-MsgGUID: LqVR650HTza9C5X9xYmt4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6588985"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:13:29 -0800
Date: Wed, 4 Nov 2026 14:13:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] gpiolib: use __free(gpiod_put_array) in
 gpiod_get_array()
Message-ID: <aushZraJyTywcwh4@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-5-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-5-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:33PM -0800, Dmitry Torokhov wrote:
> Switch to using __free(gpiod_put_array) scope-based cleanup facility
> in gpiod_get_array(), simplifying error unwinding and eliminating manual
> gpiod_put_array() calls.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> -	descs_size = struct_size(descs, desc, count);
> -	descs = kzalloc(descs_size, GFP_KERNEL);
> +	struct gpio_descs *descs __free(gpiod_put_array) =
> +		kzalloc_flex(*descs, desc, count);

I believe in this case one line is also allowed.

	struct gpio_descs *descs __free(gpiod_put_array) = kzalloc_flex(*descs, desc, count);

>  	if (!descs)
>  		return ERR_PTR(-ENOMEM);

...

>  		if (i == 0 && gpiod_hwgpio(desc) == 0) {
>  			struct gpio_descs *array;
> +			size_t descs_size = struct_size(descs, desc, count);

Reversed xmas tree order?

-- 
With Best Regards,
Andy Shevchenko


