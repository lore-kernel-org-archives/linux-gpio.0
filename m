Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B34FB9BA;
	Thu, 17 Sep 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650020; cv=none; b=PztAJvnyKwF053va3SYTc8zXMk51D9r4wOVhmFNvCwCwHo3OxTQB1kKKj/i7qM4m2BLKFhhGIsSeNmG5fY1ebl9hrfjpNHiYj//qDWMuAuPdKGIXuDbx4nhtGePyodi6VpkzNKwQYLJxslDgCG5O8lYHtDzYleMDfh/R9s+FdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650020; c=relaxed/simple;
	bh=fnSA3ZHadEOkVq2wZc11TDEJhpap1RJvd4qDUJYvOpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1pmhzgDWO4OtDDsqPYCABnTlq+Sg0dspUM983lHJ68nrVSeOl67lmmj+qoODjyKOuoHhKbCPM3ve0g2JcyGfYgmDcAxY2Mq6cZ93XMV4k5R5A9W+L0/U/ukRD2lCDWTpj/SEH1SE8V/okx+ybVQYe2WqggLjL/XROkbp+VNqKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnJwqIgj; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnJwqIgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789650013; x=1821186013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fnSA3ZHadEOkVq2wZc11TDEJhpap1RJvd4qDUJYvOpA=;
  b=RnJwqIgjnfr/9l08SJEO2Pa0kAVWJMR2B1TjbA6ssbQSjBUN/au3uScO
   F9b7n2w25ml7e3RbHzyrXI+RV7siHpeKXsG2g0FrVUuKirrY7/lsRxrUA
   G7GG4lnow4Kp4/WDH2cssh1BAUAK/lllgVwRvCVSJ6xEQ5QY5UYuIzly8
   t0j76GmapCknTMnJLBMj8vV+aASfZUocfkTminZoC8/1kA2Edd9KhIttA
   XVynrPQqeAXIYuXixirK87aE1/jVm7YaPtMHARAGzYSl8YSuYskk0M/Wm
   wt4PtXutJizoWp8Ie3Kggw9fbkKiny7GJUT/D8GW+kHjazr0+AyaiqVjm
   Q==;
X-CSE-ConnectionGUID: gVz7JWv8Q+2G4PE+V/d+ug==
X-CSE-MsgGUID: ETFYWGZ5R9CO1g/B7Wi8Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="574939"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="574939"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:00:08 -0700
X-CSE-ConnectionGUID: Q0bNwbL2QWiqyRS4yT7Cnw==
X-CSE-MsgGUID: W/xGtr8bQZmM94o6Ngr0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2005101"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:00:06 -0700
Date: Thu, 17 Sep 2026 16:00:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: use of_node_name if line-name is missing
Message-ID: <aqvkU_1_ki5lGXS_@ashevche-desk.local>
References: <20260917122815.88601-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917122815.88601-1-linux@fw-web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 02:28:13PM +0200, Frank Wunderlich wrote:

> Until v7.0, GPIO hogs inherited the DT node name when no line-name
> property was specified. This was implemented as a fallback in
> of_parse_own_gpio().
> 
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
> into the GPIO core and removed this fallback.
> 
> Consequently, GPIO hogs without a line-name property are now displayed
> with a ? in /sys/kernel/debug/gpio. Restore the old fallback.

...

> int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)

>  	fwnode_property_read_string(fwnode, "line-name", &name);
>  
> +	if (!name && is_of_node(fwnode))
> +		name = to_of_node(fwnode)->name;

Can we move it inside the loop? Yes, I understand that it will be unnecessarily
called more times than required, but gpiod_hog() is called anyway in the loop,
so I don't think it will be a big deal. With that it will allow to group
OF-specific code in one location.

>  	for (unsigned int i = 0; i < num_hogs; i++) {
>  		if (is_of_node(fwnode)) {

		...somewhere inside this conditional...

>  			/*

-- 
With Best Regards,
Andy Shevchenko


