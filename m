Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9DC288CA3;
	Wed, 28 Jan 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606925; cv=none; b=NDykt6Crgf8BngIS+ZqLZMp3+IIb7b0ZK9vMnxywa7Gw9ruocowlALrozcPebr4JMb4Q9G43pTbFLu5qdfiwxD0/tWuQPNee3MUyDZZAPrXR7ShgwN7A6tIblhKn6TnSCuW5BduAIE71kBNg1R7m/HBEEjzEb5EcbEbaiKFJuaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606925; c=relaxed/simple;
	bh=reQiiupQFcecc89VAABFySqAHkPwoL1k7lDCfkNfXzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY35gcx6+wQCT7BLGcoqhoroGa6e8Jk1t+iYiIC9R0zl5iUNcIoh+y+Hcv46VB1KTKCRmoV+yD28TpGw/VW+NlJuxeyCuhCQz4eBB5b82Bm55k5J11U6w4XC1wpusnrQ2SQcugwLNKLiiiBLRl0d9ToT5vFjjDdN+vDv9GCkx3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd3EjVpM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd3EjVpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606924; x=1801142924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reQiiupQFcecc89VAABFySqAHkPwoL1k7lDCfkNfXzw=;
  b=Jd3EjVpMY7sr4PwUQUCX8m7a8NTmfU7fA9Gq34gobRcuoW3B6am8L8cf
   UhsWM7w1uCWb4odQ1GDIdmIHCF0kE7QSVS170bT7EwBbZhg2lP6i4KbJZ
   fbfYJJQHrEGUNqPeBTtrR2aYLVJahRc6y8+wWSi6bSrrWNUMySCaIMcPl
   4to3Xm+FqdQcC51gVKIEVSEzaXqcraxkexKXk5JO/cbPkxCv8bBCcYGMk
   HwtycpeMsgDYphin+8W6lgu4GrjxSVSCBfehNvwCXhgWUmShRKXcw9FI8
   kyT5T+GRP3E55285KRifYvOxIUEiG2XuO4eeZM6nffGCEUj4i8pY5x6oY
   g==;
X-CSE-ConnectionGUID: U1Q9EhJKQI2FeZAgB4mJXw==
X-CSE-MsgGUID: qHUmXVMOTZyMtYZ67Sf/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70717896"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70717896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:28:44 -0800
X-CSE-ConnectionGUID: PK/jaK2lTZqgccaFyPdDkg==
X-CSE-MsgGUID: zBZi/NdPRYKokQFqdL1zIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231226269"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:28:42 -0800
Date: Wed, 28 Jan 2026 15:28:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Remove duplicate error
 messages
Message-ID: <aXoPCFPDVNl4ao_D@smile.fi.intel.com>
References: <20260128124635.40980-1-andriy.shevchenko@linux.intel.com>
 <20260128131909.GO2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128131909.GO2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 02:19:09PM +0100, Mika Westerberg wrote:
> On Wed, Jan 28, 2026 at 01:46:35PM +0100, Andy Shevchenko wrote:
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


