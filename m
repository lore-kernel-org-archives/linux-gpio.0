Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73E4D8D8D;
	Thu,  3 Sep 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448896; cv=none; b=GvdieSEyM/DCTVk0QqbRsA8wMuOm43PUs6L+F4PEPZpysBzS7PsDb7hf07joEbpaD0xsnKgSYyLU3eiD+U1SMp9NacG/YZXVrAKu1bnsIT1wm3uTv9BNiEGPIjmD1gA73vS5weJD2fpy+jiEYLUs/4y4Q6qNkdmfwxKkabhaP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448896; c=relaxed/simple;
	bh=GXDerPr6UnkixmbFsRMthKYPsEuiAfmG0+pnH0dyivY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTO5PH6X2FQq0JFnHbABKe9YHInoOCGTnjQ2ocmfK9fzQyp06xgByABZl3Qxl7pP/1gAQDgZBVhCiYIUzcXFfkzkxMtRZyEuK3f1eShs6HMapXnTq1pZID4D6uH8vuXwDP2R8d/dYkt5Q2ulSe5M499w/VbawrcA/ppIyCKOh5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpE9m164; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpE9m164"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788448894; x=1819984894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GXDerPr6UnkixmbFsRMthKYPsEuiAfmG0+pnH0dyivY=;
  b=MpE9m164ry1tHC8fT3kfzPLishxLjSnsllVRzxoYnxmyOI7hhW0DDTEb
   EZPrS3h5FeYvBl5VVp1PV6jnx7WUXCra4OGY5RRhAeetSCezeSPWYEJXp
   3MzX6LYgI4U6zDESz/K0j7xwcLBlTjuzKgrJQXJH4ZL7RVh2woTQ6j7j9
   qjY97dcZyyHXsRwv/m2D00pd5hgpxoVFgWRiyeIQ9we6Sv2wLbxdFEetE
   oBqfuvCbxlFilktB67gy3vBKGGTJFfpnuBnevZZ943l8CxJsS2TmwMnxX
   apvad8KKdb7adUNS7Tt5VSPMnLZzQm7AYZ1w6UvjDOdcse91eaaHldMo0
   A==;
X-CSE-ConnectionGUID: Wwpt98dMSZG5KuraEiLeHw==
X-CSE-MsgGUID: TgzilUEySZSwOrxpTvMSag==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88968014"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88968014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:21:33 -0700
X-CSE-ConnectionGUID: Iq5tJMM7S4yir9yeIZMI/A==
X-CSE-MsgGUID: syzhVi5gQtOkzoG7JeqJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="307971946"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:21:31 -0700
Date: Thu, 3 Sep 2026 18:21:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH v6 3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Message-ID: <apmQePRVxyrWFiAZ@ashevche-desk.local>
References: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
 <20260903-ad7768-gpio-v6-3-4254ef6c9b38@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-ad7768-gpio-v6-3-4254ef6c9b38@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 03, 2026 at 02:01:28PM +0200, Janani Sunil wrote:
> The AD7768 provides five GPIOs controlled through registers shared
> with the parent IIO device. Register an auxiliary gpio-regmap driver
> and use the parent device for runtime PM.
> 
> The device has separate input-state and output-latch registers. Add a
> reg_mask_xlate() callback that checks the line direction and reads the
> programmed output latch for output lines while retaining input-state
> reads for input lines.

...

> +#include <linux/bitmap.h>

Hmm... as far as I can see this is an overkill and bitops.h should suffice.

...

> +static int ad7768_gpio_init_valid_mask(struct gpio_chip *gc,
> +				       unsigned long *valid_mask,
> +				       unsigned int ngpios)
> +{
> +	if (ngpios > AD7768_FILTER_GPIO &&
> +	    device_property_match_string(gc->parent->parent, "clock-names",
> +					 "mclk") < 0)
> +		bitmap_clear(valid_mask, AD7768_FILTER_GPIO, 1);

This is a single bit, we have __clear_bit() for that in bitops.h.

> +	return 0;
> +}

...

> +static int ad7768_gpio_probe(struct auxiliary_device *adev,
> +			     const struct auxiliary_device_id *id)
> +{
> +	struct gpio_regmap_config config;
> +	struct device *dev = &adev->dev;

> +	struct device *parent;

Assign it here, this callback must not be called with dev == NULL, so it's fine
to dereference it without validation.

	struct device *parent = dev->parent;

> +	struct regmap *map;
> +	int ret;

> +	parent = dev->parent;

And drop this.

> +	map = dev_get_regmap(parent, NULL);
> +	if (!map)
> +		return -ENODEV;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(parent, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(map, AD7768_REG_GPIO_CONTROL, AD7768_GPIO_UGPIO_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	config = (struct gpio_regmap_config) {
> +		.parent = dev,
> +		.regmap = map,
> +		.label = dev_name(parent),
> +		.ngpio = AD7768_NUM_GPIOS,
> +		.reg_dat_base = AD7768_REG_GPIO_READ,
> +		.reg_set_base = AD7768_REG_GPIO_WRITE,
> +		.reg_dir_out_base = AD7768_REG_GPIO_CONTROL,
> +		.pm_dev = parent,
> +		.reg_mask_xlate = ad7768_gpio_reg_mask_xlate,
> +		.init_valid_mask = ad7768_gpio_init_valid_mask,
> +		.drvdata = map,
> +	};
> +
> +	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));
> +}

-- 
With Best Regards,
Andy Shevchenko


