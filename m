Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB6374A0A;
	Mon, 24 Aug 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560644; cv=none; b=M8XPKMQyE9XT8MtLUAzByNGWW1XF8hkV5YbxiUb45uEdrcz6e8GNf+aWgiX1FfWMOyPTEiFipwb5qWDNLIZH7dW9rc+dR7wgVqDvgEoMKTwyVHqVNrpO57nIuDWahoZWI51cGE5zPzIH4JfpOXysppT7goj9T2STOw9LP3h3EQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560644; c=relaxed/simple;
	bh=cAYy6Ol71yQ22chKUdr48h166KtWjCaDZ99Vcll1NQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dX7sAZRDShMeV2UiquS9wyzP57M+WaKSpIUMNCpg/HBwhcT0PzRjU/5etlaZxBOFWEqNhvtl7O0kDKOaF0ywh1QrETddBBkhnC0co63kEWAsCgKxc2zrimfuhA5qZ5D/gD9tQNXzwyuiwYQCsrKA1r+TnQvhNI9ldR9Z1R0kyyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfnpCvbe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfnpCvbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787560643; x=1819096643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cAYy6Ol71yQ22chKUdr48h166KtWjCaDZ99Vcll1NQY=;
  b=PfnpCvbeUpE5/ruDXablpfz8d1hqE8bIK+pcbdEX9K47zBzNtLCxZ43d
   HJrn4DwWYfJm8jH0H9TjF3hD4FHprciA1k6JkPjftLecN4vaOf7S6vQe+
   7JbdmyUY5EEHtqgXjQlosttBAW8K3ldxhS3juXaG9D63nlYb7N75l6Bsd
   MRZOik2/fEZuiWhNk6/cOuhtZhWmTHuWdMw9cMc7py7+rKkZEPO3F361j
   RwMlBCk9GUA/9bH2rzF4ImhMlc30ftnBeRePLlja1lfqvw80wH3pF3356
   lPERq89YwFIDRkENg4wfs+VtOSjj0K/LCo8fyaSUjqDbViRHhgR1xXn3c
   Q==;
X-CSE-ConnectionGUID: PffIyrvVRXy9tijTITIumw==
X-CSE-MsgGUID: l3SB4H9yTSKEy7ACmiFSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87875310"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87875310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:37:23 -0700
X-CSE-ConnectionGUID: IAOcitHWQo+QTCvXyYaymA==
X-CSE-MsgGUID: ZyA0SafhStG1jWC1UvlR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="290462069"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:37:20 -0700
Date: Mon, 24 Aug 2026 11:37:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: Re: [PATCH v1 2/4] gpio: shared: Replace open coded
 fwnode_is_gpiochip()
Message-ID: <aowCvk7Em-8AoJ0d@ashevche-desk.local>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
 <20260824074427.3226457-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074427.3226457-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 24, 2026 at 09:42:33AM +0200, Andy Shevchenko wrote:
> Since GPIOLIB provides a helper, no need to open code it, hence
> replace that piece by fwnode_is_gpiochip().

...

> -			np = args.np;

Ah, this one is important.
It seems that

                        struct device_node *np __free(device_node) = NULL;

needs to be replaced with

                        struct fwnode_handle *node __free(fwnode_handle) = NULL;

or something alike between the lines.

> -			if (!of_property_present(np, "gpio-controller"))
> +			fwnode = of_fwnode_handle(args.np);
> +			if (!fwnode_is_gpiochip(fwnode))
>  				continue;

-- 
With Best Regards,
Andy Shevchenko


