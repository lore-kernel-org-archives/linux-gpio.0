Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F2A238166;
	Thu, 24 Sep 2026 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283993; cv=none; b=WL2yBLVFtXFtAdCIuiRRyWoqMn1tCq0FWx5XaZzupr9NdBmrpQhdP35jBvvA2otfGEgss/cGRrgku1qDSE3W0RsffrsXJ+M/NPwX8pz/P7tyKXH8vWUotbIoZPHAsBA5XHUXBSWuq0sO9x/bXoMDKUa430ZEqpH4wTO4vesGbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283993; c=relaxed/simple;
	bh=Sx38KfYXo69J+GT7YM6M8Cm+EwnM5jIXC92ixe7RFqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcYQZoxV2wxbUXSSMq+hi5s6kzajZYCqxmCUbeSXl2GktphwgkyUKMVbbUqD62UAyI1Ucq6wh/XZmelMenIBcnoLoCYWcPtzHKGrCctxgPwds9MMcbrFTySMqoMTD5ORoDJAwD1LIrMJ+Aa9IBND9juhH8NHc5MIS7ET26HjVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4IUWjU4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4IUWjU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790283991; x=1821819991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sx38KfYXo69J+GT7YM6M8Cm+EwnM5jIXC92ixe7RFqo=;
  b=X4IUWjU4onQuSmuIPVz3G0TAVWYuno+ahanP9FGVTUsHWGBrv62ME2Mb
   Jb2rBpaON8keJq4WYIFZie6oNKjtC9KBlSysiYCk5tDUL5S1rC/E5yKn/
   OImRD7WGKUNIWm5p3lnGoTg5Z/WXeVXNsirT+jjLNTs2L8l+mnv3ww+Rp
   c+PthTTEHFrpAo3UVHwoefYLUudp7FUFq8Xifi7PzqYoc5t54UXH0cVT3
   srW3wLnHRScFaVNnlacb/Ts0uc81NSASgpUXSVRf94kMJJVNo3OGwjjmb
   hVPvadNBRbCN1w5+GKIipjo0tjmI/IXhLxmO/vEXassLQTsVAyNcac8bT
   Q==;
X-CSE-ConnectionGUID: rSLus3Y7SAqbvjeKReV0pA==
X-CSE-MsgGUID: 0RvrvHmjQZGPCql2vlvHlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90936880"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90936880"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:06:29 -0700
X-CSE-ConnectionGUID: AHNfqT8xT+qKCh9FAItBCg==
X-CSE-MsgGUID: /bGDIzbcRuqgTnKPWz0Bjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278862432"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:06:27 -0700
Date: Fri, 25 Sep 2026 00:06:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: regmap: document gpio_regmap_get_chip()
Message-ID: <arWQ0VNQtqiOGz5p@ashevche-desk.local>
References: <20260921-gpio-doc-followup-v1-1-618738124f4c@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-gpio-doc-followup-v1-1-618738124f4c@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 21, 2026 at 08:13:33PM +0800, Long Zhao via B4 Relay wrote:

> Add kernel-doc for the new helper and state that it is only for GPIO
> controller drivers, not for GPIO consumers.
> 
> This is a follow-up to v8 09/18.

Then fold it locally in be sent in v9. However as far as I understand your
small chant with Michael that the new approach should not use it at all.

-- 
With Best Regards,
Andy Shevchenko


