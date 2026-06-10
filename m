Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8B331EB5;
	Wed, 10 Jun 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101457; cv=none; b=aYHOihtWdxLiCDAkj8xXdDclKnWvcp4Nqk0VQ1cDOsa2hvBsvLyTaJO8pwBUefi6l7elROOXA6viWRsHGxRTyHOMgkjZdyPvcOMGBy1FS0LtpO+LcpVvSNxGiZ3zlFYdhseL2LqGbasIDz+Al7GkDesl+FgHZpjRbzsJc8/9ccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101457; c=relaxed/simple;
	bh=AMF6ZNmHPvA+E0eD2kPKdzZht7SvJj5vuBOYw/S+Jws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcOJAbpMt18p8fX/0lpVpnrI4csZooTORhfh0HT50t8UfK0sOHv0/KmjU5qgWkRRLeJYOLhsePZ3zEB+CMG1Af/sfzLutoRfDDzpiGyVySZb7uMni3/1J6jiHz6aHaRvKkePSI77GNZMucZOpoDjRoDyKG0IUgdPMYexdDWbhYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzqxA6Bi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzqxA6Bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781101453; x=1812637453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AMF6ZNmHPvA+E0eD2kPKdzZht7SvJj5vuBOYw/S+Jws=;
  b=IzqxA6BizZDAiM+9Y3VNei+mgT7Oiz+i11Z2p0eNAc2X65S9M3m2t6BQ
   Sydr5Ny1Kxz0MjfnMDf4EsYkUZiZK1UWdA47Wi89sUBnUm36NXgtnjcXP
   mw1+8wJkWwgWRpIV9cYJ/OVfgyJ02IurZJJZpJOxFYZN/MyO5XIQZ09et
   HUNzWDF4NPi9CPX6A3COx7aP+lYLn00vjNwVjTjtq39KhHB40HTbX4X2i
   ig+soxN3w+v8hrgGAzJFawbjNLmgg/fILxQUuDctE+9dsalf1w9Eypz60
   JpccY3AWV9E8gDB/MEL4V5dRQwDnk1WAEgohxhv1lJEQbIhcKMe3f1wXn
   w==;
X-CSE-ConnectionGUID: 2SIRlgZHRseLrQ4bcBqM5Q==
X-CSE-MsgGUID: GsJ06u6ZSWqk/bDC3reuxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="82086503"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82086503"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:24:12 -0700
X-CSE-ConnectionGUID: pyDH0xx/RYu2GkxTTOHXJA==
X-CSE-MsgGUID: ed7brLWsQAqMFqKuZx7aUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243229751"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2026 07:24:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0531595; Wed, 10 Jun 2026 16:24:09 +0200 (CEST)
Date: Wed, 10 Jun 2026 16:24:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Message-ID: <20260610142409.GT2990@black.igk.intel.com>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>

On Wed, Jun 10, 2026 at 04:34:23PM +0800, GaryWang wrote:
> Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
>  for device id INTC1055.

Okay we can see that from the code but why? Can you explain it here too?

> 
> Signed-off-by: GaryWang <is0124@gmail.com>
> ---
>  drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
> index ae231f7fba49..aeb031570536 100644
> --- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
> +++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
> @@ -330,6 +330,34 @@ static const struct pinctrl_pin_desc tgllp_pins[] = {
>  	PINCTRL_PIN(276, "SPI0_CLK_LOOPBK"),
>  };
>  
> +static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
> +static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
> +static const unsigned int tgllp_pwm0_pins[] = { 99 };
> +static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
> +static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
> +
> +static const struct intel_pingroup tgllp_groups[] = {
> +	PIN_GROUP("i2c0_grp", tgllp_i2c0_pins, 2),
> +	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
> +	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 1),
> +	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 1),
> +	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
> +};
> +
> +static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
> +static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
> +static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
> +static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
> +static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
> +
> +static const struct intel_function tgllp_functions[] = {
> +	FUNCTION("i2c0", tgllp_i2c0_groups),
> +	FUNCTION("i2c1", tgllp_i2c1_groups),
> +	FUNCTION("pwm0", tgllp_pwm0_groups),
> +	FUNCTION("uart1", tgllp_uart1_groups),
> +	FUNCTION("ssp2", tgllp_ssp2_groups),
> +};
> +
>  static const struct intel_padgroup tgllp_community0_gpps[] = {
>  	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
>  	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
> @@ -367,6 +395,10 @@ static const struct intel_community tgllp_communities[] = {
>  static const struct intel_pinctrl_soc_data tgllp_soc_data = {
>  	.pins = tgllp_pins,
>  	.npins = ARRAY_SIZE(tgllp_pins),
> +	.groups = tgllp_groups,
> +	.ngroups = ARRAY_SIZE(tgllp_groups),
> +	.functions = tgllp_functions,
> +	.nfunctions = ARRAY_SIZE(tgllp_functions),
>  	.communities = tgllp_communities,
>  	.ncommunities = ARRAY_SIZE(tgllp_communities),
>  };
> 
> -- 
> 2.43.0
