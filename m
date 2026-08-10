Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C5372B26
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346582; cv=none; b=ulDOUzHqMRq7h320l6IfJhoYnpswiPgW/XwU1ay1ijCUXVBSmaezLOfYvs8gJC96gWT5Hln6Y9EjkEQHDHER7L1FuGPe4yfTW5wMK8xuYSbHZsepDbbze0x3of6mCTKagoI6dOwDsX+bSdATBjSpfcbCfCfogWmlzpOb7giBEw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346582; c=relaxed/simple;
	bh=j62z6F0g0gX+7Q8aIzAJVtT8cldDiyFB6jdtr+v8JYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aK54/apXjB0rme2KLQGz4kTUScKe4NOmo0Yx08KA1a9kl5n6dE54iWW126zws6NRR8MelBo5vhK+b4We1ktWr6E7fyvjMHvb2J8Aen9bUCrGlCnT2Sp9hcQP+SRsKSZPusDXp1R7c7FRxYDbmdF3fW7ILALX5WRNsuN7y4yeu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbGcVMR0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbGcVMR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786346580; x=1817882580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=j62z6F0g0gX+7Q8aIzAJVtT8cldDiyFB6jdtr+v8JYw=;
  b=VbGcVMR0vI1YC9TUtGFzDgaaBV4UId8bTp2huv7gSegWUZsxDG/cLhBC
   7Xp2v855RPyAlIx9am9dHsC0YHogWV0Q+JluPCAulRpJcspH5zDK/9BTo
   6c82ksYreWjPQXr9FVje38qFFuHeZo3khxkvK5EZ0xi1sWUVHdJoQT9SH
   31gazPcP8YK8vozgz0BdilWbOiOglqZDxFzMqGS+UFl1cMo5y+8V7qYG4
   hZDKR4y15X5ZQlB9LhZPLbxOGZK/jebZGFlc1KRA2otPbEOtmrf0iAdo/
   VV+Hobdb6Wf1Zdw9b+uMcVNwNQo7l+GRepuc1grFalJoQmNPDPZzqhjgn
   Q==;
X-CSE-ConnectionGUID: ISUUDgsdQFe2ZxELaOWR1w==
X-CSE-MsgGUID: bbUw/CXFQFaIqdL2lNXuVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="112399993"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="112399993"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:22:59 -0700
X-CSE-ConnectionGUID: 7P1CHLvcS1ywv/4xxNzUbg==
X-CSE-MsgGUID: hDXaopBpT9imJ8M1Eoo5qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="266812997"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:22:57 -0700
Date: Mon, 10 Aug 2026 10:22:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: BillyChou =?utf-8?B?5ZGo5Y2a5YCr?= <BillyChou@aaeon.com.tw>
Cc: GaryWang <is0124@gmail.com>,
	JunYingLai =?utf-8?B?6LO05L+K56mO?= <JunYingLai@aaeon.com.tw>,
	Thomas Richard <thomas.richard@bootlin.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	JasonHuang =?utf-8?B?6buD5LuB5p2w?= <JasonHuang@aaeon.com.tw>
Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Message-ID: <anl8TtJweGgob1kp@ashevche-desk.local>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 10, 2026 at 04:17:43AM +0000, BillyChou 周博倫 wrote:
> Dear Andy,
> 
> Thank you for your feedback, and we sincerely apologize for the delay.
> 
> We are currently updating the BIOS to configure the HAT connector pins to
> GPIO/GPO mode, which will ensure interrupt support on the OS side. We will
> update the BIOS as soon as possible and share it with you for testing.
> 
> Thanks again for your patience and support.

Thanks for the good news, I'm looking forward to test it!

> -----Original Message-----
> From: JunYingLai 賴俊穎 <JunYingLai@aaeon.com.tw> 
> Sent: Thursday, July 23, 2026 2:48 PM
> To: BillyChou 周博倫 <BillyChou@aaeon.com.tw>
> Subject: FW: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
> 
> FYI
> 
> Best Regards,
> JunYing Lai
> 
> JunYing Lai
> AAEON Technology Inc.
> 5F, No. 135, Lane 235, Pao Chiao Rd.
> Hsin-Tien Dist, New Taipei City, 231
> Taiwan, R.O.C.
> 
> 
> TEL: +886-2-8919-1234 Ext.1891
> 
> 
> 
> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> Sent: Friday, July 10, 2026 5:11 PM
> To: GaryWang <is0124@gmail.com>
> Cc: JunYingLai 賴俊穎 <JunYingLai@aaeon.com.tw>; Thomas Richard <thomas.richard@bootlin.com>; linux-gpio@vger.kernel.org; JasonHuang 黃仁杰 <JasonHuang@aaeon.com.tw>
> Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
> 
> 這是外部郵件：在打開連結和附件之前，請確保電子郵件是安全的。 This is an external email: please make sure the email is secure before opening links and attachments.
> 
> On Fri, Jul 10, 2026 at 04:37:56PM +0800, GaryWang wrote:
> > Add AAEON software JunYing.
> 
> Thanks, waiting for the response!
> 
> > yeah the ACPI flag should not set for HAT pins, JunYin knows it, They 
> > clear the ACPI flag from the driver now, their BIOS uses the default 
> > from CRB, but they should fix it from the BIOS to match the right usage.
> 
> How do they clean it from the driver? IIRC the ownership registers are locked
> when BIOS hands over to the OS. Technically any pin that marked as GPIO input
> must not be owned by ACPI to allow users to connect whatever they want there
> and get an interrupts. Many of them also have "Locked full" permissions,
> that's also may not be convenient. Another thing is the absence of bi-di GPIO
> configuration (or did I miss that?), which people may want to have (my use
> case, for instance).
> 
> In any case I have latest and greatest BIOS version (r3.5 of this year) and
> problem still persists. Can AAEON share a BIOS for testing? (Note, if you
> want, it can be done under our Intel-AAEON existing NDA, I believe.)
> 
> > On Fri, Jul 10, 2026 at 4:48 AM Andy Shevchenko 
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > Since I have been playing with the $Subject board, I wondering if I 
> > > miss something or the BIOS configuration is utterly broken. The 
> > > problem what I see is that most of the pins on the SoC are marked 
> > > with [ACPI] if you look at the debugfs 'pins' file for INTC1057:00 device instance.
> > >
> > > This means *none* of them (which are user visible via HAT connector) 
> > > may serve as an interrupt resource to the OS. How the OS should 
> > > request interrupts on those pins?
> > >
> > > As far as I understand that the BIOS does initial settings of CPLD 
> > > and basically I can use transparently the pins as per their 
> > > configuration done in BIOS. Right?
> > >
> > > Btw, do we have any contacts to engineers in AAEON or whoever who 
> > > does these UP boards nowadays?

-- 
With Best Regards,
Andy Shevchenko


