Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793743;
	b=FRTR53a/hfivvgndcpzr9RasJ4dTVHi35Z0Vw5iFf3IpsQPjJNC9VV3x+qhNyPqZsNd/
	 FUvps3FJ9eA/yaeLDa1rjLda894kqj30omqN1wWCY4vx7CAlGw6al7N5MV8hqqdwIsmGp
	 9n4Dk8vahGuOIbVE/neD6fuKhIBEzvaRfQGOvWdBeNXce8vU/kAX81FNHIX++nrCS9Cah
	 Xg/h5P7+4oGYTbIVhEAE8aXf8ECxTRQEDemoYdPTix8VbkkKy+Z7h94shIvgOrFVj28ao
	 NjT/6R0RZX2Kwe69Ewn9XzbBKAzVd05XcdViXAhLO9/23YW9NxsFXS15BoCBDCoXSVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793743;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=1/YJyaKOuLzSztSgBWqqjlgC5XHFnBrPrAE4BQdaQwQ=;
	b=gCsYbJbQ7T0YO7XbjrJfdbXwM91w51fDA1khCbDfD6jlbRs9OyLEf9lSCCKyDnwlR6CK
	 3xaCsnMwoI86OnazvNBK/CFt9rL78IoJ7htGCQo/ju6Iu7KL+AGlIpn1nmr685xpgGfoz
	 fZmC2o+l1RO3JUMzJgqFDz7y4ymcsXvmUBNUlAEtGmXRsQf1q2HDeFVGETy0GpSfytcbs
	 vd+LQE90hJcwmlejgDOtbvRFJeX9i8YRrVE6JTFsJ8O+BhsKDtVChuRU0OruyMyi2YICq
	 AIaWKTsY7hrlkUCjV8T5XBWevkOZZIk/q0eZY5U4uIz8DB09dI7OMefEghN1e6K3WlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W8KCAwbM;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93315606A329;
	Wed,  4 Nov 2026 12:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93315606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W8KCAwbM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793743; x=1825329743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1jP5DnfU36DH+aXQagEiUXnjE1+hQoNjsWix5hElcvw=;
  b=W8KCAwbM5Ci4bqL7yAm+nxP1qDk3PBwFz4U95zXdV13N0V73T+9xVu6S
   1s+g9ygrJ2kruZ7efOGZSO/pJb/aj5HE4NUWaA4YFNxXu6gmxJ4pw4uB2
   /5C6XkYqppw280leEGyko/R4Snxfh2PjYiVGmarq7Z7EjJ/G0zNd1Zs0K
   Jj7xH5Uf8ZFIZvIbfjePjLRTYcG8+nqmg5rduyFKEpFeHmykhyyI+WLdU
   Qh5/6LWR5+VRhy717U7Uo4Rys8QmLOCoDUmDPJAf2Bdeya+qE9oWiKQh1
   vSb7jZbgR+v4M2L/MOAYtN8577Ly6CBfHSdtntU87pG5QNMJxtzoXIHrj
   g==;
X-CSE-ConnectionGUID: pYpoTNUhQSe4iTjxonzAdA==
X-CSE-MsgGUID: 0PiTR+/IS8aH6GlO99CazA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2445210"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2445210"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:02:20 -0800
X-CSE-ConnectionGUID: QbMOL/dCTiq1Z25P7nhmpg==
X-CSE-MsgGUID: PVRsCUtHRbq+WUKam2RoLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7249539"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:02:18 -0800
Date: Wed, 4 Nov 2026 14:02:15 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: intel: Convert to subsys_platform_driver()
Message-ID: <ausex3-tVRSZExuW@ashevche-desk.local>
References: <20261104113343.1634218-1-peng.fan@oss.nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113343.1634218-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 07:33:43PM +0800, Peng Fan (OSS) wrote:
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.

Will wait for Mika's tag and apply later on.

-- 
With Best Regards,
Andy Shevchenko


