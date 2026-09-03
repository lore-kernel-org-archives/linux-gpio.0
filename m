Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202C499F0D;
	Thu,  3 Sep 2026 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436472; cv=none; b=XVwIGSmsVyrnJoi2AMdptyUhcaYyvrZHdbnBXQ8g2a+3oVHD5IQSEDee43zclvFWQ31CGSH57ZzBuRWzgXmZJzWazLG38vBq9Kuzc8zAf8xwGjyGceDLuzpiysZr2irwueX3pxf1q85JcH/XVPwJeAM+jdXA/BBlVyB28nqoHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436472; c=relaxed/simple;
	bh=fmx4U5BXoXBWEPpfKRMDhgFzzGZ6yDJ23YHB1/dwg+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgaRwYUa4IWSWjLfrN6OvoF9nRJlcah9hxe713gZNrhbUzshbJInJ/3zdO/VOVCICYG9XowwKzbIDmLSr1bN1NGBSlvQLS7luCs/R2It65oIqaxt2gGnYUAivlqE2ttKIZDCFkIKo5pFExZQQyitUqtEnOYTkH0B9heyls3+CLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPmHW6ho; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPmHW6ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436469; x=1819972469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fmx4U5BXoXBWEPpfKRMDhgFzzGZ6yDJ23YHB1/dwg+o=;
  b=YPmHW6hoyF9jKlaZTcz/PHQs/+dIi5kEyyGE6kXHvGUKGdtHwfoCikAn
   oYU8laZ3X+NsCf0xVoIgvs3Hla5ambeHc2aXjNnlAnf7SwW8eQ0j7w+Ez
   /1hZPgZLIYjGmHQNndwUKl3qB+1jkdoT9yExGmdWwm7hPE3MnaXFz6YWn
   MJqeWl1if1LD0/QsdLAW692N53fI/hBmZZYNHtvkh80Zfv67hUSCf7RzL
   1uslnI8BNzlWFDb59IMyrv7TzsmpfTkyejiAhbaKII+9rya06F56vM6JN
   F5/jmItO6qFdXaItcK54X6LFoVE4Pe4JSCNn+zFEDFeSyPFrYP6hlqTD8
   Q==;
X-CSE-ConnectionGUID: kM4AQ+T1TzS7tOY5QkRQeg==
X-CSE-MsgGUID: 5zgvsuCVTE+tYUJzh4XcqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88948204"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88948204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:54:27 -0700
X-CSE-ConnectionGUID: pboMxKB1SYKIuUpA+N4AhA==
X-CSE-MsgGUID: kx38B5UTQWOM+E20zMAp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273850425"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 03 Sep 2026 04:54:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 21E9B99; Thu, 03 Sep 2026 13:54:24 +0200 (CEST)
Date: Thu, 3 Sep 2026 13:54:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Radek =?utf-8?B?VsOhbGtv?= <rvalko@lipicko.cz>
Subject: Re: [PATCH v2 0/3] pinctrl: intel: retrieve pure platform driver
 data as well
Message-ID: <20260903115424.GN106095@black.igk.intel.com>
References: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>

On Thu, Sep 03, 2026 at 01:46:11PM +0200, Andy Shevchenko wrote:
> The reported platform can't be enumerated as it misses driver data
> associated with the firmware node. Instead we should use platform
> driver data. This mini-series to make it happen.
> 
> Changes v2:
> - constified parameter in intel_pinctrl_get_soc_data() (Mika)
> - added tag (Radek)
> 
> Cc: Radek Válko <rvalko@lipicko.cz>
> 
> Andy Shevchenko (3):
>   pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
>   pinctrl: intel: constify parameter in intel_pinctrl_get_soc_data()
>   pinctrl: intel: Try to retrieve driver data for pure platform drivers
> 

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
