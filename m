Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E62D060D;
	Fri, 25 Sep 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331157; cv=none; b=KfzphXodmeKAbsijCfu7u/qkKoINB1P1sdzPuKsUxkpyzLCGhWsrlyZKi2KvCTohkwSbQf4BwzUvf6X5hird67NNaaJilJtp3wd1sUwJthnehQCntwai0fqhF5cCiZlHQzqg/VlEMkdEW9CjEY5gxHtYBzanT0HhFsrkflD19Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331157; c=relaxed/simple;
	bh=dv2u98nFhxhRrbwYzb+0UpndXO/oEEo4CVDcMDxVYYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnZvSbvE+qi/wyCYoys9kq/mCOWon42DcGlUjh0hpmTRCS3SJzxYQJal/E3veM3cdpuSjV0brTwNBVdC0pFVk3p3zSHf59Pum3yZkTXt+Kgf72en1QAfY9/HdERDXFzaPhcZpNXXcxE6PbJaAICoDdgvfAPcEMfPBpeJ762cte8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecfxsCrT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecfxsCrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790331155; x=1821867155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dv2u98nFhxhRrbwYzb+0UpndXO/oEEo4CVDcMDxVYYE=;
  b=ecfxsCrTyG+uO/tgGDhRTxRk8BtQcO1T3QWkAo+jVYacWx9J7e0MRJUR
   h8KTahPa0UTIhWyVpxbCwj0UalJM4EZQo5hCBJVj9Hq5aJtK1IH3t9bzg
   isjFRJIaq2kHcsfNY4VHwJDOzvPW1zIyrArrgqceFhvVQOe+gaPhUoEZz
   Hyobao5V71JtukqpSn8PFy84a6/2gYsf2l9WFdcuJKjESj0Xbn3iVgjiS
   2l4vgffR4YLwBjYyK+TDtneGCYiIvBH9HawiAfsfptcGaZtblXyWv1cgt
   322JVLWQBsbLhpePxLz6zPARUyX5HW3GFIkiB9QVoNPah+7oE+gGGVYOj
   Q==;
X-CSE-ConnectionGUID: wm8p8DYzS32ApQI6Yjxemw==
X-CSE-MsgGUID: xURDvrjrTEe/6lgApPMjMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102477326"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102477326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:12:34 -0700
X-CSE-ConnectionGUID: Ehufj+LLQQu/rJoKwROnOQ==
X-CSE-MsgGUID: AaS7fhlDRTeYDuOAcUHP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273786715"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:12:32 -0700
Date: Fri, 25 Sep 2026 13:12:30 +0300
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
Message-ID: <arZJDjT42V1X0I8m@ashevche-desk.local>
References: <20260924083512.461838-1-peng.fan@oss.nxp.com>
 <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
 <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
 <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 25, 2026 at 09:54:42AM +0000, Bartosz Golaszewski wrote:
> On Fri, 25 Sep 2026 10:27:55 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
> > On Fri, Sep 25, 2026 at 11:14 AM Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> >> > Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> >> > the simpler regmap_assign_bits() call.
> >>
> >> Applied, thanks!
> >>
> >> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
> >>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdeaaa85
> >
> > Are you going to handle all the Intel GPIO drivers that have a
> > MAINTAINERS record?
> 
> Sorry, backing it up. We really need to organize GPIO drivers by vendor...

Do you want me to start intel subfolder?

-- 
With Best Regards,
Andy Shevchenko


