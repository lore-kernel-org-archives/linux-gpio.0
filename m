Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822A6347FCD;
	Thu, 27 Aug 2026 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857336; cv=none; b=dzfm+vsk0vl3XQ08zSmgbRH3pq3ryBna90dBflVGFcTal67MZkGHyzTXM9VsqKHFQ8lg5mhbBfOIgm3k7xNVCNYaWWGz5/z26mAuYVACgSKF/djTRTI2OSu6iSUeVUUWPU2+/4ub6ewhyh7WIdsaw/LfrjGV5+W1I4/vHS0+Qk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857336; c=relaxed/simple;
	bh=cgNql1r5duy69QVKHPOD/L3Amcepnx3/m6jgZ4b2aak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjYPNVDr3FjVNGb9WBRr141b4jcSj4VCVPc/YLEE+mFhcQmHvF1qnmkBF+WX9uJlnB9sFkNmZsk+yhDMr+fts7zdDtc71r9eWAiJLEa8mYjYs1Ez6e/i6GQgcHope4FjwlxaYbe+8AnUhlxbFxoJE8jUT31EAvSC72rXAzekBqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLPxv0Y2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLPxv0Y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787857335; x=1819393335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cgNql1r5duy69QVKHPOD/L3Amcepnx3/m6jgZ4b2aak=;
  b=jLPxv0Y2WUDsp4Vx+WyGL72zttehUL4C1sll3npLt9bhM0j+IOKmeIrq
   FsNfndI1YhVzP8oSHNJ+YVmM77WZlZCSjB8ap+a5TzjjbSheY7CPgmPvW
   kEjJKwki/iS1DgPBOZGLxNwj83wsGDCiGuhzOCubd/BE2fvMPYF1eUr4c
   v4P5+R+13/WvIHM3EmdhESnqHp/4rHx2AP1y2lEXArcVTG0CK9383LS3/
   vSG93bPYZl/5ajmPyj7ilS/3hbYVzC9IyoRpAVPNm2pOyfjJOmjf4Ylzz
   eHHr8sYoteGG1OZ3XJ5bvBWYrTfk00wDrG3SSW4aQfKiRBNg4YNOKGWb5
   w==;
X-CSE-ConnectionGUID: RbiGn44ATS2J1TfpBffXOg==
X-CSE-MsgGUID: rswtGsJuShacFb0xXX08tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90881397"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="90881397"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:02:10 -0700
X-CSE-ConnectionGUID: /L4O5qSxRXa+PFe3YNOKjA==
X-CSE-MsgGUID: hruNPXzxRM+VRp2BpEy3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="265360641"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:02:09 -0700
Date: Thu, 27 Aug 2026 22:02:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Radek =?iso-8859-1?Q?V=E1lko?= <rvalko@lipicko.cz>
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: denverton: Fix probe of MFD-created platform
 device
Message-ID: <apCJrj-rORIXCIAQ@ashevche-desk.local>
References: <20260827184259.32386-1-rvalko@lipicko.cz>
 <apCHdNBSQ7ub6lNi@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apCHdNBSQ7ub6lNi@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 09:52:40PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 27, 2026 at 08:42:58PM +0200, Radek Válko wrote:
> > The Denverton pinctrl device can be instantiated by the Intel LPC
> > driver as an MFD platform device named "denverton-pinctrl".
> > 
> > On affected systems the platform device does not carry the INTC3000
> > ACPI match data itself. As a result, intel_pinctrl_probe_by_hid()
> > fails to obtain the SoC data using device_get_match_data() and
> > returns -ENODATA.
> > 
> > This results in:
> > 
> >   denverton-pinctrl denverton-pinctrl.0:
> >   probe with driver denverton-pinctrl failed with error -61
> > 
> > Denverton has a single fixed intel_pinctrl_soc_data instance. Pass
> > dnv_soc_data directly to intel_pinctrl_probe() instead of requiring
> > firmware match data for the MFD-created platform device.
> > 
> > Tested on an Intel Atom C3000 system with LPC/eSPI device 8086:19dc.
> > Before this change the Denverton pinctrl driver failed to probe and
> > no Denverton GPIO controller was registered. After the change,
> > denverton-pinctrl.0 registers with pinmux and pinconf support and
> > exposes 154 GPIO lines.
> 
> Thanks for the report.
> 
> Can you instead try to replace device_get_match_data() in
> intel_pinctrl_probe_by_hid() by intel_pinctrl_get_soc_data() in the way how
> it's done in intel_pinctrl_probe_by_uid()?

Ah, it won't work as direct replacement. So, the intel_pinctrl_probe_by_hid()
should be modified accordingly. I will send a formal patch tomorrow.

-- 
With Best Regards,
Andy Shevchenko


