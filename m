Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE1046EC9F;
	Mon, 28 Sep 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589457; cv=none; b=O97ZZRUs/L1kadA0k4OYbjNWf7nPEWraLSRXjeKPBUoqkDvSFlIyeZ02tPfBofXiLHcQjGHU2WrTewV8NgQijXukOVHI9np27sBPGM+wl85avwe7ArTz+sv7hZpRnbfgCQvT61Y5fZmr8ZDX5AZNS5qJ9tKRR1V9658qxtbujNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589457; c=relaxed/simple;
	bh=7iEl+XVA7aF/QzbXkNIm2ON20FLVdPb/ka0wWw9LLug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6OOa+jTcz1bL6pkEzv/WSyW8x6X6oyHGbz+9nQPCtfnu16+NQGIkfj0HRLZqIbY0qaLMpby+hlI+uBdYR99jFxVvXvcUHvjgb2fysqUoVLfu4uqnZ2twS7LGUe9palGfRibQp5/CGAnHYcJ/oUjFP5PkY/EZa7UCKiUvHEvbYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6XXleFj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6XXleFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790589455; x=1822125455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7iEl+XVA7aF/QzbXkNIm2ON20FLVdPb/ka0wWw9LLug=;
  b=e6XXleFjC3eoJ5VIljPHQI5P0e6Gw1RymGLu+QbK5Y5k0etqhcyxRqBj
   fRSxjPqiABMw6qZXVdcgnSnNa5bqOzemE30P/+SsYJASeeTZBi0QJKnzX
   4xVC0K8s8ta1MWKJkg1wVqjjpdqjyrLMkZ2ogUhf/3WlgynNoJyo1fqR5
   3rydqqcarPCVoNNi3Ro1Ccjtos/BtLZ5ob9u5UGxVNDbSXHS6WC7WtGh1
   IEqccTPbN0NXs43lJIIpZ+CDBH7U8bGogvbqEnScBFTiZCbDPuB9sPuVB
   7TlKVYA4P5q4sSqoBHTgOMahU17vOiFsiIDASqlWhSb42qz61ncgmig6C
   Q==;
X-CSE-ConnectionGUID: yKx8ndyiTbSu9RwcyxZ9hg==
X-CSE-MsgGUID: XxTVq1BXQIiG1mscjMtBNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="113068710"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="113068710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 02:57:35 -0700
X-CSE-ConnectionGUID: qXEERDwqSh6b6UF/K6q2QA==
X-CSE-MsgGUID: WV1ZEG0xS0+O2hVQ1HpxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="302960813"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2026 02:57:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EAF7D99; Mon, 28 Sep 2026 11:57:31 +0200 (CEST)
Date: Mon, 28 Sep 2026 11:57:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: phucduc.bui@gmail.com
Cc: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ
 lookup
Message-ID: <aro6C_SWBGF44z5E@black.igk.intel.com>
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814043028.12548-1-phucduc.bui@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 14, 2026 at 11:30:25AM +0700, phucduc.bui@gmail.com wrote:

> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> and -EINVAL, should be propagated so that the caller can handle them
> appropriately.
> 
> Propagate negative errors other than -ENXIO.

Have you read the discussion [1]?
It would be better to make platform_get_irq_optional() to be actually optional.

[1]: https://lore.kernel.org/lkml/20220212201631.12648-1-s.shtylyov@omp.ru/

-- 
With Best Regards,
Andy Shevchenko


