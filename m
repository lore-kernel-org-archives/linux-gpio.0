Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051135294E;
	Thu, 27 Aug 2026 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856763; cv=none; b=pfn1bGnIhhX/RNhg5rgFMZ1fZqn6mtjGXdQtL0TFX5vOz98mTx8LaJWzUyT3Eb3FveaveF5CbBJQH3Syq3e/UmnExmmxyOVxpfdIRtgmsou/D3EwVBzQumsngy5y8BSLkz2lFl+mHcj7Lz6bZn2xc2ndWRS9ghwNkWbWriqt1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856763; c=relaxed/simple;
	bh=rYPoexo/R4rS6k4X2ngPUdyKUrEtQSFsxJeDJvvGiE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nms8PxaupD1UxfAoYCagdgGrNMI9yN9M+5rQ7wE8bNvBZWzsMtnkOWFBsSprxgGj2HLBSv54LhbddxXsx+Y5CGomdmtRm7lGUltCNGNbTMymPOf//OaP76tRJhhZmFmdGhFt2y9vNPfbxSfBjJ84BWXmNinpM3dqCLdVr6+KY0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhKP6lne; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhKP6lne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787856761; x=1819392761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rYPoexo/R4rS6k4X2ngPUdyKUrEtQSFsxJeDJvvGiE0=;
  b=jhKP6lne5HY3vavC626L1nQ8rNxfYNz2o/rRyl2BIPCFiT2p82+Kxgb5
   YjYtKiJC0/qKMR8LOlEz/W/psykSqxDDnmcchKt9yJ/IXLvV2MsYFTw+4
   Hp29PvOG5qkYbheKJPBKFJlz6KLW8SxsK2bi4mmufryl0iOU0/gdyW3L6
   S4i1ILl49QhjpNqRKnYOLyVIpoiC64HKMvpJqbS6dGijbLNZiucSq/mv/
   70+t5wB2yx/gn35frsCQsnWkYrJ+7t817cuau3BEapd3OaxKHQddz0qFp
   BzHGhx+IFUzgtdr0ETiNUvizfNRV5HXbARwXzQW0591EaEWdzs9l29MEO
   w==;
X-CSE-ConnectionGUID: /MaRDTa3TaaoioVhkybiPA==
X-CSE-MsgGUID: St9NiyisT/KK0gB549+tHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99527345"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="99527345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:52:41 -0700
X-CSE-ConnectionGUID: Lp9RAStkS0euqODl6m0SBQ==
X-CSE-MsgGUID: IvnO0SqOTtOOx+FF/IWDLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="266147446"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:52:39 -0700
Date: Thu, 27 Aug 2026 21:52:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Radek =?iso-8859-1?Q?V=E1lko?= <rvalko@lipicko.cz>
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: denverton: Fix probe of MFD-created platform
 device
Message-ID: <apCHdNBSQ7ub6lNi@ashevche-desk.local>
References: <20260827184259.32386-1-rvalko@lipicko.cz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260827184259.32386-1-rvalko@lipicko.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:42:58PM +0200, Radek Válko wrote:
> The Denverton pinctrl device can be instantiated by the Intel LPC
> driver as an MFD platform device named "denverton-pinctrl".
> 
> On affected systems the platform device does not carry the INTC3000
> ACPI match data itself. As a result, intel_pinctrl_probe_by_hid()
> fails to obtain the SoC data using device_get_match_data() and
> returns -ENODATA.
> 
> This results in:
> 
>   denverton-pinctrl denverton-pinctrl.0:
>   probe with driver denverton-pinctrl failed with error -61
> 
> Denverton has a single fixed intel_pinctrl_soc_data instance. Pass
> dnv_soc_data directly to intel_pinctrl_probe() instead of requiring
> firmware match data for the MFD-created platform device.
> 
> Tested on an Intel Atom C3000 system with LPC/eSPI device 8086:19dc.
> Before this change the Denverton pinctrl driver failed to probe and
> no Denverton GPIO controller was registered. After the change,
> denverton-pinctrl.0 registers with pinmux and pinconf support and
> exposes 154 GPIO lines.

Thanks for the report.

Can you instead try to replace device_get_match_data() in
intel_pinctrl_probe_by_hid() by intel_pinctrl_get_soc_data() in the way how
it's done in intel_pinctrl_probe_by_uid()?

-- 
With Best Regards,
Andy Shevchenko


