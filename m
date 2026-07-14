Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929DA3FB7F2;
	Tue, 14 Jul 2026 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017351; cv=none; b=Mu7xXdlkoRMoanavJCBgp2p5+qU3bOGNcwCgjSrJmW3mzPy/q5F317NM+pX0elqCOQK5y2lzPG/pwtd6MpGapRYl/+8/bpePdNeC93y15ZGa9iwor9Xx26a7rZEb61Xv/Gn+xq6Mp5tKZ+xtfK4Hnsw/WjtXjAGKOD+GMjrs5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017351; c=relaxed/simple;
	bh=7UwLK+REoWPC5QyjVTl/tTquK3kF5ZeLwwW6mmQ/+Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwCchgdueR6Ac6FtHI+Tt/8HFX/TtQo6BhB4lHIk2DJrV4Qa06UG+RIrq7kDAywjomGYTWvRqZCRaFaZvE9dLO2piVu7ls7rPzwQoQZ3dGCEI0FIaDwVzyov+jzk3Ompt62PDvZlgc08Ae1a5BFo3wYcupsFerJPX7D18FUiI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krzAGk1Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krzAGk1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017346; x=1815553346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7UwLK+REoWPC5QyjVTl/tTquK3kF5ZeLwwW6mmQ/+Ns=;
  b=krzAGk1ZuSWqzAzfaBkaDo4U9yze79vdhLpp0zze7bCvlVljYW3QJBYm
   IFeZ/OzDUJKeVQLP+aEmND8yAxHZTLOadfqvTDTjz3E3R5HnoUw9IA4Im
   gEwYydqn7mbnsFzcTO6uSILt2WQIIBN4Zc3epalgG7jVp/kETYc15dap0
   2WMlyVt/Guq77If6GGPVHo1zhxw1jgclwYPrKGhibK8W7nA6d6v4qNZfN
   XC3jTrkVKwe1Kw71KogH5R5qA8oL0hbhSJK20M1c9vRg7ymPbUYqmUKfq
   3q4UwHhlBgna/tQDhlk+hvdgNL1FMZog2D2vX83+qCs5j74QAEUULJh6z
   g==;
X-CSE-ConnectionGUID: iOQ0BQsYRq6W0WkQp06Twg==
X-CSE-MsgGUID: lyuSyBP3Sge4JhAxkChkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84414527"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84414527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:22:21 -0700
X-CSE-ConnectionGUID: t6g0GdSQQiiVRRh0QXBjzQ==
X-CSE-MsgGUID: PJdBzF7wSqmJirbShV+8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="256444730"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:22:20 -0700
Date: Tue, 14 Jul 2026 11:22:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/20] gpio: sodaville: Add missing pci module
 annotations
Message-ID: <alXxuTVdAP7agxzS@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <40ab40117c9df840de84ccf0365044cf4f87d37d.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40ab40117c9df840de84ccf0365044cf4f87d37d.1784013063.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 14, 2026 at 09:24:07AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> A driver module matching devices using a pci device id table is


PCI

> supposed to declare that in the module's metadata. Add this information
> to the sodaville driver.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


