Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC34A263D
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437804; cv=none; b=dVcfVdBApO4bdHjEKZHzANklVNBfseMGcGmvZjaRlas8kvHrMuxUtPmPDRjmxhPxX+/HgJtR94s9yEb1ajhKp8G4MzgwDePnbvHozv49GWu4OeiGvQZSx3ZO6gnyx5lfl0f+mQDNvdPhpukja2rVOHTia09O3iLiSu4uRVOU0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437804; c=relaxed/simple;
	bh=D6iLQCq9Nu3cfoB9hsaZdtvkqF7xeEYS+SP15ftoqA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C6pY2Rebr4vX09Eg/uM0GiMIqbJMLnPKRSIXVLy4XCJ+Ppwbarp/MJhkw4dztKy/Nk2W4U3j1DZqbm2kmf0Cc33K2fWDTtzuCYNBPLYz5uy2ZrNHPIHbjk/12VCrfEGCyQ2DxmONReczT5jmpNxW833aiaWRm4iBUAl9j6L43hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6q/xBuD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6q/xBuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788437802; x=1819973802;
  h=date:from:to:cc:subject:message-id;
  bh=D6iLQCq9Nu3cfoB9hsaZdtvkqF7xeEYS+SP15ftoqA0=;
  b=D6q/xBuD31/lnzhiaYHvDCMHHHF0bFpwAAEipiaS47QBw8MAAxkMMD4Y
   PO+FI4Hc4A0mVRmWB57lsuKhXC09Aqf1mjk6hq4AmDt+z8QNxNpR5JjlM
   JZTlblgtZP58Y71jTICd6+1DMtFDOwzr9fg1i32xjLKRvk5F50Flu23db
   prETO4KGybgoJA1bIE5u6A+PUejOtgDUZaLFfhDmkBABgrKDGfP+UaSc1
   86b+JxvAXOawLvlUEJPHNYqBMnRMm/2DQAvqOwJCOTv1V5C0SlEX+f86Y
   6aXseQRg2Y3fuQpbBnWz8SZmMx/YnUkXzXuPugpFR0YbxyQkOazmfTZCm
   Q==;
X-CSE-ConnectionGUID: EJI9JX7QT5SSr3IrNR+vVA==
X-CSE-MsgGUID: s9kZbSwRS069MsgHeyuzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106439072"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="106439072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:16:40 -0700
X-CSE-ConnectionGUID: cn8Cvj3vTCiM2EIdxML1MA==
X-CSE-MsgGUID: cH9s8GaHSKiHwj4CqeL5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="294580162"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2026 05:16:38 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x26Mt-000000004nG-3cvA;
	Thu, 03 Sep 2026 12:16:35 +0000
Date: Thu, 03 Sep 2026 20:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: bui duc phuc <phucduc.bui@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [brgl:gpio/for-next 5/12] drivers/gpio/gpio-altera.c:224:21:
 error: 'irq' undeclared; did you mean 'girq'?
Message-ID: <202609032003.JKU2nkvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   a2cfc48fee416f0ea78e7dc38acbf2ce072574cc
commit: 6e6e585b603e4f679c2a33c8f0954ec88b52fd7a [5/12] gpio: altera: Handle errors from optional IRQ lookup
config: openrisc-randconfig-r072-20260902 (https://download.01.org/0day-ci/archive/20260903/202609032003.JKU2nkvu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609032003.JKU2nkvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609032003.JKU2nkvu-lkp@intel.com/

Note: the brgl/gpio/for-next HEAD a2cfc48fee416f0ea78e7dc38acbf2ce072574cc builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-altera.c: In function 'altera_gpio_probe':
>> drivers/gpio/gpio-altera.c:224:21: error: 'irq' undeclared (first use in this function); did you mean 'girq'?
     224 |                 if (irq != -ENXIO)
         |                     ^~~
         |                     girq
   drivers/gpio/gpio-altera.c:224:21: note: each undeclared identifier is reported only once for each function it appears in


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
