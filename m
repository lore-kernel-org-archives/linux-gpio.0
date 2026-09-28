Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0544E650;
	Mon, 28 Sep 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589102; cv=none; b=r0g8dV6emNjivEtwi1VoSZ04TjJx7me2uyHSuS4blgxgIRoRgtrAVuF5llWN1ieHmmEy+sbKxCAXsUbQf2xdWilHjhx/jjEeLf/d4XqPL/FTcxED0peUl/2Tx+77JZR0e2f2ZoeC5cUrDoA4aWZsB6ADMObkck/A2OTToyj1DUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589102; c=relaxed/simple;
	bh=LBnh838ywoUlbEhzOjyGsHjS/fWu7vNnA0vlRJWfpQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpDc2velr0rurbEJDGabkI4wzRrJ1v/25N/SnF47rsFdku9jghW/ZdpXcj5fFfMG84lQ85CkiJqmHBGS6WkaofCq8OFLcCzqrcg3etM3zCBaqWief0poK/4P/zDdMfKl3TRSPKQGbeJJzGa0YmDZxgz4CjXvm6/xAOvOiUGqyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPCxr/Y0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPCxr/Y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790589100; x=1822125100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBnh838ywoUlbEhzOjyGsHjS/fWu7vNnA0vlRJWfpQA=;
  b=lPCxr/Y0hCit6+aRbFB0JGIoo+2RH+1OTcGDKEq7XqkMR5l1ZIJWU261
   Zc+ANrw80xSxI7bi6/UIYRKV/K9irTqalKsCVk6lWE6NFz1ZTYiCQNfeb
   JCu34aHnZ4UmMCHt3BcxRUbhzy9OYsrwnq/4ie981NeC2N6TVPKdoh0oP
   SOw9YD3fJDzF20Rvxu03Zo4/gueQi+I1qM8vTPVSCmgZC5Js8d41F65u2
   W5oCRLlXk7EB+5x71zDi9tzYaBx0DLdWtM0yBiUgoluA1l6uIo2c8rb+n
   C6mkO8JLiGtHW7ZJ2+7LGvkUHbIppza1tECxuNNY3T5XEeDdgwGzDO9sg
   Q==;
X-CSE-ConnectionGUID: LO2wGStCRySkGq81mTPPVA==
X-CSE-MsgGUID: D2DwRpsvS2G65P/vhcJd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="95099109"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="95099109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 02:51:39 -0700
X-CSE-ConnectionGUID: vCc0sieiTQSOjmr0SBQ9Zw==
X-CSE-MsgGUID: id350Q6MRjiC3UZfX2yyqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="272804455"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2026 02:51:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 07ECD99; Mon, 28 Sep 2026 11:51:37 +0200 (CEST)
Date: Mon, 28 Sep 2026 11:51:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with
 SWAP_IO_SPACE
Message-ID: <aro4qbhcd3X6wTvP@black.igk.intel.com>
References: <20260815094451.31792-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815094451.31792-1-adilov@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Aug 15, 2026 at 02:44:49PM +0500, Rustam Adilov wrote:
> This patch series changes gpio-realtek-otto to be functional around
> SWAP_IO_SPACE config.
> 
> Firstly the ioread32 and iowrite32 in realtek_gpio_update_line_imr()
> have to be changed to their __raw variants as it is the only point in
> the driver where both devices with ports reversed and without meet.
> 
> Secondly, the bank_read/write and the flag for generic gpio config
> have to be able to be changed to the opposite one when SWAP_IO_SPACE
> is enabled. To avoid breaking any existing device tree out in the wild,
> make them overridable by endian properties from the device tree node and
> keep the current GPIO_PORTS_REVERSED quirk as it is.
> 
> I have tested it on my RTL9607C machine with SWAP_IO_SPACE enabled
> and with big-endian property set under gpio controller node and it
> was working fine.

Convert the driver to use regmap MMIO and most of the code in this series won't
be needed. Also it will give some benefits (like register caching and debugfs
monitoring).

-- 
With Best Regards,
Andy Shevchenko


