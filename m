Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FB4D4B;
	Tue, 28 Nov 2023 08:29:16 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11654321"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="11654321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797625148"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797625148"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:29:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r80xT-00000000D0T-0zzl;
	Tue, 28 Nov 2023 18:29:11 +0200
Date: Tue, 28 Nov 2023 18:29:10 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, bstruempfel@ultratronik.de
Subject: Re: [PATCH v2] gpiolib: sysfs: Fix error handling on failed export
Message-ID: <ZWYVVvB0O-CBIbos@smile.fi.intel.com>
References: <20231128141321.51669-1-boerge.struempfel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128141321.51669-1-boerge.struempfel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 28, 2023 at 03:13:21PM +0100, Boerge Struempfel wrote:
> If gpio_set_transitory() fails, we should free the gpio again. Most

gpio --> GPIO descriptor
(I already mentioned capitalization in v1 review)

> notably, the flag FLAG_REQUESTED has previously been set in
> gpiod_request_commit(), and should be reset on failure.
> 
> To my knowledge, this does not affect any current users, since the
> gpio_set_transitory() mainly returns 0 and -ENOTSUPP, which is converted
> to 0. However the gpio_set_transitory() function calles the .set_config()
> function of the corresponding gpio chip and there are some gpio drivers in

gpio --> GPIO

> which some (unlikely) branches return other values like -EPROBE_DEFER,
> and EINVAL. In these cases, the above mentioned FLAG_REQUESTED would not

-EINVAL

> be reset, which results in the pin being blocked until the next reboot.

Fixes tag?
(`git log --no-merges --grep "Fixes:" will show you examples)

-- 
With Best Regards,
Andy Shevchenko


