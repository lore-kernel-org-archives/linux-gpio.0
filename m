Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF74AF15A;
	Thu,  3 Sep 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443000; cv=none; b=QrxFocAlc39rVc4Cw1P6J/9Ej3kqETLLCx3pntU6FNnrDSxtkO4jgZ8DKnVna2W3JMTV0yxIIRKMjuxcgCmrpsBADCR/WObbvmViiRWioDijMJ0cf8geY2AU74WaUDFf1RYx2wbxDJMNG1DXXGTke0K/zxmQw2yurTpqXbDnRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443000; c=relaxed/simple;
	bh=5EyB23EH5eDcdX9Ji8GWYVY6yBlVL7QwTmL0UpakQ00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHInrr8ahE860wfxUfVisGThCbpc41G0M1HenCTdeS3OSFtXvfhOERH9jyK2TfRNfU7+0vZdsX3nkF3lbXwxf1DIFD48gkZv3GJ2/HjArIM1ZqbqKmvdpU3bQGiURAyX8ASY+6Zg0hREE4muNWm/L1eZCIr04w1prtD5hNZWpzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKbrmK+u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKbrmK+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788442995; x=1819978995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5EyB23EH5eDcdX9Ji8GWYVY6yBlVL7QwTmL0UpakQ00=;
  b=BKbrmK+u3JTT1GEo6tzuYUDONM7Ufl9pDCrwVvPHcJmnbhhroGHYiWae
   rZn4hWRLa4nJa4zS6sLiAfthHngy15uU5X5wQm5h6PFkGZSULPnBqD5sc
   GpyQ4GzS0pYby7P/l4+TWwBxglJHfJ9VRt/CleYY1M6UADFXFBBNlJ+pT
   wlzkwoo9W6+sgYlpBLZf07GlfS/imevoV2p1+OBb7NYRxNjY/Fz6DDS43
   9q4fD62rDlcOXbsCWiHmp8GPZt62i0L4t6bKGx9v3pVXC55jMgG3zZbSQ
   GS3ULDn5dZg5q+9VY19nJ8dkWzDtAuXCRAxeJy4ypds4AiBqHrv8Ze6HQ
   A==;
X-CSE-ConnectionGUID: MUHodzY5T7GvhHuSnOqW1A==
X-CSE-MsgGUID: 5ZQhxAZ9QDuRxtabnT1T9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88066045"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88066045"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 06:43:09 -0700
X-CSE-ConnectionGUID: UVG/2k1xTGOYy50l4ostCQ==
X-CSE-MsgGUID: iGUeliUQTE22i2ZhSU+gWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="307941437"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 06:43:07 -0700
Date: Thu, 3 Sep 2026 16:43:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Radek =?iso-8859-1?Q?V=E1lko?= <rvalko@lipicko.cz>
Subject: Re: [PATCH v2 0/3] pinctrl: intel: retrieve pure platform driver
 data as well
Message-ID: <apl5aNs7angIpuA1@ashevche-desk.local>
References: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
 <20260903115424.GN106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903115424.GN106095@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 03, 2026 at 01:54:24PM +0200, Mika Westerberg wrote:
> On Thu, Sep 03, 2026 at 01:46:11PM +0200, Andy Shevchenko wrote:
> > The reported platform can't be enumerated as it misses driver data
> > associated with the firmware node. Instead we should use platform
> > driver data. This mini-series to make it happen.
> > 
> > Changes v2:
> > - constified parameter in intel_pinctrl_get_soc_data() (Mika)
> > - added tag (Radek)
> > 
> > Cc: Radek Válko <rvalko@lipicko.cz>
> > 
> > Andy Shevchenko (3):
> >   pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
> >   pinctrl: intel: constify parameter in intel_pinctrl_get_soc_data()
> >   pinctrl: intel: Try to retrieve driver data for pure platform drivers
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


