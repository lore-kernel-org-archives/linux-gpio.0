Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D7379C38;
	Fri, 11 Sep 2026 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105466; cv=none; b=m5C/dtheYEZtzQEWvR+iFM5zAJH7UJceMpLx26u3TGELaBGZnCp0UJY64twLxSxbKT6/2GxCXJ8RsCgrIt8wE7UB5kBqN15HkyINF/hElC1lZe70FebcuT26AFWByppDvyG0dQkq4FdSAqVTWYvPZolvg+UFTbQk0yptfmljNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105466; c=relaxed/simple;
	bh=2APTfQIXTRATtbvOuCVlvk8TWKSwryDPNPcG+OH8Sis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMOHizwObGEcME1Cckb58mjhmOXvOMyEXMHQ5B1II1E+oq3SPQlrzNuuTCoj1JteLl4mrpWoFdZJWjuuBvyni0WDFjjLxOGZwLFrU6pWGfkATY+goPhHrnaJK1VHG8nuw4XGjw3OAHb6T6o5gKnaH6XQnpCZGifYB1fgPlmOsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+5uwGbT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+5uwGbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105465; x=1820641465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2APTfQIXTRATtbvOuCVlvk8TWKSwryDPNPcG+OH8Sis=;
  b=k+5uwGbTvCXeCiJDATlKfxwltGa7v3zJQSDI0dCPb6PwbvdPmPNWGOao
   iweiU+9kJ7X6a5eLqC7CYibgTVRDtFhwrLO5cZcnuw1Yq/ORS8RrDHs9+
   ndkSIMIa1i01b4Nmfjxs2UjqRKCdshAzSrKeu6kzXrLI9gD2Wk0+29fMw
   Qx3MoeZG4yOLFxLmdbMgjPZ6ZL3XaMWGvnbNtyYKwS5io0m9whiy1XfZ5
   S5+/zJoKm4s9AtiOYAjuoafgAzZmDwCsVeqrUWFNuGdCLc/vT31apZdOm
   Hv/C/ZpNxvb1r55miWsV2OcD15oKqFR/f+HycicuqhM02YcYfUy0ti/C0
   w==;
X-CSE-ConnectionGUID: L8qmaXgQQ8WxPBzR1WJv+A==
X-CSE-MsgGUID: H9ZFo2gGQ2ugULkJH0izyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93393855"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93393855"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:44:25 -0700
X-CSE-ConnectionGUID: EM65ARTMRkSFeJtaRtCkcw==
X-CSE-MsgGUID: IYXwuMZRQkqnB/483Ew1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="269234916"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:44:22 -0700
Date: Fri, 11 Sep 2026 08:44:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH v8 2/3] gpio: regmap: Add optional runtime PM support
Message-ID: <aqOVNP6S0efi3XY9@ashevche-desk.local>
References: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
 <20260910-ad7768-gpio-v8-2-6aaaa15adeb3@analog.com>
 <aqOUoEsxHXPH_Yzy@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqOUoEsxHXPH_Yzy@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 11, 2026 at 08:41:57AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 10, 2026 at 07:29:11PM +0200, Janani Sunil wrote:

...

> > -	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &reg, &mask);
> 
> Hmm... As far as I understand the xlate function should not touch the hardware.
> Is it not the case?

Answering to myself:
Yeah, it's not the case as the new driver in the follow up accesses HW.

> > +	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
> > +	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset,
> > +				   &reg, &mask);
> >  	if (ret)
> >  		return ret;
> 
> Otherwise runtime PM may be handled after that call.
> 
> ...
> 
> Ditto for the rest.

-- 
With Best Regards,
Andy Shevchenko


