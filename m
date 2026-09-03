Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FF531F986
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 03:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406247; cv=none; b=i1FCclhBTFoT5+y+Kb7+S/DydAayOow0tGgaxxSXoV6EeVInLbCEAPrZp4j9iakEd4uTmcgSZoIFLltqh2qJnviCbxe0UQJb/iQ7hn0SdpM2e5Ov7VCUvaUb1W50b04dtrBl0/xhNSvQHvf2Pdm4iz5N1CsvrPp3Pwq8jvnVNWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406247; c=relaxed/simple;
	bh=D4d23j3SkUXYASvo7nGS4dcQZB8v1kLykRri8PTJUmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T3vLwa6AMBxM9qcDlYIHUcGmbPqeqmLRlRThDycqiGVITnAxXQbGZSVpqhGRt9dNieTZTTma8cJ3oGFRPUNmFl5nx2/I57beopMhoAeXJT5zNT9VWrC6Nu2SBzgBicuf5yiw78n1VRJzMTUWQUHfRoMmYsP8Bt5CCSZMqXUFTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LK6fBpdj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK6fBpdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788406244; x=1819942244;
  h=date:from:to:cc:subject:message-id;
  bh=D4d23j3SkUXYASvo7nGS4dcQZB8v1kLykRri8PTJUmM=;
  b=LK6fBpdjzzl2qYFycowQOkWoqISW8Bb37+DSgAC0g54BfsZbQMwpW9Pn
   U52vzCLT0vocSGUEebeT1HpZrhqA8tfBpn7vFTvQHC3oNBPEPAi2a8+/K
   n8nClc2PW1FI0fxZEZCrMcJH1zZFl2pMPFzG5hxQQ2obxwKzNtQ8EXdKx
   k2TfVSQ3iM43fP+TRTnMPht1E37sqLLwWNEvOYHU7Q5Ul2HA8vABDUwsn
   TiqkJTuB5hUl9XGQ1KcUQCxhvRMkP7fAMx+n5UJC9qvdBtdfCniIFJwiX
   XYICtZtwp2WJy4rmkvvZcZwUSFNeDKfYW5Sriw5SvkY2LDlRsuRKRQ0hd
   Q==;
X-CSE-ConnectionGUID: 9nve3P9TSB2wwV/JzDU1IA==
X-CSE-MsgGUID: qtDsEsNOSE2G/deFqv2qvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87812258"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="87812258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:30:44 -0700
X-CSE-ConnectionGUID: Dq1aviDhSKaWO7Gvue+Wmg==
X-CSE-MsgGUID: Y+R0ZP0ESaGXNQHy8+wytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269603819"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 20:30:43 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1y9w-000000003vG-3zsR;
	Thu, 03 Sep 2026 03:30:40 +0000
Date: Thu, 03 Sep 2026 11:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: bui duc phuc <phucduc.bui@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [brgl:gpio/for-next 5/8] drivers/gpio/gpio-altera.c:224:7:
 error: use of undeclared identifier 'irq'; did you mean 'girq'?
Message-ID: <202609031134.VMzbwyVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   1900b5a41493e7050c68c1e62780d6fb9a209457
commit: 6e6e585b603e4f679c2a33c8f0954ec88b52fd7a [5/8] gpio: altera: Handle errors from optional IRQ lookup
config: hexagon-randconfig-r053-20260902 (https://download.01.org/0day-ci/archive/20260903/202609031134.VMzbwyVl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031134.VMzbwyVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031134.VMzbwyVl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-altera.c:224:7: error: use of undeclared identifier 'irq'; did you mean 'girq'?
     224 |                 if (irq != -ENXIO)
         |                     ^~~
         |                     girq
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^
   drivers/gpio/gpio-altera.c:174:24: note: 'girq' declared here
     174 |         struct gpio_irq_chip *girq;
         |                               ^
>> drivers/gpio/gpio-altera.c:224:7: error: use of undeclared identifier 'irq'; did you mean 'girq'?
     224 |                 if (irq != -ENXIO)
         |                     ^~~
         |                     girq
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^
   drivers/gpio/gpio-altera.c:174:24: note: 'girq' declared here
     174 |         struct gpio_irq_chip *girq;
         |                               ^
>> drivers/gpio/gpio-altera.c:224:7: error: use of undeclared identifier 'irq'; did you mean 'girq'?
     224 |                 if (irq != -ENXIO)
         |                     ^~~
         |                     girq
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^
   drivers/gpio/gpio-altera.c:174:24: note: 'girq' declared here
     174 |         struct gpio_irq_chip *girq;
         |                               ^
   drivers/gpio/gpio-altera.c:225:11: error: use of undeclared identifier 'irq'; did you mean 'girq'?
     225 |                         return irq;
         |                                ^~~
         |                                girq
   drivers/gpio/gpio-altera.c:174:24: note: 'girq' declared here
     174 |         struct gpio_irq_chip *girq;
         |                               ^
>> drivers/gpio/gpio-altera.c:225:11: error: incompatible pointer to integer conversion returning 'struct gpio_irq_chip *' from a function with result type 'int' [-Wint-conversion]
     225 |                         return irq;
         |                                ^~~
   5 errors generated.


vim +224 drivers/gpio/gpio-altera.c

   165	
   166	static int altera_gpio_probe(struct platform_device *pdev)
   167	{
   168		struct gpio_generic_chip_config config;
   169		struct device *dev = &pdev->dev;
   170		int reg, ret;
   171		struct altera_gpio_chip *altera_gc;
   172		struct gpio_generic_chip *chip;
   173		struct gpio_chip *gc;
   174		struct gpio_irq_chip *girq;
   175		int mapped_irq;
   176	
   177		altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
   178		if (!altera_gc)
   179			return -ENOMEM;
   180	
   181		raw_spin_lock_init(&altera_gc->gpio_lock);
   182	
   183		altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
   184		if (IS_ERR(altera_gc->regs))
   185			return dev_err_probe(dev, PTR_ERR(altera_gc->regs),
   186					     "failed to ioremap memory resource\n");
   187	
   188		chip = &altera_gc->chip;
   189	
   190		config = (struct gpio_generic_chip_config) {
   191			.dev = dev,
   192			.sz = 4,
   193			.dat = altera_gc->regs + ALTERA_GPIO_DATA,
   194			.set = altera_gc->regs + ALTERA_GPIO_DATA,
   195			.dirout = altera_gc->regs + ALTERA_GPIO_DIR,
   196		};
   197	
   198		ret = gpio_generic_chip_init(chip, &config);
   199		if (ret)
   200			return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
   201	
   202		gc = &chip->gc;
   203	
   204		if (device_property_read_u32(dev, "altr,ngpio", &reg))
   205			/* By default assume maximum ngpio */
   206			gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
   207		else
   208			gc->ngpio = reg;
   209	
   210		if (gc->ngpio > ALTERA_GPIO_MAX_NGPIO) {
   211			dev_warn(&pdev->dev,
   212				"ngpio is greater than %d, defaulting to %d\n",
   213				ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
   214			gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
   215		}
   216	
   217		gc->base = -1;
   218		gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
   219		if (!gc->label)
   220			return -ENOMEM;
   221	
   222		mapped_irq = platform_get_irq_optional(pdev, 0);
   223		if (mapped_irq < 0) {
 > 224			if (irq != -ENXIO)
 > 225				return irq;
   226			goto skip_irq;
   227		}
   228	
   229		if (device_property_read_u32(dev, "altr,interrupt-type", &reg)) {
   230			dev_err(&pdev->dev,
   231				"altr,interrupt-type value not set in device tree\n");
   232			return -EINVAL;
   233		}
   234		altera_gc->interrupt_trigger = reg;
   235	
   236		girq = &gc->irq;
   237		gpio_irq_chip_set_chip(girq, &altera_gpio_irq_chip);
   238	
   239		if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)
   240			girq->parent_handler = altera_gpio_irq_leveL_high_handler;
   241		else
   242			girq->parent_handler = altera_gpio_irq_edge_handler;
   243		girq->num_parents = 1;
   244		girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
   245					     GFP_KERNEL);
   246		if (!girq->parents)
   247			return -ENOMEM;
   248		girq->default_type = IRQ_TYPE_NONE;
   249		girq->handler = handle_bad_irq;
   250		girq->parents[0] = mapped_irq;
   251	
   252	skip_irq:
   253		ret = devm_gpiochip_add_data(dev, gc, altera_gc);
   254		if (ret) {
   255			dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
   256			return ret;
   257		}
   258	
   259		return 0;
   260	}
   261	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
