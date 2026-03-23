Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354203AB277;
	Mon, 23 Mar 2026 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272970; cv=none; b=T1aV9DipXitqmmK+q3/EEKm7734V0mXLuw9Jhred4p9Qw2pXFAcFPKn4wbjAlS6bkVVDLlEc9MJqHcozro22pwosDz7n+F4ybtOF1cYKqSQToQ08Z6jXf6nhdu0Zh5vl0RX/XaFzBbHf8frV/d+WB+tfFe/E+EeWYKGWPjDFip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272970; c=relaxed/simple;
	bh=LtNZJ0nQ13D6lcpwUilKWqME4fSZTGsKlqjEX/QNcYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG1rcivSSp9TCTvcxEgyF9AQ1SHPKOjQ4oGgdw+vRFB3bTcj8VX3bmcSSmKzbsq7WuvEoTeU+LjsQaW0Yb8lCByyaQeFsid2T/aK4MkgLO/THQA4gP10eFm8GWGtuuixci8SD5tPf2WJpxDbtbdJrgTkbISqGdc2o9a0F/BEpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBhWFDN+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBhWFDN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774272970; x=1805808970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LtNZJ0nQ13D6lcpwUilKWqME4fSZTGsKlqjEX/QNcYM=;
  b=bBhWFDN+5IGrTL3yJp2ejxmFnA5hS293SI6F8JvwZ0XujK0UOGvldPMf
   DKhhnXCEnpKV5m6feK8ripcXp67DubO7BKbGzBwAFYVBYMIs0VZxg6Q1E
   MiMyK/P+4PJvgZrIAvRtgqLjs3xocgvzeWlKuiLZqhRwX/Hdl8g0uE0wY
   dmpGOoI+uSDjJ91p1C4p1IvgPybzQbF3HC6kjGSYZUAAx1qre/+1dbzKC
   tr4cQ5FZ+sZfCYyzpja4pg9OoFA6fC8r3XIyENh+PWAA3rbHYouHpSJQl
   jHyRtqNjYrT8kT3xoXWXU88NJGtg7TnRrgDwKb2HxmR9ddueZ49/pKBtg
   w==;
X-CSE-ConnectionGUID: 2XEqHDfNR7WWIb5S+PzUjw==
X-CSE-MsgGUID: Y+6TGa5vQ0+hIQWMEJcKAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74979817"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74979817"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:36:09 -0700
X-CSE-ConnectionGUID: OT6I78ddRy6gCnXhUvujNA==
X-CSE-MsgGUID: nbmE7KSLRjS/3Rr5akCIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223987115"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:36:07 -0700
Date: Mon, 23 Mar 2026 15:36:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] pinctrl: core: Drop unused include
Message-ID: <acFBxPvIJofftgub@ashevche-desk.local>
References: <20260320220550.3237142-1-andriy.shevchenko@linux.intel.com>
 <202603211748.5YfMNVO3-lkp@intel.com>
 <ab6a3MACb9fed99h@ashevche-desk.local>
 <CAD++jLkpPnRCJdFoavwYqMmOUNzU3oZoPm8LDVW5CuLV9PGSAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkpPnRCJdFoavwYqMmOUNzU3oZoPm8LDVW5CuLV9PGSAQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 02:30:46PM +0100, Linus Walleij wrote:
> On Sat, Mar 21, 2026 at 2:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Mar 21, 2026 at 05:55:35PM +0800, kernel test robot wrote:
> > >
> > > kernel test robot noticed the following build errors:
> >
> > Ouch!
> >
> > So, seems the gpio.h is used as a 'proxy' for some other headers.
> > I will test it carefully before sending v2.
> 
> It's chill, I don't mind using the autobuilders for testing :)

Sashiko already suggested to just replace gpio.h with gpio/consumer.h where
gpio_to_desc() is defined.

-- 
With Best Regards,
Andy Shevchenko


