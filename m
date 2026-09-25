Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF056495AE4;
	Fri, 25 Sep 2026 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332549; cv=none; b=cwlN7zcSCEBIBjSA/ao8zUABVKeqrozvbbPaOuEkF9yf8wCCzfS3gGgcJ0vMdzUqHZOyLK1dxXDk+ozc6A/RICIbMemzhWxtNZJyQk0ZiQjkvDe2DA4WN3OVEBJmac0B0xTaL6NEuUWUxJjrCJxA515+BlgKzIR1eKAyccTG+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332549; c=relaxed/simple;
	bh=wQqmt2NWHj1mgubyNVguKY/67LUBnd0DTi3PNonAcPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLMeCbYS3SuvOHPlTw98DtlLQrs2G/D0rE+fwQsjeV381vTrtYHkvQvTULQJoVHlVqFB7Mv0LFan4dnvPfO9SW88gs2FPFs+vriHomaSsllYTIwOI1QZuvhtmCTNfoQzMWzUnsNTXYzT7NYC6Mjev6e32edbEIKIZPoCUzSxo9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYhr6Xe7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYhr6Xe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790332547; x=1821868547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wQqmt2NWHj1mgubyNVguKY/67LUBnd0DTi3PNonAcPU=;
  b=CYhr6Xe7f66lZzO3cOGXI18vW6840z4FhxxPmQeUpS26juTjOeyIDTZr
   3uX1DjWYYAHxl98V23WpXfRKjatjZXXk5TFANVPqBeCNabAoYJTgZA+wF
   aTOkGxcxxPx/wgnxsy5HXTN/lNJJ1V1MwExdV9q42z9aI8NVckIS8aNA2
   eNwcDUvlwKkwt2Y6Dry/49hs1SiMbUAhnrLr84ZpVmP/QsmQSpfLwdlWn
   JO9Fgy9CblfrK/4lUVvsIRJCQ+TwPE6h+urD6cQYRdxaoA2nZO0yxxYWA
   EXwI6Zh5ESf0KildsJTIOK4brNMB+AW/Z/MczOqc/28fc71vIyxnWwDSi
   A==;
X-CSE-ConnectionGUID: iG8KllMgTz2xDstMJ+PUtA==
X-CSE-MsgGUID: erTjxSLYSVyc/MQwLfShfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93835012"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93835012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:35:47 -0700
X-CSE-ConnectionGUID: uNXAvX86Q3iNNlCxgwrtKw==
X-CSE-MsgGUID: 5vekCPdMQk2Jcqa9XUgEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272431679"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:35:44 -0700
Date: Fri, 25 Sep 2026 13:35:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional
 set/clear
Message-ID: <arZOfm4_ePPn6QU0@ashevche-desk.local>
References: <20260924083512.461838-1-peng.fan@oss.nxp.com>
 <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
 <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
 <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com>
 <arZJDjT42V1X0I8m@ashevche-desk.local>
 <CAMRc=MdZ7n5061rwA6mo0_xTn++63HZ_JjwxTaC_qMWvTZT-fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdZ7n5061rwA6mo0_xTn++63HZ_JjwxTaC_qMWvTZT-fw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 25, 2026 at 10:23:52AM +0000, Bartosz Golaszewski wrote:
> On Fri, 25 Sep 2026 12:12:30 +0200, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
> > On Fri, Sep 25, 2026 at 09:54:42AM +0000, Bartosz Golaszewski wrote:
> >> On Fri, 25 Sep 2026 10:27:55 +0200, Andy Shevchenko
> >> <andy.shevchenko@gmail.com> said:
> >> > On Fri, Sep 25, 2026 at 11:14 AM Bartosz Golaszewski
> >> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> >> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> >> >> > Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> >> >> > the simpler regmap_assign_bits() call.
> >> >>
> >> >> Applied, thanks!
> >> >>
> >> >> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
> >> >>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdeaaa85
> >> >
> >> > Are you going to handle all the Intel GPIO drivers that have a
> >> > MAINTAINERS record?
> >>
> >> Sorry, backing it up. We really need to organize GPIO drivers by vendor...
> >
> > Do you want me to start intel subfolder?
> >
> 
> I already did[1]!
> 
> Bart
> 
> [1] https://lore.kernel.org/all/20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com/

Sorry, but I have my own approach which I prefer over yours. I will share patches soon.


-- 
With Best Regards,
Andy Shevchenko


