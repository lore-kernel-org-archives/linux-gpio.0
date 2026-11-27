Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804517;
	b=UpqKbuiAQEHr+mUGMQf+HpVoqZkqMOS9I45WeAJTuKtchqkvnrLKfsQQhQuVGdeHE1ed
	 rd2H909a4TYr5FXToRHV2thH2jpfHz+o7kCaPXvwdZq0GMSn1xEHltWh11SoYiOCQB2jw
	 zjPcm4jnEGSrKZdCz+45BXIwY0iE4I85pWxODmg+QRQvADZ+WQuNgieHzqcPi7HJgPthI
	 tQ2lgOM+HEsqNn9PSrGiikGF+lY/ZJTyOgwwTS/6MeWH+5M6Fd10qbPLCd6izLoSBS1gj
	 x/Fmy3Q6Mg6bj/KZ3ATF0yF5Le8AZ9cFTMIoFcdDXGZRkrDfLDEIWSc+oCwTRAYQjjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804517;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=HVSdNDHhs3+VVMRBOX5sTBdHdsKEZdANEr9dYpz6y2w=;
	b=srkvzTlgXdK80TywhfqOY8rId3bIkEJW453Ajg6/f8cAbF6tHDWPLu0w7TiRE0TvcI8j
	 E1OZ01e9ss8rINpTpY5lwseOYxim+5YzFUwf5ATdB1YGzAj0bJnWpwg/f9zyFra2d/y6d
	 oUPEVqiICrCT3O9JuBtktIroGq0a0zsyknrxq9uzXGWqRfvF+C4FlBzW5KnfHC5QYKjyZ
	 nsj1pOdKLg10q30LWF6sJ7/MjMrWjiSsr9ZpFWD3fzukMP1jECbKBbqtfnh0rwMB0u48L
	 MkQAcrSuXzjKXfJ/WVMALRnWYMDiKxx/UenVuCQ958nHqqr2y2trZ0THZwuOJG0dszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHV5GQjw;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28545606A324
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 18:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28545606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHV5GQjw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804518; x=1827340518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9hxSYaLDqREhHtyIiX5w2U7PfdJEL4Rgw0iZrmjrjU=;
  b=AHV5GQjwTlwQNpfs10bRlWIFGww16H9Z3scfqsvPJFqn3KZQ+P7iX9iG
   UlvYFLxG+f25FPoO7UULxQLwhytUVesIuon00hZ1Q6fFlJI+OdDqV6xa0
   FLx6bkieV/je4W07Y0pEwI1EoGnDJb3CckYUL4AufDQDlXQzOUMeiI74s
   Beof0ts3oqvYVeo23aEuHTAaUg9ukNyG2/wN8eSsef/J02LXtiydslWFD
   rn3cp/5YBQRRhIaFqEjrpaDcdH3feXv5/aaB/e11dU1vI4N5J2BUkxpkq
   lvd5mIk9hsG1pgjLiVaANbCHuz7N291iX8piP7XXUeMD6oW+sFbTcx6OZ
   A==;
X-CSE-ConnectionGUID: ozjAuA8xQqmDhseCg4dzwA==
X-CSE-MsgGUID: wRTyKLv3Rz6zVP7qgGwNVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4573152"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4573152"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:35:17 -0800
X-CSE-ConnectionGUID: sxVnqLTsSQGTUu4SoTOkWQ==
X-CSE-MsgGUID: UP6LO7fkQHSpadBncEiqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12233288"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:35:12 -0800
Date: Fri, 27 Nov 2026 20:35:10 +0200
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
Subject: Re: [RFT PATCH v2 05/14] gpio: axiado-sgpio: create the IRQ domain
 from the gpio-regmap callback
Message-ID: <awnNXqahhZuubszR@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-6-mwalle@kernel.org>
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
In-Reply-To: <20261127145232.814492-6-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 03:52:22PM +0100, Michael Walle wrote:
> Use the new .create_irq_domain() to actually create the domain. This
> way, there is no window where a NULL pointer could be dereferenced in
> the irq callbacks.
> 
> Switch the irq host_data to the gpio_regmap pointer because it will
> already be needed in the irq domain callbacks. Otherwise, the
> .create_irq_domain() callback would have to set the sgpio->gpio pointer
> which looks odd.
> 
> Don't use device managed resources anymore. Instead use the new
> .remove_irq_domain() callback. The driver didn't dispose any of the IRQ
> mappings before, although irq_domain_remove() mandates that. Thus add
> that to this callback, too.

...

> +static struct irq_domain *axiado_sgpio_create_irq_domain(struct gpio_regmap *gpio)
> +{
> +	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(gpio);
> +	struct device *dev = regmap_get_device(sgpio->regmap);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	unsigned int ngpio = sgpio->nsignals * 2;
> +	struct irq_domain_info d_info = { };
> +
> +	d_info.fwnode = dev_fwnode(&pdev->dev);
> +	d_info.size = ngpio;
> +	d_info.hwirq_max = ngpio;
> +	d_info.ops = &axiado_sgpio_domain_ops;
> +	d_info.host_data = gpio;
> +
> +	sgpio->domain = irq_domain_instantiate(&d_info);

Same comment here, because it was no devm_*() helper for linear IRQ mappings.
Not sure if we need to consider error pointer after all in each of the
callbacks. We can just check NULL versus not-NULL inside gpio-regmap core.

> +	return sgpio->domain;
> +}

-- 
With Best Regards,
Andy Shevchenko


