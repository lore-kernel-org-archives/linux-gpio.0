Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156D3BB112;
	Fri,  3 Jul 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078170; cv=none; b=D3E9OtmXMqZKxAdagHUYJIueLuFpTb78vSl7jRSw+X6t6YnOLXRdyCHgH1A6HKjA2s38eGEL0QYUOxfkBKXCBBlah2UIYTJZ1EttQE29Z0KO7GSnOsMXyh9SG1huUfl6fEZ5cIMZyS8QRJG4kI/ajOmJEk7eHAQ7dVmi1Ou+KjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078170; c=relaxed/simple;
	bh=ZPWKhACqHwRDTfkRF83NbNt989qOfNioimYHeftlKxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMj1uC0JgpPYVJJsCIFyZxcm2R7EROewY8lSw4NAtwEMM7vlkmV9XNpnIbJDnevtBmVXiO4jAbKB5YmsyvIJPIPWnz97G5ESCgj7yHq0aK+67FcRL58qYKs707r372yNGWGCsalTO24e7EPrDX2G4f9CCV3X/fPwjDSb/F7tQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6iDDVzg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6iDDVzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783078169; x=1814614169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZPWKhACqHwRDTfkRF83NbNt989qOfNioimYHeftlKxU=;
  b=c6iDDVzgltblE1brUU1nP6vVwG0zo9Rb1Ew2/oN3xNfZQPylSArL2sLf
   vOJc4YTqpvWnKurrLCVHYkXa+tQaC9R7RCpv4NQ0pahpQIJVTdS3CKz29
   7XunDXTonztgQ7D2Gwcj9zF16vCE+1LGyBIMkA1Rto5O9sZYN/bH7I3bl
   MpZoqi22a6Ru9QyeK2mRgrDkBJFhh/HUOC4UFdiYs/G0IidsXen9UUygM
   71x53cTzP79eKcOwHo/1qwfUA9zhVqa8HGbkeJPSvbomx1ttKpIy3oLR3
   W4Itk1g6dRLjlWwsEIX5ARKW7XqKwEW+12kkarV8tsFvSm9bV57VamiDw
   A==;
X-CSE-ConnectionGUID: rUf1PFFxQ5GUNMrdkBFC4A==
X-CSE-MsgGUID: CpRjTFVQRl+USlJYNH71RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94190892"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94190892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:29:24 -0700
X-CSE-ConnectionGUID: VQKoxUxRQlmHSt/2y2g4uQ==
X-CSE-MsgGUID: ANWYQ0K6QqakoGeIx8zbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276302079"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:29:21 -0700
Date: Fri, 3 Jul 2026 14:29:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: Re: [PATCH v1 2/4] gpio: regmap: Provide default IRQ resource
 request and release callbacks
Message-ID: <akedD7YWp6anS_T4@ashevche-desk.local>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
 <20260702130903.1790633-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702130903.1790633-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 02, 2026 at 02:42:55PM +0200, Andy Shevchenko wrote:
> When GPIO regmap based driver supplies its own IRQ domain, it might
> still want to keep track of the IRQ requests and releases, in particular
> to prevent a GPIO, which is used and locked as IRQ, to be requested
> via standard ways. Provide default callbacks for such cases and keep
> struct gpio_chip private to GPIO regmap implementation.

...

> +static int gpio_regmap_irq_reqres(void *irq_drv_data, irq_hw_number_t hwirq)
> +{
> +	return gpio_regmap_reqres_irq(irq_drv_data, hwirq);
> +}
> +
> +static void gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_number_t hwirq)
> +{
> +	gpio_regmap_relres_irq(irq_drv_data, hwirq);
> +}

These two functions has to be part of the patch 3. I forgot to update this when
split a PoC to a series.


-- 
With Best Regards,
Andy Shevchenko


