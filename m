Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018646EF75;
	Mon, 28 Sep 2026 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583317; cv=none; b=LXs04t4zymrOVvE9OCm6apeTTnpOWHpBfs5scWzNGRjUS5vskr5DtFf7M2ro4oT7cQKvzUYPP9gVgu6T1Qg9iU+h2a7ISuxZ2tt3cA3NxVrX9TKoQVfj/apo1tLu9OrzeEV9/sCESkwEpUgPz7pU4EaZ9ttAlOnwogjdtP8OQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583317; c=relaxed/simple;
	bh=PrxkeBWR3/Zp6v4DmeIXQ679HelSl1WxdfQZudDB/I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQwlUFQPWOJxl44lauloa1+9HJc/t974kDgDzuHtPhe4zSnEnsJOjXd0Wdmom0Q6Hn9ugFN0gwFo/90Xi/WZK7/UaoWuyXDrlEhsFG+KQIKeIOquNhBOhXy7TvcTjy0/y0d07WYTqQEFONHr8cfO8XmVGJ6lbl8l75CrxnTz7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqVLTRMT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqVLTRMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790583316; x=1822119316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PrxkeBWR3/Zp6v4DmeIXQ679HelSl1WxdfQZudDB/I0=;
  b=TqVLTRMTCuq2O0bdyNa0zTSnwlCLZ4ZYDDdScdiNbwo3oeTuVwPUnnoW
   s1R+vSMbYK05h8gjaHkXeYX9fkY8fvpp+Q0mMwckWbHLlQ9lPOQqJ46sR
   f59EipAOVsjrQq2hup2hub7Af5HZXdRDtlHm2jLFRcWg52XrVgibIhaE+
   GfjVOyZD/8KlELCbLADnVeAVw6ZUH00fJhLifggRzPW0jfnaUV+/NVnmz
   aB3LkjI196DuZ/DDjDE/pNzGUHHMQs4Izs/tRBsJr4h0BF2OUq5GDqeFP
   OR/x47kC+LxsT+jpIaRpuQmkc1vDLImrpy3MJmTSRs7gGwtfF3pFxhlFY
   g==;
X-CSE-ConnectionGUID: n1TBFxWEQwuyKPjiEZM6CA==
X-CSE-MsgGUID: 3V8v8xS5TkePi1gHcAamAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90143648"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90143648"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:15:16 -0700
X-CSE-ConnectionGUID: uA4l3vuJRv6ijg+qJwUqNw==
X-CSE-MsgGUID: lqsr78xWSuiUqe61ZuFIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="301266170"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.42])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:15:12 -0700
Date: Mon, 28 Sep 2026 11:15:09 +0300
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
Message-ID: <aroiDQV_p0isAQo5@ashevche-desk.local>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
 <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local>
 <20260926100727.GB106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926100727.GB106095@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Sep 26, 2026 at 12:07:27PM +0200, Mika Westerberg wrote:
> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> > > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:

...

> > > > >  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
> > > > >  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> > > > 
> > > > These are interesting drivers, not sure where to put them
> > > 
> > > IMHO they should be there too. We are maintaining them both.
> > 
> > Do you send PRs to Bart or you just rely on him to take the patches?
> 
> I don't expect these two drives to get too much attention, and they could
> be contained nicely inside intel folder and that would help Bart to
> identify that these are Intel drivers. So your bandwidth would not suffer
> even if these two are added there. Your call.

I'll be happy to have a co-maintainer record to be added!

-- 
With Best Regards,
Andy Shevchenko


