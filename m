Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4A34A3DB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821243; cv=none; b=Ea39CxOd9MOTuyg4lStjZS7WNk99bYdpkc+SiBACkRbAuAKDwc1rzPuGWEgsILrLVlvyetJomFS9Ldy+jAErUYjLePqVpsim9T+XKwjO1nHLMP6Yg60G04O4e1bd7hOq2Vbp3ZHf6RFv0sSrJ3NHDr25+9eeumkEDOwiFgdjDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821243; c=relaxed/simple;
	bh=AJ52d1yQLK8OY8GoqNYxFvc+m9iyUW3wdCqsnatWDWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5+bTfHFEkNZGs9k1MX0YMz5T1swqPmfxMRuzx3WtPqBDf8iCD3gnr3NMlyTiwdZfH4xTouV+tyxDC0vsmY495/XYQzxD7X7sR24TnpmtV7KxjvE6eaPHct1xYOJqACAw4MZQnIndPYQVuqrsimTxyhSlGiXPM6+GXRhuxi1R1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mt8uFPju; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mt8uFPju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782821242; x=1814357242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AJ52d1yQLK8OY8GoqNYxFvc+m9iyUW3wdCqsnatWDWI=;
  b=Mt8uFPjuhfcSI0kN2/3iMqlVlljrQE9XF0bTF2F4ozt235wqphrMGs7m
   5LmCpgivd1JjpzDEyWmPNhLvsZ2D2T023n5wfDO0D2UGIoqNJMNACe1Sx
   2QweV5uUY8VyQt+2Yc8dQet5pKgRSdQNbnhwPFjFAhhvflwMQzeKGfh+o
   KamMWPI9rX6bxE2oPyfo6cWwIp+2rsKiRaGdJKfThtma4L1BuFOwIF6qA
   wzVTFTU0He9sbvnxWIdvnnwko+bIdfQ3sCZK+EcaVRlF6AogX/9qjH5Gr
   9/urevi+Fsw+R+LyW8T3yLw3rhoSjhboNQYw0bfW7Doab53s335hxcrhx
   w==;
X-CSE-ConnectionGUID: XL5w7FOYSDOVC674DSIqDA==
X-CSE-MsgGUID: wgk5b8GgRz2qiPqFPi7lAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87368925"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87368925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:07:21 -0700
X-CSE-ConnectionGUID: 8V0jMHu4SRSCNK1CJMrZKQ==
X-CSE-MsgGUID: IQ4Gb1MLTc+3Rpp2rwXsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248879656"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:07:18 -0700
Date: Tue, 30 Jun 2026 15:07:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: shankerwangmiao@gmail.com,
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
Message-ID: <akOxdBR_-rOweHXB@ashevche-desk.local>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:

> > This patch adds back the support for gsi_idx_map, which is used in the
> > ACPI DSDT table to describe the mapping between the GPIO line number to
> > the index of the interrupt number in the declared interrupt resources.
> >
> > This property was removed in Loongson CPU Universal Specification for
> > Interface Between PC/Server System Firmware and Kernel v4.1 in November,
> > 2023, but still in use in firmwares released this year. A sample of
> > an affected DSDT entry from a 3C6000 board I'm currently using is:

Oh my gosh, can somebody actually try to consult first with the Linux kernel
developers before adding non-standard and wrongly named properties, please?

> > Device (GPO1) {
> >   Name (_HID, "LOON000F")
> >   Name (_CRS, ResourceTemplate () {
> >     QWordMemory ( // Omitted, not related
> >     )
> >     Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
> >       0x00000010, 0x00000011, 0x00000012, 0x00000013,
> >       0x00000014, 0x00000015, 0x00000016, 0x00000017,
> >     }
> >   Name (_DSD, Package (0x02) {
> >     ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
> >     Package (0x03) {
> >       Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver

Yes, it's non-standard property. It's a broken one in terms of the style.
See DT binding documentation.

> >       Package (0x02) { "ngpios", 0x20 }
> >       Package (0x02) { "gsi_idx_map", Package (0x20) {
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >         0, 1, 2, 3, 4, 5, 6, 7,
> >       }}
> >     }
> >   }
> > }
> >
> > As can be seen in the DSDT entry, the mapping is essential for obtaining
> > the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
> > for the line numbers largers than 7, it will fail with -ENXIO.

This doesn't look good. Why can't we simply hardcode the proper behaviour based
on the _HID? The gsi_idx_map seems quite regular and periodic, do you have some
other examples with different mapping?

> > The code in this patch is mostly picked from the version 5 of Yinbo's
> > original patch.

> Cc'ing ACPI GPIO maintainers.

Thanks, Bart!

-- 
With Best Regards,
Andy Shevchenko


