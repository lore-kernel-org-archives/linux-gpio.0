Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597826;
	b=DldDlCFNgqYUXOwjhDj5FK7Tnjrjx/V5GGoCVjvhAlMF9x0sX52A50Ste33zAjSR2rHE
	 PmeO+IcSZU2QqyQpCvvFMVhjuCU5a3CHQVF9SIqI1rIwBV5HyT4n95u/R0sOWVXj9dKBs
	 89rP0dw4vLbKeXk0ybmsvECQAqkowTH1+MbqLMB8figMpEwauuF/++Y62YuMAU4uyNObo
	 K+KVVAvYXd2gZ3UXmglJ0pUp36GzAKX29+6KDK7gWXtPeiFF5J9hf1XcLgffNkkDpqpHn
	 XLE6NJjzn50udIqKkubncudM14G/HMkXR9X4XcYfJSOkZqdu+HefUMvTFJT4YaytrYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597826;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=pH+tj3qwGYrTAo3UEfrdi4pIkMsrOAs19/q+eI5TIwo=;
	b=Q3sfGCz602nHAUP2dUFpQ3ytKs3fIFatlZa61B9V7E7rMkhWZ8CZ8SzQMVwPXQaLHnAb
	 ZbTQUEz7ASjihWhF0seHRp01hcao3lKoTpzzFvyVEvwkWat5nYVfVxaduWIIlNhCqGybh
	 LCwGXtF4uYv/3aW83jkfUxYBr5mOruM7V6YrYeBogO79ByBJTYWXZM8l7J9OnoZUo3Rfo
	 VYwkn50ENN/+5oEEYQr/PHRpPJTsNWFkJ4eHxFdILpqbwXG0Q/bqxWIg+3eTz1pzVB1OZ
	 DMXcPAC2s7STSp7HidK3SFPPRi9sMZrX7QMKgOU+MRt6VhvY+vYwGDLO05vGPIerfBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NC2Fk8+6;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD8606A319;
	Wed, 21 Oct 2026 15:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CD8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NC2Fk8+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792597825; x=1824133825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zq4wmiZbxWqtchaG+x8w3e154PofCX54MIWAg9+VRSc=;
  b=NC2Fk8+6LVjGD1HuQxAfMArOOByCtZaqXuUnk7aHY/CPiF/uyj9Y+Q04
   sHQwuQ5NGIuUA5f+XXBM4YXUpjgyPOvcHMNN/aoXyR8xF9C0YCbkQh9C4
   Yti87M0mi4v35sWXP8iWmZAz4Ll4NW/WCJIgxBQNzIu6lOiqqwH7HSUQy
   bAF033YExUkUuN60Tf34lg/l/aW4SPmuvlQWzTQirKEICgz+8SRpO6RLQ
   SswEKT3+KVmmjKmSj++F1VNrJt0kxppUMwen/MfuguGSKvvlB/Wg/gbRo
   lmkQ/NJcjyWSaOpXf/Wli/SxfPn05M32tVTdzP8GUFkRNYLIGsuDBBFfH
   Q==;
X-CSE-ConnectionGUID: CH1mhkaWTYOS/T9839w89g==
X-CSE-MsgGUID: PVunDm9qRcSvpa/BzkAv+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1200481"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1200481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:50:24 -0700
X-CSE-ConnectionGUID: lBnd6AaxRv2xcIJRJe5Q1w==
X-CSE-MsgGUID: PKTA8ELZTbec/ZPagKbXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3519426"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:50:21 -0700
Date: Wed, 21 Oct 2026 18:50:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <atjfOrjsxnKe80zh@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
 <atjbpKxrW7x7Ohpq@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atjbpKxrW7x7Ohpq@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 06:35:06PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> > On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:

...

> > > > > Bart, anything needs to be done for this series to go in?
> > > > 
> > > > We don't have Acks from MIPS maintainers. :(
> > > 
> > > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > > the changes, please?
> > 
> > sorry, I was on vacation.
> 
> No problem, we now have more time :-)
> 
> > I'm fine with the changes, but I'm not, if they still apply cleanly...
> 
> Can you provide your formal Acked-by?

Maybe I misunderstood you, but FWIW I have applied it on top of today's Linux
Next and there is no conflicts.

-- 
With Best Regards,
Andy Shevchenko


