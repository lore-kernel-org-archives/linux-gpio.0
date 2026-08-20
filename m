Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3B440637
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207072; cv=none; b=CgbbVtw+23IJN7ak5o0ChzBpid7qGCeFLY2HkU5XbUJM7nbnnXLx86JNOX+COSvkRF5HEm21VjlGVAwJlrq1y4kjytq2sXORUt4z5ey0tREvuMWm1FHdCjDuw+Vs5glkxyR6kwRf9Ml/mg8fnpoforRJmLii1GSJEbuJ0gdhXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207072; c=relaxed/simple;
	bh=PT7lajS+jV1NZef6hM7Ynt0b0lrzYa7CgfnmjaLqd/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsyDNoHppGBiGMwUSFI3GHUy2IQhMhKAF5xRE8Y0pE+oMKGcMiR6a5jWBUGzmiJLeZsm6xkk9RMGML9XLDlgHhmnY8mqp3Xwlhv8txk2Oyf5PZuigfTFar9UnxWOVNm1AnJp+DzwM2Aj0rinwKBalMaQgxfzlL2FYrfG8BVH+6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuWzFFiT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuWzFFiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787207070; x=1818743070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PT7lajS+jV1NZef6hM7Ynt0b0lrzYa7CgfnmjaLqd/c=;
  b=AuWzFFiT+IWUmqa0ONIXvE3R0OuqE6PSJi6r9GA1jmoq33bGllPzhwXP
   IIOBzYumIf/Z44RnTZ2Gxd8HkFGb2bBd6O43LYlw0oxFDh0hKJG//04sD
   NRgleTPtna5pz9kQrh1cUofzFzmdI2nfV5Xix6qVp+JDAW9EeIc1/03es
   90sIiOkBAiGHorOt96dNRIJSKaEJGB7V/OZSwcqpL8qtPL6/iS70JS6xh
   1BuzjV9v1WuEQicHnF3HKG5U16yYMypnnFkofJS1shTEzV3KNVviq1YKF
   Kw9c3/zl2S7Sp78KvYvNKHmzHB2swyvjyWJtasfw/YX6gzCNQCdjzCTJ7
   g==;
X-CSE-ConnectionGUID: 3aL+n8xsQey4JlZoSq3pjQ==
X-CSE-MsgGUID: 5Rw1ht5IQTKTbwXtlOOk8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87648865"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87648865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:24:30 -0700
X-CSE-ConnectionGUID: kfsAEUdoR9a2tLdpJAMDKg==
X-CSE-MsgGUID: u8hUIkK7RYG32FxI6s6gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="263216470"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:24:28 -0700
Date: Thu, 20 Aug 2026 09:24:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: BillyChou =?utf-8?B?5ZGo5Y2a5YCr?= <BillyChou@aaeon.com.tw>
Cc: GaryWang <is0124@gmail.com>,
	JunYingLai =?utf-8?B?6LO05L+K56mO?= <JunYingLai@aaeon.com.tw>,
	Thomas Richard <thomas.richard@bootlin.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	JasonHuang =?utf-8?B?6buD5LuB5p2w?= <JasonHuang@aaeon.com.tw>
Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Message-ID: <aoadmbnFae8C4y3q@ashevche-desk.local>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <anl8TtJweGgob1kp@ashevche-desk.local>
 <KL1PR02MB7239DF2E12270CC4B58F55429FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aoadazG84iGSWCuI@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoadazG84iGSWCuI@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 20, 2026 at 09:23:43AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 20, 2026 at 05:19:06AM +0000, BillyChou 周博倫 wrote:
> > > On Mon, Aug 10, 2026 at 04:17:43AM +0000, BillyChou 周博倫 wrote:
> > > > Dear Andy,
> > > >
> > > > Thank you for your feedback, and we sincerely apologize for the delay.
> > > >
> > > > We are currently updating the BIOS to configure the HAT connector pins
> > > > to GPIO/GPO mode, which will ensure interrupt support on the OS side.
> > > > We will update the BIOS as soon as possible and share it with you for testing.
> > > >
> > > > Thanks again for your patience and support.
> > > 
> > > Thanks for the good news, I'm looking forward to test it!
> > > 
> > The updated BIOS for the UPN-ADLN01 project with the HAT connector pin configurations is ready. Kindly download it here for testing:
> > https://aaeon365-my.sharepoint.com/personal/nas_aaeon_com_tw/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnas%5Faaeon%5Fcom%5Ftw%2FDocuments%2F007%E8%BB%9F%E9%AB%94%E9%96%8B%E7%99%BC%E8%99%95%2FBIOS%2F%5FReleased%5FBIOS%2FUPN%2DADLN01%2FUNASAM36%2Ezip&parent=%2Fpersonal%2Fnas%5Faaeon%5Fcom%5Ftw%2FDocuments%2F007%E8%BB%9F%E9%AB%94%E9%96%8B%E7%99%BC%E8%99%95%2FBIOS%2F%5FReleased%5FBIOS%2FUPN%2DADLN01&ga=1&LOF=1
> 
> Hmm... I can't login there with my @intel.com account. I suppose that share is
> only for your company. Maybe MS Teams will work better?

Or just sent an archive privately to my @intel.com address?

> > > > -----Original Message-----
> > > > From: JunYingLai 賴俊穎 <JunYingLai@aaeon.com.tw>
> > > > Sent: Thursday, July 23, 2026 2:48 PM
> > > > To: BillyChou 周博倫 <BillyChou@aaeon.com.tw>
> > > > Subject: FW: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
> > > >
> > > > FYI
> > > >
> > > > Best Regards,
> > > > JunYing Lai
> > > >
> > > > JunYing Lai
> > > > AAEON Technology Inc.
> > > > 5F, No. 135, Lane 235, Pao Chiao Rd.
> > > > Hsin-Tien Dist, New Taipei City, 231
> > > > Taiwan, R.O.C.
> > > >
> > > >
> > > > TEL: +886-2-8919-1234 Ext.1891
> > > >
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Sent: Friday, July 10, 2026 5:11 PM
> > > > To: GaryWang <is0124@gmail.com>
> > > > Cc: JunYingLai 賴俊穎 <JunYingLai@aaeon.com.tw>; Thomas Richard
> > > > <thomas.richard@bootlin.com>; linux-gpio@vger.kernel.org; JasonHuang
> > > > 黃仁杰 <JasonHuang@aaeon.com.tw>
> > > > Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
> > > >
> > > > 這是外部郵件：在打開連結和附件之前，請確保電子郵件是安全的。 This
> > > is an external email: please make sure the email is secure before opening links
> > > and attachments.
> > > >
> > > > On Fri, Jul 10, 2026 at 04:37:56PM +0800, GaryWang wrote:
> > > > > Add AAEON software JunYing.
> > > >
> > > > Thanks, waiting for the response!
> > > >
> > > > > yeah the ACPI flag should not set for HAT pins, JunYin knows it,
> > > > > They clear the ACPI flag from the driver now, their BIOS uses the
> > > > > default from CRB, but they should fix it from the BIOS to match the right
> > > usage.
> > > >
> > > > How do they clean it from the driver? IIRC the ownership registers are
> > > > locked when BIOS hands over to the OS. Technically any pin that marked
> > > > as GPIO input must not be owned by ACPI to allow users to connect
> > > > whatever they want there and get an interrupts. Many of them also have
> > > > "Locked full" permissions, that's also may not be convenient. Another
> > > > thing is the absence of bi-di GPIO configuration (or did I miss
> > > > that?), which people may want to have (my use case, for instance).
> > > >
> > > > In any case I have latest and greatest BIOS version (r3.5 of this
> > > > year) and problem still persists. Can AAEON share a BIOS for testing?
> > > > (Note, if you want, it can be done under our Intel-AAEON existing NDA,
> > > > I believe.)
> > > >
> > > > > On Fri, Jul 10, 2026 at 4:48 AM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > >
> > > > > > Since I have been playing with the $Subject board, I wondering if
> > > > > > I miss something or the BIOS configuration is utterly broken. The
> > > > > > problem what I see is that most of the pins on the SoC are marked
> > > > > > with [ACPI] if you look at the debugfs 'pins' file for INTC1057:00 device
> > > instance.
> > > > > >
> > > > > > This means *none* of them (which are user visible via HAT
> > > > > > connector) may serve as an interrupt resource to the OS. How the
> > > > > > OS should request interrupts on those pins?
> > > > > >
> > > > > > As far as I understand that the BIOS does initial settings of CPLD
> > > > > > and basically I can use transparently the pins as per their
> > > > > > configuration done in BIOS. Right?
> > > > > >
> > > > > > Btw, do we have any contacts to engineers in AAEON or whoever who
> > > > > > does these UP boards nowadays?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko


