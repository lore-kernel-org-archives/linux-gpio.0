Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837B1FB1;
	Thu,  2 Jul 2026 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982417; cv=none; b=RDZo/336OHuilzM3mf7H5ZYUoRtlJ5RzeKbEhxnYV11KKOCtLbfj6vyzGysKAfSgdCcbILNvzkUojdG7/P4CLqfPbnbMrZK0WsMLgjFD4KRjR6mnXTQ0ZDP7VEOoqf7gsJ+btJBeRQ5EbLBy0/P/UQ2E2AH063s6/7yv8qLMY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982417; c=relaxed/simple;
	bh=P52D1y8jOGUjZ6I3s57GSNefpnkRnNgy6EEsYJnyQG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsOGRaANQZMitjM63+t/bFKd9BN5z94BkxZ3sYjhxf+nAyemWWZy/75kvFh1+bmC47xbGtxrqWOTj+lm6rZHwwsZTj53SWTJBW9zEwwgsWV0NAgAjwdl67EYQhp9xm5ekV4XYYX6pJ95JDjoBlWr3kib4WIBfv556Plm0gq8CZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oANJBY7e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oANJBY7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782982416; x=1814518416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P52D1y8jOGUjZ6I3s57GSNefpnkRnNgy6EEsYJnyQG4=;
  b=oANJBY7e/7C7qj6EkT1M/aR36gPPgb9zpVrzwzpSjf7Zfnzc/W3iV+z9
   cYX0u+Yacs19iuyNnUJPBfjqrW/aD9breakKSi978dZYKdQ+e9OeWD6+8
   BnOYFsWLcdFkn185tUIVUJwsfW/3T9hM0P8Pj1X3QZdnWryAAdds7GWOv
   SNbskD7E4Zs1FBlYYuGiPPVvQSMS74+9i8eJS6yAxVdeid7o/Bmcpl7BG
   MqdOkMNcX0u67wBVKp9kGo8iB/BGcwMmx5JLVcurD4LOgb/n63hyU4qr9
   OmLbtGJEbUulIbJxrafKWDZHHbVbkT7OIq/PLPpUIXbRtelIr5+Q7n+Bb
   Q==;
X-CSE-ConnectionGUID: nIpoSzqnTaeb1T1JvdzXkQ==
X-CSE-MsgGUID: 9zqy5mlITrCdFdhezDZW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87560989"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87560989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:53:36 -0700
X-CSE-ConnectionGUID: 5CKMNQHHQHGqeUcG/7hD0w==
X-CSE-MsgGUID: FgoX1yMSTG+LAgRB/EyMgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252362347"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:53:33 -0700
Date: Thu, 2 Jul 2026 11:53:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <akYnCrs85b3liEu-@ashevche-desk.local>
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
 <akYlZCn9LKWGWM9e@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akYlZCn9LKWGWM9e@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 02, 2026 at 11:46:53AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 02, 2026 at 03:10:37PM +0800, GaryWang wrote:
> > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > Add support "UP Xtreme i12" board.
> > 
> > The pinctrl-upboard is provide additional driving power & pin mux function
> >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
> >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> 
> I don't see neither Linus' nor Mika's tags. Can you explain why you dropped them?

While at it, also fix your Real Name in SoB and From headers. I believe your name
should be "Gary Wang" (mind the space).

-- 
With Best Regards,
Andy Shevchenko


