Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC6D352C28;
	Mon, 10 Aug 2026 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786392145; cv=none; b=lJQQCqgxcdyT+PSlneNZvKqBLvAtoLwJRqaX2Lrx1rOvwHKXwsPNeeUFlvzP/PW7Zn1rP7ws6n5gpFL8MAgJvqbePKy1ENU9C9Vu3xaBf75aV0Q3Wu+IZzxamJGcq87g0PWnZ1BOmOyOqxo7/CYgM1Vg22CMqPRi6+EXpPE7Wcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786392145; c=relaxed/simple;
	bh=9xgm3q/deDgp0UiuirMlRr+73eOPocE1wi8WgQWnUVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmKVrlYcp8OVXa8hVhQ5A7w541TPIX2lBQUuENb+iVo3k/0RWpf5EpV3YwZJ+jIcgp53GN/npuXY3wPJnUbq6eX+DOJaSyyc2cHN8IkrUkDGSatNAbLQ3mFxxC2a1G72packycL19l3dv+UasNhu7GpFHlaMyasf3D3sc6BxlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FICAdIaP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FICAdIaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786392144; x=1817928144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xgm3q/deDgp0UiuirMlRr+73eOPocE1wi8WgQWnUVY=;
  b=FICAdIaPttDQTVBxG05baKnR8mtImq+GMMhkXbLuI8YgMRGmX9uSITqa
   yHBxgqx3cJqDJ/AuwcOyGjYELciWZPzZnaTJtSAhunJZ5/0vvJeNFLzir
   8mlGA+RNHYEGxCzivv/B5vYuP7n8gx+sG/XQzeFiDhCAbyZqKMCTM+wnP
   PVriItUQQPYLiCxYvJ18DpeCa35aTmj+0zHTqzenJFJGPxI3y4UpVloQV
   +Z7bqdQ4gwSeEXewl5H/hFGYezAeuaQhU1ozheVAX4Tt670jHKvhMLpm8
   Lks7l9d1UOG2UiFRmazB5OO/j+XTWtvcxeqkOikvqG9oaU/8JkIq/z0vo
   w==;
X-CSE-ConnectionGUID: v6ai92s4RIWV9g64ZfZSfw==
X-CSE-MsgGUID: bIPPU3B+Q269qhoQDl0aWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87134233"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="87134233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:02:23 -0700
X-CSE-ConnectionGUID: hJpYVr4aReeEZMeQ22JHog==
X-CSE-MsgGUID: x33doLZpSfmE0OokEInHCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="261835527"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:02:21 -0700
Date: Mon, 10 Aug 2026 23:02:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
Message-ID: <anouS8SeYINmMT3C@ashevche-desk.local>
References: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 10, 2026 at 11:58:17AM -0700, Alex Tran wrote:
> Apply the requested initial value via the existing gpio set

GPIO

> wrapper, so that the pin is not left at its previous level.
> Afterwards, configure the gpio pin as output.

GPIO

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


