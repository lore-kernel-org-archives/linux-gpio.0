Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392FD4D0A0B;
	Thu, 15 Oct 2026 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092104; cv=none; b=o0+z8UyuUvCoQ2uFTd5U096Yf1i/zFo3L0jx4hwvNBSlOLPcGGzX714soppaS5yB1fm+DkJJNq8aYBn9gsYU/ymqawa/K7zFBk4fHQSaMQiTOZFWYcLgLH0esNsaupEtWmQfziyQGNYepWkR+j4NMZ6135CtHLh65MEmNgH6pnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092104; c=relaxed/simple;
	bh=9LqhazZ8y0jzFuAz+1Zjczovem69p4adWSJPxrySQ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gy/g+Bl0j3eMNlEYD7AzhTXxrxM76TePdR2NqiwPBD1Nobd9+bBG3x15BijLgIH5Zc4AAMA4YWEHNEIY0OQXSj+in3ryl9eMlOnk6f0t7wAOd8BWYjaomWmKoepxc+VjoZR/1O4OxYQ1QpDSdP17JUOk/RqqoSGloS5uwR9m8io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3Cv3nPi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3Cv3nPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792092102; x=1823628102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9LqhazZ8y0jzFuAz+1Zjczovem69p4adWSJPxrySQ4w=;
  b=n3Cv3nPih7jUBd9JIwE5Pg3aqeMV+OdAB/w+/KKONsAUxd/7DYuQzeci
   ZChy6Y1epHlESNxDhtRHm3SrSCiU12Kvcw3Q5/BJaUy2yZRPnF5P4nrHQ
   q7r71CEeyUCJh8/JBFPVOCIEQZxmCxKaQgZr3/WO4cjJTNoEEfEwBkfLM
   Dw0l7FKpb5sViIDVcvLXZlB42CFe4bihFKE+27mMW3GpeAQyfuuASYTPn
   kZWYPZPgmOxlOu7aoULoiTAOlr7Bf9Deg23TMPO8bNCX8dAYOD6bpj4Ma
   jsQr5Zb9xxYk0Ke3DlWvnHXcpAdr2RgVj+0gRVRw8jes+iJpvTsPyXHpM
   g==;
X-CSE-ConnectionGUID: 3udm8/EGSPaNWc0Bq0NcAA==
X-CSE-MsgGUID: qDy2VMzhRAyl86fT3MEsTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="874444"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="874444"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:21:42 -0700
X-CSE-ConnectionGUID: bSRXlOtVSZOQfVM12h86JQ==
X-CSE-MsgGUID: EcAkDL28RuSW35z1IStPJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2237555"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:21:38 -0700
Date: Thu, 15 Oct 2026 22:21:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/8] gpio: pl061: drop redundant pending check in the
 IRQ handler
Message-ID: <atEnv-fSdwSDCcO1@ashevche-desk.local>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-3-3fe3eb315a55@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-cv75-gpio-v10-3-3fe3eb315a55@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 06:53:30PM +0800, Long Zhao via B4 Relay wrote:

> for_each_set_bit() does nothing when the mask is zero, so the
> if (pending) wrapper around it is redundant.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

One nit-pick below, though.

...

> +	for_each_set_bit(offset, &pending, PL061_GPIO_NR)
> +		generic_handle_domain_irq(gc->irq.domain,
> +					  offset);

Make it a single line now

		generic_handle_domain_irq(gc->irq.domain, offset);

-- 
With Best Regards,
Andy Shevchenko


