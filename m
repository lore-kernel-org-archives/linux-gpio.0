Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5083B3C14;
	Mon, 17 Aug 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954487; cv=none; b=SPXL9LH2uceZ2w5CUU26/RTr96dccGmatqEn3Sfy0lvJYsBAHxgI8RuO6tHATbulrhfZ7cB8nD3BCGxvcUAYN+ybThff1Rg8HfEKb1lyZyCSv00CQNBYRRvSf997VovFnyyhb9TpxLBYdEfb7xywiPL21C5YCyPKUczdF7zCpSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954487; c=relaxed/simple;
	bh=2xg2fqrWDnuVZV5VpH4PApn7JY+j0Dn23K69Vlu2gZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tghKZcEDaayOyaPXUrXR0XH1/odDMjaEqNXb9pfKfNcxiJIVAu9YXeLmW+0NWNgXwIXi/SXpS3/rWi+iT2osJMYvjl8Zh1Ncnf1EnjNAPKgHu+3u4PuaUsPqi+iAqamch/1h5cA9LfOy6SLdvLYFAQR6ixcKI9A/VW5DMQdkjBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2GCxGMv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2GCxGMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786954486; x=1818490486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2xg2fqrWDnuVZV5VpH4PApn7JY+j0Dn23K69Vlu2gZ0=;
  b=A2GCxGMvXrWoqWd2yHeerl6eLYJQwNv1IGQAInoqVG3gs5S67SJixoAs
   78lOeWWTvW1n0jAn43AVtm6B5/YC3sKW2Lf1KHVHOULMCRVfkpc6mqV0k
   0cTByade4GeHPQ8gTVom2xVT6w1p9PDopUtXAVCaoPGSd6UE72i4SB0un
   KN85XM5JQINpu88Vnq7k4dosSaamJbV3DaFQ90d/Yp3aN1e4dsD/mdjDr
   z7OpjTm+LozrZK07ozyugC3drmgE9UPw3YRzyCaK0NkmDKggsagPiVsHi
   tnB2vNC7qUHM8ymAXtz/H+LRTrnFgKba4794dChZm163CfCl1+AA/o4zA
   w==;
X-CSE-ConnectionGUID: 4kBy0UYpR9uwhaMNM0NA+g==
X-CSE-MsgGUID: s4fafC0+SkWeWECb5JRZVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87440673"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87440673"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:14:45 -0700
X-CSE-ConnectionGUID: z26KG5jgRwewx4eAI1av0Q==
X-CSE-MsgGUID: WsLOVbg8QbK2vwLLVxIYtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261110150"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:14:43 -0700
Date: Mon, 17 Aug 2026 11:14:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Tai <james.tai@realtek.com>,
	Tzuyi Chang <tychang@realtek.com>, CY Huang <cy.huang@realtek.com>,
	Stanley Chang <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 4/7] gpio: rtd1625: Narrow 'i' variable scope in loop
Message-ID: <aoLC8frbgn3fJ5Kc@ashevche-desk.local>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
 <20260816-gpio-cleanup-v3-4-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-gpio-cleanup-v3-4-f298cdd65fca@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 16, 2026 at 11:17:33PM +0800, Yu-Chun Lin wrote:
> Declare 'i' inside the for-loop header to reduce variable visibility.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


