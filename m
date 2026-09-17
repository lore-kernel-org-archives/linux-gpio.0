Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BB53A894;
	Thu, 17 Sep 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652391; cv=none; b=mNeGSPkiJ/8fQrqdD9o7zo9HQMVv1gs++FKHH7S6ph+lCCfUY9jMHoLUK7bDM/deW/kk8ZkskksTBYbHIWuf9kuPjdbij2BXkBF6fKpgen1L6P2kaUf4UNhbWeyhI7CkIBa299c/B96kduQnlW8NfD8DiueUFcSAO/i1/rktmP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652391; c=relaxed/simple;
	bh=MnY1GpEk653T3W368n0d8F1LgMP7hnnNeolcOILf7YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3dIOsetBu2i3CijDIl4goShtZ+sfsNE50SLEPMDkKsJkRx9L6YomJiMJ/2GmuxOwsJNo5nnm3CEdpxwKJJ/L9vquGXouf5d0atJAcRZNmNnlliGiSoFMHbCcW+RmVcWj4DOMIChMslanpSIz/nJSVziZ5CiXw2CEL8+Tov1m5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoJck14g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoJck14g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789652383; x=1821188383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MnY1GpEk653T3W368n0d8F1LgMP7hnnNeolcOILf7YY=;
  b=LoJck14g9OH6ak1im/MzX9C98A8Qe5HZ63+0qzLiztGtkcu48k+HHJFm
   0FjQQKH0G55A8KoJTDxr65qUEEzEaDlpSfmHY+s+fJ111cciMdN79c73w
   HqVGuhMoLboUcKXR0sAQq+qxcTy4f1gkLypwMQWyF9UylOfy+yGmFqlf9
   UXqz7exkI+97WILwPU3G9O/2yrktbyqXfkKEGEMFc10TcX4Bz9vs4GfSP
   Awg4i92o3tTCBLXDDb0m3lhxslErpFeBgL7d2Rd0yJfnfyFT3Ac1AZ/G6
   uhOl8YMXd85hfXwsZGVbaQpsL6xIEyAbJsvDsTNBX/3+/0YcGS7gnTqC6
   A==;
X-CSE-ConnectionGUID: PakNZgARSRy0b4ULU1X2uA==
X-CSE-MsgGUID: dE0CtnbSR8asx0XjETe7oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92584744"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92584744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:39:32 -0700
X-CSE-ConnectionGUID: m8Ad4rALTgC8pQ7Y8K6K2Q==
X-CSE-MsgGUID: 71aozPS4RbCh6yssA8UqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271155797"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:39:30 -0700
Date: Thu, 17 Sep 2026 16:39:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	frank.wunderlich@linux.dev
Subject: Re: [PATCH] gpiolib: use of_node_name if line-name is missing
Message-ID: <aqvtkNQQp15cr35G@ashevche-desk.local>
References: <20260917122815.88601-1-linux@fw-web.de>
 <aqvkU_1_ki5lGXS_@ashevche-desk.local>
 <85b0d147af3b63a6b2419b7daaf81332@fw-web.de>
 <aqvtMDiqCzsxUDKw@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqvtMDiqCzsxUDKw@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 04:37:57PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2026 at 03:20:49PM +0200, Frank Wunderlich (linux) wrote:
> > Am 2026-09-17 15:00, schrieb Andy Shevchenko:
> > > On Thu, Sep 17, 2026 at 02:28:13PM +0200, Frank Wunderlich wrote:

...

> > > > int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle
> > > > *fwnode)
> > > 
> > > >  	fwnode_property_read_string(fwnode, "line-name", &name);
> > > > 
> > > > +	if (!name && is_of_node(fwnode))
> > > > +		name = to_of_node(fwnode)->name;
> > > 
> > > Can we move it inside the loop? Yes, I understand that it will be
> > > unnecessarily
> > > called more times than required, but gpiod_hog() is called anyway in the
> > > loop,
> > > so I don't think it will be a big deal. With that it will allow to group
> > > OF-specific code in one location.
> > > 
> > > >  	for (unsigned int i = 0; i < num_hogs; i++) {
> > > >  		if (is_of_node(fwnode)) {
> > > 
> > > 		...somewhere inside this conditional...
> > > 
> > > >  			/*
> > 
> > I'm not sure what you want to achieve here (maybe only to have the
> > is_of_node-condition once?, as the loop imho is only for enumerating
> > multiple gpio (like "gpios = <3 0>, <4 0>;") inside one hog of_node.
> 
> The primary goal is stop spreading OF-specific code. If you have noticed the
> function was also rewritten (during the move) to be fwnode agnostic, but that
> was not feasible by 100%, the leftover is collected inside the mentioned loop.
> That's why I really prefer to keep all OF code there.
> 
> > Here the node-name will never change (like the line-name above) and read-once
> > is correct.
> > But while looking at the code i also thought about these multi-gpio-hogs
> > (label and output-X). Imho here something like the gpio-controllers
> > "line-names" would make sense as well as something similar for the output
> > (or just handling this with the GPIO_ACTIVE_HIGH/LOW param).
> > 
> > But if you think the part should be moved into the loop, that's no big deal.
> 
> Yes, I think that way.

Btw, while doing that, also add a comment explaining why (like we have now for
the OF flag translations).

-- 
With Best Regards,
Andy Shevchenko


