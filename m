Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653841B355;
	Fri, 14 Aug 2026 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709293; cv=none; b=eahMe/+xrE+mOriIXnhj+ijb8P7N1/Iwt0BUhAYm+PFUgBnkr27eGNHdmB7uJalh6YwmS9wEGAcmjKlqVoN3f+rZE7Qmc6QuYTNhLemxqZxSjzcrWWNe+2AenvKhZctwUPcv0L/584+yUB/jHwrTgOJ+cHp27fBzDbur9dKhctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709293; c=relaxed/simple;
	bh=CIY5IVE9cMPEeidluDo6I1G6ebnV0FVFD3N11EkSlWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbvXdH2aNt0GlaWm0x+sxhF+SokS5Cf7+wtkgABdqfOVpkdXzzmtEuOdbLdrsDBcDSVzhe1vSbpC9jEbm+/IYOKP93NYeEO+Tj6E+U0rth5dKMsZFl9/M3bQvN8NX9Ap3lIDSEQyujZwfMQBGkkd9uDOfMKSjB48u+bsElRD1xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5LwMcC9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5LwMcC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709291; x=1818245291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CIY5IVE9cMPEeidluDo6I1G6ebnV0FVFD3N11EkSlWg=;
  b=c5LwMcC9xFHtOf9RQhArQ6NVknEnBgbZF550lyP1BzJz59bgcSLTbnyH
   vkU8jGJhS0DhBlkP5/6hDDbZH3ssPqiwCqpUCZYfRjZQDKPEHFlrujBCi
   zegz7ntXmNovC6AZOOeKsCFy/gv+6VnigbPBQsCnSLyIjwO6HySqmsJDN
   7Csu3AU6AwnOsZ6VV/eCPkERBJI3sVmpnhx8bTD9SlybvIZ+6wkqaOzSl
   pP7hMwbrkHsOaLudfs/Eo/448eEyGREnQquXX10hIxNTygTjKbX5y0zms
   wdg/WDyeap2hP9ejGBeJoYqBbKPQ/zXC9cdtnJ6UPZH7fgctgk6OrcLRa
   g==;
X-CSE-ConnectionGUID: rnaKlSJxSJOLH6avwqCvQg==
X-CSE-MsgGUID: d6fxagflSXmCOCE9iPSGsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87170475"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87170475"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:08:11 -0700
X-CSE-ConnectionGUID: Sf5guNqAR1yqmoOu239M4w==
X-CSE-MsgGUID: 6yULgY0jTamBcOcKt7lWXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="266196696"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:08:08 -0700
Date: Fri, 14 Aug 2026 15:08:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, tychang@realtek.com,
	stanley_chang@realtek.com, cy.huang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v2 5/5] gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro
Message-ID: <an8FJheU89AEtxcx@ashevche-desk.local>
References: <20260814025657.1400452-1-eleanor.lin@realtek.com>
 <20260814025657.1400452-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814025657.1400452-6-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 10:56:57AM +0800, Yu-Chun Lin wrote:
> Use the standard IRQ_TYPE_DEFAULT macro instead of explicitly listing all
> supported edge and level IRQ type flags.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


