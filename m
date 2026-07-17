Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C22DCC13;
	Fri, 17 Jul 2026 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307493; cv=none; b=OQdPwwkiEW0CfwY9EfB2WnyHITkP9x1JGvgU4pnlvSD/Mc/813s/lqnXoqXgBCyKovcmWNlbERFxzTPgNx00qFLuQvhEn6maVxUDAfrvcPpgCm9d2zeeChCQehgVtuzdT34Wqo2TKX4Jo7Gp2QxCwPA5sQf3nyGoH19IPPD6c90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307493; c=relaxed/simple;
	bh=PdX1I2hzW/T9LV228l7ZdyK4vtUrrUEq0ltpoFsli4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUGcrS1xyytNmdZn7L8zqQcO9sWE8z9MzZx/XdWofILq94F0No8EfGucR2gap6WjeHzZKgw4+mKporYI5lHD1J1+WcROmXhbYzehmYXjkLcEopAgFU83p6ldofCmpqNTP0Z0M4YYOD7x7BEki6pBr5H9EbH6MqCygs4SiqbG05k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRd/nmCg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRd/nmCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784307492; x=1815843492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PdX1I2hzW/T9LV228l7ZdyK4vtUrrUEq0ltpoFsli4M=;
  b=XRd/nmCg0EVivif6YabfVDKzjbEYc32rgsL3sGbrKx5zi1P65Zd4dKPh
   w3OnWP1JPoovhXrMdBzrq1lW/i8ExLHzhuRGeaN/8jwG9BOOFPsxrFQpi
   3EKst9Sry/J5EmPsR85ZaLFYOabP3h5bVlhTNSDSV84BA05F02eZQwo8b
   CPuDfn0eaCI1+BUb+Qc1CQm4HPC2rxUIoqPGSzDkMfZgNgSKP3zWckJAA
   kJztPeYaHWib1OFfrjKVgq080IRyhh5gxpyS0UKyXCagiUDgvBIvz4nEp
   8T7BfIiCyHnuUYhKJoYWFKdvtfd5QyONq31knxADi2OllnDbKwvnsRbf/
   A==;
X-CSE-ConnectionGUID: WMYYybahQPWunuxu9krJhg==
X-CSE-MsgGUID: xauEA1VVRmKkqXzpq9k5Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110532601"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="110532601"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 09:58:10 -0700
X-CSE-ConnectionGUID: I/1Vc/WOTVyzYyYHsxvhnQ==
X-CSE-MsgGUID: hKNasVnjSDGC93nSCVp8VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256281570"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 09:58:09 -0700
Date: Fri, 17 Jul 2026 19:58:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] pinctrl: intel: Remove redundant dev_err_probe()
Message-ID: <alpfHmQVcHzF90f9@ashevche-desk.local>
References: <20260717105847.131359-1-panchuang@vivo.com>
 <20260717105847.131359-4-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717105847.131359-4-panchuang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 17, 2026 at 06:58:45PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


