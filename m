Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1233D51A;
	Fri, 25 Sep 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333294; cv=none; b=Oqkj1nMZ6EXRKG28CBC9A6SvbDv2FXPuhjIA67unpQ0kagrD41zbV+NbsT4t4Dgm8d/U368y1u22Zncj2AUJdFWiFaauCK5ogOaPR3maqFP/nHHFBNGleBCGubd+kpNsMNaIVMq8UQTgnNDU6miEkjFKaevT8eLby3CGhA1q4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333294; c=relaxed/simple;
	bh=42NDHnXrJGCDoYnGrAdfHrEwPgU2O4Cc9nJHzGVeBlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC9EEJ2nlFAqLlK3+87uN/baJfm1/hr/XqJeeq/6Q8aAtmDqr4wHtOLWqrQN1Cj9B7p9snAO4D2suKaXYW99UlFT4zWa02+Q8PC/iW3zxg8tsRdP7QgjTbzwb8telD9xKNV84X7HFa53N9iafWnieSloz8QZakatR3R0+a7GMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXvQFmdf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXvQFmdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790333293; x=1821869293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=42NDHnXrJGCDoYnGrAdfHrEwPgU2O4Cc9nJHzGVeBlM=;
  b=HXvQFmdfCHemaQ42Ic4cDwgVjXvuhVsLNN0dMw8YAkA/LxlrjMt7AR7Y
   93oFHrR8sYy/DMm6MADX/co3aBmUuTC2LnEh6clcDvhc6dbIzAMxWw4Pj
   LJTWL8NiXB4BMjKzFyX7Ugfqmj6OGojAgCyR6G0goJDDHaQWhPDBXH8G5
   KpcSNP7njlObvm4zzLDAnEeTzpzX5DKBoxh7udfPN1H88ldzWpnFyR0hn
   Y6Mx9LqBfVHnjosqhF/CwVzQJlmS9eL6gQqLc4ePi/sRdG8wqYeTsG462
   Oq4zCWGnXKkTimx9P78KKBULhP9qLfN+BwaIB/AEl+DYxIvtUNU8+jAP4
   w==;
X-CSE-ConnectionGUID: M6p0NSffQdu2IT2lKgNEXw==
X-CSE-MsgGUID: asaD2Zr2QluDUb1640lw1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90177809"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90177809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:48:12 -0700
X-CSE-ConnectionGUID: 3WOl2E5+To2QoYEQaWI4Cw==
X-CSE-MsgGUID: eYBZjRHxTcSzYIHjYkIA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273862021"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:48:08 -0700
Date: Fri, 25 Sep 2026 13:48:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
Message-ID: <arZRZfa7AmDxmwoJ@ashevche-desk.local>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
> In order to avoid maintainer mistakes on patch ownership: move all the
> Intel drivers into their own dedicated directory under
> drivers/gpio/intel. Don't touch Kconfig options as we historically sort
> GPIO drivers by type, not by vendor.

...

>  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
>  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0

These are interesting drivers, not sure where to put them

>  drivers/gpio/{ => intel}/gpio-ljca.c            |  0
>  drivers/gpio/{ => intel}/gpio-usbio.c           |  0

These are definitely not going to intel subfolder, they have nothing to do with
Intel HW, they are against some custom external (to Intel SoC) HW.

-- 
With Best Regards,
Andy Shevchenko


