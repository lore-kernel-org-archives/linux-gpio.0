Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D116272E6D;
	Sun, 30 Aug 2026 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124448; cv=none; b=ax/9gbpdgSr2yUCWobWW2QahQ9Iqv+pyQj2loOY5kuEOBeL/rtJevarewmhhlMS73U3V5SCjI38+CtpldLIqI8ASRrFkImpE45FTylfpEZGTV+JYArkzKLT07HpjOQLMF3vnIf1nnzKJcFZl9DebbZZEiMDXYIw1o9zs1EG4IMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124448; c=relaxed/simple;
	bh=u5WW52dRfOA9bB1N5Z5GSQCIlLzFE6CPKa3DpFewPDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ove2vfndQ4+BXqQpytsf15i9RHVM0nP2aJinlx8/5oMrS7JT9bY/NAei5xl/I1ghpvzXSOqmyCjGm9vVMQtSI0MqftOWEeyaBQW3gWzCisz0mqvReFZzc3l3p5T49hzYd1ufMB60SxmJSQYVo6qXcnDqM+TOtpBNGeuOpXWogs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxJuQo73; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxJuQo73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788124446; x=1819660446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u5WW52dRfOA9bB1N5Z5GSQCIlLzFE6CPKa3DpFewPDg=;
  b=BxJuQo73WQaMjpNm+g24TSlA9HFJZqGl2W9Tjld0nEWeqLb9lwlsomoT
   dBY/8jzgkfnVAYMb5gLhP4+D9q8qu5fogMTAloC3kp3pqTKsij6HRrLJl
   SupV6DetuH7BHqhgSB1OWWxLHQhj2GZ1bUew0A3OZ9L3r2qGRt79D6NhD
   HWiopUMxs85mvjNyPKoBqThLIpuOtl6IQ5gYXy+H5EzuOaOMikPmpt56D
   OMCkIyKdUKby+7gH70/dhLgKIZuaPU9tKOTmboldaejZzdllSL7yhzByI
   tmR8w2T8fU7nBW39NIBmFAFSkVdCpsNGE9ABVD9bFJzuxgD0qPLUKGSG1
   A==;
X-CSE-ConnectionGUID: +SYmL7YwRzSbIt17ekv0sQ==
X-CSE-MsgGUID: b0PGnNh7T/iJLAxcnDt0bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106060750"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="106060750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 14:14:06 -0700
X-CSE-ConnectionGUID: qdshCc9lT+KpACMbc3W3Zw==
X-CSE-MsgGUID: c/6HIHzpSEOcjPazKn0M7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272433446"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Aug 2026 14:14:03 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0mqn-000000000Df-1ywc;
	Sun, 30 Aug 2026 21:14:01 +0000
Date: Sun, 30 Aug 2026 23:13:32 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: Re: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded
 fwnode_is_gpiochip()
Message-ID: <202608302328.ToabNDV1-lkp@intel.com>
References: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v7.2 next-20260827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Split-fwnode_is_gpiochip-helper/20260824-094232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260824074427.3226457-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260830/202608302328.ToabNDV1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302328.ToabNDV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302328.ToabNDV1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bcma/bcma_driver_chipcommon.h:7,
                    from include/linux/bcma/bcma.h:9,
                    from arch/x86/kernel/early-quirks.c:17:
   include/linux/gpio/driver.h: In function 'fwnode_is_gpiochip':
>> include/linux/gpio/driver.h:888:40: error: 'child' undeclared (first use in this function)
     888 |         return fwnode_property_present(child, "gpio-controller");
         |                                        ^~~~~
   include/linux/gpio/driver.h:888:40: note: each undeclared identifier is reported only once for each function it appears in


vim +/child +888 include/linux/gpio/driver.h

   885	
   886	static inline bool fwnode_is_gpiochip(struct fwnode_handle *fwnode)
   887	{
 > 888		return fwnode_property_present(child, "gpio-controller");
   889	}
   890	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
