Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B16262FC0;
	Thu, 26 Feb 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098287; cv=none; b=f3hlLeujuPNHNjbfd92XIw7d3i0BWWQkN4XedO7OGNZuRwc6eV/vZSPUfA0KpAYF8f5VHq+3Bgnf1wFA/iPbYOKKTrDX/sbIEMvbncC5S8C6IRq6cVpiHesVnRMhiFt3JW4acB2QsqrG7+7T3izR8t7QZjCZy5SAelrU/cIlGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098287; c=relaxed/simple;
	bh=1Z2EvbwJoIK5hSSG5J5f18ttTYbhJNccN2I/+uLuS5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY3iiKQNkO0/zc0+/EXkKk+rRZCps9UGs9nT9qqqYbH4IFhiP7Vkd3uj9m9CPtqLe9YPr0bf6vcNfuXa8UOW3XLlzdDIZfQiYVhxdAewJk6vtzIVzar7gElS5R27xaf5YthZuR/oMTyIr57gUjeKA+FoLd3NeoTDDYSQWxAH4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kp/fzGhU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kp/fzGhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772098286; x=1803634286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1Z2EvbwJoIK5hSSG5J5f18ttTYbhJNccN2I/+uLuS5Q=;
  b=kp/fzGhULAZ/hydYmkEg/XCTEZJrHdsPi7OdW/8yCY4RA9LzEnnAzc2T
   sJvSUklbaFtnXFntGpF2f+9tBQyzKYdBC+bW3wI/eE0M8F7qU4QE3H58A
   nFixlV8CMNPBd0CneXhQVe3jVqjlWZC1WxN+TqKwqozrtmHaiXvpZYXum
   YOHFP7hpHolZw2wrIjfQWye4CXnZqt2xa0irLNktZcmYEmfDx5cW1jP2D
   nKNqC/760mcNe0yWaTMcyr8yO5lupNeuLDF/i+/zOKCn+3TcTSxQPTTE+
   4GZ3TXlZ3VqJqUfSZNkZnhX31Zj+Nmw3nXw/j2MJyI6H7HVIA+O60At0v
   A==;
X-CSE-ConnectionGUID: ckitaG1fRt6DcH0///Y4QQ==
X-CSE-MsgGUID: DIpZYyq7RnuqEVFR0wxHnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84610210"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="84610210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:31:26 -0800
X-CSE-ConnectionGUID: Eb555HrDQJe+EAx4oKkAaQ==
X-CSE-MsgGUID: miZad0eESGOcxQ5ftHpkmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221129143"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:31:24 -0800
Date: Thu, 26 Feb 2026 11:31:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: generic: Don't use 'proxy' headers
Message-ID: <aaAS6vdnLzD3zP1g@smile.fi.intel.com>
References: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=McM+Adk7fVp0jpWUvRQSa=Q3BK8BRC24RXoB0ussbsRww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McM+Adk7fVp0jpWUvRQSa=Q3BK8BRC24RXoB0ussbsRww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 10:24:59AM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 26, 2026 at 10:20 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> >  #include <linux/bitops.h>
> >  #include <linux/cleanup.h>
> > -#include <linux/compiler.h>
> >  #include <linux/err.h>
> > -#include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/ioport.h>
> > +#include <linux/limits.h>
> >  #include <linux/log2.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > -#include <linux/slab.h>
> 
> In that case don't we need device.h for devm_kzalloc()?

(It is device/devres.h, but read below)

It comes thru platform_device.h. And if you follow my attempts to split
device.h, the state of affairs will look like not much will happen there,
so the platform_device.h <- device.h <- devres/device.h is guaranteed.

TL;DR: if we have platform_device.h, it covers everything that device.h
provides.

-- 
With Best Regards,
Andy Shevchenko


