Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702155;
	b=0V5xxWCeYdTfr9OE18YzvU44uQ/KreznnAwRIRM0GIAs+FWtQcrBHFEZ17mqcpNA6kS1
	 9zWI+5f/hu6ByvWkESybhVxRnNE4v17/r6op+KM4hl6zgO4fzcHzFduMHfPlKxlA0unk6
	 nlS+NHtx5WTW3+/ptwhsH9t7Xew0PAxGSdFMC43829PUqE84mPI92ec9ieWJEcO4bkkIn
	 BPWCJkGiuhQMb+ZUjVs6o12z/ZG+G4uNczlB63n/jMEiv7F2EfPfpIzZVsC4SBzLA4chn
	 XAOtTmeTw7tNyeDdYvmQNVY6jMW6DJCOpwZNmWmUPn33fAUxqI2hZ7wNM2nqHW95nEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702155;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=DvNlOLrQl1zHrzP9kMdWeXuOLflsfgIOeWg11YWjZXQ=;
	b=h7lR0hLcH7oYCf/RVhcjOwg6xgmjdTN30tBi2ycP9Mwk6pJThljqgmcVqI7cYfL3ZE1e
	 FLMFOHfe8khY0AjdBlAId1+HrONxj+YCI7cSZLkcz/1k5wHEkQwl+d1UWk1KpQubLyz9l
	 xdNb0AQLQoksgkGIwbbOHVSdGC98hNKix/p4k/NoHGrbi/bq/ZXSW+sdkdpnn/FRrKGgk
	 EDZTzhFmwAiE84muwiF8pYpDVxzCD4TEEAQkhlrTKMqwoM7OR6bbNRMKOGW//ZkCLRGc+
	 r5uG0aAqf4JlsbV5V6TL4oNPq+Vs0Lt7t/EnCxAzsI9O6nFmZqUYJ3ip00L5VYJo9Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Hy0O/aai";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C4606A31E;
	Thu, 26 Nov 2026 14:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hy0O/aai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795702155; x=1827238155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PI3GrZI82El5lUJzgozmBlkYPr4rbm0RBQwTQ9QQDgw=;
  b=Hy0O/aais8HXosRGemDnTFsNa3IM5IFVFii8tRyBgq//EnGdmmRKzvB0
   wbUqYi+UJcWV/9OtnWHJGpRaiHdX5oVl0RdAMNCcMB6E/zeMQSkmsOGQi
   TCrwu7VvyQ+ewwaDpXkaCk1TPGxD3WIedUwOOxMsXiVhS2VZmijRm9/s1
   eeFN/p1A9D5RtUZLrFNo730lmeog9u1yVHDjqyNvM3SS3FYVQDQlGNO2E
   TPMp5s3JT8BoyXVms9Tte1Td4NS3HzpOXCFdcADdaYpAP6w82XA+RoLkI
   Ut3cR2a4fiUxUzk6LmmX3ewVTr8mFvFbCDYsVpe+4CiBOtqJXgCavzcUO
   g==;
X-CSE-ConnectionGUID: ol+OMnd3S4O/1ErlUzK6+w==
X-CSE-MsgGUID: fp8sqwUmQreRtI20tWlWug==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4521876"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4521876"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:09:14 -0800
X-CSE-ConnectionGUID: i6VYdyTHT5GnpdEIrjIaBw==
X-CSE-MsgGUID: /a0WLyTTSEK/u/ofaWNDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12601443"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:09:11 -0800
Date: Thu, 26 Nov 2026 16:09:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
Message-ID: <awg9hXmlaX4zjmQH@ashevche-desk.local>
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
 <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>
 <20261126073545.GM191152@black.igk.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126073545.GM191152@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 26, 2026 at 08:35:45AM +0100, Mika Westerberg wrote:
> On Wed, Nov 25, 2026 at 07:06:24PM +0100, Linus Walleij wrote:
> > On Tue, Nov 10, 2026 at 3:21 PM Maciej Strozek
> > <mstrozek@opensource.cirrus.com> wrote:

...

> > > Add ability to use cs42l43's GPIOs to drive speaker and microphone mute
> > > LEDs. The LEDs must be described using
> > > 01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which tells
> > > which of the 3 available cs42l43's GPIOs to use for the respective
> > > function.
> > >
> > > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > 
> > ACPI property, so Andy and Mika need to decide if this is a reasonable
> > way to go about this issue.
> 
> I think the properties themselves are already "known" so that should be
> okay (but let's see if Andy has any comments), there is though a tiny
> observation below.

Yeah, I think it's some kind of vendor/device specific MIPI properties.
Would be nice to know if they are specified somewhere or is it just a vendor
push.

-- 
With Best Regards,
Andy Shevchenko


