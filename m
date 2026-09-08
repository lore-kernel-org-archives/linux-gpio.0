Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3A5221D6;
	Tue,  8 Sep 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864436; cv=none; b=JYbuzN0tO6d8t7cxnWJfeIrbCH05JOtes1l8gEW+LqQqxiXhdwJcuM0uuwNVtvVgZQC43Q4qcWfE7SjMUXw5RORQQ/feXdX1N+kC6cI5MWBsWhxZaFzUO/Uf/Y4Lrl0Y6ZL/uR4c3Rf4G0xz0RgainQUa0E2Vwjj3x+kYVXI4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864436; c=relaxed/simple;
	bh=VbHlU/p6Tk/EjCLNWdDIjkjnGRxPZFpSEZTRc2D5f+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da53lwebkvC7+I5tCDNKQHhmt8u4nYbfJzpbJF+Bco6KmChWhJO1DENqa2p4ney4Tjfr9Vt0t0r0/B6+kum9Bhx/izMJaWWdcak/qvQL8c83Bi7BBI9JfYWe8eaXv4iwava0ezxT1bCWek7jSNwiHG4KbcPclzozZe2Wl4k3HlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W68NJc4n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W68NJc4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788864434; x=1820400434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VbHlU/p6Tk/EjCLNWdDIjkjnGRxPZFpSEZTRc2D5f+4=;
  b=W68NJc4nzJTHnuIuZQJm9+INRseDoGuNDz3TOvblsTKm6W/YwdhnwO8U
   W3YNaTu+PrDbBxsBxsxeGKZUhwpymPZop3Ouu6AvjtWdMVr7B73BCwOSE
   nh4hioca4yzWR+pp9zhMo0G9ZSKuLlBUbkeRlTfGn6GHZHEH2dt+QyBnP
   BU+LuGbTGpxjaRjUYDLX1cddbqpP8+s1g2MtlXjsLXASlyIj4e+mW3sDF
   gTLxXe1MBE9ZTWvgmfAyopiG3Kge+oYAWsTPlqPlrYTHZZHNjnM3MLMGk
   03CyD8glsA+2BNVllZztV3U6vaBQNDtY5TUH5sPsZm/svEINdl3x0SqxS
   g==;
X-CSE-ConnectionGUID: UUjYK7qaTk2fPdQX9niTFA==
X-CSE-MsgGUID: Gy8STUtaSNGnxQn6kr5viQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114802029"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114802029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:47:11 -0700
X-CSE-ConnectionGUID: yA7xUbFpR7qlj3ufNyPP3A==
X-CSE-MsgGUID: HYZLeDzfRem3/soDuZ7b9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270922622"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.92])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:47:08 -0700
Date: Tue, 8 Sep 2026 13:47:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH v7 3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Message-ID: <ap_nqnPLWJpz5N8o@ashevche-desk.local>
References: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
 <20260908-ad7768-gpio-v7-3-52ee6ef18a1e@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-ad7768-gpio-v7-3-52ee6ef18a1e@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 08, 2026 at 09:24:54AM +0200, Janani Sunil wrote:
> The AD7768 provides five GPIOs controlled through registers shared
> with the parent IIO device. Register an auxiliary gpio-regmap driver
> and use the parent device for runtime PM.
> 
> The device has separate input-state and output-latch registers. Add a
> reg_mask_xlate() callback that checks the line direction and reads the
> programmed output latch for output lines while retaining input-state
> reads for input lines.

...

> +	if (ngpios > AD7768_FILTER_GPIO &&
> +	    device_property_match_string(gc->parent->parent, "clock-names",
> +					 "mclk") < 0)

Looking at the length of the line I have just noticed that this uses
gc->parent->parent. Here is the question: what does gc->fwnode refer to?

> +		__clear_bit(AD7768_FILTER_GPIO, valid_mask);
> +
> +	return 0;

-- 
With Best Regards,
Andy Shevchenko


