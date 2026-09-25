Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67A481255;
	Fri, 25 Sep 2026 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340879; cv=none; b=h4rsmmKXLacFo1Qhx385nt4JI8S4QJ5vK/0YAgAiluyPkiFPxLJc1HwTy6zixkH50HlmTBIvhrkDvlGQV5pMkxVqfqkh+hy2XU83c0wCxnjEsmZ1yrJwvxD9Wb7Y69ySjkwG6iQUGkefXmEL2dnUwT6jsL5IIv/4mw7Lo739yVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340879; c=relaxed/simple;
	bh=I72GnDGaHtaDHRKp6yPa7hGD+z05A+lQsyVNib1yehk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFjl4T0YTdtKdq71Qdx92KhrYsK0c2v4KN09xSdXfbmsmALvpOmgWPNZ8CoFxCvTkoEUo4/E0JbloyiaFNPu/8bokwLyW4Bw5AOoFrQa4ABvnKad6+dplW9l1kbP+Clm79Te9v3XAVKoIs4n+pAOLlMFIstV2JyDjcSuDhiybMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuOTVcj/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuOTVcj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790340878; x=1821876878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I72GnDGaHtaDHRKp6yPa7hGD+z05A+lQsyVNib1yehk=;
  b=BuOTVcj/KN7TiwULIfgnDf3ZcjUfcXgxxQnj5RvQsH4xMzczJrKh0d4n
   scDMLYTcBPOtrw7mpY0t4sjS+4Ffx/Ef9T47b2XX9BdmNRl+JiCCpMZPS
   hZfvLKiH/unFuRRjnlNDR5XVc1XCWLsPNWimBZIwSkhuISfMofVHkEw1+
   BWf4ypG0lgIulB76TqiKoiqvPKOt54ANrWwkWcU+0GnVZZnym3eLRNKUz
   ZKAyPF1HnK+CfVKZixjhDjlvHSIkA9g3TLJPHuAcHukUDsUjZCUH6CLCt
   mOOVSt4yIFQQltO4vLpY9sMLt4y5k3WlVPcTkLOmSYB2GS/5CWVE0b8NQ
   g==;
X-CSE-ConnectionGUID: +RLHaOHKQd+oHOoq5oFlMA==
X-CSE-MsgGUID: DQQ7UhhiRb+o8XrsSfUjGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90185911"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90185911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 05:54:38 -0700
X-CSE-ConnectionGUID: dZv9edWETZeqMuyoP3OM0w==
X-CSE-MsgGUID: +INsS4aKSWK/hvCevuV/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273880604"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2026 05:54:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 91E1E99; Fri, 25 Sep 2026 14:54:33 +0200 (CEST)
Date: Fri, 25 Sep 2026 14:54:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <20260925125433.GY106095@black.igk.intel.com>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arZRZfa7AmDxmwoJ@ashevche-desk.local>

Hi,

On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
> > In order to avoid maintainer mistakes on patch ownership: move all the
> > Intel drivers into their own dedicated directory under
> > drivers/gpio/intel. Don't touch Kconfig options as we historically sort
> > GPIO drivers by type, not by vendor.
> 
> ...
> 
> >  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
> >  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> 
> These are interesting drivers, not sure where to put them

IMHO they should be there too. We are maintaining them both.
