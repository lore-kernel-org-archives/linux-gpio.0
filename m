Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13C3AA518;
	Wed, 12 Aug 2026 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522844; cv=none; b=q2AEwtKm4S5cLvTWVICdKujWv2iZj0UlTcmpwPhpww2kDVuetiUG5u3sVQYjAeBburPeMQSkmkW2x5qYZjn4x0v3jjEn15Q2HDQhWX10L1jHsJxNDu0gkAUF8+oVEogXha9vPPMDYPY2i6ixaMPIse7EJzFrWEAiPOPk0kDc/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522844; c=relaxed/simple;
	bh=zY9lfAeGg60M/szQsAT7pL7C5lr5YMoI0MFXXJjlo38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdVeK7qdFw8rH98g1Aau5IFWe6f39PTgslEmdVJRJqVgpSP9JlDfGevbN/6Vnw4yFMPdoiV2BRubqQfzaM8TS1plMFr7gn0ULXzatBsUDi1KWnFX8L3ErMO7X1ohOeEounAGpjrLv9MVKbmo8VIHZvUf4Tm7/zYhKOyG5Va7zhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlarmWQL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlarmWQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786522843; x=1818058843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zY9lfAeGg60M/szQsAT7pL7C5lr5YMoI0MFXXJjlo38=;
  b=MlarmWQL5HJcKZNwFQuE9WkSQdIpvPCerHk8Cnib00jRlP5GHevaEgCc
   hQEzGgV2vrY3SzBSdTGjXWimlo2bo38P/Y99fwcrosOqnD9CQMq1rRChp
   SmRGxb+tjTb6aW4ruIMx02rigKSISqF1mVdXTGot3V0kl1W+4FNnMXXAw
   iG4c++Ozl9MWq8Qshgco0UKBiaK3AUD2eH4RyW92ZCZsPMKI2P66SX8Qv
   25gWqrnI0kJlds8TFTBCSWntEBU2gWarbYtqtEqkKToyuBfKlh8+XS1XQ
   rqIC/XqPyHRtnnm8Pdq73N/lwZ1ztiKgbS2pQ8O2XUV8x0hFGmp38/bdr
   Q==;
X-CSE-ConnectionGUID: Rw+zrP9fRPS548ugcZzZrw==
X-CSE-MsgGUID: RB5rq/3cQf2Bsxx5jtIjiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98581839"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98581839"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:20:43 -0700
X-CSE-ConnectionGUID: HxDbThHLS1imTTlw115NKw==
X-CSE-MsgGUID: 4sV80IQTTc+RqD4rcZy7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267070761"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:20:40 -0700
Date: Wed, 12 Aug 2026 11:20:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, robh@kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ
 lookup
Message-ID: <anws1QKiDqMjLNYl@ashevche-desk.local>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
 <20260810053142.27938-2-phucduc.bui@gmail.com>
 <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
 <CAABR9nETzzsjzE0JnnLC5tX7d=0yZW9bt+t8DuVxV=JSb1VsYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nETzzsjzE0JnnLC5tX7d=0yZW9bt+t8DuVxV=JSb1VsYw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 11, 2026 at 09:48:01AM +0700, Bui Duc Phuc wrote:

> > While this looks okay, have you considered actually having the
> > platform_get_irq_optional() to be optional in this sense?
> 
> As I understand it, if we decide to use platform_get_irq_optional(),
> then -ENXIO should be handled as the expected case where the IRQ is
> not available.

If platform_get_irq_optional() was optional, it would return 0 instead of ENXIO
(and avoid printing any message in such a case).

> If we do not want to handle -ENXIO as an optional IRQ,
> then I think we should use platform_get_irq() instead,
> which matches its intended semantics:

> https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

> -------------------------------
> ret = platform_get_irq_optional(dev, num);
> if (ret < 0)
>         return dev_err_probe(&dev->dev, ret,
>                                             "IRQ index %u not found\n", num);
> -------------------------------
> 
> In my opinion, we should not use an optional API if the IRQ is not
> actually intended to be optional.

Right. But does it suit for this driver?

-- 
With Best Regards,
Andy Shevchenko


