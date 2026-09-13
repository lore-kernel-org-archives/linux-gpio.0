Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F83876D6;
	Sun, 13 Sep 2026 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286891; cv=none; b=nuhaGvcl8lgJ5J6cHMQ6lmvs8pg+w8fqsW6u2FXhplqJaW5kIdcM5HybdXLKrBlHhgLM8QepEEu4ctwDt04z0s99BvX4v3xdfhwdVomIV5/Zm20z/vUSLof6fT8AUigI9PLGgd9yKCi+8880USrqPmh2bQ69ag3sXrl2xrzrZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286891; c=relaxed/simple;
	bh=KVXWnXKt18yT+rXsHFFgdU4B/qSR3ZMAvaJWAP+J3SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cdu6FUtGq367rkU872hjDOM6u1FwsOr68g38szI1ud44oQFYhlomtosLHxF/NGP9HVRxoeh02dEtu3WsUyqSgEuGlQZfT10vhR9j9QZrvG1v2rCoLLc3LU9Tgjq1SmqMhi3OxKBFycP/JtR6FL+ftrjdmEW+5N6chto1C67m2oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvpmDIVj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvpmDIVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789286887; x=1820822887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVXWnXKt18yT+rXsHFFgdU4B/qSR3ZMAvaJWAP+J3SU=;
  b=lvpmDIVju2dyo+sDqNAn1JwEcAISjpixFNUGRjzuV8knVLwcPqe/eu4+
   nOAfegYnnb8RKY5kRHXDjOw2QU8THt2dSL4kH0M20JakNXyVivPuN4R9C
   fHvzJYxkccu/zAzaOpmIxBOj6K08b6RGBntYkd+CApIm1heBqUZELIbkK
   5wsq1ZvXLyJ/m7MbCNaBPYgJdnaciZnSFH/V8P6eYAA2770YHl6Hj8AJa
   t1WUxz2QUOQyQQTSZUR6DueCJqX8h07PoNmIhmfXY6zH5bCkr5g7nqju4
   sxCykWKj5KjaH+ontq2cOBYwPUus9gB8Wl3LxPu2enkXKiUcSHDWQkI7j
   g==;
X-CSE-ConnectionGUID: ILO/MHpvSV6b2KABGLRO7g==
X-CSE-MsgGUID: 1pZMWrbQRtqzfBYCR7vIxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89447270"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89447270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 01:07:58 -0700
X-CSE-ConnectionGUID: WQ+86aOoSMCb4Tgzhk3VjQ==
X-CSE-MsgGUID: EsBqSr5VTFesXKPO+1FgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="271858118"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2026 01:07:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0541B99; Sun, 13 Sep 2026 10:07:55 +0200 (CEST)
Date: Sun, 13 Sep 2026 10:07:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] pinctrl: renesas: rzt2h: reuse helpers
Message-ID: <aqZZ29nvQb-A627J@black.igk.intel.com>
References: <20260910160226.489183-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260910160226.489183-5-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910160226.489183-5-cosmin-gabriel.tanislav.xa@renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 10, 2026 at 07:02:26PM +0300, Cosmin Tanislav wrote:
> The PMCm peripheral-mode test, the PFCm function read, the PINm input
> read, the PMm write, and the PMm read are open-coded in several places.

> Reuse the already existing helpers.

...

> -		reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> -		reg64 = (reg64 >> (bit * 8)) & PFC_MASK;
> -		if (reg64 == PFC_FUNC_INTERRUPT)
> +		if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)
>  			return GPIO_LINE_DIRECTION_IN;

Basically this part with the helper should be split into a separate patch w/o
Fixes tag.

-- 
With Best Regards,
Andy Shevchenko


