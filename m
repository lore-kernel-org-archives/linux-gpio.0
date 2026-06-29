Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FC3FAE19;
	Mon, 29 Jun 2026 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727539; cv=none; b=JVvJhK2yZXsdzPdtBps44RTfAoCTDGfmFgJnHRg1VE8LaYycV514LkqPSbtmYugDBDoNQY0NlMsawceV80cNHcibkl3KI/SQvPdC83ECJe3d4jwrgQJhKF7AMm2iTd82J2ZK4z+Qj5LbNvS4xSCK9/kog9jVextUV/dfr4Bu2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727539; c=relaxed/simple;
	bh=tIiREu5pXy/nUQ9dOW6a3+enIzKKULeLd6hiLgFvlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9Bau9S121HyfK1pkjiR65hfdnhob8/lmqdEC47/HLrOvaKKwirxUE7drdLZZ2+r9pxVYqKHQolh/39N5i+92ztA4FT+eEGATYSaPZUiS8SBYCjjpTQ6GJF9QM65zvTc1NHjnDIpgmkZnTbIMncT681QVTpQK13QUGprb+tozU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeKYU0v5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeKYU0v5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782727537; x=1814263537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tIiREu5pXy/nUQ9dOW6a3+enIzKKULeLd6hiLgFvlUc=;
  b=ZeKYU0v5EBppIkx4mP5GOC1EI2Gp9xEqjkkCKbP0cgiBgZ3ig4GFj67M
   /E0mo1q1vjvcpz+R6vvfy0fAY3lyTb+riT6NTK7mYwyOpQdRurW/MBRRF
   domdGC3sk2Vhy4D7/gNHdQtI/0/tQQfqlBOW2Cf2B2Tj9nQJCWgbkcfdN
   1bgKktBJ++QY+4KOSYeAI6Sc6cv+CCvtfW58F0A1EWsnZvDwAJMg8tK9f
   7+Obazs7Nl+cTOTlUy4INhfWdEx2BoOI4bBeMn4330DHUqQ+BTJSE0/fc
   SeVjzkon6J8aKw5lyj9L9BkzsCR5nozEJh/LkzHhs97oYevXv84zuF+XG
   A==;
X-CSE-ConnectionGUID: v8YNKf/PQDmwat311Pjkbg==
X-CSE-MsgGUID: cLfEU/dEQkSiIQ8g9AcTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82406331"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="82406331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 03:05:36 -0700
X-CSE-ConnectionGUID: Ntom/HqKR5qqEM1xpEtHrA==
X-CSE-MsgGUID: j8RxipM4ToakveL+yLuIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255509012"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Jun 2026 03:05:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we8rr-000000007Gz-065t;
	Mon, 29 Jun 2026 10:05:31 +0000
Date: Mon, 29 Jun 2026 18:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH] gpio: dwapb: Defer clock gating until noirq
Message-ID: <202606291736.mAgOeA65-lkp@intel.com>
References: <20260629-gpio-dwapb-wakeup-v1-1-3394f02317da@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-gpio-dwapb-wakeup-v1-1-3394f02317da@ultrarisc.com>

Hi Jia,

kernel test robot noticed the following build errors:

[auto build test ERROR on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Wang-via-B4-Relay/gpio-dwapb-Defer-clock-gating-until-noirq/20260629-135404
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260629-gpio-dwapb-wakeup-v1-1-3394f02317da%40ultrarisc.com
patch subject: [PATCH] gpio: dwapb: Defer clock gating until noirq
config: sparc64-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291736.mAgOeA65-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291736.mAgOeA65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291736.mAgOeA65-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_set_wake':
>> drivers/gpio/gpio-dwapb.c:377:7: error: 'struct irq_data' has no member named 'parent_data'
     if (d->parent_data && !!ctx->wake_en != !!wake_en) {
          ^~
>> drivers/gpio/gpio-dwapb.c:378:9: error: implicit declaration of function 'irq_chip_set_wake_parent'; did you mean 'irq_set_parent'? [-Werror=implicit-function-declaration]
      err = irq_chip_set_wake_parent(d, enable);
            ^~~~~~~~~~~~~~~~~~~~~~~~
            irq_set_parent
   cc1: some warnings being treated as errors


vim +377 drivers/gpio/gpio-dwapb.c

   362	
   363	static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
   364	{
   365		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
   366		struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
   367		struct dwapb_context *ctx = gpio->ports[0].ctx;
   368		irq_hw_number_t bit = irqd_to_hwirq(d);
   369		u32 wake_en = ctx->wake_en;
   370		int err;
   371	
   372		if (enable)
   373			wake_en |= BIT(bit);
   374		else
   375			wake_en &= ~BIT(bit);
   376	
 > 377		if (d->parent_data && !!ctx->wake_en != !!wake_en) {
 > 378			err = irq_chip_set_wake_parent(d, enable);
   379			if (err)
   380				return err;
   381		}
   382	
   383		ctx->wake_en = wake_en;
   384	
   385		return 0;
   386	}
   387	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
