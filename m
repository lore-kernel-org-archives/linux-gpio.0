Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A13502B9;
	Thu, 22 Jan 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094125; cv=none; b=HOteqI7psJWrRd8zxsiVxr0xEY2OZfNNC368j7iuxxjetPTgO/3qLPOANq7hhHhYy0L7r4pSZXpHHgyHWMWqmh4PGT2d+Mt83fSowZQHN4sQnrQjUdD5eedF8TBR/A4Dd53oOpTxsfLUPsmoXB1UzkxlxkJFJ8QrrbS4tmaUqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094125; c=relaxed/simple;
	bh=l77IAsVXahcW5YI/IdZW6IxkK1iQnfGhw6G2mzcbNLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huOIf5xOcZr8QHkGbx6KeCfIdV+rq8MTVLBX4IBVgw8VuWroXhC+2iWzDl8K1bzbQA10eJLu9YA6p+LLLWVMw6gXjY2y5nRI04O6vxph5FK7sS7OJbZyyaKGW7vu5Ll4M7i590iaxzI/oED38mf8c84r+d43ebcG4bDSw1W8Yg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSZLFxsY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSZLFxsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094124; x=1800630124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l77IAsVXahcW5YI/IdZW6IxkK1iQnfGhw6G2mzcbNLw=;
  b=JSZLFxsY5jjvVj9hLSRqiZoXoWI+ayoQUE3F1rE7Fza7fXeYCpiWn/ZR
   p0br/nO1Ul8/AgcGlzojAp++4uzF+E6cXvMvjpsCy5xtMvtAs8ZP0+MUJ
   ww4rbJnjsqSFlc5K8NarkhLbH5/NGRxZFrgp463jExdMITb7dbO0IKyxf
   QJvsAj2Ldk7yk76cM+xL4pQqbo4AholKw+YO+tqzgYTm66BZ+UnlT9Yo+
   PNZATmJsCQVaP7tBzfmLCoXXxPcla4/ODxjTD1Xa44aXISGVwfhoIAOrs
   9C4CWeGIpIPQT7ec573yfG+aY1Xz1Za3jubnKXe657sgypLh65MCnPHho
   w==;
X-CSE-ConnectionGUID: iEqgZE10RPyG3WDMm0ahHQ==
X-CSE-MsgGUID: Hxqyv6K2Te+CIw/7i+PLVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70384594"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70384594"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:02:04 -0800
X-CSE-ConnectionGUID: NW67R4G3RdaUyuKfqBUm4A==
X-CSE-MsgGUID: n2EU29aJRAySn/f0MLrr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206805571"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:02:00 -0800
Date: Thu, 22 Jan 2026 17:01:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] ASoC: pxa2xx-ac97: Remove platform_data
Message-ID: <aXI75VDA60hRIrYQ@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
 <aXI7LlXOiLSD2K1a@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXI7LlXOiLSD2K1a@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 22, 2026 at 04:58:59PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 08:44:59PM +0800, Peng Fan (OSS) wrote:

...

> > +	if (dev->dev.of_node) {
> > +		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
> > +		if (reset_gpio == -ENOENT)
> > +			reset_gpio = -1;
> > +		else if (reset_gpio < 0)
> > +			return reset_gpio;
> 
> No, please convert to devm_gpiod_get*() or even better to use reset-gpio driver.
> TL;DR: no (reinstantiated) of_get_named_gpio() or alike must be in the kernel.

Ah, you do it in the followup, right?
If that is the case (I'm going to look into it after this one)
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

And thanks for cleaning it up, eventually!

> >  	} else {
> >  		if (cpu_is_pxa27x())
> >  			reset_gpio = 113;

-- 
With Best Regards,
Andy Shevchenko


