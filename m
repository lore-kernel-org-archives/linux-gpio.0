Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F714B95C0;
	Tue, 13 Oct 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884789; cv=none; b=Be/+cQAAP/UY17Gf3/OQEivJjWTPZg6VxoyhxPpWVJI9bVrn/SXMO9vjkoRkJArCbwIsJw2ZBusP6syPY4/URPjP6pp9UG+c4h21oV4wgmsr/xzznUq6mwqhBQ7VXH7gzrscQImYMsNSkzlNJ4S3pWO3wP/fqFBWNDHtLlurUTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884789; c=relaxed/simple;
	bh=dsQ3c3r30MByiQl80F9uySddLkO/UAS3WgjYmjdt+fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meOysWyzREQ35qCXeOs4pzgT4KFHch//RdL1QZUOXe6lQSmb+oLGMCzhYc0nDVAzzf8y0ag9YensTgqIbcY/nGEbt/3KFl68IstxRynRaA51xCWJCiSg7JerFucIvlwa8CCRjuz+IC2n7SpjR1Zqwxh+GkdzZ9/ZTeuIrQFA954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8F5AjUs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8F5AjUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791884787; x=1823420787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dsQ3c3r30MByiQl80F9uySddLkO/UAS3WgjYmjdt+fs=;
  b=J8F5AjUseXBAZY/iEPMxONLDQOgT8Ln4zjDklWKSn7eyNzRufP3ptSiN
   eemGACbL+ezF4Xy1/Hz3jWUz654rAGtiLOhJKC+M7VGcgM/xoMUYSaSRY
   R/4F1EfvUGZSkzTRQPUdeRJyWQPSyyapAJJxLdWdPNLi4XbvLj3VEldbV
   OZnTpsnLUPp0ZZosH5H4enZtGFGsmcTnJye4JR7cuomNTXxw0Fu8N6h74
   uyg/wKfR010ALPXuNxPeDNtZFfMhsVQ3QqoU/lQhHGdD4UDfY8vQ4rOp6
   DpoM24zsF1LtApDUerWdEK+0sfTIOhIR4NhDBy6jx47R+q25Sss2lqQkc
   w==;
X-CSE-ConnectionGUID: a9koeaZnRXyKlN+QBWmI/Q==
X-CSE-MsgGUID: KD67smqoQFeuOdSWBeUn7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="504747"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="504747"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:46:27 -0700
X-CSE-ConnectionGUID: jFIpIThAT2iEEf0urpX9OQ==
X-CSE-MsgGUID: smM8Y3woQKiB7j0xfwBQXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1091222"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:46:23 -0700
Date: Tue, 13 Oct 2026 12:46:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 7/7] gpio: pl061: add Ambarella register-layout
 variant
Message-ID: <as397YYv1k_IfIJC@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
 <as3a7UTe9YEyBAY3@ashevche-desk.local>
 <179f2223.7d43.1a1347ce995.Coremail.zl020895@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179f2223.7d43.1a1347ce995.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 04:59:23PM +0800, zl020895 wrote:

> You did give Reviewed-by earlier. After that
> tag the commit gained the DAT cache, so I dropped the tag because the
> code changed. If you are still fine with that version, I will restore
> it.

Yes, I'm fine, please keep it, it was not that change that requires
reconsideration, but thanks for explaining the reason why.

> >Ick?! I thought I gave a tag for this. What's going on?

-- 
With Best Regards,
Andy Shevchenko


