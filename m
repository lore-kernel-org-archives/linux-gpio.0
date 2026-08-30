Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522E35C180;
	Sun, 30 Aug 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101881; cv=none; b=hRMj8iBM1FGI/rzfML8OCl/Jxfb00ltDH2yDIVxKhLKPpN8P09tdje9x14w47R0gEQaVUXeszDRLfXINmF3UXJCpWjsY3aDosB7l0lCtn4XqLUbO8mSJDQCqnREMs8J3XRrCg9WK60toYDbfZwrWbR/jOgSvI4Jp5XmKvjGVoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101881; c=relaxed/simple;
	bh=Jz6SGp8A9K6qYUuqL9q2t6pIpvCJVbYQr8/3UysdP40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=al/6tIINerEHFv6svAzsIzq7BKLZwnU6crGRQKxX1ZuiGoD83+Vup6GRp/g9y1H8LtTBifTF8OI+RF0DrmZbnUz/0fPTXpa4zKIBVd/9CHkJE1ZZktyYqOddEDSohRvd/BRiJJ01TLEhN8Kgcnw0wDnJq3bjflMJ/KB5x4NAc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+G3xMUP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+G3xMUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788101879; x=1819637879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jz6SGp8A9K6qYUuqL9q2t6pIpvCJVbYQr8/3UysdP40=;
  b=R+G3xMUPcLtvpZWvEyTFlhKxFXu86m6ERtmJ48HeA7RGh2L4+ENxWebE
   AgReK6sIAVTvS5/rOUOETQH+NTKkEC92mYU++pYBk/pDKghU/IMrxjaLf
   iO/9iSPBFcDq17/kM+WklhLnpSy2s/QPwMNUxCcG90+/uxJ3ZU4jW4Vi1
   W0qbwg35Dt57YWXxaznMx4pgqOrmKLFnKye3Uq+b4h5vYymmEt08my/bB
   5NU4g011+AinpBIvtQva6ewB24uCJZD7mIjmKh85czEcH2bZoZoM7+dbC
   Qqsr5jS1cqDSiqMFWyS0RDT8A65vV+0NE4hGkCSSIy3egXX4cU762Z9Zt
   g==;
X-CSE-ConnectionGUID: WNDU9LpIR42k8fb7HoBpqg==
X-CSE-MsgGUID: A77GPOC1Sbynz3/8alvY0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="99877498"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99877498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 07:57:59 -0700
X-CSE-ConnectionGUID: NUdCDotGSWypYZ4ykE5Ycw==
X-CSE-MsgGUID: wdrIOB+hQ3KIfuK+A17WXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="306825838"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2026 07:57:57 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0gyo-00000000095-34uo;
	Sun, 30 Aug 2026 14:57:54 +0000
Date: Sun, 30 Aug 2026 16:57:33 +0200
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
Message-ID: <202608301629.wjbEOoNN-lkp@intel.com>
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
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v7.2 next-20260828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Split-fwnode_is_gpiochip-helper/20260824-094232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260824074427.3226457-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260830/202608301629.wjbEOoNN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301629.wjbEOoNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301629.wjbEOoNN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:83:
   In file included from rust/helpers/pwm.c:5:
   In file included from include/linux/pwm.h:8:
>> include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'
     888 |         return fwnode_property_present(child, "gpio-controller");
         |                                        ^~~~~
   1 error generated.
--
>> include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'
>> Unable to generate bindings: clang diagnosed error: include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'


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
