Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE735F161;
	Sun,  4 Oct 2026 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791102539; cv=none; b=Li1Mkdov30Ikk0IEMqW/9xG2ktsBrd+7V2jp4gS1Qy6uK6Lrhsn2T09FtJ4I4Dh07kgQZ1yHqVaaPm7o1QM4B0kLgUoSLzBQPSfThQ1K1fs14jDzhAR9odfxPHsIP8gJ6Mhq+YcZaNvOB1hMbBPuyQb9jkKFHjRPZWthS4dQNCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791102539; c=relaxed/simple;
	bh=DyCCifF2eiKxtMwZn3NsN9SFtXdsEgn5WFJ0W/q6EQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1i0i/LrSUlXi1wHx74QU/r6SsVMOPohP54cZdnwMtpkZCXm8dR/PchZnskAgMpjnAFuyvW880SZu6ICV2RtcQzfDCPfyUoXS3k34mggf0SJ7AkCeSX6whYj6LipfrN4aV5zST8BiB5wcObKtXsex6haftTCoXwc6z1m3IgXLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWmeuxQS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWmeuxQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791102538; x=1822638538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyCCifF2eiKxtMwZn3NsN9SFtXdsEgn5WFJ0W/q6EQc=;
  b=UWmeuxQS7aMl3pQTKDUJYDKVCmkqySZwx+/7/KqubrFaPnbETk+HQX2v
   9cH5lgeC0jCOF6LKSH6t2nlVdEIVUPNSIl+FPTVfx+8FG5C+ijy6D3HAN
   DtAZ9X4mcznnZU6fvqtqAa+oKBg3H9n68Si7bNTApQXyVlo38BcBOOqbw
   5di3ODuAxjpg7beRqeEd0yNbuKpKHAZR9wyAV+Q+xTFbrRRHOT3Y0IJmk
   ie1nK/8ftdUXTConNvwCRe7wXvMwUcHQk9H404q0FLLunzPZKMHmwDV7P
   ZAvae3eEq12VECpWEA2JetdgH4UtjTJQdbJjpT9CaMUpP4Qp3n/sL3j2u
   Q==;
X-CSE-ConnectionGUID: +lG1GezLTLyyhktY1LtYNg==
X-CSE-MsgGUID: Fif7R31gSySbfd31QehOww==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="94512817"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="94512817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:28:57 -0700
X-CSE-ConnectionGUID: DcY6GtM5SUOYXxFLfucUnQ==
X-CSE-MsgGUID: 50LicehBRae5O+HoCGWcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="274689930"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:28:55 -0700
Date: Sun, 4 Oct 2026 11:28:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Junjie Cao <junjie.cao@linux.dev>
Cc: brgl@kernel.org, linusw@kernel.org, ptyser@xes-inc.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] gpio: Move Intel PCH type of GPIO drivers to the
 intel subfolder
Message-ID: <asIORD7gXY3VJ__Z@ashevche-desk.local>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <20260925160913.1648565-4-andriy.shevchenko@linux.intel.com>
 <20261004054809.24211-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004054809.24211-1-junjie.cao@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 04, 2026 at 05:48:09AM +0000, Junjie Cao wrote:

> One small note: moving GPIO_ICH under "if PCI"
> also excludes its existing COMPILE_TEST &&
> HAS_IOPORT path when PCI=n.
> 
> I checked that gpio-ich.o builds with W=1 in that
> configuration before the move. Could we keep
> GPIO_ICH outside the PCI conditional to preserve
> that coverage?

For what purpose? Yes, it might compile with PCI=n, but it makes no functional
sense. Note, that currently Kconfig puts (mistakenly!) this driver as memory
mapped GPIO driver, which is true, but not the whole picture. This is part of
MFD driver, that is solely PCI and never been anything else. My series rectifies
(or, if you wish, clarifies) this.

Also note, that having compile test enabled on PCI devices with PCI=n may lead
to build issues as PCI doesn't have full set of stubs (yet?). It's not directly
related to _this_ driver, but MFD parent one might be the case.

But, of course, it's not a big deal to add " || COMPILE_TEST" to that "if PCI".
I will consider doing that if we move forward with this series at all. Currently
there is no consensus on what to do with some drivers.

-- 
With Best Regards,
Andy Shevchenko


