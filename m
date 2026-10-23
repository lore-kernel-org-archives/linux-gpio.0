Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741191;
	b=arLYv+V6S4LF3/zXtRM+Djbj5XZICFg9q72XDnmc1owgt5vfyUEsLOSSPA2OJZfUpPaI
	 BOEGp6A47AhBEwT3LBtxqgkk0myUtGvX6n3ws0/NKVuCYFaLRTjAO6N7LujuwpHO/3wfF
	 Pbj1545EuuXOJqHYDwG4X7fe10B7ucV4XYpYfxlhKRVXt0EYhAZw0rYPV4zYUllzgCxXp
	 CzrXz5M5qIqdOZCns4p6azqgvncQ+nSqf7UCjKCV9X/Re8qWW3eVU/u4acVZc5JjytX9E
	 UR7FxBbo7Cs3jtVqGPONY/IZOUFXzPIgdb9ARfIgYXTR4+jIUfG47vWVfl2LUoizS6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741191;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EauERKbmcpDtUYtYvuwzD48kVrdOpqNb4EzH/hqdS30=;
	b=LxfsXJATcUgLmLprsRIHP4orfDuZzu6qaXBw5bi4iQo2I7gYPeKwqhHUvW+W3snYgv+j
	 vVDGdwpICbZiPnNr3WjENep4f4cJp5JLZ5kILDg6yPgOQ6HwMUGNXRSjHc+BN7MlyXk7I
	 GPx57EGZDaOffflnoAnbnNxWvKLgyhZYFpUeFx/FdXwmCn5zQuo7DzsFN1VVFhJmjTF/A
	 0XaOv7PzObEgrf1VzuNH0OzE9k3s65RlNGs6FU9mdc54j/+F55HUgWS2AZQdgw9ynrCVQ
	 9cQEl9qM0EBZVlr9Y5+bCAUUEvKGfTaab+oojbx6LKcNGqOY1Tfo5jF0OIkwRhj3fbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="GOW3/nUC";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3B0606A31B;
	Fri, 23 Oct 2026 07:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B3B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GOW3/nUC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792741190; x=1824277190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9byVv6fYl0fkuieHuivwbnkPmPntHtzbYjwkEX5Hm6E=;
  b=GOW3/nUCLqajWHrOENXEJ+a/qQLjMrzGrIz5K+DG2ynYcB0ALVSqHeF9
   qiIENlNqxAJ22iFO8NwN42ZQBsdc5FnBSoImKTZfvULMIuikHyoNxxIzn
   MzJU0yYAdJ/4XgjO/6++lIWUgSU+jSoK4Gx+fDkNusFffzGFG7TQ0b8FC
   YA3GplA2QJ2IFlH48MPdBTyZmx7yCpdszUC0Rl6ULdeR4IjP+tOpzeqyn
   aTr7sob1Dg5gVVA8nRaAV9fLg827AtxR2s7KkI0SZZ2+VinQ5H7t5EnFm
   eDGyWrzT/suMvhKNWDbCh0ZOQ6llzAh0MADa2yJQCkYQD2lqZPzXIwPF1
   A==;
X-CSE-ConnectionGUID: kA+VTGAARNSUKnfxLiLgAQ==
X-CSE-MsgGUID: ljYqZEuGToeqULJDIHk2Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1489741"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1489741"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 00:39:50 -0700
X-CSE-ConnectionGUID: sJ4nIs5rRte4JWTk4fH17Q==
X-CSE-MsgGUID: FzPxDc/dR+WZq10BYX/wNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3642670"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2026 00:39:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK9sP-00000000SIo-3Ncv;
	Fri, 23 Oct 2026 07:39:45 +0000
Date: Fri, 23 Oct 2026 15:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Samuel Moelius <sam.moelius@trailofbits.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/3] gpiolib: Introduce
 devm_gpiochip_dispose_irq_mappings()
Message-ID: <202610231525.VHG1gg2F-lkp@intel.com>
References: <20261021204654.1001101-2-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021204654.1001101-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v7.3 next-20261022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpiolib-Introduce-devm_gpiochip_dispose_irq_mappings/20261021-224443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20261021204654.1001101-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/3] gpiolib: Introduce devm_gpiochip_dispose_irq_mappings()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20261023/202610231525.VHG1gg2F-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231525.VHG1gg2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231525.VHG1gg2F-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib-devres.c: In function 'gpiochip_dispose_irq_mappings':
>> drivers/gpio/gpiolib-devres.c:337:37: error: implicit declaration of function 'irq_find_mapping'; did you mean 'irq_dispose_mapping'? [-Wimplicit-function-declaration]
     337 |                 irq_dispose_mapping(irq_find_mapping(gcirq->domain, i));
         |                                     ^~~~~~~~~~~~~~~~
         |                                     irq_dispose_mapping


vim +337 drivers/gpio/gpiolib-devres.c

   331	
   332	static void gpiochip_dispose_irq_mappings(struct device *dev, void *res)
   333	{
   334		struct gpiochip_irqdomain *gcirq = res;
   335	
   336		for (unsigned int i = 0; i < gcirq->gc->ngpio; i++)
 > 337			irq_dispose_mapping(irq_find_mapping(gcirq->domain, i));
   338	}
   339	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
