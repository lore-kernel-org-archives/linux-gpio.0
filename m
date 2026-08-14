Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D04611C9;
	Fri, 14 Aug 2026 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709275; cv=none; b=FINAkgW+evZR4xHJCy/G83jNAJ16mt//rb4flMeq9HDyuRQrNEW8/5BKv5LFdGq4WW+kyE4WcLtZHfJNHPTSrypPyaxB2AgnoshX1FTr4ov/kfTHweXODj1Vcum/dGSTqw+ihlKyEuC75duA83dNsFdpFAk+lq5YPyyCu8DQUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709275; c=relaxed/simple;
	bh=h00XhyQx6SrXj15KOMq2ecM+ERXHw8EZQ5VhGIAoCqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SN1u9FuIIrQeHuret45ohWUYpL9t5jfU9wk/OF9YFjV8ovq1ScYGQwcl7kxUbhEHY+Zg6KTYPZamWRGroVLoQQMrSDgISLI1ckScvctkQSnyvyAc72aYIgNVNom1Eu/cny+OLZr7tW3Z05/Iey+fi2DLsQumvDlSnvugjK5PlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tqq8PAic; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tqq8PAic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709273; x=1818245273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h00XhyQx6SrXj15KOMq2ecM+ERXHw8EZQ5VhGIAoCqY=;
  b=Tqq8PAicYmBJdYbY5lVp2s2PoJATOYTg1wTNGob20dJGm2xgYBY3XYkh
   mnnMNJNyCNyWArsogDuvHUJrNfmSG9I7PReyQsLWxLRtuyJuQoSw8SZDB
   lmflTFvW1scXYCxJPUbfdIJOpyy2ggvh+MUEXjEoRmuZxfRd6C1Yb097H
   D6nCtmbS15snCpVHexWCeCp+i7e/xABjS8lADU96iMnlEGQLW5xxVcZQV
   ysEXmBc3kLKFb0W7gwjZEoIktDTIxa/rJHQ46vnAV6+bybIFyPLJRqpyg
   e0Fm58Y3IWIarfchS5BD9HKQLnW1YTTRv0WLbHIil2bNEy6SJG9l47dNf
   Q==;
X-CSE-ConnectionGUID: 73wnjXn+TzGX1fcrCk5j5A==
X-CSE-MsgGUID: 90j4e+2nQ8GxJ5GU+Qoc9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86250344"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="86250344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:07:51 -0700
X-CSE-ConnectionGUID: ZSlyk1cmQ9y3EhML8UfK4Q==
X-CSE-MsgGUID: I2E+IVpMSVuaWQdQY8rtLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263777500"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:07:49 -0700
Date: Fri, 14 Aug 2026 15:07:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, tychang@realtek.com,
	stanley_chang@realtek.com, cy.huang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v2 4/5] gpio: rtd1625: Replace pr_err_ratelimited() with
 dev_err_ratelimited()
Message-ID: <an8FEjrFZIRN6Jqk@ashevche-desk.local>
References: <20260814025657.1400452-1-eleanor.lin@realtek.com>
 <20260814025657.1400452-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814025657.1400452-5-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 10:56:56AM +0800, Yu-Chun Lin wrote:
> Using dev_* logging macros is preferred over pr_* in device drivers as it
> provides proper device context in the kernel log output.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


