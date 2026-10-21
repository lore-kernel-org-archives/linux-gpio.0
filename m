Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596966;
	b=EPe4WW0Maz3FXN1ln9Unynvf02cQYz0qGLQN4FTCHhOWG/vbQ2w8ujUDUAAOCVhxWZwS
	 pNSnua6/y0cDt973WzRSR7ztMGc16Lpv0UUKrYiw+pak5V02xy2iJxPmGQOOQTe8cfedi
	 aVE52HPYq5380U/gNOuQWom+So27SQQGxcGhCxOjuA48N/pONEh63srgaOrDSHjdg3bMp
	 xwEZZOZ32znl7rNEFSjmhQzL+IsAsc5ZVJki1978CO05Up2Zltkm0AQKSX2j6nllooKBM
	 4pVh2ZM8SiRjCpxRUg/NOI/HVtsPuXum9K6KmZy1evbKuJD0yd73blOSKmI9d/8COXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=MZHhvUFusfypBe6CsTjwmGtc9b99XDIJ0VZhK2ZvLFI=;
	b=O3Il9B8BCvumSneGEOOkt1NN1twFDZzvf4Pw8+EnbIwTkajs+KnGIcarM6lhWkUmWU3h
	 ORZHEmfx00fnA+7Bv2+uLWQT2TwOUCmI3/vOBwxHAEH+zrQOZnWsAufy8+sKWGFti4rNg
	 Tarn+7JOJ62yAQ7WDm/Gtm8oofL17DNRny/RsilMapYIF3a3psBquPDvGpzc6dzJlSeP4
	 fGAIgiMyfHr2OEF0Fj5VcarEK+Cu9X+50H+3O2xsiENrJjwhJHn2Pn+xmpOarJwnBcNtE
	 T7YUfPVi3AKJZYT0KulBCFnY6HgCe3WWqNOGG9Va3c00nJVNu4c6tijcN4YJ3JZdzDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gz72SjjX;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEA606A31A;
	Wed, 21 Oct 2026 15:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AEA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gz72SjjX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792596965; x=1824132965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HsIFHqOoewiHI3/nH/Ctq+4QfATKLpJxW4Tp8y7fuz0=;
  b=gz72SjjXmu1YZ+aPcxw6t6cxQmHUxusMmW09H/Uc3G/iL2M/pJ/BjCXC
   +X6chSO+B67sgRMX+ADNeSJPlCfXgVpb9yFI+/Or/yZhQ6F8SCGC8RxoA
   J7nPxFZTpS9t00MalLSi615xgPKPbeuQmLEK1FTzuORHTHa9xbCVtDTVS
   vhA2cClchTo27niAtqY0kvS8NGQGGpuhv5Y9nZoIFJnCxAHgq71fGgMDo
   JE4RqGdpd+F0K7Dj1EartRreozAx6vt9lE7aCzWkUTHV3WH7UTwCvjV2k
   YUB2/ThNwsDD9xuCs0KBOIDGLvuQ2oFFldPg68S0newFXrUBh/OBBsRo0
   w==;
X-CSE-ConnectionGUID: Kmffx1f5TtSU5e4zcVQWeQ==
X-CSE-MsgGUID: mtr9IIJYQhyxilUMBRKSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1324996"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1324996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:35:06 -0700
X-CSE-ConnectionGUID: TT0ERoC8Q/ugkw4XVOyFBw==
X-CSE-MsgGUID: tUGEurUCQYG6eqD9ygyXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3064106"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:35:02 -0700
Date: Wed, 21 Oct 2026 18:35:00 +0300
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
Message-ID: <atjbpKxrW7x7Ohpq@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atjBsoY8mjGw9fQ8@alpha.franken.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> said:
> > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> > > >> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> > > >> <andriy.shevchenko@linux.intel.com> wrote:
> > > >>
> > > >> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> > > >> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> > > >> > small series we kill gpio_request_one() and leave only two legacy calls
> > > >> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> > > >> > a few users and high chances to be killed soon as well.
> > > >> >
> > > >> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> > > >> > with possible immutable branch for others. Please, ack.
> > > >>
> > > >> The kernel is clearly a better place after these patches than before it, so:
> > > >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> > > >
> > > > Thanks!
> > > > Bart, anything needs to be done for this series to go in?
> > > 
> > > We don't have Acks from MIPS maintainers. :(
> > 
> > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > the changes, please?
> 
> sorry, I was on vacation.

No problem, we now have more time :-)

> I'm fine with the changes, but I'm not, if they still apply cleanly...

Can you provide your formal Acked-by?

-- 
With Best Regards,
Andy Shevchenko


