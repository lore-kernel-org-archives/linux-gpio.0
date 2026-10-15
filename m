Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD783ACF0F;
	Thu, 15 Oct 2026 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092542; cv=none; b=fGH6MWhWGqvpdA5AUNWLTk4jdZ+uCjHCEnI8w9AwTeIhql3IUuLZORWLWC4JlqmaPOmd3H5oej+VNpMcdszi0YMMBcNVo2znfzcZY0wIanbYvQycWSsQCFomvf8iqTCI+I8gyUmJkSQZxvUUAI8eGzX9cfw7dY5ECP8jDGP3fW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092542; c=relaxed/simple;
	bh=lw1A+ybJJg9d3sOd8Mh2RikYHB3S+6LKtmqLymczoIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYUypa247FIGK+SeSziKI0CdSSB/en8IMl4mIp8dKxZUDsv/kt+/5JwSPB9KNwCH327DT0Ve4UHVaylIAnvFMMins/I1jp78sUMN1BIZ67rRtWkXi7YSFdNTEUoV6hbl5+zpz1EbdrNxL+KTcKP6yNXQSgoxragAcCl9Fw9stBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvW0l2K2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvW0l2K2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792092540; x=1823628540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lw1A+ybJJg9d3sOd8Mh2RikYHB3S+6LKtmqLymczoIQ=;
  b=YvW0l2K217Bcfp5BXv3f7lYVcOzRH/LmR09fYMP+l843cPCBJCnqrytn
   /oEhqVTwSBOBWopORkCWT6nhZNRhfqBJW8+ybCvyKQR5b20CZ0SLUX1WN
   ejVL7n1SzV4CkjtUIDc5TwrxrqsPI3aWjLPWg4JoUUjI30tpHN3sCO7iC
   zvwaqLhvQfapR2+T4TMZlzO1h+Fy9n8GR5z2jiq1CqYxKtiNBuYTmmOHA
   d7wLs197b39nweVbbMH8OvGc/Y+GncqS0rHdNobK3yu09MUwc3L2kz7VU
   7jaaQxQQhlLkn8kxu74BqjghG9hCXQENjf9UeBEyzO+JUT49NNjsV/6aQ
   A==;
X-CSE-ConnectionGUID: Mpfl0y5lSQmN32+CmaI7ag==
X-CSE-MsgGUID: AvOh4jpnQuyR2oiX9pnJvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="885628"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="885628"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:29:00 -0700
X-CSE-ConnectionGUID: 3zj+FKH8SW2ATqZooBgJ8Q==
X-CSE-MsgGUID: UtZMT7T7QgWCLYko00GB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2120575"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:28:57 -0700
Date: Thu, 15 Oct 2026 22:28:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Chanho Min <chanho.min@lge.com>
Subject: Re: [PATCH v10 4/8] gpio: pl061: convert register access to regmap
Message-ID: <atEpdoHAHouGHWYv@ashevche-desk.local>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-4-3fe3eb315a55@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-cv75-gpio-v10-4-3fe3eb315a55@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 06:53:31PM +0800, Long Zhao via B4 Relay wrote:
> 
> Replace readb()/writeb() with a MMIO regmap while keeping the existing
> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> under the irq descriptor lock.

A few nit-picks, otherwise
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  
> -	return !!readb(pl061->base + (BIT(offset + 2)));
> +	return regmap_test_bits(pl061->regmap,
> +				BIT(offset + PL061_DATA_OFFSET),
> +				BIT(offset));

There is some room on the previous line.

	return regmap_test_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
				BIT(offset));

>  }

...

>  static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> +	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
> +			   BIT(offset), value);
>  
>  	return 0;

Can we actually return the regmap_assign_bits() error code here?

>  }

...

> static int pl061_irq_type(struct irq_data *d, unsigned trigger)

>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  	int offset = irqd_to_hwirq(d);
>  	unsigned long flags;
> -	u8 gpiois, gpioibe, gpioiev;
> -	u8 bit = BIT(offset);
> +	unsigned int gpioiev = 0;
> +	unsigned int gpioibe = 0;
> +	unsigned int gpiois = 0;
> +	unsigned int bit = BIT(offset);

Keep the reversed xmas tree order.

-- 
With Best Regards,
Andy Shevchenko


