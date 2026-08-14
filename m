Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257146A61A;
	Fri, 14 Aug 2026 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709167; cv=none; b=iPW68OGu1clsnzXKRdVQATAa9bx4YYq07dijJMw5mNIXSwJs0tFyntFc+OotM1cjjMd/CkCUBscE1BG0NQ/8t5HieXC2YCJuIQiSTexhHDOjtTcZNdja866XPiwjBQWQK6HNFgUNtMU03cOhQduyXkhFQ5B3GuQq+/snLusKu/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709167; c=relaxed/simple;
	bh=ZrT6JBxBEd6Sct/4/jKB6bO38YdDnYcUI5AaZayq2Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7i14vFvfOhnK92jq4vuC7hQWfj+60pKoF4VjgrXa+khUcBbXMlHtAC0wOImk+9OL3XN07aFt+s62s7Q5JiC39N9CStKe2r1s7cMcuocWgGBYibkmTdMJnLmODWgSqatSN4ctMoP78H7hZGQMyZG4P4bQLbp1MIKqj9cIdw1EPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiQHPYg0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiQHPYg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709165; x=1818245165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZrT6JBxBEd6Sct/4/jKB6bO38YdDnYcUI5AaZayq2Os=;
  b=fiQHPYg0otrsSPZihvjDIaC8qazHC2trBHx1JkwXzYe06B2xRXeC9Jyk
   mIp/p4f0aqJFgKueRGZoJluqs0N1Bk8ek3KHzZNenlbVybU5vGahMOU2P
   akUKWPk8EU4/xEakaB7h9BnX58pboPRf3E8wurZbc44yR/KgOk9wL2MRl
   J9LnBZOlIuHyRbpwVnIhIdMGRjbDIBCxtI520iwMm811GMHDLfeiqeWBc
   vEKghVqF4YaAJmep2p6UN2R12bNIrP2PSFfL8Y4zd2cxdu0pB6ylAJWf4
   jVKPxjGomF62kW5Sm+1IKwt7Hct7Jwr2HqBZQtPvRep/X7K+tGxGjwwA9
   w==;
X-CSE-ConnectionGUID: Sr7MQZKXRv+SR5QZpf0HEQ==
X-CSE-MsgGUID: kxKjLd8LR3yd8Yly5kdX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97952428"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97952428"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:06:04 -0700
X-CSE-ConnectionGUID: Tiz05i4eR/6GAhiPY34elw==
X-CSE-MsgGUID: dyWvRJBARkKUxMnIzz/2kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264251085"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:06:02 -0700
Date: Fri, 14 Aug 2026 15:05:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, tychang@realtek.com,
	stanley_chang@realtek.com, cy.huang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v2 2/5] gpio: rtd1625: Fix variable type for regmap_read()
Message-ID: <an8Ep579ycwxjOx2@ashevche-desk.local>
References: <20260814025657.1400452-1-eleanor.lin@realtek.com>
 <20260814025657.1400452-3-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814025657.1400452-3-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 14, 2026 at 10:56:54AM +0800, Yu-Chun Lin wrote:
> Change the type of 'val' from int to unsigned int. This properly matches
> the expected parameter type of regmap_read().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


