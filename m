Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79062C0307;
	Tue, 27 Jan 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503393; cv=none; b=SFrJlT6Qd2+XEx2cvutfnzynGE5vDyNziVOWRQx2WG+sjJKhUJeIMJ3l8uy43SCQYCzVDv3yhka+DXBv8p+t9hrjAGTGtm8jHZXh0g8jmJlq0CEOlqcRbe35W+dMznLeXZr1w0A7JXazhfvjQ8pzIKXHbADAG9NtfZW5d0W5oH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503393; c=relaxed/simple;
	bh=6rp8Gj8+yiigr5D5nr5d/pCnbEGTf8lH3ThAyc36Xag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhJvuijCjAAep/RIxZ1S0HnQUFWg0r20rQg3zX3IYgRX/YUGpd11YlvyOvFfgexCUz5zibDIwna1THpUIVdfzqHGCZRu210Pb/z+Vz3c9t+NInpRbP+Gixu25u5kWhSACDyNRbiBiy7jXRH1ZhOvNcrO0hp3TeW0fuP4nkROq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqX6yacY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqX6yacY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769503391; x=1801039391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6rp8Gj8+yiigr5D5nr5d/pCnbEGTf8lH3ThAyc36Xag=;
  b=CqX6yacYw+m/Pr5L1fB0nYfq9PhmNVQQV/dLdw8pGTTcolYN5vqMqWll
   YO/cDnOVzpubjgY4h7jdDeJz5HbxsyzFx5LPrY/RbLoHOad7mUSfEXXBA
   5whei+tlKpziICz+3WTBjVz35Xp9a36cRdXbqKAdUnOu0wmtn329nOPTB
   hApRdnTrO03Cja3ACbG4rSOsDXlNtKOd4ZZ84IF27/6zJvZEa6+HnWX2x
   OsOfAYTTjw8rbD+iKEq1tBRFBPPYgw2ZDHT2bR89PN5cZ6SM5Zwg16AZd
   D0PwYAFnrG3+GaY6aK6KycOTF4/YN5XUwH5zE631xxndx7n/rN/M1rDV/
   g==;
X-CSE-ConnectionGUID: FvpvaUbkSMK+30ElYQgVFg==
X-CSE-MsgGUID: MPG9B3+sQZCB7sR3i8MIPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88108459"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88108459"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:43:11 -0800
X-CSE-ConnectionGUID: QLvJaP4VSzarKwkFM9fsvg==
X-CSE-MsgGUID: CsytN/y7QBOdxJS7XIEUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207976922"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 00:43:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1A55F98; Tue, 27 Jan 2026 09:43:09 +0100 (CET)
Date: Tue, 27 Jan 2026 09:43:09 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Join tng_pinctrl_probe() in its
 wrapper
Message-ID: <20260127084309.GB2275908@black.igk.intel.com>
References: <20260127083845.3681331-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127083845.3681331-1-andriy.shevchenko@linux.intel.com>

On Tue, Jan 27, 2026 at 09:38:45AM +0100, Andy Shevchenko wrote:
> There is no clear sign why we have tng_pinctrl_probe() in the first
> place when it has already been using managed calls. Join the function
> to its devm_tng_pinctrl_probe() wrapper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
