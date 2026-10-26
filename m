Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034272;
	b=MMULudMCw/8ztnHAGPSk/GrrniNGcrpBKhqW8bOx7NYQht6m2kvT1/59liszf7q9xD1H
	 HefXho8xaPkymf/YARQ6PnA5B7tCoe2+tN1PxUJOEXiLeDVMWbj3pw+oucRqhvqGvDFsx
	 b4ExwIONYnA1bPMT1NKwWUhnEgRVLOPnAYN7LgFNvNBam0gGDECymkUQ6I1m9T9rpJMKZ
	 Q3HX01J4ZdE1iYjX3baL9s0oiNW1leZXa6Q1mGnJVGoCGX1LqAJds1im8baPGfaATTy2q
	 SL1fxGhfc+f92Rwv2p9jdu3Sh0kyPqq33qbskypZw0g6Lvm8UcdB9DWmY/vcEeb0FeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034272;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7V7Zjrx8rqOb0qhaCukFNA65jiKCMuEfiPWlWwYxd7w=;
	b=AaJyg42STDDml9v4aZBAkXh/xci8I67OknFlcfGTpedoAAcYlt7Ys35HUtN8kMW9iCt3
	 mRfKmv/753uA7crUgXstYMmkeCMLBeBAgfE7UMZ6kuK22JkAxU1YGAE8pYtjvt0rUoG/9
	 +0woXVWISW+1/8ObNYtgFGiqs2LObkT2M6jhqr7sSx702wrOXPSQJm+QdQ48NAzevYW07
	 U0hLI6zk3nJBlQs7azQfmYX73Y4n7I0TJChbQV8M1rUiziW0/kUPsELcT/e1S6Y1E/ATM
	 7FxkXxsb3UWJCVMRSTKYXIxZwCu3WJQzFEOYGrfagYsxLoCpLWbd7hp3o+6vPlOkrhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NpVI7ba1;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1F4606A31A;
	Mon, 26 Oct 2026 17:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NpVI7ba1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793034271; x=1824570271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7/I2COr2vevBNZllQVEQmGUdzom0AsG5huPiQeLvcH4=;
  b=NpVI7ba10l33RTeua4iwgnAebQFBaSwKzsVQJWd24ELrSffK4RklDrOY
   VrqyFwVcG4zWeMYEvg3gWaeiSWi5oFF9e+KTJUAODGu8dLdeZyTEnTJo0
   vwQoClz49FfD7BknR/xssPwqz5ZQjHw9CAPs5u1xA3SZd44eSKdnVPgFZ
   OYXGkLXwyn+F+34pJFJK39CCyCc7ZsiZ6Srta39IJvFjd5HLg89ilNhZS
   nwBQKQmX4nnE7wetmcb9TtRPrft2Y6/SuhfcCod3WUNmjMxwNjzbx0cpU
   wXvEJKX9Fmhp+gqoPryC/mTu0LDX0/KbtRglUHdH9Q6wqVflcEZsK/eWw
   A==;
X-CSE-ConnectionGUID: GLoSJlswR2evDl46O4TVeg==
X-CSE-MsgGUID: Z4ogHXR/QD+FbSq1EAFhRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1605526"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1605526"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 10:04:30 -0700
X-CSE-ConnectionGUID: n+I0yCcNQsq5GGKt/LTpnQ==
X-CSE-MsgGUID: uiM5I0BuT+uPaV24xfmfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4716397"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 10:04:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 237DC121CBF;
	Mon, 26 Oct 2026 19:04:31 +0200 (EET)
Date: Mon, 26 Oct 2026 19:04:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/22] gpio: Use named initializers for acpi_device_id
 array
Message-ID: <at-IHw8k0Dv4J_ry@kekkonen.localdomain>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <2acd554bae9411e84aa9ab8cb5d6748b5906b824.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2acd554bae9411e84aa9ab8cb5d6748b5906b824.1793030820.git.u.kleine-koenig@baylibre.com>

Hi Uwe,

On Mon, Oct 26, 2026 at 05:28:23PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> acpi_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # gpio-usbio

-- 
Sakari Ailus
