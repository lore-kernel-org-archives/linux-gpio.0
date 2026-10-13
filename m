Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80A330675;
	Tue, 13 Oct 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899725; cv=none; b=DtjhHRyjeqZatYSQTao1Jv5SoZAzTy92Og/Ve1p3Vv31IlR6VNpQO40QtOBsilODs/p9+j2yDDexxCPWqYUQAFce3rArhyotMlUC+zBs+sqw3ctI2l7VIJAaGfhimY7X/2YQXsrzF+vML8lQSNO5cofA2j+9jpfPiXs2IH+0WuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899725; c=relaxed/simple;
	bh=jvbrqy8I4miW+wSkK502XDqoPN9Jx1JKbrD9wkOUpXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdmqCT21baBvs8PwQX3RSRFyMFrL1YaSPql0YE8WSl4Uw+p6JLFDkgo8pCy7YZCqPZjN/IPR7Ruo5EX3IkCZAZT7k/Rh66KdNBQ5jkYiCkXhgtNC1r949RZ3XoguYXHhwXFE9+eOJ2hpjWCXodToSJ5tYXphYN5IIbnJ+KC8ANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKJRs8AF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKJRs8AF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791899723; x=1823435723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jvbrqy8I4miW+wSkK502XDqoPN9Jx1JKbrD9wkOUpXw=;
  b=EKJRs8AFGxsszKDwkwTDKrXD7jHYyhT4jXVcRJKWMn1fxdyT7YPJfWpl
   +aVylzWFp5usjJQ0BSJCT3H9Qi6nWvYUJ3rXdCc1yCwRxNNJWSwTiNJ6O
   IPaz3xlO2ZcGNueNMjbNgSNlbiJW4zFYHWkwCVkL7JZIgUPD2ZU3CnrS9
   HBF+zGXooXL18rz9TrqmGUe6YssLk7esYp8CLoBGdOWYNnAm3xEXePOKs
   DM8bVhHmXkcxK2C1DAYtKgfMTkrot7j1bBulTblc85JwOrVwQwGVR4rEf
   5aikmjjIVrQTp6lKIH/qpENxzLBbm+sfoGmEh/jGSzaNstJRj4KvsnclF
   g==;
X-CSE-ConnectionGUID: WuKIpYU/TsmffgeMYiII4Q==
X-CSE-MsgGUID: 3Jz8ZduiSZK4jDGdKMqKaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="721324"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="721324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:55:22 -0700
X-CSE-ConnectionGUID: oMI85wWfS9WDIx1vH5Lxxw==
X-CSE-MsgGUID: sowtfEJ3SgSLsZaLynl/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1110177"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:55:18 -0700
Date: Tue, 13 Oct 2026 16:55:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <as44ROCHy-WeMdIZ@ashevche-desk.local>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> >> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> wrote:
> >>
> >> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> >> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> >> > small series we kill gpio_request_one() and leave only two legacy calls
> >> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> >> > a few users and high chances to be killed soon as well.
> >> >
> >> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> >> > with possible immutable branch for others. Please, ack.
> >>
> >> The kernel is clearly a better place after these patches than before it, so:
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > Thanks!
> > Bart, anything needs to be done for this series to go in?
> 
> We don't have Acks from MIPS maintainers. :(

Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
the changes, please?

-- 
With Best Regards,
Andy Shevchenko


