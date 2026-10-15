Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE74A013F
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070371; cv=none; b=cZysdXJcGjsqwBw6DDt1kZpESzKFg7YQf30QCcO+lMzV7/hOCkBcrXfeo7zfYN2g4jnBMX2fVTYK8vugt4YsKCwcL1oSmBKETLDOnxMCjZBa/JcZ6OxaVTUXvMnyi1GOx8ifNeDofk5j8PBQyInu8ZYg1p+jhgCHYIIUkRx6A0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070371; c=relaxed/simple;
	bh=SM+iwSmRdLvCzf+j2YOAQoeAW7XhKDAwu/gmMJzCkSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRGd5z3+kNOoIvCQlwLDFdIFMSP7D+txs1xZZL84ZYkrecnydVr7I7VyqDcDfj6ED4mFQGTky5Ur8RY0h9v8xofjdPSMrW7VPw+JjTsV5cb8aoNzhYGd9ChZI54UHUPJy0BZi/qq/ybU2/Pa0oBsZxlINV0d5rGQMgTu1TY4q+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWydISOq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWydISOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792070371; x=1823606371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SM+iwSmRdLvCzf+j2YOAQoeAW7XhKDAwu/gmMJzCkSM=;
  b=AWydISOq6haW3vCrB5Qauwi7gC02cuyZWnVBxl02cvYObY3pPEo9vNsQ
   2Jk7thyNZoT9GF6ewckr6RxbV1WNk1u89aIfyvoDBRPJJFh0RHqoCDjWi
   Ze5HONLo1lXWw9B+cLJP/sKI99f4JUb097jeMRjXL53f5335s1ac0Cd40
   YPxVyJO03yEi+9iQd/6UPIxaTVGh1xl30WWOrGCNVwqA064ebmx9sfzro
   aaIR0XqYFzICUmvHQ1ZzEA6MH9ObcMKINL/XN8SNmwT8ScR7vmGhTWIoo
   UE7q+PtIsMqq4zYXs0mHGOrvWhQZgaxcMXy6uls6AYPqJQzzWEaFkiktm
   A==;
X-CSE-ConnectionGUID: TGoPYDpuR86uElShRr2DQA==
X-CSE-MsgGUID: cJD1nrBQRhOJRGGvrAUyKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="724431"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="724431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:19:15 -0700
X-CSE-ConnectionGUID: I1z29EKqSceeLzUu1M21EQ==
X-CSE-MsgGUID: 7hjGVrilT/SanuZJFvsG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1786483"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:19:14 -0700
Date: Thu, 15 Oct 2026 16:19:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] intel-gpio for 7.3-1
Message-ID: <atDSz_8Xw8bGuWfd@ashevche-desk.local>
References: <atDMqjm-J1qoYPeX@black.igk.intel.com>
 <CAMRc=Mf9s7XkM=8cv0WZ_wB=nv92cKyD1q3Kr70HaJ7kHjmYxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf9s7XkM=8cv0WZ_wB=nv92cKyD1q3Kr70HaJ7kHjmYxw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 01:06:13PM +0000, Bartosz Golaszewski wrote:
> On Thu, 15 Oct 2026 14:52:58 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > Hi Linux GPIO  maintainers,
> >
> > A small set of fixes for GPIO on ACPI-based platforms. It was in Linux Next
> > for a while without regressions reported. Please, pull and send as a fix set
> > for current, v7.3, release.
> >
> > Thanks,
> >
> > With Best Regards,
> > Andy Shevchenko
> >
> > The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> >
> >   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v7.3-1
> >
> > for you to fetch changes up to 3fd4bf93d586cb07304cdcb5e8b3c51ac1d8284f:
> >
> >   gpiolib: acpi: Fix GPIO lookup using relative path (2026-10-13 22:34:07 +0200)
> >
> 
> Thanks, pulled. There was a trivial conflict fixed like so:

Oh, yes, forgot to mentioned that. Resolution is straight forward and you got
it right, thanks!

-- 
With Best Regards,
Andy Shevchenko


