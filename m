Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294F222590
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 21:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237738; cv=none; b=dpRp365YHQAmyKWDLfASZR0p+Fyl8trPJfEuvxAR2gda0BeOKoaW/bPgqUlPpE9kqzq3RSdfbO1+VGd5QiPfHSbfOnaKw+oDJAE9tZtqxQAgVyY6C8BA82HGPf03u0KXefkSHNzEHe85re4h8D7GkfiOUprqZiYgt3iIKbgy06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237738; c=relaxed/simple;
	bh=hiD18l0SGJLPb+KNLi6dAdF/4HzXFKH4dtldDMoh5MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGLDC8gJR3yq551H+cfa4Kc1LB3nAhmst5EOY8Oab6j0xxz0cpVflCrrnH3OoJuXHLP86V6TwtEUIDhzm8SB9lUpmwvaMxZdL+tCkeikNtD8eNdjG5Rb+Zp3WEMJlHO2N2kZDtQAKnzm8PPJ3uvAZ/r9whzNANNKBk/h7eUSUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ahfp1D1q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahfp1D1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784237736; x=1815773736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hiD18l0SGJLPb+KNLi6dAdF/4HzXFKH4dtldDMoh5MQ=;
  b=Ahfp1D1q5pv1q5VvU6IoGhIuqKWrl+F2D5MN9iH17d/dLKl50wQy5mPH
   8A+zZtN05qZZj8oTzxM08rUfabMLzSQw4NENxnIheAiP4YVoaxy86kDbf
   uV5fAYr9U+7JWM786tpGUcaQdof6uxUD91GsLj1j5fp8zkbFIcCxsXdF0
   nW9FfA9B7Ov5T2oQohHPlqWbi7eOinZ5MnLiILXxSxqa57qP5iyz4+ZkA
   zOvs2DqUoONPxUb2LDmWTRkRJY2Gq9hAtQKkRvwGojzPEEG1ivnaDl7lf
   Ip9MJJ8mINbb96bo35M5ETAoChzbHL704tw0TD4zUcgoVPugBuPpDhxi8
   Q==;
X-CSE-ConnectionGUID: cXE+EXumQU2KCZ5RPkqsfA==
X-CSE-MsgGUID: Jjvu3agpR/GfZzjPtecUrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96278281"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="96278281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 14:35:35 -0700
X-CSE-ConnectionGUID: mXKMSy5kQSKnDw1sk1vGaQ==
X-CSE-MsgGUID: 2KJa8BQ2R22HcKpOTMtH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="286680631"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 14:35:32 -0700
Date: Fri, 17 Jul 2026 00:35:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Xi Ruoyao <xry111@xry111.site>, Bartosz Golaszewski <brgl@kernel.org>,
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>,
	Mika Westerberg <westeri@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
Message-ID: <allOoYUZXocOfk8F@ashevche-desk.local>
References: <akTDj-YJjuDOBc0i@ashevche-desk.local>
 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
 <akTRyQqXuSU6pl71@ashevche-desk.local>
 <AA7111AC-196F-41F7-A47B-E5118F7D26F2@gmail.com>
 <akThvlKr5MdbNloj@ashevche-desk.local>
 <73df1090f513777f3c0c4bfd1b9fc01f430ce9c3.camel@xry111.site>
 <aks67K3v2VNIkyRF@ashevche-desk.local>
 <B6BABD9E-104C-405C-9D9C-8B063791B20F@gmail.com>
 <fb6dbc208d771911988d60685f6145b6132c66b6.camel@xry111.site>
 <782E1F07-5E90-42D2-A2E6-4404C53B4C05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <782E1F07-5E90-42D2-A2E6-4404C53B4C05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 10:45:48PM +0800, Miao Wang wrote:
> > 2026年7月6日 22:26，Xi Ruoyao <xry111@xry111.site> 写道：
> > On Mon, 2026-07-06 at 19:43 +0800, Miao Wang wrote:

...

> >>> So, let me state again, we need an input from Loongson on clarification on what
> >>> to do with the property. Because what I read from your reply is that property
> >>> must stay and specification update was a wrong move.
> >> 
> >> If Interrupt() repeated in _CRS is allowed, then I don't think it is a wrong
> >> move, but we are considering about existing hardware and firmware which are
> >> not following this change. If repeated Interrupt() is not allowed, then this
> >> would be another story.

ACPI seems have no limitations in that. The problematic part might or might not be
the ACPI glue layer in the Linux kernel. The interrupts from the ACPI table are being
converted to IORESOURCE_IRQ for the platform devices.

Looking closer at the code I think it's allowed for the platform devices. For
the SerialBus ones it's not supported as they are using the single interrupt.
This is platform device, so it should work.

> > If repeated Interrupt() is not allowed (I'm unsure yet if it's allowed
> > too) we can still use the hard coded logic like m % 8 or MIN(m, 4)
> > instead of gsi_idx_map.  AFAIK these mappings are hard-wired in the chip
> > (i.e. not programmable by the firmware) so having the _HID is enough.

> So will this PoC work?

I think your initial approach to just read an outdated property is KISS.
This all smells like over engineering (since Loongson hasn't given any
details on the topic).

-- 
With Best Regards,
Andy Shevchenko


