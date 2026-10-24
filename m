Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810788;
	b=NL0iXdWubIvGaYZTw7/k86iYzIXCS7o2sk3F4mPUnQX7fGUKcAKcwgqvqDf4Yr3Uqpt0
	 gtK+Xw0HZxpGlOGDkEWvVa49RfndmAJVHlpfWkeEfSjFJzyvjK+fpIfDYr8U8A2raj84h
	 Rz/cPUCOs1cTW7T3XJLu0FUzqIYixwdTPdzG0tXHaEGPixxQr9ozoylxlUEy/X+odKl3D
	 O39wLYKAl+R3ZggT/47yVJqBx9RRxP57RW6wK0lsg9cuLFz8fB/wisBBN30cwbfGijZzg
	 CCFpgBj8+HTGiO67bMz3W9VR5UTKN1sVlXzT1SZf2SNr092s6RLESfCobqn2QZxsg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810788;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5dvfWf9RXx0yO1VYyhyNJZafDFoC0+dDXPTBwAUaQwo=;
	b=pvIqI5snutsBtrmCkWO2HMQjJhMRPqirwasi90loL8kNFdgQAjH2s0NtiMzdUACMKdLj
	 Wiu5vjDL5GuPFtVIfELukDrCQq6Y38D+qwSVdUDMOdRDWh8gR5s2cWomI6tWWucPXsUXR
	 spRtDRfu4yZwd1L8cTwWeBWvtl2YaV0COXKcGTtnwq102lL9gEYS0TI9l5yuNDXhfk+kH
	 pIVbrFVlgD7y0jRM+Mu16qPW0PqOwQhaxuOicYIYQb5mkDfRN4LclujpUOBrsIjGlMrD8
	 mLuwXJSotiaWCyYzLqYGowvL2DUBOy33Gpk2LfzqgqgpwU8AUOqnKbbamIo/0xIMhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DFe2okgL;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DA606A31B;
	Sat, 24 Oct 2026 02:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DFe2okgL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792810787; x=1824346787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjtHZy24l7lU9ZVx6Z0N/W5smjnDjkMBTb96jJtM0Ds=;
  b=DFe2okgL0N5FG8+VTFnAU/xzGPpsNU1NH098Xhv9EhiR5+QB5S05I1NB
   EA/ZHh4rSF1Fx37DEaob34PfzaGHH85xndCIYTCAvYum4neEtbZBnJxDN
   Cd2lDP6yNOVCQ6ev1Xe4aALJhkAfaQS5jTHsi8bvNx8w89e7LBFzW8MpG
   7rjq4Lzc/3yYVjMIesVmdDrnEUbrkP4W/ULPxwaSVQZRfWVyQhCFzdOTi
   pwihqQ+smULteax8Cn/38KBtBysQcVxmZvkBpU1HMhbrIgOMbqLjblWAF
   d/ALUpfacdFg8d5OgSvaPNEKUXIIiR0Zkulruee/27DquGQOKQUfHOW3U
   g==;
X-CSE-ConnectionGUID: VyadVyDdQf+s+t7xyLVF3w==
X-CSE-MsgGUID: 9HbESt1gRuydFWSKYG/xMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1587419"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1587419"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:59:47 -0700
X-CSE-ConnectionGUID: rgDMD7UgQYyrZcRUKtUq/g==
X-CSE-MsgGUID: m5SPcwAHR4Kp+MC+cEoNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5639305"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 19:59:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRyw-00000000TWU-2aFr;
	Sat, 24 Oct 2026 02:59:42 +0000
Date: Sat, 24 Oct 2026 10:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Hao <haohlliang@gmail.com>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Liang Hao <haohlliang@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpiolib: Add irq_set_affinity helper for GPIO line
 IRQs
Message-ID: <202610241003.gRosyohv-lkp@intel.com>
References: <20261023151209.58772-2-haohlliang@gmail.com>
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
In-Reply-To: <20261023151209.58772-2-haohlliang@gmail.com>

Hi Liang,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v7.3 next-20261022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Hao/gpiolib-Add-irq_set_affinity-helper-for-GPIO-line-IRQs/20261023-231104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20261023151209.58772-2-haohlliang%40gmail.com
patch subject: [PATCH 1/2] gpiolib: Add irq_set_affinity helper for GPIO line IRQs
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20261024/202610241003.gRosyohv-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241003.gRosyohv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241003.gRosyohv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib.c: In function 'gpiochip_irq_set_affinity':
>> drivers/gpio/gpiolib.c:2154:14: error: 'struct irq_data' has no member named 'parent_data'
    2154 |         if (d->parent_data)
         |              ^~
>> drivers/gpio/gpiolib.c:2155:24: error: implicit declaration of function 'irq_chip_set_affinity_parent'; did you mean 'irq_set_affinity_hint'? [-Wimplicit-function-declaration]
    2155 |                 return irq_chip_set_affinity_parent(d, dest, force);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        irq_set_affinity_hint


vim +2154 drivers/gpio/gpiolib.c

  2128	
  2129	/**
  2130	 * gpiochip_irq_set_affinity() - irq_chip set_affinity helper for GPIO lines
  2131	 * @d: Pointer to the GPIO line irq_data
  2132	 * @dest: Affinity mask to set
  2133	 * @force: True to enforce the mask without online CPU checks
  2134	 *
  2135	 * Hierarchical irqdomains with parent_data delegate through
  2136	 * irq_chip_set_affinity_parent(). GPIO irqchips that use a chained parent
  2137	 * handler resolve the parent virq and apply the mask through the parent
  2138	 * irq_chip as described in gpiochip_chained_parent_virq().
  2139	 *
  2140	 * Affinity is programmed on the parent irq, not independently per line. GPIO
  2141	 * lines that share one parent irq also share its affinity; updating one line
  2142	 * replaces the mask for all lines on that parent.
  2143	 *
  2144	 * Return: IRQ_SET_MASK_* on success, or a negative errno on error.
  2145	 */
  2146	int gpiochip_irq_set_affinity(struct irq_data *d,
  2147				      const struct cpumask *dest, bool force)
  2148	{
  2149		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
  2150		struct irq_data *pdata;
  2151		unsigned int parent;
  2152		int ret;
  2153	
> 2154		if (d->parent_data)
> 2155			return irq_chip_set_affinity_parent(d, dest, force);
  2156	
  2157		parent = gpiochip_chained_parent_virq(gc, d);
  2158		if (!parent)
  2159			return -EINVAL;
  2160	
  2161		pdata = irq_get_irq_data(parent);
  2162		if (!pdata || !pdata->chip || !pdata->chip->irq_set_affinity)
  2163			return -EINVAL;
  2164	
  2165		ret = pdata->chip->irq_set_affinity(pdata, dest, force);
  2166		switch (ret) {
  2167		case IRQ_SET_MASK_OK:
  2168		case IRQ_SET_MASK_OK_NOCOPY:
  2169		case IRQ_SET_MASK_OK_DONE:
  2170			irq_data_update_effective_affinity(d,
  2171				irq_data_get_effective_affinity_mask(pdata));
  2172			return IRQ_SET_MASK_OK;
  2173		default:
  2174			return ret;
  2175		}
  2176	}
  2177	EXPORT_SYMBOL_GPL(gpiochip_irq_set_affinity);
  2178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
