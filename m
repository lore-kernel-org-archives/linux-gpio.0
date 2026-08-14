Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FDD41A507;
	Fri, 14 Aug 2026 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709246; cv=none; b=rbmfr3w/plZ07UFtcxcZjiP23nWwUETNV2s8enohTW7oh5hRek44Fx6HOrq2b/NdLRqMU4e+T+ehIqbFihgQc+XuUbERVa6xmVCEUrxYbAUD50q8byyBaIMjFN+jQwic5FHFOY/38GtA0UdWXD4YGX/Cq53qlY8ORF7Su2TF03w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709246; c=relaxed/simple;
	bh=gSxTcVU6UzExx5ZqzBMKgR9c9sXg8Sm9ZZVlLKBiHQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFPGsGtoBbUqyy4avDIlzpwjvGyKv9hgNHm9KzTfmRQqFAVuglzVkAsfPWNTvg7GwrV6nMFX18zJ6Pxbac+E7Y0NXvwT8K/o0e6fQB3j8WuzdqgExftfaNtpTV7vEPKAjLGswgTUb6jTAluGUA5wcdklpJgyL7U815FQ7KlhI1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4HHRPhy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4HHRPhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709244; x=1818245244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gSxTcVU6UzExx5ZqzBMKgR9c9sXg8Sm9ZZVlLKBiHQo=;
  b=K4HHRPhyjmMsh1kiuMwCSFnLWAz4mbmVVJSexiVyR7gdU5r/+MurkvIT
   8qb1PLdt5SemIOyoHIyQgMyLeG/P+xjqEonw4gI6JvHXPSttJKrG0An3x
   bN/eKf704BEeFXUISqzUQbZPCqyguvV+sqNhDEJaWfs4skbZPuOFpbFtT
   BVHpw5eTgEOzM1wqYN2L0e6XtWtJ+YfFuL0oNSNuZ02hN49sJ+DEKu69R
   gfCql6Pi2tMsspLa85XS5SJi3ZU3VDZGPKENcykgKD3vfwYHxxMxkV7GK
   uX7sBkcKlBcNRsZea5IiUXEqMZKEx6ts1WBJdHJjuVXmFQVzlKBmLZszk
   g==;
X-CSE-ConnectionGUID: OF/8R5ikQfOFrx256Xv4Lg==
X-CSE-MsgGUID: YbyFa2l+QRiOhoCuS18CSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98644426"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98644426"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:07:24 -0700
X-CSE-ConnectionGUID: xUyAUoGaQSOlVLMM1ZEs7Q==
X-CSE-MsgGUID: g0k56rztS/6htBrr6Z1a9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="267695195"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:07:21 -0700
Date: Fri, 14 Aug 2026 15:07:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, tychang@realtek.com,
	stanley_chang@realtek.com, cy.huang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v2 3/5] gpio: rtd1625: Narrow variable scope in loops
Message-ID: <an8E900DedLJXEoD@ashevche-desk.local>
References: <20260814025657.1400452-1-eleanor.lin@realtek.com>
 <20260814025657.1400452-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814025657.1400452-4-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 10:56:55AM +0800, Yu-Chun Lin wrote:
> Declare 'i' inside the for-loop header and 'hwirq' within the inner block
> where it's used to reduce variable visibility.

Sounds like it also can be split to two.

-- 
With Best Regards,
Andy Shevchenko


