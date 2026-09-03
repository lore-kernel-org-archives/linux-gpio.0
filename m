Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8143B489
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420913; cv=none; b=jdXxjVw5VnnWWQ0hi6uXrqQik4gJtUUE0TRB/e8daqxindtGbfIMz37DSqYnVopqtXIh4hw973/+zk1A3zDv4Va9TUJX2HL9ME8WQC50u6wXtGmRtyBghF9kNdkV58H+7TB+2/vhhzvZKFj2I0SDqnrHIpfuFYe/eWZEH0F81bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420913; c=relaxed/simple;
	bh=39Jx9KtDS8alLni2xt7CpfUzAqEr0FXk2RhxhmCdxPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YSxMs1Oi12U0pJjVCPElWwfUKllYP3CvWY65IYusj58BP/40bJa7MBErJDbn1+yIegLlDWwI4PdvMJkprrFf8qO8jR43O8+F1Vi3iAGTWeMOHJpr02SiUTOBwuarCsUW6BsWpSSh+2pI4mzUt4QiT0xsdlR3h7tLY2ZvkUMg84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtqL1Dq1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtqL1Dq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788420912; x=1819956912;
  h=date:from:to:cc:subject:message-id;
  bh=39Jx9KtDS8alLni2xt7CpfUzAqEr0FXk2RhxhmCdxPE=;
  b=BtqL1Dq1UUIBssUrql1Ol/0533gthbUzkusAp5HX58bPQJIPMexEIoTy
   LEKXcZ510oAFTL/wkiWnwSxmonz4k1WOxbYDDUbyAWSGzZQyBQrqq8Me0
   W4QJTS6GsZhEazQfoZtHCYjf1ZZ3CqDbOK/+EOSeoPDpglyLVwURoich0
   Q6I2xKSOmptCa+fBwy3+5PsFvOP2SAC011vL3v/zV4ptRjTa3heJJQ+kT
   Bt+p52EsnV5Xjqhxpl+5Z23dx3O8NvDD003oCc8QMrNnmHaXQNHSnzSuO
   7oBXni92gT/TF1IxorW12EWb0gFCygQfF01qRvJJUPTapOGFNTYl3hnw2
   A==;
X-CSE-ConnectionGUID: hX97FJXeQm+w/ycprn4jgg==
X-CSE-MsgGUID: b96AMpgrT6iouquReRuZaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92711849"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92711849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:35:09 -0700
X-CSE-ConnectionGUID: 49kDZtfySiiJC1KDq10zrQ==
X-CSE-MsgGUID: l5cGXGY+SlStrJStJ6qeUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268308910"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Sep 2026 00:35:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x21yT-000000004JO-1LdR;
	Thu, 03 Sep 2026 07:35:05 +0000
Date: Thu, 03 Sep 2026 15:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: bui duc phuc <phucduc.bui@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [brgl:gpio/for-next 5/8] drivers/gpio/gpio-altera.c:224:11:
 warning: comparison between pointer and integer ('struct gpio_irq_chip *' and
 'int')
Message-ID: <202609031554.tpxA67sB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   1900b5a41493e7050c68c1e62780d6fb9a209457
commit: 6e6e585b603e4f679c2a33c8f0954ec88b52fd7a [5/8] gpio: altera: Handle errors from optional IRQ lookup
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031554.tpxA67sB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ed1626b9d0eaf7c406f44da5fb595ad94559f54b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031554.tpxA67sB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031554.tpxA67sB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-altera.c:224:7: error: use of undeclared identifier 'irq'; did you mean 'girq'?
     224 |                 if (irq != -ENXIO)
         |                     ^~~
         |                     girq
   drivers/gpio/gpio-altera.c:174:24: note: 'girq' declared here
     174 |         struct gpio_irq_chip *girq;
         |                               ^
>> drivers/gpio/gpio-altera.c:224:11: warning: comparison between pointer and integer ('struct gpio_irq_chip *' and 'int') [-Wpointer-integer-compare]
     224 |                 if (irq != -ENXIO)
         |                     ~~~ ^  ~~~~~~
   drivers/gpio/gpio-altera.c:225:11: error: use of undeclared identifier 'irq'; did you mean 'girq'?
     225 |                         return irq;
         |                                ^~~
         |                                girq
   drivers/gpio/gpio-altera.c:174:24: note: 'girq' declared here
     174 |         struct gpio_irq_chip *girq;
         |                               ^
   drivers/gpio/gpio-altera.c:225:11: error: incompatible pointer to integer conversion returning 'struct gpio_irq_chip *' from a function with result type 'int' [-Wint-conversion]
     225 |                         return irq;
         |                                ^~~
   1 warning and 3 errors generated.


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
   225				return irq;
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
