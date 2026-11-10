Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318938;
	b=rCNKOTEhoCxEGnrpif8A4Px9x/+L1Miahee8JWPNlQVvpUSlnlTzotbgeeGKKvRxpWsg
	 h92dAHTeLgNJvDqhsRxyNwvS53zU4iLZuS8W611nyo/nBPMpHvuGgKUthhH5RVo9DxDEG
	 sYxDw3rckrLGehK7dYjx2t+FYyxD++etLi4WJjglNuV05BStpvPhNpPJZZbjLc0mzyCxc
	 v/xxWsXQ+c5aR2R1IkiqbbUooenvGgdC9BNplVTCrsrgWzgimQmitCnWOsdAquGr/8nRu
	 QMdCoAs7pHh0JZ20r8WqlVhHBqYluPpDx83ptJOofmjFjRThWZz7nvehozy04oVMhiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318938;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=IYGhANhPBrozk6ereFsD6fb9TNu93Ek+MLRFDmzCQDo=;
	b=glqxBSoJD19fOor6NsJ27sFSITp7r0dzCfQileDBbhz2b68dZ+5/MAd/xMCVTyn5TtBC
	 elLJitvTCG3JM4GfP2EVFMli0j3ua5SA9Lbhwmtv3g+q1AKhqgi7k7i99ajn2IwcH9LGG
	 55WVa9jDccn+cY5O2MpLq772/ETgPz1bAzEVxrM9y0YTmsdISDEPtiOA9M8/66Wj1PPye
	 wGPTBIQyx9ahF6SQxwTwu/Uq4majNQAwH8tt8GOQFSzDxrSMULsc38xudhK99TpoCStYE
	 gAa09HWD8ZfJZCx68f/n+EjWu4YA+ojUgblW5mTOVlKJsSic28qIP4XMzr43iZ0LBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ECZSQnsD;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4E606A31C;
	Tue, 10 Nov 2026 13:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ECZSQnsD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794318937; x=1825854937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8O1LBRwu+sB/68DfU9Zjqdg14RpoGbap0+yHR8ZzjA=;
  b=ECZSQnsDrfSVTzCJXOTlOjsK6r9y1Rjd2JtxtBwVwVELwmURUOqXW/Br
   6la/Oof7V7lOrZnyW16vu61y903YZvPtRltk9n2wyjtuD5d4JNm2kX1CW
   ZNhYh6c6PWQaZvvgl5ElbN+8ljxraJQyF0wRHzf0lphXEE3LJEkST0opE
   EHf0Yv4NJfXmoxbLAlgp7qqBZ7MN3sJjpvc9u7wTAkmiZDOTuztR5VmiK
   woCaXdIQ46ZT48mQVpGiUr8+DxXR+OlGlaHBnxM8279w+jehamQE7e0AQ
   AzZ8/CBDlGNuo4Q2hOG6TiERdtSEuJBI/ETMI5uLJycwzt6QBbbI/pNbi
   A==;
X-CSE-ConnectionGUID: KJI/dfMGR9CpDcBewIQnFQ==
X-CSE-MsgGUID: YAwx74T0R5CBQYZsIplJug==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3059467"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3059467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 05:55:36 -0800
X-CSE-ConnectionGUID: swvv99rkQ1udTRNjdJRSQg==
X-CSE-MsgGUID: TUiSrJe5RlSHRKUdDZxGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8018180"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 05:55:32 -0800
Date: Tue, 10 Nov 2026 15:55:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 14/14] gpio: pl061: use string_choices helpers for
 IRQ trigger logging
Message-ID: <avMiUkiq54lM20mX@ashevche-desk.local>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
 <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
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
In-Reply-To: <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 12:32:39PM +0800, Long Zhao via B4 Relay wrote:

> Use str_high_low() and str_rising_falling() for the level and edge
> debug lines.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


