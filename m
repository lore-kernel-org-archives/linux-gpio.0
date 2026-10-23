Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737985;
	b=rhFTsp3YRj5monaO/85B59lK8I60Iw0f/o9YzYVCKUbIX1HxNo90bSJUWISBF0VGaqjz
	 tcu6Afjggla3rrb2L3LEe7zcZtcnDyDoV2C7GtQN9rgGF7Ome2wQ9XV/QPsH8A471zh2U
	 2fElhF4oeJicMw16On3EEg3eLxVqCuM6ALoOprPNyaGhLiz1L84s3m+xWz+l73guEOvgp
	 NSnv3NUc04AACFrWCOBT7a1CFAx6vm5qjaWrUSWX+6XySxuLqp8ZbQt5FVFT/ET3ByDJE
	 36+PtaW+E3MxS8PaG8NNbjOTGKF4y87qa1mvbpTJeko0qFI7JVkiTgc2OsmPqSUfGbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737985;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=A5hfuGLL9U51nvhID9oUu3453+srUYM+t5Xwxht3AIo=;
	b=VzVvxsptTn3fJdA5kgyTxzeUCRtmtbRASifpUGr+KujVyymgGSyoMT80tRSmzLH34trz
	 JUQv7Ryy9LCSnARSZtLiS0Tt4McvErZX5eeCS1hakx79R5DzAci7/s4+ar/JxM1Gut3TR
	 3IRK+jb3r00Ro5xqokJtRrN61rgiHrGnkAP9kyB0RiIsYVzRnAMJgep4FQDdeAF2TN9IO
	 6OpftBhVHM4GTNM0Ep+vE5RZgZ/x/Ug/4Hm8qfKqtPxjk5jsFva4Oi8gWCgJyw4NwA4YY
	 ZDlPdh122ZP7p4uwJ1Aw6UqSrnX+tHtiIQauOFUZdxSZVrswN79fCeA9MQdWpqd3OGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1F2Iw3z;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F351606A31F;
	Fri, 23 Oct 2026 06:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F351606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1F2Iw3z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792737984; x=1824273984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IK7GHeF/iSOkxUaWEWahXG0mGoC8RmG0GWUii1LygYQ=;
  b=l1F2Iw3zsYau6/q83/zylwOg7n6lmvMefpzklnAUfK90JU99oBlgFA4I
   BSeYS3IEqkw4dwHUzqVruXRk0PdtsstC95ZdRqA72BdrkzpM5SrwB8pNx
   y3sTlVL6Koi9TCNtmtFzkNao8bsAbwJg1X4eh5Achcpe91Cin404p2piV
   8uT5GEEUbfbVopEQvLrTFqWVF3YPFd/qWynJELn6zL+JIXbssIeK9bhOj
   XZpsY3vsYDRBTuQz5JIvRZfbLb2kyJ0/dyz50d/xvqlmqrmd2Yk87EcmO
   XGTDsCZwh5GS1nKi6jFlYJNobiEfHUb9xJLwHh0A/gbDyAt+nNMnYH/H6
   A==;
X-CSE-ConnectionGUID: cIFAypSWTR+b7q9uY+noYQ==
X-CSE-MsgGUID: A5pwx3p7RvyqFnanDDn47Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1377331"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1377331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 23:46:23 -0700
X-CSE-ConnectionGUID: ymazaAbZTm26TqRgwuVb1g==
X-CSE-MsgGUID: lcL7yanMTpCwy4PyBDK5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3505972"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 23:46:19 -0700
Date: Fri, 23 Oct 2026 09:46:16 +0300
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
Message-ID: <atsCuEYYPokdQn_m@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
 <atjbpKxrW7x7Ohpq@ashevche-desk.local>
 <atjfOrjsxnKe80zh@ashevche-desk.local>
 <atpbQV_qEoLyAG2J@alpha.franken.de>
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
In-Reply-To: <atpbQV_qEoLyAG2J@alpha.franken.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 22, 2026 at 08:51:45PM +0200, Thomas Bogendoerfer wrote:
> On Wed, Oct 21, 2026 at 06:50:18PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 06:35:06PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> > > > On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > > > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:

...

> > > > > > > Bart, anything needs to be done for this series to go in?
> > > > > > 
> > > > > > We don't have Acks from MIPS maintainers. :(
> > > > > 
> > > > > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > > > > the changes, please?
> > > > 
> > > > sorry, I was on vacation.
> > > 
> > > No problem, we now have more time :-)
> > > 
> > > > I'm fine with the changes, but I'm not, if they still apply cleanly...
> > > 
> > > Can you provide your formal Acked-by?
> > 
> > Maybe I misunderstood you, but FWIW I have applied it on top of today's Linux
> > Next and there is no conflicts.
> 
> ok good, I probably mixed things up :-/

Thanks for tagging the relevant changes!

Bart, I guess now we all set for this series to go in.

-- 
With Best Regards,
Andy Shevchenko


