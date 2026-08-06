Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB7423E9B;
	Thu,  6 Aug 2026 21:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053545; cv=none; b=gp2v2LzbAI8KX/o34laevJySgXWl9FJKbApHIjOaPj7+e5yy9l3ZFUGm/l9PkJiNStwvzSiZ1yZ+TMx7dv1QFccTUyit4QXM5PM82xIwJkuhx33r6G1sNIRdJ3bn+UOh29ILvhLKxLO5VoAnoNli6ZlhTOGHqdVVntRzdg4AqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053545; c=relaxed/simple;
	bh=AXHGmryH/95esRSg0XGPWbcKZXOWetohQOyhlnMbCkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYB2am4FRop66Pv6F1zKxB5JAksNNY3EiPAR8laI7gPFwDEUbjvDYot0ihIzBAqVzn7YiRay/ILGTa/nvl8yGYMXjaGOu4VMry3tf+yjze9pGjNu5Il3f70H/gbW/JiSmApq7jxwMG0ErQbwLZFJLt4xu26YGkGmcx9gfkh7xBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiE6RcFt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiE6RcFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786053545; x=1817589545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AXHGmryH/95esRSg0XGPWbcKZXOWetohQOyhlnMbCkw=;
  b=MiE6RcFt2r66SLoxyA+PH69/31Fx7xqiCW7pT83HbaJ50ikyP+MJMSyZ
   cqJ5+DWfBFIQ+5qGOaEV1fMaEot4QZ5pLarbhgzfqY2U9+vc06WD0Qff9
   ZuU7MQTLNSnhm2RRe0msStUZ0RyxYLYLcF557+ALqT7em4dH3g4ZpW5Ir
   pEJm91HXZZWfdKARJ11hNWm1MwDN6Eb5Powahgn/mIwDiYUen6gCfBfLY
   ZFFxDoce+KBfoZNl2uiHTFQLmbv+eodxjKyd/v46UC+jAv5B/LaojrVTB
   VfSSmWXT0n+4hPjteXAh21A6X7oqKBI9kZ+NevJcvIlH26dhE8T524PlL
   A==;
X-CSE-ConnectionGUID: SVnhY9XZTRGbH5OcCACjRQ==
X-CSE-MsgGUID: NZpEGkQgSFS2JBKxXfL9mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="109454240"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="109454240"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:59:04 -0700
X-CSE-ConnectionGUID: 1IkSbAI9QkmsfZVbsc6Ccg==
X-CSE-MsgGUID: qNMR/4LDQf63sht+1lAjmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="285587965"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:59:02 -0700
Date: Fri, 7 Aug 2026 00:58:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
Message-ID: <anUDo61Y1ZkoUgRv@ashevche-desk.local>
References: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 24, 2026 at 09:42:28AM -0700, Alex Tran wrote:
> After successfully configuring gpio pin as output, set the
> requested initial output value via the existing gpio set
> wrapper, so that the pin is not left at its previous level.

...

> +static int pin_control_gpio_direction_output(struct gpio_chip *chip,
> +					     unsigned int offset, int val)
> +{
> +	int ret;
> +
> +	ret = pinctrl_gpio_direction_output(chip, offset);
> +	if (ret)
> +		return ret;
> +
> +	return pin_control_gpio_set(chip, offset, val);
> +}

But this is a wrong order. First we should submit the value and
only _then_ set the direction. This is not glitch-free in such
an order. Granted, not all HW is well implemented.

-- 
With Best Regards,
Andy Shevchenko


