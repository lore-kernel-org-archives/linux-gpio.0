Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535571;
	b=AlnLM5IEbTCtD+rJz7of+wkwIKm3Uwl4rBrtrgvzNAbQO10ZWJ4DlfWCwjKIMabJOixx
	 ErNa7OiKahrj3JTg/CUsf83VJHiMmHu5BVZCp0vL9PSc8nzVAl56CJwIC8N0+7KRme8jR
	 dgvQLQuStxLR0fSe93XLmMFGKezHyyXrdfYingtMUvcEFN0Pt78K/8Y3F8vjqOPq9sc00
	 Egw9EBzZwtiJ/udiaKo8Wl6Vz8zuYKZG7odpDQfBs78nLVcvNhlwEOSEw2FRxn00JAs1c
	 ncZdtfFt/Gy7DmfZv0tJ+ACBjU44uFNX/FUf/PaRzTwSxd1yaRH/ScUFXPwLhA9xMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535571;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=XpMQNmyTQAqvIoyQZHcZYRMFIEIVqmDAIGpA7xBBLU8=;
	b=c6AtUSRPG4oZVNNmIukDBIV7unqXFMcDjNyBmYeEG/qKvtaaMTULh2UDhT/GpmkeJ2+W
	 oYSAeUnD6FpYHpl2onZcYuqgO+3qL6/wE1/ieq+T9GcAX32Moqtin47ahPA4psEnYbYSN
	 ysBKaJHlnlktsIdCO9wTQpOhVRNJf4MtTt/OO57wS3pdQXz+o7VayxQ0/nWLXh0lQWNvQ
	 gbHYkdaTpXHWlukiZcuFroawq1IDs56tosREVfDZUJYiN/Ka2IPEK5ufplMwctrA8XW5+
	 4VvaN6EyWgllOuDlrm8VR/m1kGhMk0QLlRjbCF4XVu6zp6RAlbTx4fWkPYTSc8SUpuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TQ04NkPV;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E221606A31E;
	Tue, 24 Nov 2026 15:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E221606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TQ04NkPV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795535571; x=1827071571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bu3ZzKJFxKOMBnFL1hrUcHdjIZNBHrB5bZc/ct7kZpg=;
  b=TQ04NkPVBRIHtkbkFsyaSThAw6OhbVpWBSIyQVEIIGah6qFgs2TQkh8d
   wBIHGZIea9b+xVK3iHBh2SV7d0HT8B26Tx51l1wpIyY8WKSVn1o0sjXRS
   x+gavtgHMijWiwcf3V+jE2/W5liqPsVZDmjHUkGO621vqrNk6/ZQ6RBie
   DqL2rd4a2IgQwcfRfqD2EpCAlKfp5LgNwPSNKfX/939SoOpgF9BNtAgpn
   uGAfy2G/muaaK7/+bF29LZvl3p9SCaiXJzzyZ0YtKBAOd2omvh1Xe1Xgj
   RnxjPhfZwo8nD5vyhsHrZKGtRTViE4PsTSn0WdRlwP+hvr9Zj/zAV/X16
   w==;
X-CSE-ConnectionGUID: Ns6P7QlNQLW5OELIyFYKUg==
X-CSE-MsgGUID: a4rfhbcNQYeGMNNyd9/rTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4387994"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4387994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:52:42 -0800
X-CSE-ConnectionGUID: pL5D30ApQei847+yzGJqeg==
X-CSE-MsgGUID: VkkIDHZhToaC8wsqdIZMJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11893428"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:52:39 -0800
Date: Tue, 24 Nov 2026 17:52:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	Kent Gibson <warthog618@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still
 requested from user space
Message-ID: <awWyxCSnEfG0im8o@ashevche-desk.local>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <179553128045.30278.93325260808484684.b4-ty@oss.qualcomm.com>
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
In-Reply-To: <179553128045.30278.93325260808484684.b4-ty@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 03:41:22PM +0100, Bartosz Golaszewski wrote:
> On Tue, 24 Nov 2026 11:20:31 +0200, Adrian Ambrozewicz wrote:
> > Removing a GPIO chip while user space holds a line request, as when a
> > hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> > and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> > a blocked read() stall the removal (patch 4). Patch 1 makes
> > gpiodev_release() wait for pending label frees; without it,
> > cleanup_srcu_struct() can warn, more often with patch 2.

[...]

> Applied, thanks!

Thank you!

-- 
With Best Regards,
Andy Shevchenko


