Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1263A543A
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674670; cv=none; b=rOoGM/95PcH4FuDPaD/Yacd+/+GUrg0RcoOMw7scCkuOiouPZpqmFrNK5cj+3FPp0MhcwICkCuR/m8pTbRSquf0tbA4oxj6Y9Ij6NNH5GC2fUkLkix2/LJCJWwjGf8Tq51IEM8H6SXjhFPjcWh814s6sI7C0SY2eKts313k7dG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674670; c=relaxed/simple;
	bh=AQ/1Ml1fy2EQimOdFGuslZWUrorLkTv1gplV6Lo8R9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ligk9sgO1iFuNO0zK63IO6Oqwm7zRxTB3v3itSSkv14L3TAWwJPIpI0mvXkzK/MnkMvw3Z9vejjVrK0MxqS+a0zlm4L/z4iM4kMd0oQHkt5e07bRZkyV3EDKcH1et0T0TBihLZkHCx488fuqHn7JTRSixYWvOcmzK9DKs4VD8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3gr3SGs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3gr3SGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783674669; x=1815210669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AQ/1Ml1fy2EQimOdFGuslZWUrorLkTv1gplV6Lo8R9M=;
  b=d3gr3SGsVdjHp7Me51sr2OBX8aeIymA6SwV6Y/kkrYSRtYK4r3SWKBev
   uwXS8HWMJxX3RVL5ofWZUuFGESn7vM9exfGE0p2ap7lYRVyd39VUC9ffO
   DWPyY6Yfw+fJevEkyBsmgdoUAw/H9EN3EKGNIbOD9jmac5X+Yp5n0nm/X
   rMrXym7llrzGHz4FmC3xaDRdy3MVjz0xToJFqC+mk/8DnMtuiIyvTqhkg
   I4/7TLX+dhXJnMnubr6tiJFb0+oX+hhTZR1mF1hd0tUiejCL/bJThlNuV
   eVAbhVpdKQWrSYm57ihE5n0wbKMVvRCy9VRnkjtB1NF1kgd90+so9QPZg
   A==;
X-CSE-ConnectionGUID: v35DN4gYTmSVKFMeKgI1Tg==
X-CSE-MsgGUID: Q/dzdNCHS8aubsMpUKKzXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95744708"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95744708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:11:09 -0700
X-CSE-ConnectionGUID: Cxu9AuANSXKsIYBSVvwYJg==
X-CSE-MsgGUID: 6MSdp6eoT7y5AF8uN7dYIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253721377"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:11:07 -0700
Date: Fri, 10 Jul 2026 12:11:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: JunYingLai <junyinglai@aaeon.com.tw>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-gpio@vger.kernel.org,
	JasonHuang =?utf-8?B?6buD5LuB5p2w?= <JasonHuang@aaeon.com.tw>
Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Message-ID: <alC3Kc2BcjkmUVwV@ashevche-desk.local>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 10, 2026 at 04:37:56PM +0800, GaryWang wrote:
> Add AAEON software JunYing.

Thanks, waiting for the response!

> yeah the ACPI flag should not set for HAT pins, JunYin knows it,
> They clear the ACPI flag from the driver now, their BIOS uses the default
> from CRB, but they should fix it from the BIOS to match the right usage.

How do they clean it from the driver? IIRC the ownership registers are locked
when BIOS hands over to the OS. Technically any pin that marked as GPIO input
must not be owned by ACPI to allow users to connect whatever they want there
and get an interrupts. Many of them also have "Locked full" permissions,
that's also may not be convenient. Another thing is the absence of bi-di GPIO
configuration (or did I miss that?), which people may want to have (my
use case, for instance).

In any case I have latest and greatest BIOS version (r3.5 of this year) and
problem still persists. Can AAEON share a BIOS for testing? (Note, if you
want, it can be done under our Intel-AAEON existing NDA, I believe.)

> On Fri, Jul 10, 2026 at 4:48 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > Since I have been playing with the $Subject board, I wondering if I miss
> > something or the BIOS configuration is utterly broken. The problem what
> > I see is that most of the pins on the SoC are marked with [ACPI] if you
> > look at the debugfs 'pins' file for INTC1057:00 device instance.
> >
> > This means *none* of them (which are user visible via HAT connector) may
> > serve as an interrupt resource to the OS. How the OS should request interrupts
> > on those pins?
> >
> > As far as I understand that the BIOS does initial settings of CPLD and
> > basically I can use transparently the pins as per their configuration done
> > in BIOS. Right?
> >
> > Btw, do we have any contacts to engineers in AAEON or whoever who does these
> > UP boards nowadays?

-- 
With Best Regards,
Andy Shevchenko


