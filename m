Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804990;
	b=2uicbWUJlvr7CLG6r9GEn8BGwG6ULtcBfpEcL23bO6uibBeuop/f5QJCxgn42iJ7cE4h
	 dOGZ7O4lEoFHfsJAuZEBHQRgF88EeApQI4jhWPFxfztoN2FAu/Koa0+qjw1WMp0FK8O4p
	 +eHDuIKYM4GIc91+6KmQXtf/KHsbsJUXmBsLg+DaotvX1Pv6MomSjptBCY0qB/4RLzEE7
	 +ZTMJyTFcsa2s5fsQx5jRMKYOs2JrKG4ffKhxD6C0t5BgbigON9TESL1cQpAjBScnb65m
	 kFjhYSLpkSLyfKWKP3uerTBuWNjX5WUDthhOj2Js2lKMt/cS+Nv8GWrPti1NzWb6niA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804990;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=pwVHUGMid9ou+CBB/ce0NpTHGfZTB2UzJfD/sAb6ZPY=;
	b=HbZPV/bN7EVV5O9Bt/X4eBhCUkoNnabvg1IzH0i0urjLvmrBzo3LkuzP1RL6OPZcV/+L
	 NDumNiW6fRrJzn7nqmBcRyPVc3qInrSvbmeufBbN12isYLWIQ3L2VxpM3sZLaGKmpchFR
	 xgpDLEemZ9q3VWoSuhfEA4M+IefMKeKN1MMzkWoRJOS2JqcNwd9sdiG99F7HBgiJtQvmo
	 FclP7BIECAYhOF9rV36oPm2E5Sx5kcQzkMJwUUPsRPA3K658lfyP5jlSARQtEZyLYCW1m
	 6SoVukuo7RUp0KACg+JO4eVGs3G03C8MwuddSUPpUbDq8n3W7tkwFrdVtzrybViscjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zad7hYup;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A2A606A6AC
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 18:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A2A606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zad7hYup
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804990; x=1827340990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JdcchG4oY2oqppCohhkP//FgydJQJkHqV1x6LPU2b10=;
  b=Zad7hYupIZSGM9JJFDZMXS6vZ3okD1ndehsNHVjjHTDAq3fJ0nAMY/Gv
   +cFZJdjeM20QPjGyVvvwy3x2vT2ytEpNkqmgcC3bG3OiaUlmjASiaKKTX
   03MrzB9XPStW3o/KwO1ZYdEzx5M+8/9ac5azUgaCEvw1SUmrQJX00qV13
   wCbpzSZKgJuJ4RKVq8amFDRDxq0eWRRzJ1uaRE1HHCLF/d4+pj29qzExp
   gX/Z06DOeKMac0HKrlK37VbqJv6e0VZoPNgIE9P/BEtuSJn4518a/mWXr
   WeOzmfYJKD3FIsU1UOdYZtD2wIyz/7OlQsuco8u74oC+1kWMEq8oRSi0r
   Q==;
X-CSE-ConnectionGUID: 3XxTX+bLSpGBd0tvoJFZCw==
X-CSE-MsgGUID: TJ1is7pnQe+1+sYScjpEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4686359"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4686359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:43:09 -0800
X-CSE-ConnectionGUID: xd1xCNBzTS+w+tP2XHprqA==
X-CSE-MsgGUID: dSCQqBX9RemNNvIyTdDyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12738462"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:43:06 -0800
Date: Fri, 27 Nov 2026 20:43:03 +0200
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
Subject: Re: [RFT PATCH v2 06/14] gpio: regmap: add helpers to add a
 regmap-irq chip
Message-ID: <awnPN6vGwnAcRgjt@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-7-mwalle@kernel.org>
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
In-Reply-To: <20261127145232.814492-7-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 03:52:23PM +0100, Michael Walle wrote:
> The most common use-case is to use regmap-irq together with gpio-regmap.
> To make life easier for that and to avoid code duplication, add helpers
> to create and attach a regmap-irq domain. These helpers are intended to
> be called by the new .create_irq_domain() callback.
> 
> gpio_regmap_add_irq_chip() locks the GPIO line while its interrupt is
> requested. This assumes that the hwirq numbers match the GPIO offsets.
> If a driver doesn't follow that, there is one without the locking called
> gpio_regmap_add_irq_chip_nolock().

Hmm... Can't we simply have a boolean flag instead in GPIO regmap configuration
and just distinguish it inside the common helper?

...

> +/**
> + * gpio_regmap_add_irq_chip_nolock() - Add a regmap-irq chip without line locking
> + * @gpio: gpio_regmap device
> + * @irq: the parent interrupt
> + * @irq_flags: the IRQF_ flags to use for @irq
> + * @chip: the regmap-irq chip description
> + *
> + * Same as gpio_regmap_add_irq_chip() but doesn't lock the GPIO lines.
> + * Can be used if the hwirq numbers of the regmap-irq chip don't match
> + * the GPIO offsets.
> + *
> + * Return: irq_domain or an ERR_PTR() error value.

Okay, this might justify returning error pointer, but irq_domain_create_*()
shadows that with NULL, which questions the usefulness of it (the error code).
I'm fine with either approach but still tend towards using
irq_domain_create_*() helpers instead their open coded variants.

On the other hand there is no much win, especially if you replace

	info = {};

	info.XXX = ...;

	... = irq_domain_instantiate(&info);

with direct assignment as it's done inside irq_domain_create_*(),

> + */

-- 
With Best Regards,
Andy Shevchenko


