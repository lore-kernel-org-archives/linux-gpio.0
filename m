Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725844;
	b=2ESwTQIthsG/NktMfwOhaW7WUmuXnBkSGE7YajsJ+e1IvLiWTSPqmvHBXPqb8mz7Unap
	 /EOcvw5CECPDf/SezEyRBJGV4F42kdd9q2K3XrAe4QQ03PqOwca5Uis/Op5/wru3KM1Xj
	 2H13w+6oOTCokoYKLDYsb6Os9BXpllM0oMJH5lzAHQJqqTzvyaVhDU0ru+xk6AXUfHSVs
	 PqB6iRhf1EVj7OmLU+C4igjWQ7JrwKLXMmqxobDBY2jAAOcYhm+9zdKVwKz0BYp6oshfF
	 MeQZmBzf+iuiqDenIj7lQcoV4oRQOdnheIJYGqa8S56NVdeSW7mxzlgXuh1ak3t1UHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725844;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=I7ETygHFy4ZrJzYJUzThx5GehZFSEsdSaH2VRPBo+2c=;
	b=XWKEZo1VbWbMMAjVqHrJvdyfpB7zs0XOuaJ9x0DW8LqaXkmapXNNtcXHpY2p09jgyz2v
	 nQFSzX2GKb2S4TKJqbkOebCJhN84DSR2YUN9JEnmkN1O9ZyuddDilO9apf7HNFDTC5Vln
	 DqGSFbaJmPWdZtTGMqcHB4qHTn9KNit0lhrieak1Gl2giSvDTwXsJrg9VntVX8nrNokP5
	 TBFfASbp4Gr/GnOHUcGQHuRB7yu+7nB1nX0OP0QoiAa9cuvx6TglZO9oWN3174XatDNSM
	 ukj2RJdCbZWUbksX6x0fql8X5GZGOdF+QKSociHvShNSoGpOpy/RL07ZLXUoqEgf/3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PooWdV+E;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E1606A6AE
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 20:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80E1606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PooWdV+E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795725844; x=1827261844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eKUhwDV/gMSHptOzLlZGIzm5ZxRtl4Wc3XXhlLLplok=;
  b=PooWdV+EyobmbYST1LqicjkugCZIkYOPQJLJrUb/0RPEWyem3Lm/S5ax
   Od3eNXsJxEwhOlwnlwHVjhzNHrwWEygTu5n+viWlmqnciD+KDd0jjRmSR
   vSHL6KU5+BPoloZNH6KzKshkUm98T/+ITRoNpCPGtAt3lcN3gagEEVfFq
   Fy1vFDxGcKThDg3lJ69XiAHhNvqWPCKgDUb7N6VvC150ucMRee5bOfhnc
   LMjI4x4neI1hm5raoKA980RiW/UeZ1qKMRnqmxHeJWEv6Q0b5hApn3MX6
   mLJ0cRT+tS1a4CPOz3ylWisweYvXTJqkT/Uzgw4hFTqA9oCi+JLsfMM0D
   g==;
X-CSE-ConnectionGUID: VQhnQwOcSlePKSRU7uqLzw==
X-CSE-MsgGUID: DZaefLAtTdCMYfEUb082MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4657579"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4657579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:44:03 -0800
X-CSE-ConnectionGUID: 0ZP8mGilQuK8Va0Bboq95Q==
X-CSE-MsgGUID: obiWjL8aS/O3Q4mwfUrbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12032903"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:44:00 -0800
Date: Thu, 26 Nov 2026 22:43:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH 06/13] gpio: max7360: create the regmap-irq chip from
 the gpio-regmap callback
Message-ID: <awiaDVcNkqjaRL6S@ashevche-desk.local>
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-7-mwalle@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126153600.299724-7-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 26, 2026 at 04:35:17PM +0100, Michael Walle wrote:
> Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
> domain.

...

> +struct max7360_gpio {
> +	struct device *dev;
> +	struct regmap *regmap;
> +};

Why do we need both? Is regmap created with difference 'dev'?

-- 
With Best Regards,
Andy Shevchenko


