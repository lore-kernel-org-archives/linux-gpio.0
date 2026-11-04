Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789725;
	b=3A81eSiS6QO6op6XtS2I89XJmg/OHYFCovktlfOGbHAzSJ4kSCEeYh0J1f8vk/qlh0bd
	 lyqYTra6K6+caqKl02VY6MCyOcbQfjDewTZMbhaqxyPewGlB4ASiuG+oJ+kMPRWkqeRhv
	 r0qfI32x5tY3YiZw0r4XyrDv2/yPGQIArUS1xBuWvy8zYypcCD76mYAw8qh2JAuhxJ08+
	 Lt2BPTqcqMXnEA3FvD3IqNmHtMR7b62kOPL8ubfIZzLJRmAm2W48jA9fZbYTZ2mNcD//Q
	 /4M1IvEkNVAUrimQduByN4jxiC1gjct470kinzp34ehG+YfUxHdpCtOsIPbbGD24Etw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789725;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=q5EB9sWYexwM66oISVKEoWC7PirZef6I7jp1wtU1bZY=;
	b=obqMZS7mM7YCredgzLvbHRo5Hnmige9RBTrnFvxgkIUWkaFtBNDka0Sw/MS8C946Zqrt
	 dNNPXcefviovYM3K9qG6yyDuBPGKrTN00FWWa6l4bzMcv73JMq4tZzSX8te8V5UdivuKc
	 XK7QY/aD9fIeYrkzQdU/WV+ymIzkcTmCV8QCPsNotqNXLQv7oKxvPmkNx5NmRUuCsuNJL
	 DRrCqjkqFmgjwPV3faI+49zgfhBGjy06eIYHBPFsa2PxrC30L5f7hXnM5IKxqEdEaeSQp
	 7wPl9jNJ3ubhWtHiVTYgn4zsTKOoIXg7ijOdTAWYTcd2P39mryb0dfaI9qQgAC/RFnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lsrdtjg/";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98E606A31B;
	Wed,  4 Nov 2026 10:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B98E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lsrdtjg/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793789723; x=1825325723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y7denP/ndQ8Np+vR3riInyTK3v1TSZ+KMP6Au27fEBY=;
  b=lsrdtjg/tyQRcHcd0sxywiPkwbQ/HgvfIOYKe/rvYR6wBLAysNSQxITb
   boyLd41aPQYZ3EHivYYSF/sARzh3e7wthnAHyb7R5cwZx0jZyOZxMDAwk
   0PG/BTNj2GR05LkOpF89vQZ4biQ7vsCwNyH20MzqLj4hDj7QfuQQT6+kR
   Pkvyyk4aJ4fuRkBHVmHU0sUJZ42SR9sQ8ENAvTu0qyd2LRIUXrzyqHcAJ
   qxfFrn5xqn5xfuEMPNyNA5K/JciPJCI3/LRiBksXIK9ODO/rJBnrzFR8x
   vaFcMCSsihpCKHGRc4A/wYK2yyZAeNUgOAIq+A0w1Jko57iQ5UiLZ3uQS
   g==;
X-CSE-ConnectionGUID: ruEvMqIvQ1WRZZX7vrkydA==
X-CSE-MsgGUID: A15xrFJITnyyVqg+6vkYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2415177"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2415177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:55:23 -0800
X-CSE-ConnectionGUID: BZVaxyjYQFOtcDxMqSdGUQ==
X-CSE-MsgGUID: nR8KF5bSSo65a20nMZftCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6845480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:55:19 -0800
Date: Wed, 4 Nov 2026 12:55:17 +0200
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
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <ausPFWOj-usp084X@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
 <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
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
In-Reply-To: <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 10:38:11AM +0100, Clément Le Goffic wrote:
> On 11/3/26 12:41 PM, Andy Shevchenko wrote:
> > On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:

...

> >> +	int nr_functions, func, ret;
> >> +
> >> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> > 
> > Is nr_functions signed for a purpose? Can it hold an error code?
> 
> No indeed, will fix in v2.

> >> +	for (func = 0; func < nr_functions; func++) {
> > 
> > 	for (int func = 0; func < nr_functions; func++) {

With the above in mind, the type of func has to be adjusted accordingly.

-- 
With Best Regards,
Andy Shevchenko


