Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067E3BBFD4;
	Mon, 17 Aug 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954451; cv=none; b=sg+A8pWBc8hbx0ZrrN+zj4bXtZjTl9hReMTuIuUktryc3KuoRQ0KjEbImXlz0RkhyCY7+IS4ESFp6lV9xp58+y/j/8IOO/qA9zJYPyS/y4tPqvwdbEQZDVDLdOOXHuJ/mmVjAa5iyViPTVlqYmF6mDmSYCBSRAk+UvOEkcgE7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954451; c=relaxed/simple;
	bh=JQYmyr/G2PVLHHnHi0H2bAb1vXgJ2cn0/WwSH6s5/kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvTSLVB0le+SZRByEIUXP7mg807ZxPTNj7jDLg6wkfDw58ruiEJfreE7+UxZtLnafm0W+AdiDxDzDa2xGBbM/PtxY6aEPlLEwxQ/QwOtsOsDNbxZhiOzx0pBelJL8gSXGD+putATnzNl2OYBbowYYiTYm7rPd9mTD7BGxbiSAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvmZI1uJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvmZI1uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786954450; x=1818490450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JQYmyr/G2PVLHHnHi0H2bAb1vXgJ2cn0/WwSH6s5/kU=;
  b=lvmZI1uJvbPXOhL8dk2qwQSaQGuftXMgLNIIlRXwnE2LHw0EWxWek0/Q
   Vbl+pE39c1iddGrxwZHBvO7sySfUe1US1ip7v6RpIYY4IYMB2O5H33UMD
   2PzDpPThhuHzeJw7oNyL0IhzHQWNWZZRfCKnUwC+0/UuG66tyY9cltoP5
   HGbBJWebBAX53eQ70nUQBWWQigNneFJsTRlaOUFvyIdI7nL3VjktDwNgC
   7vjb8xTCaI5zg3BdVuefE4OQkAMwkPW/DszKd5/UtU7lClRbLrZpEY+55
   0nOmoPFCaX/7D3rxdxa3HMnRR5ZImQibgc8xWW0eoPaafd00svb9iJ/mx
   A==;
X-CSE-ConnectionGUID: X9kzCLufRXe/+Z36AT+B1Q==
X-CSE-MsgGUID: x0K0fEOgT62EGRZHJsw9QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87633212"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87633212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:14:09 -0700
X-CSE-ConnectionGUID: yTPJoQ5IThakiMUUlvJVVQ==
X-CSE-MsgGUID: y1YywOooQci1gB1PXQBFwA==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:14:06 -0700
Date: Mon, 17 Aug 2026 11:14:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Tai <james.tai@realtek.com>,
	Tzuyi Chang <tychang@realtek.com>, CY Huang <cy.huang@realtek.com>,
	Stanley Chang <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 2/7] gpio: rtd1625: Drop unneeded initializations
Message-ID: <aoLCzAu0EbGAqvY1@ashevche-desk.local>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
 <20260816-gpio-cleanup-v3-2-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-gpio-cleanup-v3-2-f298cdd65fca@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 16, 2026 at 11:17:31PM +0800, Yu-Chun Lin wrote:
> Drop unneeded assignments. While at it, place correctly the comment to be
> just above the referenced code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


