Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829938;
	b=cptlZK7DDsdGYpWG73bh3rdXyYvCkWUfVzbLm9bSj8iDuHuZvgYxUlDKnJYp7hL4p8HI
	 jTDhnfUpEkMItzvuC43805bSypaNNORmn82PmHPrXgE5p3kH4eeycY/Cv/K4/A3DT8BVT
	 dfWnAcZjeVr709ETx/0D2HFxrdLykSDAj3jat8TfC44UBGEsoS1lD2UG3K0AjF0OmXN/h
	 4yrVaIEsIvrZNEUvPE3DWDFruqhBr1hctcKhE79GncFQkOxs8gGOWXs5jbHO4oawRUE4D
	 u8IfYkMjUrNrn28NaoGe5H2a21M9+1PGcLZR5yVEj8OYa1FldTrOrQ/81TRItbiCjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829938;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=2H7Qz1hbUFxeTortjCVtaN2LpttMmibW+PPG+dhuH5g=;
	b=KgNsuEoaTqf1sTkWoBeKo4hOWiYc2oy16Y4KntHHbiQVQ43gXb9sIiqCzPE7sJqrv6rL
	 6vLYjIjUiSZYu76VCX04CkxfIp9aFyZOGfd5ZTeMTMIa+tWY7snwnFpSrj8gz4nUsOBH1
	 kMORzM5tc+SppAZamjtt3Esq2b22y4UWLBZ+kM76G4b8pMjqnvayrfb6qARRCviSpiDqa
	 PbBNpIfYDfIoJkIMIZbyIkj9Y7ZsRgml6echpBGjZflxgvmDmwQ8vAuLT+PZvqP1+8Sb1
	 01XLnp1K8zc2IvtTVjcpBI3p1Gwnn47yqLcwmUvoIsSfYbSuykrVW58FkdaD40XAb2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UzwEqeT0;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B1606C92D;
	Wed,  4 Nov 2026 22:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394B1606C92D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UzwEqeT0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793829938; x=1825365938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DkmTEcT4ie/Jd5AT/Y+y6b4Ri8lpkG0TIqlwf/w7344=;
  b=UzwEqeT0Sxp7I+gR0qmVguMSG1THeRkEZ3EnHVeWuSi2zcGSiEhv7Kmd
   S75hgSyr6xTcQoUxILGcTcnPiJn7I8pDhmbgunJDxLK/rNhcgJ0z1fFiM
   nE5u1blEdfqb06/OZ8FtSic2oCa9Gil4CNso8PwsSwBrXxDeJy3r0AX/U
   pRggWJuaWVtryCck4i2p9moDcKqAkkrWQVOSNaMb37FwgZeTQzUu5Vkim
   rz+nHFAaiHtk6R7QMJ7Xj5DS4Gk4SrHrlR11ABBoWHQuiWKOw0nbgHHW8
   ybKZrI97yELDxdT5Sf8L2J++yQsVNWm9GVRVXmiYOf/KmOZq2LjgkuFeP
   g==;
X-CSE-ConnectionGUID: lV7TYPTOQLSHGmz5zzPG6g==
X-CSE-MsgGUID: DHgcniwzT7uKhE4hMfNViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2597114"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2597114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:05:37 -0800
X-CSE-ConnectionGUID: 0S13eHReSO+WCgdjIul1NA==
X-CSE-MsgGUID: qraWBz+nRgu3V+Dmku3KKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7145512"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:05:34 -0800
Date: Thu, 5 Nov 2026 00:05:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <auusLNvkCmHs1buP@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
 <ausjJSZkaGKNfykE@ashevche-desk.local>
 <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com>
 <auumQhqJwIl4XZDM@ashevche-desk.local>
 <73caedd26b375ae7671d24bcee115f05@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73caedd26b375ae7671d24bcee115f05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 01:51:52PM -0800, Dmitry Torokhov wrote:
> On Wed, Nov 04, 2026 at 11:40:18PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 04, 2026 at 10:14:49AM -0800, Dmitry Torokhov wrote:
> > > On Wed, Nov 04, 2026 at 02:20:53PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:

...

> > > > > +	bitmap_set(array_info->get_mask, 0, count);
> > > > > +	bitmap_set(array_info->set_mask, 0, count);
> > > >
> > > > You don't need these, as memory is nullified.
> > > > Also note that we have bitmap_clear() IIRC.
> > > 
> > > bitmap_set() sets bits 0 .. count - 1 to 1, not 0. Both get_mask and
> > > set_mask start with all count bits set (assuming all pins in the array
> > > are eligible for the fast path), and then gpio_descs_check_fastpath()
> > > clears individual bits for pins that do not qualify.
> >
> > Ah, indeed, but we still have bitmap_fill().
> 
> bitmap_fill(dst, count) fills whole unsigned long words with 0xff
> without masking the tail bits in the last word. Here get_mask and
> set_mask are sized to max(gdev->ngpio, count) bits and passed to
> gpio_chip_get_multiple() and gpiochip_set_multiple(), which iterate up
> to gc->ngpio bits.
> 
> When count < gdev->ngpio, bitmap_fill(mask, count) would leave bits
> count .. round_up(count, BITS_PER_LONG) - 1 set to 1, causing
> get_multiple/set_multiple to touch unrelated pins on the chip and access
> value_bitmap beyond count bits. So we really need bitmap_set(..., 0,
> count) here to set only the first count bits.

I see the point, thanks for elaboration.

-- 
With Best Regards,
Andy Shevchenko


