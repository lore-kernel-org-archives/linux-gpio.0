Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804265;
	b=RGiQwCrgyQeYL7M5KOj5TK/GBAWsJqrulhNCbjCswjDkwiY5KcmDuWY345Ysz2Kw5Wal
	 v3f8PRuQSc7ucp2A5d/kRpws0rn6ruBA5hWbuZ57ri+tojSfdZptFsLYGfmCkL3aJTThD
	 Agrcyn6wpk7c2PkLF1e1sM/IG7ixB3xnrPD+YMfPbgR/89YasxagdUOZWjP28ZZvoEdcH
	 XskwcxRkGCUBEea4a9LQjoNumG1i+qGo2b+gBxVRSu0hlrj4UZR0fKr3jxa2u5P/FdNAs
	 Fvm8rHaioEaYC31JYYCMo8g+6gzxscRNGAWxTQZB4yBlsY16UwIZ8uZMWMCY5sMBDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804265;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=yU2nYKrDNlFNsbHHIkXsJcnjvDyggWyC1jVuTdrtc4g=;
	b=HzlB/Kn8+r1oZnIUXDU6Mt2zU1WOxRl2aTT8KqIyH/3atD6rxBjtzVsQ1S+zr/VzNJve
	 tQeNXUWgiZydNA7yRMf8bmRVJbGBvsYDmlKcN1FmATsoUbUc4D9DtR7UzFSp7SbEQSFGc
	 5HAgiaCQGvzJ9jAEfIaVVxN8UQ9c/SZPjA/RsmcaCP0oRg6M6J2wV7QZODw3g5iVlllcw
	 RxHaiyWiARKzJmCyvDtSQYtO74kOTSxrktmwhgXUPEytITJYyKMAKxuIEzUhjRADAUDVw
	 HzwK1HXGvUZMsAboZzko/KTC+mrdeCWoMHn/j2LekbjHTc3iIXvIU42qkQIjkf/C8mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W6+/O2LX";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89606606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 18:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89606606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W6+/O2LX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804265; x=1827340265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TBFJ66+LtWaiW+TPpfa+OeTpRDo6xWfqGRmmzWRu4C8=;
  b=W6+/O2LXuu+zi7vSqnYbhw9Fwsslv7vU8l6f+hjwJsBScLeO8g3EE7hu
   DdW+nuZQSIWK2D39MOMDbjh8RWG82br923QTvNeiFOamqLaI+V5864zyO
   bBenNT0hsHzEJ99YQLRHQ+hA/ADYXPj0y7aEuQpotiWZiQmatW5r26KId
   8cvPq4IKjE+sqZ/3dD7l5qSi6Z4Y2QQnQZZBbleDZhSJER0GFOoPb1T/w
   TxHFORCifUAzGn/6g0OScwebRHXvDZ568Fgxd+8zWwGk4QaVPNeXf9QNa
   FFmXMDMg9/MNpOHY6HEJADvDIoNpIn6rOPLRgkViEbpGQZNP4gbJek/lx
   w==;
X-CSE-ConnectionGUID: SM4lqmwtSIuXMn17Jhru5A==
X-CSE-MsgGUID: 685TL8d7TDyn+0B0qRgBmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4603982"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4603982"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:31:04 -0800
X-CSE-ConnectionGUID: IGB1DSF6TyORstOwI95YdQ==
X-CSE-MsgGUID: QZTLcboxQsenkF3792mAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14211216"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:31:00 -0800
Date: Fri, 27 Nov 2026 20:30:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH v2 04/14] gpio: rtd1625: create the IRQ domain from
 the gpio-regmap callback
Message-ID: <awnMYpXTtH7scMet@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-5-mwalle@kernel.org>
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
In-Reply-To: <20261127145232.814492-5-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 03:52:21PM +0100, Michael Walle wrote:
> Use the new .create_irq_domain() to actually create the domain. This
> way, there is no window where a NULL pointer could be dereferenced.
> 
> Switch the irq host_data to the gpio_regmap pointer because it will
> already be needed in the irq domain callbacks. Otherwise the
> .create_irq_domain() callback would have to set the data->gpio_reg
> pointer which looks odd.
> 
> Split the interrupt handling into two steps: first fill in the
> interrupts and in the callback attach the handler.
> 
> Don't use device managed resources anymore. Instead use the new
> .remove_irq_domain() callback. The driver didn't dispose any of the IRQ
> mappings before, although irq_domain_remove() mandates that. Thus add
> that to this callback, too.

...

> +static struct irq_domain *rtd1625_gpio_create_irq_domain(struct gpio_regmap *gpio_reg)
> +{
> +	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
> +	struct device *dev = regmap_get_device(data->regmap);
> +	struct irq_domain_info d_info = {};
> +
> +	d_info.fwnode = dev_fwnode(dev);
> +	d_info.size = data->info->num_gpios;
> +	d_info.hwirq_max = data->info->num_gpios;
> +	d_info.ops = &rtd1625_gpio_irq_domain_ops;
> +	d_info.host_data = gpio_reg;
> +
> +	data->domain = irq_domain_instantiate(&d_info);
> +	if (IS_ERR(data->domain))
> +		return data->domain;

This is open coded irq_domain_create_linear(). The only difference is that we
propagate the underneath error code instead of decoding NULL as ENOMEM or
EINVAL or something like that. If this is the case, add a comment explaining
why, otherwise somebody will change that in the future w/o much thinking.

Note, it was open coded since there is no devm_*() helper for that.

> +	for (unsigned int i = 0; i < RTD1625_MAX_IRQS; i++) {
> +		if (data->irqs[i])
> +			irq_set_chained_handler_and_data(data->irqs[i],
> +							 rtd1625_gpio_irq_handle,
> +							 data);
> +	}
> +
> +	return data->domain;
> +}

...

> +static void rtd1625_gpio_remove_irq_domain(struct gpio_regmap *gpio_reg)
> +{
> +	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
> +
> +	for (unsigned int i = 0; i < RTD1625_MAX_IRQS; i++) {

> +		if (data->irqs[i])

Do you need this? It seems to me that irq_to_desc() returns NULL
and scoped_irqdesc_get_and_buslock() does nothing. Yes, I know
it's a tricky code.

> +			irq_set_chained_handler_and_data(data->irqs[i], NULL, NULL);
> +	}
> +
> +	for (irq_hw_number_t hwirq = 0; hwirq < data->info->num_gpios; hwirq++)
> +		irq_dispose_mapping(irq_find_mapping(data->domain, hwirq));
> +
> +	irq_domain_remove(data->domain);
> +}

-- 
With Best Regards,
Andy Shevchenko


