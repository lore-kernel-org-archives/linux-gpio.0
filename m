Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC145DF71;
	Fri, 14 Aug 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709126; cv=none; b=btc1QLCqGfMeNCnf5ohtB4kI+RD2mmQUMCxz0Eg+D2Z4+oqbkF2MBD6pXrRY4wg7u/lROyoyLbJ0aXaIlQ65FCVegYcHuurFnFwrPEemxlB0OEDBE7CVJgpES25viEQPHpCd7kabDXcGSdhz5l9job8/eLInCCXEH1AqN9a53bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709126; c=relaxed/simple;
	bh=Jroc+2GcF38awQ+NU+nEuPPe+PeBeM0d4W60Kod36Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1lb5Kyxsyg42NPd1ZoL+HORS0ZkDyJr2UiAaVsll5ZesXsjG7vpXmjWRe5DDv1VjQoRe0Po8xAg5rNIZX7O7ljcKDGI6hwdcKl9QpDwkTDZkpr3D2Fh62jWhzgt4iEU0nCTfp1YGFPt9hQGkSCybFGKs+E2Gn64Q+BPLknolVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jimZ9P0L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jimZ9P0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709123; x=1818245123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jroc+2GcF38awQ+NU+nEuPPe+PeBeM0d4W60Kod36Rc=;
  b=jimZ9P0Ltr7BnXGmpNTYXseI7mmkqwf/BI9Akw+rD8hW3dQB3LkM9El/
   CmifuQBpaEmQWf8tjYgpwjk5G/oWClAcqXdezm6ksmAHYArtC6nOXuxjp
   Hnq2YZGrzA1ZiFDEhvhd4i8imnYhnqUYu692tv3knfzO6nzspn1414rYH
   wCvpMwic/Uw80jfUCYCCr73FKRBvNP2/dtKCPHK82725QtiOO5j3ZNyS0
   00/5kMIbim9HgWCrkhbVTSFs8jvhTDAsQhaal0UYeTpbYxgryFcwbz28r
   khFzxRMRNAmx2hlqq1HzLvo9tweCljpPEbQpX/O0ETAmlNYIpYw6l0/fK
   g==;
X-CSE-ConnectionGUID: piMGS9ZAS12SELjlzMxJIw==
X-CSE-MsgGUID: BbHntkoBT4egDT35Zw1bIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97878346"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97878346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:05:22 -0700
X-CSE-ConnectionGUID: g3kPdIEtSPKJYZDWxX6jZQ==
X-CSE-MsgGUID: 5fUNMkVpQFOlL/3qYWPRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="269395779"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:05:20 -0700
Date: Fri, 14 Aug 2026 15:05:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, tychang@realtek.com,
	stanley_chang@realtek.com, cy.huang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v2 1/5] gpio: rtd1625: Minor coding style cleanups
Message-ID: <an8EfgU5HqwyfKHA@ashevche-desk.local>
References: <20260814025657.1400452-1-eleanor.lin@realtek.com>
 <20260814025657.1400452-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814025657.1400452-2-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 10:56:53AM +0800, Yu-Chun Lin wrote:
> Address a few coding style issues:
> - Drop redundant initialization.
> - Remove an unnecessary blank line in rtd1625_gpio_setup_irq().
> - And move the comment closer to the related code for better context.

Not sure if this needs to be split to two patches (the second item doesn't
really belongs to it). With that being split out, the Subject may be corrected
to the point of _this_ change, id est "Drop unneeded 'ret' assignment", and
in the commit message something like "While at it, place correctly the comment
to be just above the referenced code."

-- 
With Best Regards,
Andy Shevchenko


