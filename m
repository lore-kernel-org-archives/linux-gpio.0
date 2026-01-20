Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3E42EEC4;
	Tue, 20 Jan 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916814; cv=none; b=ROc/vWLfCpintmrUyZouoCqb3+cCMAmPb2WwEYDj1sWsiqzw+i8YMmHbfcxIg3TXOPpYU9K9ZatIbBiqFSvJKJJxoP0aLEfERDZRkjpngrNbQCqGICNFsFvUHqNZMJBQotaVrlJC2P9CQzJtsaF77P6qbP9+dHsqA8w0kdpIxV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916814; c=relaxed/simple;
	bh=ZJcYNTdij+GVlvAMKN2o5xPtEZvqHrO1C1wRwO6SMNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6hWlLUSQhYmSiMEJU+plToVBb7vV4vCDg5Y9QlfAUleqS+QbNehbyX1xHpUqYgBhDvRGN8+Zq0SyN299+ue9WHMLttMGY1iLhIbT88nGj/Fpdih3h6POtDkoDST4FHMxGEk9hlgQDX8O4LCtPZQUbSyByVoCFExlZxMWYrQOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXOhZkWm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXOhZkWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916812; x=1800452812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZJcYNTdij+GVlvAMKN2o5xPtEZvqHrO1C1wRwO6SMNw=;
  b=PXOhZkWmCsljm50zim7bl0cf/uWRrTWLeF7CxAlDzZTmv2NfxievYk7B
   eWmR4PfzQRbF3WQsC7vSDVwZZlu3T5130Tjfp+j2/7hrmJf/5Yz+txPdO
   WKoa8E4bk60em30lS38hMLjFg+XeIc96OW5BzWd5hcZLH1ZLxp+0c0lAI
   okKethN75yY/OjsNyaO6GH6cQo0o7ilwKRos8XElcgdm76z45PPlI4Sfy
   ymudNpgm2EAsKpxwRL40N6MoJxMvGJI0WGJdjCKTZP7h8Pio65P1VMGmQ
   otv1sFk5C9fELQcAS3KVTZuq1Eo24TAMkuouNUPe2znbtS22c33W7qwKi
   g==;
X-CSE-ConnectionGUID: xUlccsRPQ/O7TOO+RbQPUQ==
X-CSE-MsgGUID: ehHUcfN7TmOeUSfq7A6PBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70177786"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70177786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:46:51 -0800
X-CSE-ConnectionGUID: zuFigJWYSvONGH+WK62IxQ==
X-CSE-MsgGUID: VS2Y05uUTGmUsGhVKcxZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206162969"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:46:48 -0800
Date: Tue, 20 Jan 2026 15:46:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: mika.westerberg@linux.intel.com, linusw@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Guido Trentalancia <guido@trentalancia.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Add Alder Lake-P documentation
Message-ID: <aW-HRvqc40ja60cF@smile.fi.intel.com>
References: <20260120110042.1021199-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120110042.1021199-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 20, 2026 at 04:30:42PM +0530, Raag Jadav wrote:
> Intel Alder Lake-P PCH reuses pinctrl IP from Tiger Lake-LP. Add user
> friendly documentation for it.

Thanks for doing this!

Side note, though: this is not the only driver suffering of the similar issue.
Can you address them all?

...

>  	select PINCTRL_INTEL
>  	help
>  	  This pinctrl driver provides an interface that allows configuring
> -	  of Intel Tiger Lake PCH pins and using them as GPIOs.
> +	  PCH pins of the following platforms and using them as GPIOs.
> +	  - Tiger Lake

We also have letter suffix for the above. Does this driver covers _all_ Tiger
Lake modifications?

If so, I would do

	  - Tiger Lake (all modifications)

> +	  - Alder Lake-P

I can tweak this when applying if confirmed, otherwise we would need
a revisit v2.

-- 
With Best Regards,
Andy Shevchenko


