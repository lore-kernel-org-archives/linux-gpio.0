Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE4353EC5;
	Wed, 28 Jan 2026 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606947; cv=none; b=taBU5TctQjxVh+/dCMBWIU0RXRxhznvfQd0Zoz84iKUYIUCWZP+gG68A/6VKzupObGtrQva4STYpK6oeDomvumQj6yrXNOogZxBrV8WNn1vMp2YjhBHq5r3HsF2lTNNe38ESLQWJP8OYBbX+1nsJ/x2QSvAhmT8+NRltW93RiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606947; c=relaxed/simple;
	bh=BVN0w+dQ+RIkXFeD5TyG4u77LfHTRfM2vlqZ06nIug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEJ/oUmHQmb+TVDnyKgaUA6NIkoCEJkx94jtZ67Ng7FgefZbJhiFmBb39mHlR7Oy4IANxMNYbe5aQyS2g7Um9I91A1vwYZgGYq3P0HtQQX2PJ5sA8OSA+wJlc4WJRnmxrs/rbfTPXxR475BJxAkF51uF7g0eLVPRLmLnti1UdJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEst4CR0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEst4CR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606945; x=1801142945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BVN0w+dQ+RIkXFeD5TyG4u77LfHTRfM2vlqZ06nIug4=;
  b=BEst4CR0WuJzOYJJyCK4w5KdpSgqpRa6el1uAmJiUcoYQJMvTsK1Zi67
   Ohu51pUBJhu2w95Xa5EKkMF7mhA9XpBo9KzgaStHEOP5yzjxuMQg7KgsR
   hW8abMT6R5Q2EPvwmtffHODOZ5FzE7DGLpo4qUWQ123Dn0gtUtSkJIZ4T
   rZVuIl1Xo0XQSNgHS2L8yojpEPNq50NGESvNTQrCy7IytA5Ujc9ppKxZD
   ZdxpHsRRESL+o7fBxB87Bu86pqDsxlkPtWo4h90hulx7L6J0/vA1jBK5n
   He+LRgtbZ87oGcactCbOetzMdSJHZ3y8WeoRb/BXr3z2SG2YEmMpzTGhq
   A==;
X-CSE-ConnectionGUID: A6xxjAGIQ2u4/rrx5uieaQ==
X-CSE-MsgGUID: e9OkUDNdQLKSvZSSp4h00g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70717937"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70717937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:29:03 -0800
X-CSE-ConnectionGUID: qX61SzQwQF2PnVBZZdD2Yw==
X-CSE-MsgGUID: cVonXP4KTDyDYM6rh+VrWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231226394"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:29:02 -0800
Date: Wed, 28 Jan 2026 15:29:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Remove duplicate error messages
Message-ID: <aXoPHD9Qz6aFzFlS@smile.fi.intel.com>
References: <20260128124506.40882-1-andriy.shevchenko@linux.intel.com>
 <20260128131813.GN2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128131813.GN2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 02:18:13PM +0100, Mika Westerberg wrote:
> On Wed, Jan 28, 2026 at 01:45:06PM +0100, Andy Shevchenko wrote:
> > The pin control core is covered to report any error via message.
> > Since that it's not needed in the callers.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


