Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319798;
	b=KbIoFkexXJKG8iqt/cXYVESQyay3KTM9bLLjLH8jFuVQYdSjz4o1Pr4EI+k04eRfhYiS
	 6nup3JXOwb6vGb7Bp3qa5A2GJUviWO0cwiEMWi0UdfR2k1tQsjAgXK3a2Trf7lKxcAuXP
	 QdPKxptTHgLqp3OsFqK4rzmvQ1MH8KcLsEtn/+1yJYLZVry/AGT+eylspWCPk1iAIrIki
	 BuQ2AX8xic9Men7ZbVPzprFJOKcQKds0JL2kK5l8ryVs/z7tHYC1KemZ8vIaYs+0eVpiq
	 8qZpLFDtvUR2eqJWXy1e+XMcBrxcSAlTqiA6AElgcD7tIp/+65U3aZ2MqKMBkvam0/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=pB57B8wW+SEvfaiOl7ycc6ShOq9TASgyNKl6X5D51Yw=;
	b=Cup8D4OBBd/1Ni+tsDlqSV+WNUfGTdJvlpEXtfdCFSPvgEAc1kJ8Y3wzPWtTkY/7o7Ai
	 MHrnwRNHeeLAwmRT/y1mTC4DVu0U7//f0dBocf/p/6FsuFqKY652DZKqIYVoL/orf1M/8
	 cyRzMNYAHuhBAVmQ4rPT/3RJ1tbPnFRM2fiQXOtHowgjaa7fHQgQIml9ScT/TBM/u0Yrq
	 hZ66GS2dG1TNQwDPIv0Q0oXnrzrahmyZxyvumxMMRag+u6aseDORmejC5M3S4CZe5TCGr
	 fkvoqUC+zayBGtWjYQG+PDCUEbFvOTiNk4NL5KnadEiBW4VfwdBhAYxwdnZd0Bjpwzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUXMoT5l;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F5606A321;
	Tue, 10 Nov 2026 14:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUXMoT5l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794319796; x=1825855796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m1MGGQV4qzQITJrJo2OceVWPRzE+TICqoPHwYE9qCiY=;
  b=NUXMoT5lGoYknyvqwe8TdsUaKMndwduuvukvhDcFlzA5WrLYh+z2iVE1
   /DdxVllC6x4jc7kKxJsQTLA1B6R2T5+j/d5ciHsdJoxa+feOu3d5g/p6g
   +Ddy3qf2aaOHIC5B3ZvWLtPZxfFN0ik1xYiviYJBfXQdaEomkPZ93Ci5a
   2H1ZhqLfaM85Cig5djpIPt8y3G38spyJ1oX2O8GVpFg0o7rUZOmhqWJ3g
   h1vDxaQeFENfOyqysE05Cuaru44Mf72Uq5OQjSiCi45vtXQMDSve5ez+e
   LbU53CZ6fVnOpPMdPG0inOA1Hu6ttunUZx72QJCzEHQGdzuNlXN+6ausQ
   g==;
X-CSE-ConnectionGUID: ILlqd7+4QR+UBHqVVk5iQg==
X-CSE-MsgGUID: wCEehn2JRPOOKf/xEdnjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3065885"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3065885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:09:56 -0800
X-CSE-ConnectionGUID: hnkphMxnRqWtT2jmMU07YQ==
X-CSE-MsgGUID: K+4pWKqGRQSoA8y0UQ7tFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8180084"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:09:52 -0800
Date: Tue, 10 Nov 2026 16:09:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <avMlrXeemXOSR3ng@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <avMg5XmU8uSzPR4s@pluto>
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
In-Reply-To: <avMg5XmU8uSzPR4s@pluto>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 01:49:25PM +0000, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:

...

> > +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
> > +{
> > +	const unsigned int *elems, *pins;
> > +	unsigned int nr_elems, nr_pins, i;
> > +	bool pin_only, gpio;
> > +	int nr_functions, func, ret;

> Beside nr_functions, cannot all of these variable definitions be moved
> inside the scope in which they are exclusively used, i.e. down inside
> the for-loop ?

While it can be done, it's not most recommended style. Is it already in use in
this driver elsewhere? If not, don't do it in a single function. Same if it's
used in like one or two out of dozens of cases. TL;DR: be consistent in the
first place.

-- 
With Best Regards,
Andy Shevchenko


