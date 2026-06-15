Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286163F54C3;
	Mon, 15 Jun 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532441; cv=none; b=X81OayG7fUQ40IX3Nu4qAuOYME53/GqH53IVCnsuvM56RoMYra0QZdUwStlBCcSwbkJU87bbBXS56nsYctBedsLFba+67KQxU53uIQSY9ktYpMoJBpW96/S7H1ylwAgCp0VgkFOBwfdo8/IVubeFZQ3LRI/6f/fv0dTGbqBoe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532441; c=relaxed/simple;
	bh=Bs+KWCg3ASY1Y+umTWqPXu7706DkOFRO8zfBMj2IXYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWbaoNdtcZ9aT4hvueWQ9b8vqqfAd5XmhdNyukH+Vt3vaUwG+F3MmnROVj/wI2AStcTxV9XvAjrw10OfHlIZdjOsOT4PA2V2gZBpAuwfm890JRwc3kso+DMFoFIKXCs5NGTOTfHuu84l/z9dJxbUJBos+T9/3CuZkCWE0PYzqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfUIv5Oy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfUIv5Oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532441; x=1813068441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Bs+KWCg3ASY1Y+umTWqPXu7706DkOFRO8zfBMj2IXYo=;
  b=hfUIv5OyB6hHNAoHblHvyp0igiB3Hh2lp6qjzVlVzcacN9yd9H1XO54F
   C/qIVkdYq6DGqsJnq+y3hh+ks6v8f5BcDDZcVb0FmOGf11QZi42YA3yVF
   /LB1MBsXNLHS+m5Mj9atCmVxC9v66IpA/FpZbmtwgQJ/hZjR0oie4Oh/I
   9qNj0/MXKDvo0d2c382Pmpam9eVNgcOp7MQdF9zs5ZtYJRWCv2Y1gJvTk
   F4HKHikUBLQQFsZK4XpmcZqznXgTLFZWjtg7umHMmoYnhRiGVjt5xpsz1
   Gj7/gLyaPENuYLgZoNJYCQ+B4O42GtOWqwMCnim9XjmX+++87enpw7T6S
   Q==;
X-CSE-ConnectionGUID: GTW7I4WHSEekpQZqs7lZuA==
X-CSE-MsgGUID: 6O14Y5+rRFyBVpAHBbpJaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82171010"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82171010"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:07:20 -0700
X-CSE-ConnectionGUID: UfUi7eNJRuq9rdA4efP5/g==
X-CSE-MsgGUID: DVXBZPP8S0anBDwwiWnRlA==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:07:17 -0700
Date: Mon, 15 Jun 2026 17:07:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: GaryWang <is0124@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <ajAHE29I3IWQNVsV@ashevche-desk.local>
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <CAD++jLmFKz19CRp-E=JcUnNkxNzKtSow6T8_9jDpR-wTrs9Ptw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmFKz19CRp-E=JcUnNkxNzKtSow6T8_9jDpR-wTrs9Ptw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 15, 2026 at 02:32:51PM +0200, Linus Walleij wrote:
> On Fri, Jun 12, 2026 at 12:13 PM GaryWang <is0124@gmail.com> wrote:
> 
> > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> >
> > The pinctrl-upboard is provide additional driving power & pin mux function
> >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
> >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> >
> > Signed-off-by: GaryWang <is0124@gmail.com>
> 
> LGTM
> Acked-by: Linus Walleij <linusw@kernel.org>
> 
> Since these touch Tigerlake, I expect Andy to queue and send me
> the patches from his tree.

Yes, this is the idea, but first I want to hear form Gary about Up 7000, which
seems doesn't work with this.

-- 
With Best Regards,
Andy Shevchenko


