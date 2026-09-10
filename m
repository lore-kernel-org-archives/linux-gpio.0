Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC343C6A56;
	Thu, 10 Sep 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053870; cv=none; b=iUZKnKyQhigntWw9xaNhVSS+7JM7ehWqGcDtItzecq9rVpkNnggU+EbA8CdIvAFqGe+T17BfbtZYRC2zoC4Zwqro/vnh2xnUNL7YscsNn6HfnR9NuH0nQemSrN12qHUu3+/V63uZmrxxjL93+Am4Nh48JxyIzM2LlK8ShG1ytqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053870; c=relaxed/simple;
	bh=rc7Bib4zh4ULU+z35qShBnBVaKULUISgwzQhJ3tZgAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6y9pGvK76SKRDCg73SZGVFwIR6JhT91Hf7UgOp1Rc1CJ0zXrLCgvtQAAqvSRtHl9ig/duH+lNSfKnlLrB88yehS5Y+CLUuxcgpOBMzoy29cUg35EZVkU5rVViX7ETGTwZSaOqtlxCJwy4SgEXPOJ/DLF54U8mADcik4woZsOqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrBkOiud; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrBkOiud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053867; x=1820589867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rc7Bib4zh4ULU+z35qShBnBVaKULUISgwzQhJ3tZgAQ=;
  b=UrBkOiudko6SpeSWkNPsoz+eQjXtNGNXTSthRljCUOFmgqa9Thm1DQLK
   aGT0U7tHFTRk/Pu8kEWTw+2HC5RPdePaGubNjZbRR0Pj3NNyS71Q+nQ6B
   adp3GbYfB1jeOwlx4FcaM0/GRTShwNMuMj5bUAJSZZnDwCC4QIjvloR+D
   uZXjYCU35XR+jhzmGmnjefkocvQz5nEdLXf/L8ALxzOojFfUqALC8wu9j
   z5r7S6ujjeDkO7Hjn0IwdNnae2OFAs7ytf+PEo1PSOHw1FZG4+8DnGoQL
   vsba4fAHICCII0pw/3W0gz8aGAIzm+fT+90OWU/IP9HwG1iScUMIvsfj0
   g==;
X-CSE-ConnectionGUID: 3+XX/ouLQJuPBox6IvbzHg==
X-CSE-MsgGUID: JYyGE3cSR6qAQmTY/Gq1EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106875133"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="106875133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:24:27 -0700
X-CSE-ConnectionGUID: WBf9OfTGT0CWyGs+8poi/w==
X-CSE-MsgGUID: s9cvCnZ2Q2e4q8EIUU9gCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271653661"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:24:25 -0700
Date: Thu, 10 Sep 2026 18:24:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <jananisunil.dev@gmail.com>
Cc: Janani Sunil <janani.sunil@analog.com>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v7 3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Message-ID: <aqLLp54ZuY3LVIcC@ashevche-desk.local>
References: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
 <20260908-ad7768-gpio-v7-3-52ee6ef18a1e@analog.com>
 <ap_nqnPLWJpz5N8o@ashevche-desk.local>
 <d597d432-2903-4f0c-883e-eccb6867bc8d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d597d432-2903-4f0c-883e-eccb6867bc8d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 10, 2026 at 05:07:12PM +0200, Janani Sunil wrote:
> On 9/8/26 12:47, Andy Shevchenko wrote:
> > On Tue, Sep 08, 2026 at 09:24:54AM +0200, Janani Sunil wrote:
> > > The AD7768 provides five GPIOs controlled through registers shared
> > > with the parent IIO device. Register an auxiliary gpio-regmap driver
> > > and use the parent device for runtime PM.
> > > 
> > > The device has separate input-state and output-latch registers. Add a
> > > reg_mask_xlate() callback that checks the line direction and reads the
> > > programmed output latch for output lines while retaining input-state
> > > reads for input lines.

...

> > > +	if (ngpios > AD7768_FILTER_GPIO &&
> > > +	    device_property_match_string(gc->parent->parent, "clock-names",
> > > +					 "mclk") < 0)
> > Looking at the length of the line I have just noticed that this uses
> > gc->parent->parent. Here is the question: what does gc->fwnode refer to?
> > 
> gc->fwnode is currently null. Would you prefer that I explicitly set
> config.fwnode = dev_fwnode(parent) and use the fwnode_property_match_string()
> here instead of walking gc->parent->parent?

Yes. It's very unusual to access gc->parent->parent in the drivers. IIRC none
is doing like this (out of GPIO drivers).

-- 
With Best Regards,
Andy Shevchenko


