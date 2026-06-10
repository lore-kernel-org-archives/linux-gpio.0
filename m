Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE64071EB;
	Wed, 10 Jun 2026 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102268; cv=none; b=H6y9xe46juWPIjVQJd1UMkBitxACZ9v54jGiVDoEP/IQJdNGzVUbP3nYGqUDFvXp7++UktqoJ4Dw3co+eX7KXPA7PFvs5/KeMQwd8ZEZLgQq4MlSazrKNpAPBrJmC1ZtEST786DtexyUDGjhJFBsIvEc8swytRKUmGIk/PBwSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102268; c=relaxed/simple;
	bh=Z4XxNmskXaOi9LNho2I7ZG2okK/xrJ34GLzPUXJDy1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJq+vuBkltTgyFissRU2pRS/UNATBOP7FMTKVcGpefRC4HRjYZiddmKHrKCDxWDKXnVb+4y9sQDPwMIBJ3+Hy38q3ckgI6oZI145rBzEZjT1wi8Zeis8GkMsvveqB1PQYuQzYMaclhrCX5XExKvUsS9bp7w0q8BEfMzrUi7V5Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmCLflzT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmCLflzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781102267; x=1812638267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4XxNmskXaOi9LNho2I7ZG2okK/xrJ34GLzPUXJDy1M=;
  b=CmCLflzTlEuKmuxXcE1dUzLsR02ap2VjwLAOo80+9yOZFKMq4eWyfjnm
   rNVd9NTk7Rq00ZZk/gfUtWUvTiwlYjWse0RhY7pFtQ9hU7/DhQLMA4R+U
   nQZZHX3fuIdGBSHmyoCk4JMyJt1Cy/H23xJ3h+9BPB5u1YjNy4/nkg5MH
   9hPszwsBXWTSOernHtlxExhheE9oy9pECaxcDQWz1D5lM637t0IgoSVEs
   BZJSBkcCrDe0DKrCmKZ22JZDoHF6Bitk0J1673XRX3pJZ+3LqdMkqBA70
   8H1EjqS/j15ZHWaUwwHaMU5831XjtZb+tRxC5aL5v1mPH5Q7bicldN5fQ
   Q==;
X-CSE-ConnectionGUID: /FArWZ5HTEOZ/QaKqIbW9A==
X-CSE-MsgGUID: 7TGc9yktQdOJ3gHVZyAIfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81026942"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81026942"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:37:46 -0700
X-CSE-ConnectionGUID: 0CCRzmSZQJu7Yhk90OZbgQ==
X-CSE-MsgGUID: k6+N/vKzQrecMlqg2Wbvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251266514"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:37:44 -0700
Date: Wed, 10 Jun 2026 17:37:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: GaryWang <is0124@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Message-ID: <ail2tWow7VwWRkL_@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
 <20260610142409.GT2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610142409.GT2990@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 10, 2026 at 04:24:09PM +0200, Mika Westerberg wrote:
> On Wed, Jun 10, 2026 at 04:34:23PM +0800, GaryWang wrote:
> > Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
> >  for device id INTC1055.
> 
> Okay we can see that from the code but why? Can you explain it here too?

Yeah, good point. I know the why? because I reviewed the pinctrl-upboard
driver, but unprepared reader doesn't know all the details.

-- 
With Best Regards,
Andy Shevchenko


