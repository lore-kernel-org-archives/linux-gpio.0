Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB03126C02;
	Tue, 27 Jan 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503696; cv=none; b=SRaBITcglpTyd61siqcNB/hGp7rapYahvmsoS6o7q4MSPlhhEz7lHBJtvrt4P9iHRK7/EQJmj1Lc5CfOnR2iG4iyc212IT0/DPyRQy/SJPFyWemK36upeNF+6UdLguOuL2dF6AUyo08xvUqF5EjE7UUJKMnmYgFlnDOqV480h+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503696; c=relaxed/simple;
	bh=QPfOxcDUpuO2/1G3DNexCBmoPtKGK5VPm6mvHYEI3x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXy8hpglI88QAMIsdLL7fyKZWuhnxQq5fz/WnZBPCxRK83nEDgUBqP8RE6ESCO3+kQVjOh4f8raGgzUkl2aELH89kAEDALyFJgsT9axVaJx32+uXVN0xQR5Ez8H5fTE2Pr03EplhnO1EUKJBf3w4oWdfiDdbcfMxxgMrYl/7GaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDtDEy/i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDtDEy/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769503695; x=1801039695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QPfOxcDUpuO2/1G3DNexCBmoPtKGK5VPm6mvHYEI3x8=;
  b=hDtDEy/iXNwEy4acZ4I6ZDEpGrr+QkYDwtgFjCcBvLF/gcVklURg+6SO
   VZNRNsu9pcUh3T0YYFktBQ0X4VrkYTBY6PR9R3TA6lDG8MFG9lCMr9W7F
   Wlc2nYS/q6kutUExfFEuKFBQwh7enyOjeTdo9X6Mj900eEYSRLPJFzuJF
   sqhpEB84nMQkXxTFOCP09Sd+JEgmGZXWiDEFxJ+P/TP932xNFvJGpcTbe
   shgCmBA+MgWChHRbAhMqLvuHg/MCrzebVmqAq+ZQRCi33onqU/WcT1cjo
   upE57iuWdjpwRNZVJA2xW1g0mEJq6Mw5DV3q+DobzwidxMBLVf1RENY4b
   g==;
X-CSE-ConnectionGUID: VerAglh6Rne4iO1TmAzpOA==
X-CSE-MsgGUID: pvRT5nDKQJ6iDeo2wjl8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="80997271"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="80997271"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:48:13 -0800
X-CSE-ConnectionGUID: 0r41CJhdTM6YTDt0u9Xa+g==
X-CSE-MsgGUID: 7e7xJETVQeagfglfTziUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207811965"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:48:12 -0800
Date: Tue, 27 Jan 2026 10:48:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: equilibrium: Fix device node reference leak in
 pinbank_init()
Message-ID: <aXh7yfEmOJ0zsLb0@smile.fi.intel.com>
References: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 27, 2026 at 01:30:07AM +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_fixed_args(), the caller is
> responsible to call of_node_put() to release the reference of device
> node.
> 
> In pinbank_init(), the reference of the node obtained from the
> "gpio-ranges" property is never released, resulting in a reference
> count leak.
> 
> Add the missing of_node_put() call to fix the leak.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


