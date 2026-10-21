Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586836;
	b=rVqAzBxB/q0vU8TJ64DwR4BsK8RBrRT+BjYnYem6WHXvDm0+Os01VmYKPY0nSJAHtRAL
	 VPTxsaIK5YUxZWT0cMDETMjg2s9YBbdyutaDZSoEcknfM+sHSexCFGmUCZNK24IWhh9/Q
	 Y2V53sktoJZmINQuKHR2c0KIq060G7Rk2GWCJxx2FH9E3f9yijOSvWW86Y0w322ghEwIj
	 fO5napyg4X7W12Iz8v5AUiRWGk9RtgNLeX5NXGw8/nQddBUWQR9xy5CuK2UIMZjnO5yzw
	 LFpuV0JtdRaVBfBr+b/cRoFd/Cp3GChuxgrLS+Lyz+oMNKqMwuo2rZZfiJmBtenaIjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586836;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=h+6kTut313T1kzfryIlNhjR7sVddPvzqTki+kejtPDE=;
	b=jcVKbwuZZeYcebMVci9wfohg3jgqeUDvBRUx31PlOAVXjyywSgN9w9bSb3P5ovrwyvrn
	 a69qL3My8Y3EgNZcdx1OcNOGLeaDMSNqa5HQI/gvi/q2sC1XFTQEXuyDo8/YfAPwhJnFH
	 w+bblRo2pdUvIZjP6uJRMqyzKMZ+KLX3XyQ4k+ki6fdgEDlWPUxCM5GDmVE6LFJQsLY3H
	 ibJhMiD6JH5bmMSf/IjRjn/wYfpLspRAKl/wlhzL6JmObdBV5henWKCqh2MRKyFIhrJtI
	 EFC4ANuPEmHu2F2fQfIJ2IqXYpawppaQ0xe5hk7WBxJ9YnyA1BVag8NwlXouVvatPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fBEi21nf;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D8F606A319;
	Wed, 21 Oct 2026 12:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D8F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fBEi21nf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792586836; x=1824122836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HIvDjBD5uZn8lGbr0pLiT6J1Xk+/neKlcIqVGiBlQkQ=;
  b=fBEi21nfjl0xhD9MsYnu+wZ76MwQ1sMBRtzgGMYnYMHReIpY/VqRra3L
   XmTN9NYycjMOlUn3/QE4jAyaCWDveGMgfB3EIjtavF6imD9qnE6qE9eWD
   rCI67soq9x/yb1boHIrhYcV0BcE+7tNEISXSx4oZsSFTYbjZzVBdf3lq5
   srfVB3S4vj/E1GYTKcVhjhxcZat2oAMYsZNkVLgoFPYjTwUfKggtmwYLp
   kkzCfaZVd+7scV+z4w5CrjM+Q2HSL4yLxSCOQtNfWH2qCixfPrM6/qIBd
   8keGBMPQT6zizWNSob0sOfrLfs2HRqpO4l+rf4i+qxhW4irNm75xMQPKU
   g==;
X-CSE-ConnectionGUID: jYRXtB+YRPCvgyurS31Haw==
X-CSE-MsgGUID: sFGLgP7JQRaWee7mcU/Bhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1321678"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1321678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:47:15 -0700
X-CSE-ConnectionGUID: Z+PvNIwQS3u6qr4SgoTcBg==
X-CSE-MsgGUID: XSJgS0cAT+2m3sKtoaS6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3406620"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:47:12 -0700
Date: Wed, 21 Oct 2026 15:47:09 +0300
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
Subject: Re: [PATCH v11 4/9] gpio: pl061: convert register access to regmap
Message-ID: <ati0TWJWwEo1W2UE@ashevche-desk.local>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
 <20261020-cv75-gpio-v11-4-e058bae19571@ambarella.com>
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
In-Reply-To: <20261020-cv75-gpio-v11-4-e058bae19571@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 03:54:08PM +0800, Long Zhao via B4 Relay wrote:

> Replace readb()/writeb() with a MMIO regmap while keeping the existing
> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> under the irq descriptor lock.

...

> static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  	unsigned long flags;
> -	unsigned char gpiodir;
> +	unsigned int mask = BIT(offset);

Please, check everywhere (where you touch the definition blocks)
if you follow reversed xmas tree order. No need to resend just for
it, but if anything requires v12, please also address this.

>  	raw_spin_lock_irqsave(&pl061->lock, flags);

...

>  static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
>  {
>  	struct pl061 *pl061 = gpiochip_get_data(gc);
>  
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> -
> -	return 0;
> +	return regmap_assign_bits(pl061->regmap,
> +				  BIT(offset + PL061_DATA_OFFSET),

Keep it on a single (81 characters) line, it's fine, it keeps it consistent
with the rest of the similar calls, so increases readability overall of the
driver. With the same remark, address if you need a v12 for something else.

> +				  BIT(offset), value);
>  }

-- 
With Best Regards,
Andy Shevchenko


