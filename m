Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CEF3C1092;
	Fri, 18 Sep 2026 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712778; cv=none; b=ucZvUs6A7+sBIXOKQxheTjgJnKsRw7yHh5mTArtN6Jy7BOGV7kTtsbljg0vNKQNKIaUCIk5GXUhO0QOQBO4x1uja0lpY13wD98h0Q8dLczcWg65w6LXllg9eLfDmtE9j5fWj/cL5FFxUwpmlIoxVp2aJtrDHVkQF9FA8qrYS9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712778; c=relaxed/simple;
	bh=fH4QxBtRneeuysLqzH5sJ5gY8METg01EP90nji0pmvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXSIg3jJ6RynolDrRq8VQDvSNmrSPctYWbS6U19l1jagqPvAj35xk1Q59Prn+LN3P2Zyo/fO/mOw2ou0mNsRMZO00U+iFwqDxyyeSxMjk+DFvU49L097fIaBi0tEITYZ/mrgBE1ACZHRqSmHdLWPPj3Qcy3zKM004c5pRn7u50Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erz+Ib4Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erz+Ib4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789712776; x=1821248776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fH4QxBtRneeuysLqzH5sJ5gY8METg01EP90nji0pmvU=;
  b=erz+Ib4QANmZUrApUSZ9s4Z7AJa1wj8k5ZxSqvi6U6e2nm7N6JczoVBE
   AJr4BTBUtvyoHX3U2abn5LJmRx3lw4Lz8TVPnrf4ciOIPmhzN4AXbAGPw
   mLtfpRzmrMKzfH3VWKrO666Rt4LModn3tpQS1kZ4tAnjB+ZL5+uvmfK/Y
   fk/MWUmamLQSQYYnFAwQ04OGsjc2mScNEx5uNNk+qKgjTykVhZyFF8MSi
   1lM6hIT55fo/0c2SpmoCmNeqpD+LzWy5sGcx675QwxTZNunOYf/an5+dq
   WG5dtcNUo3NjLzRSlbdIfTS8J1UrRNpaemYBzK/WL+4pIESnjoRu2dayX
   g==;
X-CSE-ConnectionGUID: f7zVjrquQu25ZM3nrqJgfw==
X-CSE-MsgGUID: xMiEpMTgSRyIIKBjMmENKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115730196"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115730196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:26:16 -0700
X-CSE-ConnectionGUID: +WK8H4YHSR2sAJ4EdDSN7g==
X-CSE-MsgGUID: DDBNg/YxRpyu+NtOUriLCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270921600"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:26:13 -0700
Date: Fri, 18 Sep 2026 09:26:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	frank.wunderlich@linux.dev
Subject: Re: [PATCH v2] gpiolib: use of_node_name if line-name is missing
Message-ID: <aqzZg6iQ14sna4-u@ashevche-desk.local>
References: <20260917153712.134367-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917153712.134367-1-linux@fw-web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 05:37:11PM +0200, Frank Wunderlich wrote:

> Until v7.0, GPIO hogs inherited the DT node name when no line-name
> property was specified. This was implemented as a fallback in
> of_parse_own_gpio().
> 
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
> into the GPIO core and removed this fallback.
> 
> Consequently, GPIO hogs without a line-name property are now displayed
> with a ? in /sys/kernel/debug/gpio. Restore the old fallback.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


