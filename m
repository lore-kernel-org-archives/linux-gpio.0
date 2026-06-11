Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72EE368964;
	Thu, 11 Jun 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163649; cv=none; b=Oal0tAWYQifxHbWZ2g0wDQS2YjQ0BMv0sUDQKfmhJ/XOe8t04ed1NZMapUsqbMprkXstyJWhsa/7/QNMd8kCpUgwGWHo8ERAwM0OAcV/1zD7ZnTSkX28WDf0VZX3dDyyPJpqvM5hx9Ft4tbSpRIL8L3FG8BznFfenp9GpuPnYYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163649; c=relaxed/simple;
	bh=EtBBzuzmJjAETaGMYmFXXHi1JiRSciexUkWYIFLxp9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VugYrSTGW3lDKZAgIVr1bDpFC3HvLrQKlXVXtBQYwL+H55GaUyBn2QsAvKXSUHjqvY7Ck437DPPUYMWNe3bFBH0LQ6//sdAsvwnHoiRlG1edaAD0UzgpjQsrr/AK4IkJLF2c+BBjM9s5Yf2KXZ/ayfm3XqoOxmwKtG8FBW7V8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crI6WWvp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crI6WWvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781163637; x=1812699637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EtBBzuzmJjAETaGMYmFXXHi1JiRSciexUkWYIFLxp9g=;
  b=crI6WWvprArHCEtGC9dwqSGOKq83CfcmY6o0W+arvRwQRIqbYwEG1eh7
   ze1li196EFg9oqsIDpVFNJVdhomswEwTZykqLsXkNHYY75cbJHs8pTgUG
   JevgAk4ttF5/JqRFfmlIy7TZfBwxm1y8kRAXp6F2EdDsN5jz88e4e6fCj
   tb1FXvzXOLA6r1tHuAia9bLqyybIBEuXNkPPrza8BWlo4oJSi89Fu8mcG
   SjJRPID11XjNxhD+BRAuQjvJX04trsWkS1/pnGj7DT3HqtgmyLwxkEhSp
   KggTc84Pfau7CohHU6/YQCFBVUS9Vv9OrlDKDhQTnE6z6ILhx7oobfvPo
   Q==;
X-CSE-ConnectionGUID: ujPIgJW8TLuBm7H9lPNEdg==
X-CSE-MsgGUID: fzTXLxlZQ4aYWKMqwVRx+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="80985543"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="80985543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:40:37 -0700
X-CSE-ConnectionGUID: o6v78ewbRn6Bdcfqu/3NHQ==
X-CSE-MsgGUID: BPkFLZoYTJO137Yutnlw8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="241975575"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:40:35 -0700
Date: Thu, 11 Jun 2026 10:40:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Message-ID: <aipmcBQmBMA_FyOl@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
 <20260610142409.GT2990@black.igk.intel.com>
 <ail2tWow7VwWRkL_@ashevche-desk.local>
 <CANYHO6qOWA6bGx=iygf48X2sW_2Q6ThMV-f3rH0zCZ5AYiQyvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANYHO6qOWA6bGx=iygf48X2sW_2Q6ThMV-f3rH0zCZ5AYiQyvQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 03:17:04PM +0800, GaryWang wrote:
> On Wed, 10 Jun 2026 at 22:37, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Jun 10, 2026 at 04:24:09PM +0200, Mika Westerberg wrote:
> > > On Wed, Jun 10, 2026 at 04:34:23PM +0800, GaryWang wrote:
> > > > Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
> > > >  for device id INTC1055.
> > >
> > > Okay we can see that from the code but why? Can you explain it here too?
> >
> > Yeah, good point. I know the why? because I reviewed the pinctrl-upboard
> > driver, but unprepared reader doesn't know all the details.
> >
> To answering Mika's question,
> Upboard hat pins using SOC's native function pins, and pinctrl-upboard can
> map them to the correct functions through gpio-aggregator.
> Thomas was involved in the implementation of the SOC pinctrl-upboard
> in Apollolake,
> and he is very familiar with the details.

You need to make it to be the part of the commit message explaining this
clearly ("somebody who knows somebody" way of explanation is not an option).

-- 
With Best Regards,
Andy Shevchenko


