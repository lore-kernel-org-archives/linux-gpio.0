Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF635A93C;
	Tue,  9 Jun 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016648; cv=none; b=I4f4jWeJkvXJtN/UBKPsQp1vC9GClINWCfB2nJYj15tlymWQPqUJYUOKwgoBhA+0C0+AuHajoiSaNDzhiZ94z5yWKIwaDjWNDU9bBO1AeU/1dCaO3rrMiPezmwoCpEP7Ty3ArwYsEoovnQiSKupURlZjmi65NaNgHQ3kSK54kDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016648; c=relaxed/simple;
	bh=8ZRah/BvDP8vPHrlTm40rI6m9/TLf+ouXW4eK8t2n7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgI8Omg2kKu1ZT64TaMtEBBKR9rr6esuceYiu4LhWIor/U5yuifGZwCb/HVmqy50+K5XBFp0k2OZcFPo/Rai0eyvdUUuOGFxMqcAzTzelTt0V5LyeZdlVWeiE7ph2VNkeagS74xqypHwNvilDnxFnZVmus2O9ikOaJz9mghZkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQaECYwG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQaECYwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781016645; x=1812552645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8ZRah/BvDP8vPHrlTm40rI6m9/TLf+ouXW4eK8t2n7g=;
  b=JQaECYwGtvpG5Nf2mA6ucuF+TcdUfmCji01yiRwOy7Vn6mZsYszKWgNy
   7OnWA0kHeuN37rPHB1sWpGiPUu2ZFaxxwE1HBkbGMb3iagUiLvo7rs6cK
   CdTol/W3s8exMViZXnzXAC3CdwXjs+1wWBiUmYVCN9Wc4+olFw2MiuWb4
   5xOvy/gApprCiXiKe9BLHhip2H9oC4iIZ8QiXiXH54us8O3VLtKFnUfjr
   NIYsA+bWaT0Vrtn46rffEunHZdz+DZSScEzSqgj4qiw3xb9Kqdg2ui2Y5
   XV2uoteISoNSkb0a/VjUEb1lKb1yXcv+rpD04KN08THKl/M93lx2SPEhk
   Q==;
X-CSE-ConnectionGUID: 1rOKFe/2T/yBN4Azz4Dkfw==
X-CSE-MsgGUID: lpl2lHFLSy2+3ipdjtkcjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81632156"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81632156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:50:44 -0700
X-CSE-ConnectionGUID: g3ru8ai8TEKnIYl+RQ5usw==
X-CSE-MsgGUID: YJhccbKXQTqzE8UsRYAJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245974468"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:50:42 -0700
Date: Tue, 9 Jun 2026 17:50:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: fix cleanup path on hog failure
Message-ID: <aigoP_Of5QturNle@ashevche-desk.local>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
 <20260609-gpio-hogs-fixes-v1-2-b4064f8070e7@oss.qualcomm.com>
 <aigiQ-KR-YHiult_@ashevche-desk.local>
 <CAMRc=Mc3vYpTepkjaPnK11rxveHb24X8O8gX6f=judZW5KGhAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc3vYpTepkjaPnK11rxveHb24X8O8gX6f=judZW5KGhAQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 09, 2026 at 04:33:59PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 9, 2026 at 4:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jun 09, 2026 at 02:17:50PM +0200, Bartosz Golaszewski wrote:
> > > If gpiochip_hog_lines() successfully processes some hogs but fails on
> > > a later one, the error handling path in gpiochip_add_data_with_key()
> > > jumps directly to err_remove_of_chip. This leaks resources allocated
> > > earlier for ACPI, interrupts and hogs that were successfully processed.
> > > Use the right label in error path.
> >
> > This seems legit, but there is still a problem with implementation of
> > gpiochip_hog_lines(). Ideally it should clean up the crap it left when it
> > poops. With that, this one will require a brand new label just before
> > acpi_gpiochip_remove().
> 
> Let's get this to stable and then rework it better in v7.2?

Sure. With that idea in mind,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(only patch 2/2).

-- 
With Best Regards,
Andy Shevchenko


