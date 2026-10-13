Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C85038E6;
	Tue, 13 Oct 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898365; cv=none; b=ZzPlFyh+6QYS45Wbr6EnxBJQQaZ8zK6mypi7a4gSvKvcJJaS4T3HdeSPole2ji1+3p1es8e73PsGDQsGjDP2hAWDLWPVNd6yFRxcmGdBKx+95jtnn7HL/YHZ9XWFcrf+M8gxlVUYCnnz1FFVnduIj6NyQU+hgcGGFQf4mcGbXI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898365; c=relaxed/simple;
	bh=vQUw9d5mOCImQNTh4NmNa0chp12gTHeAMoIthh/5IVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUkGJ+ui76jgmj6JuPUZL1bFI5KEzYR9Kv44C6DNXyFiCSkMJPoHGDU3gRvQDz8gfYIW/O6NPFdDnfqY+VrxsehG+HR6xZ6XskMtj77KNoJcFU6hU01hqFiW+tfVRMub2asUBJhwmYAn5B1LT351KuzXpcF3kUq/i+44qy17wRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTp2hKrs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTp2hKrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791898364; x=1823434364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vQUw9d5mOCImQNTh4NmNa0chp12gTHeAMoIthh/5IVg=;
  b=WTp2hKrsfUhHaK0a+eOAKk5AtpB0TW/mgsTApmwPkbQYdbUZpf7flJyI
   6LgmufgwwCyaYY29FMcwRiPNHFvOQNaEgLCJp4ESASaSk5YtveXFvNmHo
   reVBnfEBb9haT/oNmsDo8yHIq4Sj/dq2/y5F2vhHfVZws6NcbThBZjiIR
   sc5GYptU4JSERG9/eSJ/+caSw1/Vo7Tco0L8diw9ojhK/g3HYLDIcE5cX
   At+pioDtoFMcQOmFk9sV6Niri1vInSZB15CBbaESyHI3vbnVHcOewdKhq
   LOlQm6bWHIrqwtHn2cjG5Rb85t7VC+e16kD7PMXK/kqOe6SRvUOoEwyap
   A==;
X-CSE-ConnectionGUID: NkzaQZMxRmy1bXB7FVFlZQ==
X-CSE-MsgGUID: YOoQ9LqgTV+2E5+bYIHHwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="630823"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="630823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:32:43 -0700
X-CSE-ConnectionGUID: 1hK0v/C/QQ2j2ewLkyInpw==
X-CSE-MsgGUID: gbpn0AaXRyCVKs4ZOR2rsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1528720"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:31:43 -0700
Date: Tue, 13 Oct 2026 16:31:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpiolib: shared: Don't define variable in the
 middle of the code
Message-ID: <as4yvFgW9R5HPHX4@ashevche-desk.local>
References: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com>
 <d5508a2a-518e-46ee-a821-b6209ef35bfb@kernel.org>
 <CAMRc=McSCMS0PB69k0tnKMvBRkB1t-4HOhsvGr82yse4FuNtCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McSCMS0PB69k0tnKMvBRkB1t-4HOhsvGr82yse4FuNtCw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 02:42:59PM +0300, Bartosz Golaszewski wrote:
> On Tue, 13 Oct 2026 12:04:41 +0200, Jiri Slaby <jirislaby@kernel.org> said:
> > On 13. 10. 26, 11:44, Andy Shevchenko wrote:
> >> While the C11 allows us to define variables in the code, we do not
> >> do this style (see more at [1]). Move the declaration to the top of
> >> the function.
> >>
> >> Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]
> >
> >  From the link, I have just learnt two things:
> > 1) I am not alone preferring declarations in the middle of blocks (it
> > has more pros than cons IMO). But again, I spend a lot of time in the
> > c++ universe.

True, but there is also old style and it's kept like this.

> I actually do prefer declaring variables at the top of the function. This is
> a leftover from when this variable was managed with __free().
> 
> > 2) the kernel defines "auto" even for < c23. Therefore:

True, but using auto in the code will make it really hard to follow. I find it
nice in the macros, though.

> Excuse me, what?! :O
> 
> That's the first time I'm learning that we can use C++-like auto in the kernel
> C code. Thanks for bringing this to my attention!

Yeah, with some version we eventually get it standardized.

-- 
With Best Regards,
Andy Shevchenko


