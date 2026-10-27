Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088382;
	b=cDXg2Um6+dCYnP3YrRfAgIK4lgTLOUU4ZxrYMGLG5Z8JKjgQwNdUiMSZkv1mxSNK/GTj
	 P8oCYaCmCShEsVcEV6So0Lx60mZIwrhtUOO+DmuAyBVRsMSuIsRnyeW5b5kq9uzSgK17C
	 Vx5Unrl9f4VEj3OfKedqLM/sYcN0pNjOMO463PSpPbGnOlAm/c0S0i53fe+p3KT4MDxzx
	 ITHxT6oWcqKC6D61zvUV9cm5ekOd9EIaxpqjqDnTJUc0/OEHTG+vEJolFyFZ7kYyQ475d
	 waO19MAficz7Nz1pw8xbgzx+iIHmsLEumYZAGY0RGrXqKAu1Ylw/cCsZpyBmDa4goAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088382;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=v+21b7F33FfCpUxtnzjtl9dFT8uFzDCLvP4RjPFXtJY=;
	b=mx2wykCUDf4jZeOzUFkQkEXKL8ocUXa1yUe68gJtQ7bG9BKOqwVIjgrPW8LTv2yav0u7
	 8oA8WZ76ulIgDPMJE+8fsYVZ/ba0LetG7VH9FLHvHbfF5g7Ap0MVzODgqREfa9ckvJk20
	 6Cz1og5PLmsuPQoTyNqhvw8+fZZ6ScEm0h/wXqB7DVg2IhrhbUo8CAJPBLjEN4lOm+S1J
	 5XliBrZDMrcyHEAw2fndYlTQibg79XKKJawM0OsV0fIuBBPcN/dOQ25VQmdKiHM9BDV1P
	 DhIfHop3L2dXx2tSKP89F77X2KvDMFOi/RIxH75cZ410SPRdy0H48sKAM8KVMDe2BfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hhwQT2iB;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D80606A31A;
	Tue, 27 Oct 2026 08:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hhwQT2iB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793088382; x=1824624382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vMIfX1tgSRV9Ue0rRyiTFfKmn7ceGEaOfSCwwVC6LoA=;
  b=hhwQT2iBFOCFEIZHRE0DDl2nCa9uvZ0B77LdDLUkiXuO7T0RSUKoO5tJ
   wat3NiXF2+33MPhsnIh5twfgsirjDauQebdPQZxubd9LPGweCz02VZFWa
   NgkbFTM/NQve3S9yFjgJd47mM/VrzD1X0NZUb+Jx3rITZkOfCqP1dA9aH
   RKLv7jz1g2e72m7rauK+0uSMTW9YypilGijITl6mIt5J61bVUJ0n0iT0n
   vPmo6/OzeUwor0E6jJpiHovkfiAyM2TwVCLPeYm/vISqYbLLu1aTSUtfV
   remWtTPCCcMPd/uvfbA0tRHgsAjza+R83LD1lIq2aafWce0NLm+85mRhz
   A==;
X-CSE-ConnectionGUID: 2vPb9ZWSScqZ30eL2pcDKQ==
X-CSE-MsgGUID: HR9TdeIzRjKJpJ2kClVnRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1794331"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1794331"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:06:21 -0700
X-CSE-ConnectionGUID: aj7wMOQYRyudZ/7wEbc20g==
X-CSE-MsgGUID: H/kiAYUERLSfmRLF3h51xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6232976"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:06:17 -0700
Date: Tue, 27 Oct 2026 10:06:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 09/11] gpio: pl061: switch data path to gpio-regmap
Message-ID: <auBbdz_fBiKr1tJb@ashevche-desk.local>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-9-c22555400e18@ambarella.com>
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
In-Reply-To: <20261027-cv75-gpio-v12-9-c22555400e18@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:18:56PM +0800, Long Zhao via B4 Relay wrote:
> 
> Move get, set and direction onto gpio-regmap. ARM PL061 sets
> GPIO_REGMAP_QUIRK_SET_AFTER_DIR so the output value is written
> after the direction change.
> 
> Keep a custom irqchip and irq domain. Create the domain with
> the PL061 private data and let gpio-regmap attach it.
> 
> Leave the chained handler's regmap_read() unchecked. mis stays 0
> on failure, so the pending loop does nothing, and
> chained_irq_exit() still runs. irq_type still ignores MMIO write
> returns.
> 
> The irqchip uses its own child IRQ lockdep class and clears the
> chained handler only after it was installed, checked with lockdep
> on the CV75 board. irq_set_parent() nests
> the GPIO irq_desc under the AMBA parent for irq_set_wake(). The
> gpiochip IRQ resource helpers cannot be kept here: the gpio_chip is
> not reachable through gpio-regmap's external irq_domain path, so
> GPIOD_FLAG_USED_AS_IRQ is never tracked. This matches the other
> users of that path (gpio-idio-16, gpio-pcie-idio-24,
> gpio-104-idi-48).

Something happened to the text formatting, it's quite unbalanced in terms of
occupied room on each of the lines. Make each of the lines to occupy ~72
characters.

...

> +struct pl061_drvdata {
> +	const struct regmap_config *regmap_config;
> +	const struct pl061_regs *regs;
> +	unsigned int ngpio;

Is here any gap (of 4 bytes) in accordance with `pahole`? If so, you better
relocate 'quirks' somewhere to make int and booleans be together.

> +	unsigned long quirks;
> +	bool clear_irq_on_type;
> +	bool pm;
> +	int (*reg_mask_xlate)(struct gpio_regmap *gpio,
> +			      unsigned int base, unsigned int offset,
> +			      unsigned int *reg, unsigned int *mask);
>  };

...

> +static int pl061_irq_domain_map(struct irq_domain *d, unsigned int virq,
> +				irq_hw_number_t hwirq)
> +{
> +	struct pl061 *pl061 = d->host_data;
> +
> +	irq_set_chip_data(virq, pl061);

> +	irq_set_lockdep_class(virq, &pl061_irq_lock_class,
> +			      &pl061_irq_request_class);

Make it a single line.

> +	irq_set_chip_and_handler(virq, &pl061_irq_chip, handle_bad_irq);
> +	irq_set_noprobe(virq);
> +	irq_set_parent(virq, pl061->parent_irq);
> +
> +	return 0;
> +}

...

>  static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> +	struct gpio_regmap_config config = {};
> +	const struct pl061_drvdata *data;
>  	struct device *dev = &adev->dev;
> -	struct gpio_irq_chip *girq;
> +	struct gpio_regmap *gpio_regmap;
> +	const struct pl061_regs *regs;
>  	struct pl061 *pl061;
>  	void __iomem *base;

> -	int ret, irq;
> +	int ret;
> +	int irq;

Unneeded change.

...

> +	if (irq) {
> +		irq_set_chained_handler_and_data(irq, pl061_irq_handler, pl061);

> +		pl061->irq_handler_installed = true;

Can't we remove the chained handler unconditionally?

> +	}

-- 
With Best Regards,
Andy Shevchenko


