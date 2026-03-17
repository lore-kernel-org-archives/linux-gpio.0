Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B8165F16;
	Tue, 17 Mar 2026 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762758; cv=none; b=iSkL0sxQwz7vUJpfTNoXxlGr+snX6WzD2e9NOVYk1TYeDS92gt0//lS9OjuWpvmt3VWPI66laIfUhCoWdYvgVac1V1/IY9spxudzMjsAKcANkQdmFRFfaRBcRIBWzpLEgg+j4yOQjAL2FHp+ws0ZtabCHFxlLQiMKqA8swrGJag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762758; c=relaxed/simple;
	bh=oeglCpzAh02PkjaG8aLvfkp0iWzScnuf8ATUtPqrng0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RR2sUa66Jr0yMrZxIIjdSpwB5CbLgRBW3xl/oLj5P+feQ8zQkrzS7atygNpW16UctQ0CO/vx/EPQ8hs25sZlvpvlM7Gv5aDUtwDBqLS5GZ4Jh0eXCD9SoNCqAAv+h9R4OrZuyTxBmnca9RvP/SZB3uk/5a0snSGoBbAnkcYqzbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp1gcu1X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp1gcu1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773762757; x=1805298757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oeglCpzAh02PkjaG8aLvfkp0iWzScnuf8ATUtPqrng0=;
  b=Xp1gcu1Xpt9yPhHzFTVToaBO1VLV6+5on6oUxfDS3ehCcPePOT1hCJWW
   f+CfOLn91a2XR+C68Qr4OBhqbQw9N5lkTrYceXfL/KgeTjPRJuGoRslEN
   KxUZmAyzw9A6TjboFU4jQJU2krGGWicXVMMyUSDKpewO5z3IbEnOw+i0x
   9jgAlGS1VTl3flNPR74qM9JYUTOB1mXjHDbcRKRuqam/TElSSTooui+Lf
   7ORpsfQxCTADG9GKyKnHNBdQuDSNrJ9jmXaSv+WCnPnAzOpbOx6QaoAce
   qe2TjeYh6psWYCLRKeEPeatuTb5fm5YqIoWG8entwNY+LEZFWCotMTJSO
   w==;
X-CSE-ConnectionGUID: ngSPm1BgSl+xucQ3Gp8sQA==
X-CSE-MsgGUID: 0IArY1xhRbCH0UvwiuM9tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74918824"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74918824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:52:36 -0700
X-CSE-ConnectionGUID: 5Hlu3ZCzQdaYmcWZnL3iIA==
X-CSE-MsgGUID: huEGnqrARTaIMVyKCv1PDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222273684"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:52:33 -0700
Date: Tue, 17 Mar 2026 17:52:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 7/7] gpio: add pinctrl based generic gpio driver
Message-ID: <abl4v6iuzcGRg_C0@ashevche-desk.local>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <e154f1573e82bb96085cf3a256456fddd3738ce7.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e154f1573e82bb96085cf3a256456fddd3738ce7.1773757772.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 17, 2026 at 05:41:02PM +0300, Dan Carpenter wrote:

> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI gpio driver, this driver is a generic GPIO driver that uses

GPIO

> standard pinctrl interfaces.

...

> +config GPIO_BY_PINCTRL
> +	tristate "GPIO support based on a pure pin control backend"
> +	depends on GPIOLIB
> +	help
> +	  Select this option to support GPIO devices based solely on pin
> +	  control.  This is used to do GPIO over the ARM SCMI protocol.

This is not enough to understand (as discussion in previous round showed).
Can we have added a Documentation/driver-api/gpio/... (to the existing one
or a new one)?

...

> +// Copyright (C) 2023 Linaro Inc.

2026 (as well)?

...

+ errno.h // -ENOMEM, et cetera

> +#include <linux/gpio/driver.h>

> +#include <linux/list.h>

?! Cargo cult?

+ mod_devicetable.h // of_device_id

> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>

+ blank line.

> +#include "gpiolib.h"

...

> +struct pin_control_gpio_priv {
> +	struct gpio_chip chip;
> +};

Unneeded, you can use struct gpio_chip directly. No?

...

> +static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	unsigned long config;
> +	bool in, out;
> +	int ret;
> +
> +	config = PIN_CONFIG_INPUT_ENABLE;
> +	ret = pinctrl_gpio_get_config(gc, offset, &config);
> +	if (ret)
> +		return ret;
> +	in = config;
> +
> +	config = PIN_CONFIG_OUTPUT_ENABLE;
> +	ret = pinctrl_gpio_get_config(gc, offset, &config);
> +	if (ret)
> +		return ret;
> +	out = config;

> +	/* Consistency check - in theory both can be enabled! */
> +	if (in && !out)
> +		return GPIO_LINE_DIRECTION_IN;
> +	if (!in && out)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return -EINVAL;

When both are enabled it's out direction, so the entire piece
can be simplified to

	if (out)
		return GPIO_LINE_DIRECTION_OUT;

	if (in)
		return GPIO_LINE_DIRECTION_IN;

	return ...something...; ideally it should be HiZ.

So, even more simplified will be just

	if (out)
		return GPIO_LINE_DIRECTION_OUT;
	else
		return GPIO_LINE_DIRECTION_IN;

> +}

...

> +	ret = devm_gpiochip_add_data(dev, chip, priv);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);

Not used.

> +	return 0;

Hence, the entire piece is just

	return devm_gpiochip_add_data(dev, chip, priv);

-- 
With Best Regards,
Andy Shevchenko


