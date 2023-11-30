Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmZtFfXR"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47B8D48;
	Thu, 30 Nov 2023 08:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701362268; x=1732898268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6w9HL+61RiI8S7i1ovgXfTxFrhwEVviMStPuLeP1uz0=;
  b=fmZtFfXR03U+GQpx6+Qtlj+z/mBP0yQRNLeT/nWqbrNvxDnAUQvHi/uX
   dapzByEdIDobRd0j1kkgRKmG7N6vkZsukjwdDTKNZhrGoEWWQsI7JBK49
   iWQOeFN484EFg7jGuOV3hZp5Ed4oWjSqGfiy5IWT4DCbOtdAP7IC5sRLw
   F13hQj4qJyhiyy8wEUqwkmeY5U0BefGf/p1uN3wGO4liymi2evPqaSPiy
   yAFYNzKJZNWNHulqJjdKpGstIjnZM8kZ6Yv5dsQVbolZ/2grafItfTAeq
   v66bIcMGsC6/TZexBOCTSyjqZFilTvQObPrdBFSpiQ3zc7ynvOcElihFI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373537486"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="373537486"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:37:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="892863328"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="892863328"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:37:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8k2p-00000000kOx-3DRc;
	Thu, 30 Nov 2023 18:37:43 +0200
Date: Thu, 30 Nov 2023 18:37:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 08/10] pinctrl: sppctl: use gpiochip_dup_line_label()
Message-ID: <ZWi6V8tG4YoNRkpn@smile.fi.intel.com>
References: <20231130134630.18198-1-brgl@bgdev.pl>
 <20231130134630.18198-9-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130134630.18198-9-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 02:46:28PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the new gpiochip_dup_line_label() helper to safely retrieve the
> descriptor label.

...

>  	for (i = 0; i < chip->ngpio; i++) {
> -		label = gpiochip_is_requested(chip, i);
> -		if (!label)
> -			label = "";
> +		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
> +		if (IS_ERR(label))
> +			continue;
>  
>  		seq_printf(s, " gpio-%03d (%-16.16s | %-16.16s)", i + chip->base,
> -			   chip->names[i], label);
> +			   chip->names[i], label ?: "");

So, as it's non-ABI change, we still can use "reserved" word here as well
("Unrequested" or whatever.)

-- 
With Best Regards,
Andy Shevchenko


