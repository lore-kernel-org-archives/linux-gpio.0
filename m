Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C7038837C
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928227; cv=none; b=Ws5H+XKxMorlM8J7aQEZZ7PmjJYGhOqmRauOOKlexQpXTRO9bNvVW5dHKF7EcJOqsLpF6WT2z18eZAx3NQL1JvA7RKFig21mRUlDAy8FDfrMh5SO+bgUhgeYrGgEgAhRISWOY8DZErZ6F5cwsBxDN4+/KGlA0wxZJ7urIXvavMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928227; c=relaxed/simple;
	bh=DEDFriac35s+gIoyaMgUbMVu6cJHcKf+y+irwCw/Q9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXYM6X1/tV22TaiyyEaAbnF9IJeVSHgpE/99G04e572SVjAGhhSn2VrXOPaPp6YGRPC+ZVe0vEANr5r6REfMpaW43JIOXJbO+1UF5Kwk5Oda4bQjivoPYHWr1RkXl6qvRISRyarO7Gxs08MIJ0pu2qdD6BtyTp5Ob4DOahIfdas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDEBEGs0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDEBEGs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790928223; x=1822464223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DEDFriac35s+gIoyaMgUbMVu6cJHcKf+y+irwCw/Q9Y=;
  b=WDEBEGs0sgdJ29+urA9yOz43a7zhhBcohqM3Ldqw56QaFtZu10MatrH/
   Q2233uLDC0vzFfEFE+EuMspumc/8o8PKrm3uvd9yZMiDo0oDgxOP+s2+e
   evRxV3pct1n/GT2k5L9Wb7/5nzj4FJ67WvXHF63ZGveaZEN4nmLA/bkoh
   +pRbhGKVPdzdJ6ZTuxcemmA95Q5GgvK2A3HliaHNBkwzGL7Ta0A6C5EiI
   QSdbP88LSl08/+/zY3MsyCneKS3+5skFHYb3rktxIhnQAcbi+N3hfVnRZ
   QnYqXhoPjXVUIqs3EbumoE8tNloyBpzKwRX/444yvrJ642kiq5xDnsLgj
   g==;
X-CSE-ConnectionGUID: MM71l0TiTZyFU5ndZy1Mqw==
X-CSE-MsgGUID: t5MJTPDmQq2KHFNpKJ+Lgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101023959"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101023959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:03:39 -0700
X-CSE-ConnectionGUID: Hm8w3a7QQMW5S3wOS/afXQ==
X-CSE-MsgGUID: P6pK22I5S2mLVAZ748h99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279454708"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:03:35 -0700
Date: Fri, 2 Oct 2026 11:03:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chanho Min <chanho.min@lge.com>
Cc: Linus Walleij <linusw@kernel.org>, longzhao@ambarella.com,
	Wei Xu <xuwei5@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Long Zhao <zl020895@163.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
Message-ID: <ar9lVUjfMbMWII8d@ashevche-desk.local>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
 <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
 <ar9h0T9+EvRxj6As@BRUNHILD>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ar9h0T9+EvRxj6As@BRUNHILD>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 02, 2026 at 04:48:33PM +0900, Chanho Min wrote:
> On Tue, Sep 22, 2026 at 09:23:21AM +0200, Linus Walleij wrote:
> > On Mon, Sep 21, 2026 at 6:23 AM Long Zhao via B4 Relay
> > <devnull+longzhao.ambarella.com@kernel.org> wrote:

...

> > It would be good if some critical users of the PL061 could
> > test this patch.
> > 
> > Wei, can you test this on HiSilicon?
> > 
> > Chanho, can you test on LGE hardware?
> 
> Tested the patch on LGE hardware (LG webOSTV) All 18 PL061 GPIO controllers
> registered successfully.  GPIO direction and input read operations passed for
> 143 available GPIOs, with no failures or new kernel warnings/errors observed.
> Output value/readback was also verified on available GPIOs.

Thanks for testing!

> Tested-by: <Chanho Min> chanho.min@lge.com

There is v9 available already...

> > but it looks good!
> > Reviewed-by: Linus Walleij <linusw@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


