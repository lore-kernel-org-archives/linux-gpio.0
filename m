Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C24AFE06;
	Fri, 25 Sep 2026 14:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346908; cv=none; b=rAEWG3oj7mKUck1x6UF4Wje7HxhUw9G0G275V17L4dBPsx+9UnCBmGYHY00iyiyLbwi/tFMCghiKxysi/W+OUYkPXFLOgO6HEL9ULzQ1Nw13jHIBuwcQ76SporDl/fw6zl9wVC/sOPEM2ChloYUU0HzTAOhBKL+ePi+fvOA0lY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346908; c=relaxed/simple;
	bh=Qf7+4/XEy4gfcrID7Y9uVea9tKpcqJHcArCN95VCJeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0DmFsqfzRlkFfCKQleizb0YCqSo7WQ8Wc4xDpPZG5BHWraJB4xDKsue9Nv2Gfg4papZyJnaHtg212vumc08vOh++zGY3NuiUj1JL+5tnjAgmxOufsDPu1wgF15BRvUczbZUL+BJw8NS+xbr30JZyhNcGRTfqblAyLEqztBoI9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQ2g00yO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQ2g00yO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790346902; x=1821882902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qf7+4/XEy4gfcrID7Y9uVea9tKpcqJHcArCN95VCJeA=;
  b=nQ2g00yOUNFpiZB9mbSDYAfsto/ExFmJouJTrz/5o6O2ziUCzicnK+UY
   2xu9zZ1cOJLK3dGPi/tu/zilZ/WKoJeHMdryyuFTVwTNFdzKCCNby0ogS
   10whvDSDiRLTZF5lMVfYOHc0vDUNW+3UVNd+Iaxo5VVgWDEJ4LYfRPd8l
   amvUCNGx2O1ef/X0WmrDrmyBWVK08dnCPd1HavpfL6THMswTeuTP9AdAy
   w1Txgma9Qpy6NhpeuiqtFYqR0kywNMXs835T3lm+56C75VRA9Mkp7+471
   q8vD0lLHQ78k+DukdSL2F4QS8DniqNdWMcn3yxevAnI4mMJ50HEPqt2EB
   Q==;
X-CSE-ConnectionGUID: bF0eMc7QQsyH+Ox5PzRSDA==
X-CSE-MsgGUID: tX8LbLDAQ0aJKTe3SkT1jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94015966"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="94015966"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:34:58 -0700
X-CSE-ConnectionGUID: j1HgCI0pSCK6NUylNhPyAw==
X-CSE-MsgGUID: W6mfThgWQs239BAbRhHUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272488656"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:34:55 -0700
Date: Fri, 25 Sep 2026 17:34:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <araGjQoaffMhDMLz@ashevche-desk.local>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
 <20260925125433.GY106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925125433.GY106095@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
> > > In order to avoid maintainer mistakes on patch ownership: move all the
> > > Intel drivers into their own dedicated directory under
> > > drivers/gpio/intel. Don't touch Kconfig options as we historically sort
> > > GPIO drivers by type, not by vendor.

...

> > >  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
> > >  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> > 
> > These are interesting drivers, not sure where to put them
> 
> IMHO they should be there too. We are maintaining them both.

Do you send PRs to Bart or you just rely on him to take the patches?

The whole problem started from clashing in MAINTAINERS. If you plan to
be part of the intel/ subfolder then I assume you want to be part of
some common Intel GPIO repository / maintenance. So far I have the majority
of the Intel GPIO drivers to go via my tree.

TL;DR: whatever is related to Intel, but not currently goes via my tree,
I leave to the respective maintainers to decide what to do.

So USB/novalake/graniterapids all have own maintainers, so for now I leave
them under drivers/gpio.

-- 
With Best Regards,
Andy Shevchenko


