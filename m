Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705895;
	b=K3AeKgEmNnkr01I7YuAuLyDZZCG0gZag7A2lXZeZfqiImaxBEETuEnswPnT3ibSbvEKr
	 THo7Tn2hZgg7FKI12FTbnP/yhtzMZbuSCyZJfS2eFecUWBsnSZccY+8USeEV4JPdbEzg3
	 ShWOIGtIkvcMGoG3XjZJ2DjHUGqH/ylMngLEx/YVy54ylFFlJtNuiiulBG0UYdbT6/rRq
	 Dzk47uH5eR7XUB3AIfP+oHsRRAfnegVnKKqwkHSmAoIYHyUHT+LpEW+zkc7JWr1aBmwiR
	 jwlNDVl6aJyCymnHW5OG0h0KqEnwRiKWQpPEhs8lD2G9eUsZwTQjAlw4JRo9KJ8RoXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705895;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=SM+ZxwXvkDJiP/IazHDrslWlgbwPpcEIJLtAEnj1Euw=;
	b=gpTOVchmAm4qBMscm3dp7FQZuVZ71dDBhZozx55O9DnDzFyEJnZIxRHEiIjRJRl/mi/N
	 7QkJN1vM3gU2gXZFd3CYdbCxMMXeyLzJMiKAYisxGuuaI1MLr8D6fhl5Q2nuvCUO7Kv79
	 jNvLOFI+0yNuytlGu1JntdTvTKon34XHnuFGuP1rv58nC2tKTabJro8GDa+joMlZPxZ68
	 FFXS+UPvruqlRfHZRa/J8OUM6Qwgjg4H0AqddwSt/6AJdnLBNjMovZnphO3NPc3fC1Ow3
	 aWnMZy48lIUrGgfvFcyZJXwBsd04gTuVXby3JlJC0SORWc6zrwop0a0cavY8Llh1ArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrDManDK;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76C96085094;
	Tue,  3 Nov 2026 11:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A76C96085094
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrDManDK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793705894; x=1825241894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=S8pdZwb2Y+CAAH6NyB1ZqP4ocDmydfr0MY9PK+DwCbE=;
  b=XrDManDKoQrrooE0z2X7MosrX6WI+vA6qACq6IMhC77Se1uitptQvpaC
   pguq9o0O5KD7tij2/+kel8AI4iarwuB1EZQo3qAJgI92R8WfvWXGoNQed
   iOmbNduFPPX+lJ1e/WEu6ktHpszybCoq1YofhbTOFtTH1kiLrsIj53mFy
   Q0KUL//a7j2r9OHRgDuzM1XCh2MIHVNj+F80Ox/3surT1NSRXmivvskFC
   73cNtGzGqHe+NvRi/AJbEZGnBpBqG+YfH3ruHVoljLbFP5TDdMnGToS6L
   qIWPwJHRtdSj78cMKTGXskF3YLHZ2VuU0brU/I8WcDuJ6RLinm+9flW35
   w==;
X-CSE-ConnectionGUID: xbJC0bcjRsyDS9LAcnkgGw==
X-CSE-MsgGUID: cEd01hLmRsqGp2CgraoiOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2317221"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2317221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:38:14 -0800
X-CSE-ConnectionGUID: Wxh6HDosTJaT+CYyJsuZ8g==
X-CSE-MsgGUID: pIfaqHVkSvWewBwafQxGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6735611"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:38:11 -0800
Date: Tue, 3 Nov 2026 13:38:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
Message-ID: <aunHoe9PfumHp0Gh@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
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
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
> A get of a setting that is on or off, the flags and the pulls, returned
> 0 as a value, so every one of them showed as set on every pin. Return
> -EINVAL when the platform answers 0, which is how pinconf reports a
> setting that is not active.

...

> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
> +					    u32 *value)

I would dare to keep it on a single line.

> +{
> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
> +		return -EINVAL;
> +
> +	if (param == PIN_CONFIG_DRIVE_STRENGTH)
> +		*value /= MILLI;

> +	return 0;
>  }

-- 
With Best Regards,
Andy Shevchenko


