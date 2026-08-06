Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBFB41F36F;
	Thu,  6 Aug 2026 21:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053572; cv=none; b=ArzvHuAIhCfpRMVAJUdu5IIwGaQ0ccdCPmnRKCfxWgwwrQCsy6IotgWF/i1TWTZydPUnF8pPB28zUdl+gsflIqvCs8YzJytNmHk9pTI3fYFizjtcm0pou+RJHzsJ82SN8P+xZdov1FITtNGTV0X4q5rr+GSqHdPddZjvStc6Ct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053572; c=relaxed/simple;
	bh=f4I/ShXpiN9rsCZtdoj4w1abNrFNXHAOqpGuyZPfsHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dkx+WaV4ef1lGcmtPsGeCPu5Ur/SAZ5a2O3myEFEV1e9HJTzPFcv2PjL/2TKqXAdnirUwC18VPP6rpQczSkTiq2bejxd+vkBCKl0DIQ7E8hYrKjpo4nI4EyYwS+wY4sdFwxMraahw8VxWAJtJTCPQbdf3lBAIVfcpieOkgZ33Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5af+5ip; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5af+5ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786053571; x=1817589571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f4I/ShXpiN9rsCZtdoj4w1abNrFNXHAOqpGuyZPfsHs=;
  b=D5af+5ippzu6PnxRqqSzk2i6QmSwLgTDjbFpMzWHtjpZZePsthDmqq7Z
   cO/dLmyArZcrL/aqximYI+KdNeSR5lseQpPXMhCrA9j3seRryEbhLaqr8
   ehshl6m6VyyIpf3uDpm/dUgWhWXFG2/vP0VRr8+v7oIwMTO+lw+h1E2oW
   +d6EL3cqYz+3YO4odTGX0ZVZMIyGeJ6yZ9+a8nJBoXrDnRqnvgIhTgp7g
   F9ozhgRSNQjL4g/2xvNxlMgl6u4lQjjM1sBF/0TTx6Vixd0L4o1yr1vYh
   W6GdVoauorwaI9bt1HqHly2rATxoKcm8JR7/ffer5So+yfND+LEk9xxSv
   A==;
X-CSE-ConnectionGUID: o69eWvCoTGuu+JlVq9lfRw==
X-CSE-MsgGUID: 8x6bs2UYTDayjQtX5gi78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85783693"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="85783693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:59:30 -0700
X-CSE-ConnectionGUID: jKieQB83T0uKGqwZF9B1hw==
X-CSE-MsgGUID: EIZO92tSQ2KWZAT2J6vH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="267365167"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:59:28 -0700
Date: Fri, 7 Aug 2026 00:59:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alex Tran <alex.tran@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: Re: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
Message-ID: <anUDvrtSPm_wuBWK@ashevche-desk.local>
References: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
 <178515087648.51358.11576417960376426909.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178515087648.51358.11576417960376426909.b4-ty@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 27, 2026 at 01:14:40PM +0200, Bartosz Golaszewski wrote:
> On Fri, 24 Jul 2026 09:42:28 -0700, Alex Tran wrote:
> > After successfully configuring gpio pin as output, set the
> > requested initial output value via the existing gpio set
> > wrapper, so that the pin is not left at its previous level.
> 
> Applied, thanks!
> 
> [1/1] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
>       https://git.kernel.org/brgl/c/67ff4bf723c8bd1f1b10450fa3e8f55762418104

Thanks, but see my comment.

-- 
With Best Regards,
Andy Shevchenko


