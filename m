Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937A3CF200;
	Tue,  1 Sep 2026 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258272; cv=none; b=fLZ8JT1NaxakNOl5yEep7Zt5tv3p8grjGjxcsk90BVKzD1aUKpmbn1d0RShr0oNG1oh21Igg9O6MYorObbxBuFoIC7fY5gres0tTEg1aUrLPPROz54HqbQRkDCdCBwjlcP+ofm3lnBWk4iNElIcMYQ9ILOfmZkLIhU63DwQSn04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258272; c=relaxed/simple;
	bh=ouCyD0O09h1vUKKs+urR9vLWPja2JAT8AEBxx0+yrV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFJTg6Md8Y7XqXRl+CUo/ki/WGrzAOe9Y5H3RTcYFd2sW9EwKaMyRO/nYI9AtfrYP7z/dYzcypb4Ymz1njZBfbgXf6zw8SEQAubs3hDqh6F8UlsIXWw+ti4HRVx7F0xfS61hTRCU5qkNc2gDGnyZWECdl4t0664SlPqUX0o6fyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8NUy06W; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8NUy06W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788258271; x=1819794271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ouCyD0O09h1vUKKs+urR9vLWPja2JAT8AEBxx0+yrV0=;
  b=a8NUy06WQ35ndRYQMN/KURE/2ZBTnVDVg/PqoShknj6UDI7ys2htb6cx
   oiIHzlFsYAVpvdvoGQnU2liaB+thezEAJ+ZHhsMGHXtqvzFazorRgdBl7
   0QYt8AN2xo2EY5M+B+HvMSlF9ti1HBuXgUhudrvTxaRMMi7iGzz+/HmXE
   Iwtc0rlxNkjydQryYAlvCl5NUZCO/pPIsR2ep628n4Eh0+VwgciTuOTnI
   AbB437w+Q/YLi7hRniATNKg9Fzg0j4hCVZogtV9xjc8GJM3Svm6KFQfrf
   ZT9ZSwsEVvmLku96C4YRG6HAHtgHzktg7HQwlZgHYsmtZWZGMnud4SgAK
   w==;
X-CSE-ConnectionGUID: s4mN6zWGTb+5QqbyjPyZew==
X-CSE-MsgGUID: faVrLjNIT1W8oWDRO/F44w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88889817"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88889817"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:24:31 -0700
X-CSE-ConnectionGUID: i1BcpIzsR3qyyWJNFcDJZQ==
X-CSE-MsgGUID: BXbjYG7dSp+WqUb+s9jRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="264773745"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2026 03:24:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8E6CD99; Tue, 01 Sep 2026 12:24:28 +0200 (CEST)
Date: Tue, 1 Sep 2026 12:24:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Radek =?utf-8?B?VsOhbGtv?= <rvalko@lipicko.cz>
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Try to retrieve driver data for
 pure platform drivers
Message-ID: <20260901102428.GH106095@black.igk.intel.com>
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
 <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com>

On Mon, Aug 31, 2026 at 04:25:47PM +0200, Andy Shevchenko wrote:
> The Denverton pinctrl device can be instantiated by the Intel LPC
> driver as an MFD platform device named "denverton-pinctrl".
> 
> On affected systems the platform device does not carry the INTC3000
> ACPI match data itself. As a result, intel_pinctrl_probe_by_hid()
> fails to obtain the SoC data using device_get_match_data() and
> returns -ENODATA.
> 
> This might be also true for other platforms that can be enumerated
> by ACPI _HID. Fix the above by trying the pure platform driver data
> in case the firmware node is not set or doesn't carry the necessary
> information.
> 
> Reported-by: Radek Válko <rvalko@lipicko.cz>
> Closes: https://lore.kernel.org/r/20260827184259.32386-1-rvalko@lipicko.cz
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 7aa7f81ac405..50ffad6a7610 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1716,13 +1716,32 @@ int intel_pinctrl_probe(struct platform_device *pdev,
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, "PINCTRL_INTEL");
>  
> +static const struct intel_pinctrl_soc_data *
> +intel_pinctrl_get_soc_data_by_hid(struct platform_device *pdev)

pdev can be const, no?

> +{
> +	const struct intel_pinctrl_soc_data *data;
> +	const struct platform_device_id *id;
> +	struct device *dev = &pdev->dev;
> +
> +	data = device_get_match_data(dev);
> +	if (data)
> +		return data;
> +
> +	id = platform_get_device_id(pdev);
> +	if (!id)
> +		return ERR_PTR(-ENODEV);
> +
> +	data = (const struct intel_pinctrl_soc_data *)id->driver_data;
> +	return data ?: ERR_PTR(-ENODATA);
> +}
> +
>  int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
>  {
>  	const struct intel_pinctrl_soc_data *data;
>  
> -	data = device_get_match_data(&pdev->dev);
> -	if (!data)
> -		return -ENODATA;
> +	data = intel_pinctrl_get_soc_data_by_hid(pdev);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
>  
>  	return intel_pinctrl_probe(pdev, data);
>  }
> -- 
> 2.50.1
