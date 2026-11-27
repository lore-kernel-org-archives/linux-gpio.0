Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800475;
	b=yKwKWvQUg7BocpQVLBnQB22aJAWmN5p9Ml2FxjpU2iGcsVDjeupGdaeill56TVxobiQI
	 R8b78eOsxKXG0bLiMk5UY6mcI1ltyznkXG8Y5K4ArEPgHCbZDxCG5yyTWmNJagzSCBwcA
	 XWnAxKITYtLhVlQ6lnN7rpoaGKTgKQ8gim5GM3RY5cHxe4EuFqt4RKF9tVWSLRigTP0UG
	 5PeihZfZ0dwEXiQCMd5yn2SwX+nA88EmoXgW0Xl3cFlMy+s6B2aeEbNsMoDHo79FeA+P6
	 bsXhi1HOGl3CZeo0gMK/M44vparWRI0/wzkgDuIdbfLQvG+jjUBM0725LkiIyFwV7Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800475;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=W3eKtzyeFAx9k3SdIScJomTE4HlGQvDUwsp4irgjcmQ=;
	b=G8SL23eOnkBk7cn/Wta8FDGEoKNaMCSb1FmaG3Agox93Onjlt/oB+yjBeFCZ5mAxdbUs
	 989NnypcOJ6I8rnSu4J/j93IO78wmxxC7ilkDYzkTqMkpxrqgBco1QngK+mHrllrz02th
	 htecBTfZ1XcUe7p4UJEojB9OAHn3CMeKuBRAZ1OsNLOwF2kCdoant9tiLvHzMQDSuSTeb
	 fCnJHDEJdupRHtE23jDDEp7Hmz7IhYnFgdPHQAHaZrZ/mrTmqi5+XX/qWvfX1VnHZVc5j
	 6Z24IaLjH4//iT72hw+zzM0SQTA3WU6+wEKnH4PpmIiCQwn1qWv9ifCid3Ste8P8XYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgxuIDop;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D5606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 17:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgxuIDop
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795800474; x=1827336474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W6Q61lmnMfckv9+BDm568lRdNWM7pHAMlkSfDSGy6tU=;
  b=kgxuIDopW8UyNv8EjEYKCZbaygvmllUdrV3Z3brmwJHkUSjOANefqbvH
   5/cE4/VKuW7vECQ7Cw8+k/Of47epP06I5Oet2QO1Qy0HwV9rQhWmKXPEE
   ZDMhSH6QFUbtlHLxEdyzFGhcsFsLR6gcyN/LPa5U1q8ZlPrSwus82hqV1
   BW/oCx+yPTgZOLG6Wcx6v4/nx8yRw5awUlS/ZZvh+hRyGckXBnoYyimAF
   msySpiVD2NYiEGKwxkaaArHucZ1tWe9qYrUv193pYTBhFvJi+evbXXNQr
   J/Ouj6rssLzRpNLUmwrwcjIaJUqzeZnyV010X68THTBmih4Zy0x3ATBmp
   Q==;
X-CSE-ConnectionGUID: XM5f7F4+TR2A6MFxqhjh1A==
X-CSE-MsgGUID: YISzjK99Qvq/hmK3Pbu7CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4714137"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4714137"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:27:53 -0800
X-CSE-ConnectionGUID: epC9rlWhQqeupkvh//V8aA==
X-CSE-MsgGUID: p0Kq4xR1Tl24ziID7xm57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14109299"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:27:50 -0800
Date: Fri, 27 Nov 2026 19:27:47 +0200
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
Subject: Re: [RFT PATCH v2 03/14] gpio: regmap: add callbacks to handle IRQ
 domains
Message-ID: <awm9k-jTlhBWIi2x@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-4-mwalle@kernel.org>
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
In-Reply-To: <20261127145232.814492-4-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 03:52:20PM +0100, Michael Walle wrote:
> At the moment, an IRQ domain is attached via config->irq_domain.
> This means, that it has to be created before the gpio_regmap_register()
> call. The callbacks of the IRQ domain might use the gpio_regmap_*_irq()
> functions. Consumers can already use the domain as soon as it is
> created and this creates a small window where the callbacks dereference
> a NULL pointer.
> 
> To fix this, create a new create_irq_domain() callback, that is called
> after the gpio_chip is added.
> 
> Also add a remove_irq_domain() callback, which is called after the
> gpio_chip is removed and before the gpio_regmap is freed. It is supposed
> to dispose the IRQ mappings and remove the domain.
> 
> Also ordering of the resources matter, so we forbid any device managed
> resource handling. Any resources allocated in the create_irq_domain()
> callback has to be freed manually in the remove_irq_domain() callback.

...

>  	unsigned long *fixed_direction_mask;
>  	unsigned long *fixed_direction_output;

Perhaps a short comment why create_irq_domain is not here?

> +	void (*remove_irq_domain)(struct gpio_regmap *gpio);

...

> +	irq_domain = config->irq_domain;
> +
> +	if (config->create_irq_domain) {
> +		irq_domain = config->create_irq_domain(gpio);

> +		if (IS_ERR(irq_domain)) {
> +			ret = PTR_ERR(irq_domain);
> +			goto err_remove_gpiochip;
> +		}

		ret = PTR_ERR_OR_ZERO(...);
		if (ret)
			goto ...;

> +		gpio->remove_irq_domain = config->remove_irq_domain;
> +	}

-- 
With Best Regards,
Andy Shevchenko


