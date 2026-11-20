Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168034;
	b=toqhg3PNSrfFE19W5cMjlz4qjl0Oh8hoEjTn0DJq09EQgAzcs07Ak3J8BmP0xVqxz5V8
	 3HdNxLdQoK7ieOCJZvz2y9twxjlMTl869rKsR8qygWGXc8vkxUKtQUVxzzt5pszc+dfhf
	 aTBUEV4DCyCysn2NPoje5tvJ/cTou6QXTG63ygtDnMSt1KtV0nDMRnZHMUHzg7uhQogA3
	 opyo3UTce7BahoB3Q/GRmjC2b8PsvPp2bAcg6GXQ+9ijK38xV2dplO/QUauFlp+dwEzUl
	 etbNuBPHmUfoycRWiAO+gLhyY8ALkwd7O65NZ/kh9U9c0jHpzbVWubRCaxEvTReWTPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168034;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=hNTyL9d5D046W9Uho5nbeG7PrmHuixoNuV1srGZZBx8=;
	b=IkUAbweSPhOJ3OBYAKyAjU0XJCocXIRMOgBhS71k3g4o5zb9FQB/Fj0jN1aftz821PgP
	 mufSnqgCFkyEYkGxyc5OA72fLCmf8FfRDLJXC6Il6UHU0kNc79nV0nC6YXED/OJ/ruLjx
	 wenRhzMLZGKvugUpx8geWoXiKtnivcTmUHLJn2r9ECderb8Z/zoWvXf3IiyevKP1TBFQL
	 jFzKcX6srXPxy45VHFT9pF7OBTkQeli5vwdV6FocDiigdiIWwWBRfp8rJ6aGPo12PsOTf
	 zQHGICa51xAX50YBYewbZt3ApMZS6PN7sUBcimuZdu2WF860hOu4CUva4VdPKiKmznQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X5u3r1Tr;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A1A606A320;
	Fri, 20 Nov 2026 09:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A1A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X5u3r1Tr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795168035; x=1826704035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cGtQIbQY0xSeQNRQi2tA6DmXq6v/2YbbkJ7U6WpvmTw=;
  b=X5u3r1TrAYcg1GsUSuK65UONtxql1o3BFtPp6n5AvYZ1gOQZJ7RS9AOh
   yYQHRutAHC7IPpFoR/RfZzlMCWU758kOiUurJV1HKWON1XRTL88MKRhU9
   U9Nddbpo1rIHFYROWKeGN+W6XOiMoU74gFszRVk9wzbXJz53+SWpsvnIC
   SUKwFcO6DfwMljVrJ3MCkl2rrmHBdshsBVUVO2lAc2kqUgk+ff/OGhlVc
   8EbHlik1dUoYdDtxDJVkn7HIq5Yx5eVg3u5+Sa/Qc5Bq/3s817xU/VSis
   u1EKYOi0Ka26awhbvLiKKWL0mgj9+Lc1I0uJwzYcnhz046ww9/7/bNIm9
   g==;
X-CSE-ConnectionGUID: WKo2HA8QQNG+QbSCNjgBmw==
X-CSE-MsgGUID: nvyu8ZEiTKC1Yc0wHrtmlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3927147"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3927147"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:47:14 -0800
X-CSE-ConnectionGUID: Fq3QEnPAQLypwoCqdEYFGg==
X-CSE-MsgGUID: doqsl1/vSSqHMlvopfUXyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12504486"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.218])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:47:12 -0800
Date: Fri, 20 Nov 2026 11:47:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: brgl@kernel.org, warthog618@gmail.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio-watch: Preserve line event read errors
Message-ID: <awAXHXfe8Lc09f3X@ashevche-desk.local>
References: <20261120061836.98108-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261120061836.98108-1-zhujun2@cmss.chinamobile.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 20, 2026 at 02:18:36PM +0800, Zhu Jun wrote:
> The short-read check sets errno to EIO even when read() returns -1,
> hiding errors such as EINTR. Set EIO only for a nonnegative short
> read and keep the original errno for a failed read.

Isn't somebody sent similar change a week ago?
Before sending something like this, always check mailing list archive.

-- 
With Best Regards,
Andy Shevchenko


