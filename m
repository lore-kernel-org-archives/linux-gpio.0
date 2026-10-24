Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806765;
	b=xZBI6NqMGTlNf7xeWWzVYUCa+GhQlmEcmmvgac70UfneZZrjTr+EJBTzkL4FjNr1q0Oz
	 DOSzwzn/NjRJwfeN5r9xZROUU0Vu7h18qu5f00+pU+W+LWkg1cDBxf8D6Cno810tqZX/J
	 cfl2YWkmuJL7MgGNlzztqWrRFf8Rr7kKeFVA5ouzl9BAIxyUFW9MOFyndWns4878OBhvf
	 69MHTkxRD/tgyEpgsTCP3PEnksl6FTje2djKBateDeGVC7FIiDYG1tnPLqMq8bUXv74Jn
	 DhIjkpQ5hISbp9kaYOtv4natDxG7lc+43V4Ku1gDiw1vXDiVsHnC7nsvnLmYGsuVpaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806765;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wjuto3d/KuK0tBjAezBeTt5tVciNNcThbLMT4S20fd0=;
	b=Fgo1lfoa53MI5nsZzs93hZjIIa0LnvILgojddhGDb8H1BJwXviW5BX3RJpjt3TGAegNh
	 PUz+9XAIl2b4tYhNogocPSvXqCAE5icgXx9f89keAuvjiIzhOBluS6o1++cyBSJtLGWuz
	 jGHfCXllQvAgSoe4fyda8vl09KHwtCUGJgKRxYC/1HFW+Xi5aoqI5Tl32p3KKx1mL/Hwv
	 Bz1M/GVjKerG99sPz9OAW3inMgXK+B85KJd3gTC71NxVjzWL/gE0dziaiUQBK49ZWGOpT
	 gVibuVOanhOGJbq9avn9tLkpOE7ZHMpJZBuw75amL88r7+9pHGt12pwS3Tpgi/T6uMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GBgNuVrq;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59964606A31B;
	Sat, 24 Oct 2026 01:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59964606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GBgNuVrq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792806765; x=1824342765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UFya1hKym3VDaS8cNunTQezFRotwyKjbplRcLEVURx4=;
  b=GBgNuVrqVAWhMd97SYjvNHWES98PfyJ12V/zPpXCbm9vVD69UwnxzG+O
   OW7/Lc+IV22hZ5/kZ6P7poLEP4N819k7wGXZZ46TPQdRfOQJrqSHr4DOw
   5UIRxBzb+HQpTSh1mosmiqCJSRCfIb4GRdFsQK+ihdqbmnNc9vw5N2Thu
   5t04mQ9rv+FNkDexwm1+SMGkznVWzErpyj8NsRRw1xnRxwGkYA7KNUKRZ
   j7+GYBIbhzAm3UL4qM1pR0mpAz8ZIvYVaNFBBZuLxTcJqYXxksd+ncljV
   eyTHJ4C2z7LFKm6E5RFzgLMIyfLHJi1VG7oc1PYEX4LcyEXfF1UfmefaX
   A==;
X-CSE-ConnectionGUID: qPvXYqmARg6kSTuIAdgbpQ==
X-CSE-MsgGUID: FowA/CELTRWdziYy3vyWIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1463008"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1463008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 18:52:44 -0700
X-CSE-ConnectionGUID: /QmVDlBGS0apAzWg7GkJCg==
X-CSE-MsgGUID: MPhhLiUuRzaMRhbSLdoLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3846771"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2026 18:52:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKQw3-00000000TUs-2xmk;
	Sat, 24 Oct 2026 01:52:39 +0000
Date: Sat, 24 Oct 2026 09:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Hao <haohlliang@gmail.com>, linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Liang Hao <haohlliang@gmail.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpiolib: Add irq_set_affinity helper for GPIO line
 IRQs
Message-ID: <202610240908.4J3PwdPn-lkp@intel.com>
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
config: mips-ci20_defconfig (https://download.01.org/0day-ci/archive/20261024/202610240908.4J3PwdPn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240908.4J3PwdPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240908.4J3PwdPn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:2154:9: error: no member named 'parent_data' in 'struct irq_data'
    2154 |         if (d->parent_data)
         |             ~  ^
>> drivers/gpio/gpiolib.c:2155:10: error: call to undeclared function 'irq_chip_set_affinity_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2155 |                 return irq_chip_set_affinity_parent(d, dest, force);
         |                        ^
   drivers/gpio/gpiolib.c:2155:10: note: did you mean 'irq_set_affinity_hint'?
   include/linux/interrupt.h:407:19: note: 'irq_set_affinity_hint' declared here
     407 | static inline int irq_set_affinity_hint(unsigned int irq,
         |                   ^
   2 errors generated.


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
