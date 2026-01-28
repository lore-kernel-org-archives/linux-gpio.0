Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA4C352FA9;
	Wed, 28 Jan 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606873; cv=none; b=IBtfah9iTxT/UVspge6uGA4RBDcuvR+4Ae6IaqA/JShVoWwGIQwOAhK6DfUFldwjeo8zNpqUollLd1Gh2XFUZXLsWY8YKX0P8ZJdeB+2v0Le3ueGLV8wEknVVwZAxOEFeqC9G1NsZ/wYz41p4nOHXq8g2/EmRshuKh9UIuOjvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606873; c=relaxed/simple;
	bh=d+5nNbgHOQwKfhtJ8JLdBOCizRPlBPwWP6/bMxSZWy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhAJMRX6TncKVhbJqT9g/pwt4ur974IhwDK9wkFbOQNZmikvm2W7ttEWVEc/J9KKgQhYAhVShPvjmO15bUzv+g5xHxtaqa540pw08kWOyBiJGImvavJO2C6//z0O6Bb6zHxa35LNGEPt+vmeg5tO5Cpk3XThphU+TeOrAU2//X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4kGx/Iw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4kGx/Iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606872; x=1801142872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d+5nNbgHOQwKfhtJ8JLdBOCizRPlBPwWP6/bMxSZWy8=;
  b=V4kGx/Iw68G4bEtCeJOrPHnKzqVUl7gx4tyb/UcZWhA4x5U0bScil04k
   LfOUMsONTwT7IJFnBgMnzGSGTJmm21VtiuG4RN+kihqIasDR8IL7WBsUo
   kF1FMyzoDeYikYGAxENgjNQeDkguYZqBTj08S1HURTFAmaj5A4hA8WRnI
   sb2f3+bTVP65OLzDqUbBl+t7F6Jb9kbniA2c9+KFvgmSbVuFU2C7uV7fz
   pQB84mgohrVN4ent42q5WTDtJYPwlyVNIb/r78TOmOTNUn5aMbWT1E3SU
   gvOEakPY9Z+NilGok2exiyJAeVhWmg7cc6umewmjLtltY2KkaQf4vJrwM
   Q==;
X-CSE-ConnectionGUID: 7z9rUU1STUWzYmq4HaoVoQ==
X-CSE-MsgGUID: 1GsxDu6wTBay+lv1szvEIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70717817"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70717817"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:27:52 -0800
X-CSE-ConnectionGUID: yLIpBoRGR5q2ON8a8Tjx9A==
X-CSE-MsgGUID: nGBz7pzLRheNo+A6RvMBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231226079"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:27:50 -0800
Date: Wed, 28 Jan 2026 15:27:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Remove duplicate error messages
Message-ID: <aXoO1HP_4HSAQ1l4@smile.fi.intel.com>
References: <20260128130925.123823-1-andriy.shevchenko@linux.intel.com>
 <20260128132314.GR2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128132314.GR2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 02:23:14PM +0100, Mika Westerberg wrote:
> On Wed, Jan 28, 2026 at 02:09:25PM +0100, Andy Shevchenko wrote:
> > The pin control core is covered to report any error via message.
> > Since that it's not needed in the callers.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


