Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1093E274C;
	Thu, 16 Jul 2026 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190607; cv=none; b=Ez+b50E8CHuYNyICG4tXghvLJUmgDyhlVtKpqKeWIIqXnEmcfxUBtwDWyVDA7fuHI001bgvZX8OmSyewC7stcCM4QXDLZP7cLur/p3468vGnu6WWf5UpHsQDzKU4RHL0afiYS0U5gPmXBSUclsgTV1ZDPaC1YXDVE7TdtP3rtL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190607; c=relaxed/simple;
	bh=IJdsVEnwz8i9PARgK//TCF6tqae2WSFU8s/P9mDvKuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bV3PMnILgbDJPvgVi5Ndhp/ftO9UzBV2NrQZBTZHDF5SMX6hmmR7zmPIiAUdY9CFwESF/XP6R3QlFFe2MtQsoYhoN7ea1wyPM4nHDNMXcH5rKpwld3JEZ1dw9tbsehS2zj8szv5fVh74To4BzL5gUq3dp6yfkTNw3fQCOaN6DOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXIR31L9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXIR31L9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784190605; x=1815726605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IJdsVEnwz8i9PARgK//TCF6tqae2WSFU8s/P9mDvKuQ=;
  b=jXIR31L93tCPJYL3T2tf8uxBwKnn5slppKJCX8io/6H/a7puWVhbR5bv
   e3UFEMSu4kYTRgqdqzAv4eYImxDgyB/iChDG0P4lS2FPlnFdLo/zN31pn
   5zvr/KQw2DtprozQTyEwoTzv98pZjgZEjaXZ87ZK3L2TlJRkPP6G++E+T
   esuLhNUTtoQBqeDT6V/FHBN0RycH0ZUiFh7MkMwcoJAWswApb+8HLyjS+
   MZ+4/Lx8fuDmuboNETVKoRtnA902QOKjSYaVOlFP+vxSIByi1by4vM5Dt
   IwYpmMpJhxDWGvhT+RMW6wkrVjcZi9VF6aOnMXIpFcGKZ1r3rIQZFDmmY
   g==;
X-CSE-ConnectionGUID: Y9y6t3U0SSWpnZ9LLm6aZA==
X-CSE-MsgGUID: i5AXRLU7S7Wfq0zdgvFGyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88667681"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88667681"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:30:04 -0700
X-CSE-ConnectionGUID: TtYGDf3IQ8WH9kV3zwAskg==
X-CSE-MsgGUID: pz7wmFKeSLC0qCTCVV/sLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253807153"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:30:02 -0700
Date: Thu, 16 Jul 2026 11:30:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Message-ID: <aliWiN1EaGziNZ7f@ashevche-desk.local>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
 <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 09:58:42AM +0200, Bartosz Golaszewski wrote:
> 
> On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> > No more users.
> 
> Yes please! Thank you!

> [1/1] gpio: legacy: Kill gpio_set_value_cansleep()
>       https://git.kernel.org/brgl/c/aa4bc3b7d36d52caf7c3d3214ae4ce96d609e8c5

Not sure, I put in the comment that this should be part of MFD, otherwise
the one driver will fail (the conversion change in MFD tree only).

-- 
With Best Regards,
Andy Shevchenko


