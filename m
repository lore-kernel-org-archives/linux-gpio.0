Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6E39022A;
	Fri, 11 Sep 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105319; cv=none; b=Yz+62ebreISn8h9vRQUpbuhWYGVMgiVSCbSqsBKQyK5L2S1KxQ8qlV02pHO5eqdv50IbO0THyl4JNsGfTN0Wugsv7at07jrJ4+KVpzMJrGxpzTeEZddfTIaTjAk3ivYtJXQIXrovFi7Nt4ryjSu8wG0tLjI7S0AyKyCyaJ0/XEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105319; c=relaxed/simple;
	bh=kXNZkitfD5oqCk+rSUTgYUQObVoc+P4ztqacRPmFuWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbwkIJn6MWfzS8GmCV3JX7wXYmZ+SiSDKc1bNU7cDmESflA9V0TJYoIWvfBhDq9hKFG97Fc7AEyNh8wfCdi6wTiDPCidt+Sk3pX359tdgSKHdvqs6nw0nO45wQzXtznwI2++/wbWbd4e/iuqv49ITJADDNpJcZQmKim2tj8Tkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw2Rbb5V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mw2Rbb5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105318; x=1820641318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kXNZkitfD5oqCk+rSUTgYUQObVoc+P4ztqacRPmFuWw=;
  b=mw2Rbb5ViqiDc4cEciRxkkcR86J4wH04DDQ6dTGvByR3lK7PAyYVTwre
   WNYHmgm4+zkY/GoF4U8fIBxVTo68RJFpt4vzkQz0hvAT98vjtF9FzDI4T
   YrX+BScfOujbvU7bGvo/3aFFFCQ3F5vcNB/aLyn6pgmd1dwUyCOC25R6K
   mLaeoN9aE+xALBcfA2R3jqnX6xgfwRzNnBaLPnDkHz9eFD3dsmeSxzwam
   idjHE3Chy1x9C6O16PNXMZAP/SxsPwGvi1/pvJXE4BOu60OGLxDn8E4XG
   KaoW6vThuCP0vrWqlnUhv9Dpx0PDlImKjwe8g/pOVlZ4++rP/0fs6P/p8
   w==;
X-CSE-ConnectionGUID: 7dL38Cv1R1K43plG/vNizw==
X-CSE-MsgGUID: J/Z1x+/2T7WfDPk5Y8HgYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92077665"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="92077665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:41:57 -0700
X-CSE-ConnectionGUID: ZpDXed58Sg6Sh6FC9nudiw==
X-CSE-MsgGUID: nlFcX/LNQDORpAzSCEcqiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="310088445"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:41:54 -0700
Date: Fri, 11 Sep 2026 08:41:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH v8 2/3] gpio: regmap: Add optional runtime PM support
Message-ID: <aqOUoEsxHXPH_Yzy@ashevche-desk.local>
References: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
 <20260910-ad7768-gpio-v8-2-6aaaa15adeb3@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-ad7768-gpio-v8-2-6aaaa15adeb3@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 10, 2026 at 07:29:11PM +0200, Janani Sunil wrote:
> Some gpio-regmap consumers share their regmap with a parent device that
> may be runtime suspended. GPIO register accesses must resume that device
> first.
> 
> Add an optional pm_dev field and acquire it before register translation
> or access. Release it using runtime autosuspend after each operation.
> Keep the device active across the complete direction-output sequence and
> propagate failure when setting the initial output value.

...

> -	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &reg, &mask);

Hmm... As far as I understand the xlate function should not touch the hardware.
Is it not the case?

> +	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
> +	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset,
> +				   &reg, &mask);
>  	if (ret)
>  		return ret;

Otherwise runtime PM may be handled after that call.

...

Ditto for the rest.

-- 
With Best Regards,
Andy Shevchenko


