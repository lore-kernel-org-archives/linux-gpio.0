Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73692DCF67;
	Sun, 13 Sep 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285903; cv=none; b=cqmGi2CjVG/0TfWJ+jnD29puV4G+Firo5URvrUbmQOIebnaHBstS5sDrHVhOW/IRyLEyYp+qGK45vidVbwWNbpIRKKnSNkj/wtIhdtUYt8NIF/9zLbR9/yorf+vZ+iu8y+qgrRFHDEw4zMmhTuZl2lwwQplKRT7/F5tzqASLp1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285903; c=relaxed/simple;
	bh=U5jQQMKTN366RCXgQeUoN6dB/a7saDdDqr4pShisUIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at+53dsrj3yB2BGersFyNIro8mP455OUzUn0Bz+0TeFikXXOHxluYl4yurVj6TzmlTfixEFebs70txqIRdExh/o4+RZOxOuQKc7ZjeFSg9AcG9F9FxGMNIIKff/Kvgj3UHuV+cFcxVd3xrSsa0Nc2g7rdB9Qau/PGN9T81PI8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZWpRVGN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZWpRVGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789285902; x=1820821902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5jQQMKTN366RCXgQeUoN6dB/a7saDdDqr4pShisUIc=;
  b=JZWpRVGNVjzkxHLl36Yd6TYKyc1bDBdyfyVd9s5WeYdls/z2/PZmjmoG
   g5jOWpZ4JT4P7ug5BVXYTyhme4v6/ETUt7Mrue3E15M/yV6LXBvxHw2ur
   +5V+KWHu1nyDv+wwpdRsqzaYdaMI3/3H1+ao1/yNOYS/uRYDex6PMGtfY
   3xvpVtrfo+PpCAptQ/sCluiWW6kVS1WUrLw8EYnyifByf28FPX3GkFxRJ
   4icAeHzDpQHCiG3NckhzlcW5uwwkbDj36cWyjlbCOes1hs3l0o5cyVED7
   LoWwZ7oAycvPKZsAnPAaYuElY+wIxzjlgZn4zbxivQgdsXDO6HDa5mN0k
   w==;
X-CSE-ConnectionGUID: pYMFUsFcTzmmoWTWwbBfsg==
X-CSE-MsgGUID: P5gJozoRTRCytpVRmaM40w==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89446614"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89446614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 00:51:41 -0700
X-CSE-ConnectionGUID: Z+Ftw4SMSfOCKzFLzTY0gA==
X-CSE-MsgGUID: wpSkICYnQSC6BEEMuoS/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="272857424"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Sep 2026 00:51:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 653E599; Sun, 13 Sep 2026 09:51:38 +0200 (CEST)
Date: Sun, 13 Sep 2026 09:51:38 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
Message-ID: <aqZWCqBi71yjl_xg@black.igk.intel.com>
References: <20260910160226.489183-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260910160226.489183-4-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910160226.489183-4-cosmin-gabriel.tanislav.xa@renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 10, 2026 at 07:02:25PM +0300, Cosmin Tanislav wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
> 
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
> 
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
> 
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
> 
> Report the input level even when the pin is used as an IRQ.

...

> +static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +	u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +
> +	return field_get(PFC_PIN_MASK(pin), reg64);
> +}

This is a dead code. Add it when it has users.
Especially this is weird to have in the patch with Fixes tag and Cc to stable@.
Bad rebase?

-- 
With Best Regards,
Andy Shevchenko


