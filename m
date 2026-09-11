Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E664D4B4889
	for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150714; cv=none; b=MJ41IizIHcFG10F0MRZXWOz82IqSLdwQnX7KlSdjWIiJLeHCFrOeL1RTaMu/RH/tNAgRPQJ73/nh2ABXh2Penmaq+0D8IQuVr/94xq2m18xHF6r7Py7Kc6bqXX78QJlFIuh7CQyWFTPm+7HlO4cjSDfmH5hFrTPClSgoenr4Jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150714; c=relaxed/simple;
	bh=m641f2jCkxI5R1NEf/qi2Mc92fVJh7Wr2c05Ih6dy9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjvpDkjqGw8uauQOASGNluUUuwZDNedj/7V1jp6UD0XtIhbK+d2ZPV+RP2NYqHoHzitMJvriab02zb7W3OtJ6DZoU825ti6RBePY33euiBwEtbYlTuC2RqphEGU/09qH0rgdo0luk57KULvXGP76wORQzM1e+EOHwQ4PJdthoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO6yKkqY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO6yKkqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789150713; x=1820686713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m641f2jCkxI5R1NEf/qi2Mc92fVJh7Wr2c05Ih6dy9A=;
  b=DO6yKkqYyjJQ4IVssdG6wMWf+ILSuo2pW5z8BRyDa9X1FOPbbEcwGw7a
   6nTLTY9wdc5d4T9PPTzfBNB4aTG0UIbtLYHjEx1xkSbEzxxJyi5PJMW5B
   ptyijePNMxUuqQZxl+dN9Smx2xIJW5Gx+5O1T0QNewNThmavmc5CID97O
   WMejrToJDjoOB6g16nYH14/cF1lLW3+sbbK1YJRXs8BF4buXQXS1orzx4
   PbCffM4YHEZXPJVEjN776VaKJa5Cy03ubsZFC4f0QjON4LK+Gvj91zuu7
   z5vl1ixHw5lAdaPBXHW/BeAvmcyC84hicLxLfVBmLZkelgs2YLL+bB3Kz
   A==;
X-CSE-ConnectionGUID: VShDTai1SM+FwyxfeDjmzA==
X-CSE-MsgGUID: MsmIEmsnQuuLv3hupoCK8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89551156"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89551156"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:18:32 -0700
X-CSE-ConnectionGUID: nnOE9/EFSsOyVew9FDWsKQ==
X-CSE-MsgGUID: DlT2GOLeTR2X0HoD+qIsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="276145444"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:18:30 -0700
Date: Fri, 11 Sep 2026 21:18:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: BillyChou =?utf-8?B?5ZGo5Y2a5YCr?= <BillyChou@aaeon.com.tw>
Cc: GaryWang <is0124@gmail.com>,
	JunYingLai =?utf-8?B?6LO05L+K56mO?= <JunYingLai@aaeon.com.tw>,
	Thomas Richard <thomas.richard@bootlin.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	JasonHuang =?utf-8?B?6buD5LuB5p2w?= <JasonHuang@aaeon.com.tw>
Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Message-ID: <aqRF9CrO42-_nwMO@ashevche-desk.local>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <anl8TtJweGgob1kp@ashevche-desk.local>
 <KL1PR02MB7239DF2E12270CC4B58F55429FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aoadazG84iGSWCuI@ashevche-desk.local>
 <aoadmbnFae8C4y3q@ashevche-desk.local>
 <KL1PR02MB7239A0882DE535296B4ED5249FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KL1PR02MB7239A0882DE535296B4ED5249FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 20, 2026 at 10:04:13AM +0000, BillyChou 周博倫 wrote:
> > On Thu, Aug 20, 2026 at 09:23:43AM +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 20, 2026 at 05:19:06AM +0000, BillyChou 周博倫 wrote:
> > > > > On Mon, Aug 10, 2026 at 04:17:43AM +0000, BillyChou 周博倫 wrote:
> > > > > > Dear Andy,
> > > > > >
> > > > > > Thank you for your feedback, and we sincerely apologize for the delay.
> > > > > >
> > > > > > We are currently updating the BIOS to configure the HAT
> > > > > > connector pins to GPIO/GPO mode, which will ensure interrupt support
> > on the OS side.
> > > > > > We will update the BIOS as soon as possible and share it with you for
> > testing.
> > > > > >
> > > > > > Thanks again for your patience and support.
> > > > >
> > > > > Thanks for the good news, I'm looking forward to test it!
> > > > >
> > > > The updated BIOS for the UPN-ADLN01 project with the HAT connector pin
> > configurations is ready. Kindly download it here for testing:
> > > > https://aaeon365-my.sharepoint.com/personal/nas_aaeon_com_tw/_layout
> > > >
> > s/15/onedrive.aspx?id=%2fpersonal%2fnas_aaeon_com_tw%2fDocuments%2f0
> > > >
> > 07%E8%BB%9F%E9%AB%94%E9%96%8B%E7%99%BC%E8%99%95%2fBIOS%2f
> > _Released_B
> > > >
> > IOS%2fUPN-ADLN01%2fUNASAM36.zip&parent=%2fpersonal%2fnas_aaeon_co
> > m_t
> > > >
> > w%2fDocuments%2f007%E8%BB%9F%E9%AB%94%E9%96%8B%E7%99%BC%E8
> > %99%95%2fB
> > > >
> > IOS%2f_Released_BIOS%2fUPN-ADLN01&ga=1&LOF=1&xsdata=MDV8MDJ8Q
> > mlsbHlD
> > > >
> > aG91QGFhZW9uLmNvbS50d3w5MDU1ZThjNmE5NjQ0YjA1ZWQxYjA4ZGVmZTgz
> > YjJiZHw1
> > > >
> > NmEyZDRiZTlmZTM0MzBlYjUzOTdlMTNhNDc0NDg1N3wwfDB8NjM5MjI4MDM
> > 4OTk2Njk3
> > > >
> > MjY5fFVua25vd258VFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1Vz
> > SWxZ
> > > >
> > aU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYk
> > NJc0ls
> > > >
> > ZFVJam95ZlE9PXwwfHx8&sdata=UldHMlhFNWxXM3htaDFCMGdKV3pZTTZ1Mz
> > ZOMFBzW
> > > > GdSNmthM2RsNnFzST0%3d
> > >
> > > Hmm... I can't login there with my @intel.com account. I suppose that
> > > share is only for your company. Maybe MS Teams will work better?
> > 
> > Or just sent an archive privately to my @intel.com address?
> > 
> Sorry about that! I’ve updated the download link and fixed the permissions. Could you please give it another try? Thanks!
> https://aaeon365-my.sharepoint.com/:u:/g/personal/billychou_aaeon_com_tw/IQAdsTdWUQhvQpAoS8lELTe8AZK70ORl6FB-Ndcf0lXUwus?e=ZV0MvS

Thank you!

Sorry for the delayed reply (for the record I have updated BIOS more than two
weeks ago, but haven't had time actually perform any tests). Today I tried to
use so called GPIO 11 and GPIO 12 (on 40-pin HAT connector) as input for the
event generation. It works nicely. Also I have briefly looked at the 'pins' file
for the pins 205 and 208 (Is that correct mapping? I took it from the _CRS of
the respective Device object in DSDT), and also checked the whole list at a glance.
All seems much better now — no [ACPI], no [LOCKED *] flags were set, which is the
goal. TL;DR: I can confirm it works for me! Would this be an official one or should
I wait for the official release and re-test?

> > > > > > -----Original Message-----
> > > > > > From: JunYingLai 賴俊穎 <JunYingLai@aaeon.com.tw>
> > > > > > Sent: Thursday, July 23, 2026 2:48 PM
> > > > > > To: BillyChou 周博倫 <BillyChou@aaeon.com.tw>
> > > > > > Subject: FW: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
> > > > > >
> > > > > > FYI
> > > > > >
> > > > > > Best Regards,
> > > > > > JunYing Lai
> > > > > >
> > > > > > JunYing Lai
> > > > > > AAEON Technology Inc.
> > > > > > 5F, No. 135, Lane 235, Pao Chiao Rd.
> > > > > > Hsin-Tien Dist, New Taipei City, 231 Taiwan, R.O.C.
> > > > > >
> > > > > >
> > > > > > TEL: +886-2-8919-1234 Ext.1891
> > > > > >
> > > > > >
> > > > > >
> > > > > > -----Original Message-----
> > > > > > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > > > Sent: Friday, July 10, 2026 5:11 PM
> > > > > > To: GaryWang <is0124@gmail.com>
> > > > > > Cc: JunYingLai 賴俊穎 <JunYingLai@aaeon.com.tw>; Thomas Richard
> > > > > > <thomas.richard@bootlin.com>; linux-gpio@vger.kernel.org;
> > JasonHuang
> > > > > > 黃仁杰 <JasonHuang@aaeon.com.tw>
> > > > > > Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
> > > > > >
> > > > > > 這是外部郵件：在打開連結和附件之前，請確保電子郵件是安全的。
> > This
> > > > > is an external email: please make sure the email is secure before
> > opening links
> > > > > and attachments.
> > > > > >
> > > > > > On Fri, Jul 10, 2026 at 04:37:56PM +0800, GaryWang wrote:
> > > > > > > Add AAEON software JunYing.
> > > > > >
> > > > > > Thanks, waiting for the response!
> > > > > >
> > > > > > > yeah the ACPI flag should not set for HAT pins, JunYin knows it,
> > > > > > > They clear the ACPI flag from the driver now, their BIOS uses the
> > > > > > > default from CRB, but they should fix it from the BIOS to match the
> > right
> > > > > usage.
> > > > > >
> > > > > > How do they clean it from the driver? IIRC the ownership registers are
> > > > > > locked when BIOS hands over to the OS. Technically any pin that
> > marked
> > > > > > as GPIO input must not be owned by ACPI to allow users to connect
> > > > > > whatever they want there and get an interrupts. Many of them also
> > have
> > > > > > "Locked full" permissions, that's also may not be convenient. Another
> > > > > > thing is the absence of bi-di GPIO configuration (or did I miss
> > > > > > that?), which people may want to have (my use case, for instance).
> > > > > >
> > > > > > In any case I have latest and greatest BIOS version (r3.5 of this
> > > > > > year) and problem still persists. Can AAEON share a BIOS for testing?
> > > > > > (Note, if you want, it can be done under our Intel-AAEON existing NDA,
> > > > > > I believe.)
> > > > > >
> > > > > > > On Fri, Jul 10, 2026 at 4:48 AM Andy Shevchenko
> > > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > >
> > > > > > > > Since I have been playing with the $Subject board, I wondering if
> > > > > > > > I miss something or the BIOS configuration is utterly broken. The
> > > > > > > > problem what I see is that most of the pins on the SoC are marked
> > > > > > > > with [ACPI] if you look at the debugfs 'pins' file for INTC1057:00
> > device
> > > > > instance.
> > > > > > > >
> > > > > > > > This means *none* of them (which are user visible via HAT
> > > > > > > > connector) may serve as an interrupt resource to the OS. How the
> > > > > > > > OS should request interrupts on those pins?
> > > > > > > >
> > > > > > > > As far as I understand that the BIOS does initial settings of CPLD
> > > > > > > > and basically I can use transparently the pins as per their
> > > > > > > > configuration done in BIOS. Right?
> > > > > > > >
> > > > > > > > Btw, do we have any contacts to engineers in AAEON or whoever
> > who
> > > > > > > > does these UP boards nowadays?

-- 
With Best Regards,
Andy Shevchenko


