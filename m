Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC471552FD;
	Sun,  5 Apr 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775379555; cv=none; b=ant5Z0RGyIcJchQKc3iejf1krWv/MDa5eqF6G/F4XC2E+A7npcxqdlYsq2EAbCTJ2IXMV5dAkY209d1tUVM2TlKZXnfC8ACi9cAFzenOiPqV2NWZIcJZOXiv8Zppe1NR6V96MY3KdovtsgvxjSU+C+RYD2XfGXDbxX5PP9xVPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775379555; c=relaxed/simple;
	bh=jKF2ApH7+J7jaZcNZYj4K4ZUHGb5ofLTt8r+CPuEVFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb4BKcfadUVaeHCXEOT0o+WznVrXXv73fjOXl2z0ZpAvARtB1JpGGHY2L9kDMn88Psrc09altEf97apEXnDn9/WuYFWFTXh5EBKEG7iynVoey49ZiYaOXxiA6BzRZfBMeGRX3Yd2VA2hg2NuFINhZFM7ZuZqiZRQQBijmCRQHG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npt9HnNj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npt9HnNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775379554; x=1806915554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jKF2ApH7+J7jaZcNZYj4K4ZUHGb5ofLTt8r+CPuEVFY=;
  b=npt9HnNjU6WnZn+0VpzMVqcRmhgZFH9vEk/pojpQ0T5QxtzUVMGKAV0t
   Ab/3uGwt68knptGHS/VsiBvKEGyNBd0mTHy2qtlAn9PfeMG2HJOeO7AGH
   1QvoZ8vBzX/IxKcHSRNTWGp56eHP+KqF7bCQBlKn6ZEuCPt6s+dIlPdeh
   erxTMzR52akGSTzUMjUQJtU8Pwn2LO4rFqVOj+YXzhpjus4Y2yhS2wLI7
   GhZ2DRih3ILYT5HAPqwxJZHPATPvHmrcPj/1D2rRbIlo5nhHGz7hMf9/d
   Czw+/ipRAc80/zeL09syJ5SwA/AgfyvsfKkvitANGRFIXxV+E4BkyzuQ4
   g==;
X-CSE-ConnectionGUID: ON9K+CrlRLKlW/0A4kWySw==
X-CSE-MsgGUID: qdtlyit7TzeVVToje+i7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76388310"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="76388310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 01:59:14 -0700
X-CSE-ConnectionGUID: mTyubixVREKDJIwU+G3xrg==
X-CSE-MsgGUID: LrlP7G7nQz2yxzR4YzO9RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="232561846"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 01:59:12 -0700
Date: Sun, 5 Apr 2026 11:59:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasu <vasuhansalia05@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, djrscally@gmail.com,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for
 Lunar Lake
Message-ID: <adIkXdCXr2x2zTrE@ashevche-desk.local>
References: <adFsG9mTkoE3kIF4@ashevche-desk.local>
 <20260405013413.31970-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405013413.31970-1-vasuhansalia05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Apr 05, 2026 at 07:04:12AM +0530, Vasu wrote:

> Thank you for the feedback Andy.
> 
> Understood - this is a BIOS bug where the firmware is not setting _CID
> properly for INTC10B5. I will file a bug with Dell to get their BIOS
> fixed.
> 
> Should I drop this patch entirely, or would a kernel workaround still
> be acceptable with a comment noting the BIOS bug?

Is this machine already on the market?

-- 
With Best Regards,
Andy Shevchenko


