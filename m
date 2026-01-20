Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529142B748;
	Tue, 20 Jan 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916890; cv=none; b=Ayh0fAox7H/4+Oe0ABQ/Su81V46PrvHBOG1I/Vt16mW2SeQ6juNROOk2QwNeSei5W9/ha9o9nRguyJGeNz3wczul0O9W5u/CjY2JCAXMAClPPBr2H5w4oGEivnKxKEYva6INifmeIIipWB7TrZAAtL/rOu6a9ykKWHr0AUnEgaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916890; c=relaxed/simple;
	bh=a8/Rp5xs6Z5wuwvztzn6bvFo/wLCNqkubH9OYQ0J7L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYqQbP6TSkeiKx6KHyjz/1wAFyMPJj3+D33PEEXsyCacvUt3WXwSRMeJtDT7g3MX2kNd7A8wLD1T91uEXKmjEBkQd/L1AsBuyeBkZb5Rbbjl5rI1sVGvku6SjPCw3APCk3ym2NtNPWJVq9yHaf+HPNdX5CpwV4xysvSe0p/LIEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYTE3rIj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYTE3rIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916889; x=1800452889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8/Rp5xs6Z5wuwvztzn6bvFo/wLCNqkubH9OYQ0J7L8=;
  b=aYTE3rIjK+YMMEq/IyeDKYPvAq1YlqGgJonUfXFvCflXhC0uRt+8YRaY
   RXZ3hI9IaSA3PUsLY4mNq/cStZvBeojgC7Od4ROJxfJ5IPhC1O2CzXgZq
   /uIs2CaazId1FwBmaxIDOgMPtO/yIrzs3jYrBqXTJbQgJ81t/EbGGa9vo
   RR6Mp1X+xj3eVG3S1ntswj5Xk6ESNk5/TDS0xNfoktz7q8Z/xZai4tdEJ
   +PQk+Ukc5W6HntmHfs6GXmPLUK0RIZGQt3kzpMQf2JivQcvtHxGNJUQIn
   j8prLEZGpaEg4IaxcLOM4JvFokUgYawtvXZM9FbX64hW1cs3KxL9SebSv
   Q==;
X-CSE-ConnectionGUID: Scc4nJF9S/GKnK1uHTZttg==
X-CSE-MsgGUID: enPgc4rvRZ2xQc3rpfyPig==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70027970"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70027970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:48:08 -0800
X-CSE-ConnectionGUID: zDdCs6T5QmWK/h0JODriCA==
X-CSE-MsgGUID: zYWVGsq4SGmj/3v0CfQ/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205745921"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:48:06 -0800
Date: Tue, 20 Jan 2026 15:48:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guido Trentalancia <guido@trentalancia.com>
Cc: Raag Jadav <raag.jadav@intel.com>, mika.westerberg@linux.intel.com,
	linusw@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: tigerlake: Add Alder Lake-P documentation
Message-ID: <aW-HlIXTv6W6fye_@smile.fi.intel.com>
References: <20260120110042.1021199-1-raag.jadav@intel.com>
 <1768913556.5518.15.camel@trentalancia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1768913556.5518.15.camel@trentalancia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 20, 2026 at 01:52:36PM +0100, Guido Trentalancia wrote:
> Someone erroneously marked the bug as CLOSED INVALID, while only the
> proposed resolution was INVALID and not the bug itself.
> 
> This patch solves the issue because it informs the user on the correct
> driver to choose for Alder Lake-P.

Yes, I was that person and I asked Raag to help with it.
Thanks, Raag!

Now we can close it again with PATCH_AVAILABLE.

> Acked-by: Guido Trentalancia <guido@trentalancia.com>

Thanks for confirming!

-- 
With Best Regards,
Andy Shevchenko


