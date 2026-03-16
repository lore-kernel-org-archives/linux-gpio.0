Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A2238A708;
	Mon, 16 Mar 2026 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653981; cv=none; b=D/UNHHt5tcuQj476687ktLKuud0LuJuCL/gerRhMkvkygQ4On7gMQinpLexWogv/l9UlU4dwbZJMCH++kedlAa8Mrtypq11B25/K5iRcOXhF065gOxqFL6GGCWQ22iMYcrB/U79iwqRNOKOYXgdRYaXY54d+Uqki+hvkSJUNQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653981; c=relaxed/simple;
	bh=sFax7KVFmBwnkHO9Mju4Q1a5pWjn4SX2LhJX0iJ6Mjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB98QAWMUYP5Mxj+Fs5eGrDlw+PsP2dY1zKfN5iczuElWT9PD/wahRo2X/+mK0RcFM3M0L1ivGnWeRKpiga9pWV/IpDzkEaOP+MTskPd+v7twzOTX+zA5VOANS9jAcsV0DDK6sCabGXrVNB2R7gCC780uv+Ad+HgXi0Uwy9EKaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZUk+OhF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZUk+OhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773653981; x=1805189981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sFax7KVFmBwnkHO9Mju4Q1a5pWjn4SX2LhJX0iJ6Mjo=;
  b=IZUk+OhFZ1dIPDxvuIJ4SywiNkIFrf5vnJrg8hZklnu7FCJlhN1yvNgz
   nCaGYR0g6mRLvq+GGnyY3k+ZgUFpiGUvL5a++lPiH0TiJAfugVt1VK4Mm
   KEjeywpNaiK9fQXLPbBaotrGRxwplIQUDz2z8JPWzh4j+vZuz3awsWejG
   mUp/YZY5cndIOI29rfS5FlnBd92u4gqZPIuyleDHWf0poQIBcRt2wO13Y
   U4X6S0EXlyhAJvrB3t5uJWk84JbKXl9QBHXbLGLCiZnEC4NOk7NGHZ275
   jAkMKr3d7tK6LC6b5NJueYLnHHzK7xc4KlaQSvOAMZVjWCEcl/azObauN
   w==;
X-CSE-ConnectionGUID: cIA/e4XfQ1mHI57QtgGV9w==
X-CSE-MsgGUID: G5rXod3vRKumGbwWYtijFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="84981339"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="84981339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 02:39:41 -0700
X-CSE-ConnectionGUID: VpmjNsV9SWuagmuws7aekw==
X-CSE-MsgGUID: cbYCVSo4SKWtObkRq7OoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="222059288"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 02:39:39 -0700
Date: Mon, 16 Mar 2026 11:39:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Do not enable the v1 uAPI by default
Message-ID: <abfP2EzJXXgrxAWO@ashevche-desk.local>
References: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
 <abfN3bE0BMhkj0_R@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfN3bE0BMhkj0_R@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 16, 2026 at 11:31:13AM +0200, Andy Shevchenko wrote:
> On Sat, Mar 14, 2026 at 12:07:50AM +0100, Linus Walleij wrote:
> > It's been five years since we introduced the v2 uAPI and
> > the major consumer libgpiod is at v2.2.3.
> 
> Buildroot is still at libgpiod v1.6.5.
> 
> > Let's discourage the old ABI.
> 
> Anybody to ping them?

Ah, there are two packages, one is libgpiod (v1.6.5) and the other is
libgpiod2, I looked at the old one.

-- 
With Best Regards,
Andy Shevchenko


