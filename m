Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DAE2147E5;
	Mon, 17 Aug 2026 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954534; cv=none; b=VDyslIVhDFVhLcQOoj9mlEwTNwlZoL3hcSkS10gIzgGmf33FRJNROgXb/xOcLK67jB3P+H7ZiZrVgnm0G5MeeN8WsgUhrE99P786JF5uDZMm992S64Wof5X6pwrgkKLuaWjwyi/kv1gi8QQC0AWOeOlY3diW4yvf9mcbfzPjOkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954534; c=relaxed/simple;
	bh=adhpnUpRbNU6Ud3ZAqVP9KjHxiZ95YG3SqN2Z42My4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buVRvWch5t2eEftIZIo1MdLOw/PxlCecXo4w/NagVS0ztiYAGUUIQ2ErGwgLSXnYEaPDDe+6rEJbNHPw0tniVa+yzXANZiso/NaSz3AZiihg2aEHWc+NrvbJKUDiRP+APrKWyk+4gQTqQ/pONSNog4rBwMcIJV9mHd947HTLYEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeW52l3T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeW52l3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786954531; x=1818490531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adhpnUpRbNU6Ud3ZAqVP9KjHxiZ95YG3SqN2Z42My4Y=;
  b=DeW52l3Tr0r0AgdikvdCqVJ7sE3fxZhANJy/l5S1NywHtuIBikfA5EU5
   W3jldXrPmnA1mo4PIQHen2XfVr8ek7tsoNriVpE3RTm2esxlhLv4aELnD
   vgHFerzECyXbr+INCrdIIlF4fTQyvXyETImu5uI9bLCMO5ei82DMjL4QK
   Y5YN9WehhviM0QfP4yKVic+JqOgVPV+vh1meOZgsSPytJPvg0JaWDDspW
   I21i13q83ePPY62EOSdlEpfx6oDB+ePUzCwhi4QK+qq8W2bfH/0jQMNp9
   eKOPWqFHJ7dVmx5JE36kM3pfxpN13Fgkboe1XsN/OdsfQ3pzRcnFdX6UL
   g==;
X-CSE-ConnectionGUID: OPH44hXsSJCQ9GgPNcK72g==
X-CSE-MsgGUID: 7Fdb67WpQCec2gathkFcbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98086705"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98086705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:15:30 -0700
X-CSE-ConnectionGUID: VwqakQcwTDuNc+7dH1xmyg==
X-CSE-MsgGUID: 5apgMqqsT3SLmIsOf4ltew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="266830224"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:15:29 -0700
Date: Mon, 17 Aug 2026 11:15:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Tai <james.tai@realtek.com>,
	Tzuyi Chang <tychang@realtek.com>, CY Huang <cy.huang@realtek.com>,
	Stanley Chang <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 5/7] gpio: rtd1625: Narrow 'hwirq' variable scope in
 loop
Message-ID: <aoLDH1hk7z18CHv-@ashevche-desk.local>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
 <20260816-gpio-cleanup-v3-5-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-gpio-cleanup-v3-5-f298cdd65fca@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 16, 2026 at 11:17:34PM +0800, Yu-Chun Lin wrote:
> Declare 'hwirq' within the inner block where it's used to reduce variable
> visibility.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


