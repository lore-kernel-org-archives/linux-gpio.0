Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065D3B6C17;
	Sat, 26 Sep 2026 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417255; cv=none; b=D0vg8kEmqyOdRKLhZwYtd/QmX5hyPfA1+YYOmQ7ioEPMiGG28NWRQFupTKX4ZramyYz7eBNHuLHpS1viy4aEQDDH4Tsqsx1Tz4PufpnZbrYod4udUTnj4vCjIhJ83H7r+XMCEY7fIufAyeXlRaknJdOZRfgdHGG2xHy0vf/5tyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417255; c=relaxed/simple;
	bh=PUf3Q5Sv2k7pX3rA5zMDuBn70gSD4iwt+XeFIpFvflU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjvGbad+tDFBP1jgzAD9TSoHm3IFI87EXmm6k9ckUOThpT5dJlmGwlG7cSVrPlBtHXciVUfbKRVCARrBtkz2d60hwCDvTNeJ6Li5B5Wwu9UeT4jk3yibgUFV2RKaHgIwQqTKE6nXJ2FDTQ4XAf3W+iSfCiQjDc0MlQsss0xuhR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHIsr8uj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHIsr8uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790417253; x=1821953253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUf3Q5Sv2k7pX3rA5zMDuBn70gSD4iwt+XeFIpFvflU=;
  b=XHIsr8ujnk7eNdcp03P5tjeTwg15hvaODl7pxdw+SjPw7Ra4/XKCg+tA
   vLXWpEcmHGdiGUJswOrnvGduUVB6Nl0meAUIOM/03xGgblQNMDtS0uELA
   FCIHxQmePnMbX2vbwLXZas1wH6z9rYxqBzF3MYdpBYnd0G6eSv0oao7FN
   3O2kDr4ua0esvUDB9StH9Fl+jl/COyyGd7mxk0x/FvU1mCNfRu9DUK/7R
   D3AbFpz9fdXHJvk7Af450JOLJaqiA5qFQ+hrRZp5fSz06l6mUooIknS+H
   DyYmetpDhQ16zmXN1snQd8NHrktMorysvxAsI6/l4TgaoEw6Ht11YoIJP
   g==;
X-CSE-ConnectionGUID: BKg28W4ERh+JKkDn+XnLeg==
X-CSE-MsgGUID: jXMH4umSQ5S0YQ225QmEzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90313869"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="90313869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 03:07:32 -0700
X-CSE-ConnectionGUID: ArflJXITSaCmx87/ZIbUPw==
X-CSE-MsgGUID: 1MnTwahERmCYsMlKtRg0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="274109215"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2026 03:07:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7366D99; Sat, 26 Sep 2026 12:07:27 +0200 (CEST)
Date: Sat, 26 Sep 2026 12:07:27 +0200
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
Message-ID: <20260926100727.GB106095@black.igk.intel.com>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
 <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <araGjQoaffMhDMLz@ashevche-desk.local>

Hi,

On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
> > > > In order to avoid maintainer mistakes on patch ownership: move all the
> > > > Intel drivers into their own dedicated directory under
> > > > drivers/gpio/intel. Don't touch Kconfig options as we historically sort
> > > > GPIO drivers by type, not by vendor.
> 
> ...
> 
> > > >  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
> > > >  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> > > 
> > > These are interesting drivers, not sure where to put them
> > 
> > IMHO they should be there too. We are maintaining them both.
> 
> Do you send PRs to Bart or you just rely on him to take the patches?

I don't expect these two drives to get too much attention, and they could
be contained nicely inside intel folder and that would help Bart to
identify that these are Intel drivers. So your bandwidth would not suffer
even if these two are added there. Your call.
