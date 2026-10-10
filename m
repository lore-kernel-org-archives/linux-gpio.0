Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8533BBCF;
	Sat, 10 Oct 2026 01:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595579; cv=none; b=GVFC+RjVA9ds0teCwdyv9uuwdQ7RW/wTgFZBLCb0cQW63ZTS32oXEY2sZaFx2iri+93v8Az5eu/V2t0XP4RaWMevwwo06CVTst5JBDV0tbW1scGjUh4suiggMnal0PpuNAKKpXBwKrH35frjjjOT+AhaY8Q6g+/4iNQocB52CMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595579; c=relaxed/simple;
	bh=J9Fcww+Al93QRXoGwBUr0gIXu6hRxoc6SKUnPQMsqNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhSaf0aNL47fdjEZKzndy2UNtuP5B94CTGYZmStCVuoF/6M/ULSen9Qvvg4WA9b/eUEul2ecsgX0Ke4TRyneA73eZ59GALK2hJgCNPmNw7OccTdv6oRi/hLT7VblpORZaYYapaXUPVCgCBxBe+8CJ+NLt7rB3nQP00ZpYFNTFlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWOouH+B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWOouH+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791595574; x=1823131574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J9Fcww+Al93QRXoGwBUr0gIXu6hRxoc6SKUnPQMsqNs=;
  b=ZWOouH+By9F0n0p80A+TbEGUqZwXwaGZ9uNaaUuUTTCWn2tB+vmR7zPW
   zd1Xe7rFFg+lxWpQ75ow1yk6o847Ba/SiRL39IYiMeSmQjBvIxUS7bDF8
   uz6acWyvkUqWZy3ycf9Wq4S399sBo6UQFOH3vN3CgQsTsgbYoy48IeTE8
   Zyk9oVrbPNu02SZYSvKDBU/6tuVgLtM4Ea7qCYOVPod0jkjrS7O8dtY91
   VBEAG9To1gAB1HMsWtGnWhJN4gWUeniKxt7W6oijM0sXIFkvetHgbfN9A
   pvkFFkM8XFJUofSUoCKaioU9xHSqZ5HDWDs+EauTkv+FR6iUR4AoNfRvE
   w==;
X-CSE-ConnectionGUID: 0cGs0398RueIasrF4vYJPQ==
X-CSE-MsgGUID: Po7lP3fjRweghuEZXZ+fIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="403701"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="403701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 18:26:13 -0700
X-CSE-ConnectionGUID: 4MT35CTgQym2/cEdEAulfw==
X-CSE-MsgGUID: nRbO7wacQrKhmQTNYKmC9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="895086"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2026 18:26:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFLqj-000000006N8-1E7U;
	Sat, 10 Oct 2026 01:26:09 +0000
Date: Sat, 10 Oct 2026 09:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: phucduc.bui@gmail.com, Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Darian Biastoch <d.biastoch@gmail.com>,
	Andreas Kaessens <akaessens@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, bui duc phuc <phucduc.bui@gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
Message-ID: <202610100943.RQhhOoh8-lkp@intel.com>
References: <20261009112634.33436-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009112634.33436-1-phucduc.bui@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/for-next]
[also build test WARNING on linus/master v7.3-rc6 next-20261008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/phucduc-bui-gmail-com/pinctrl-mcp23s08-Propagate-reset-GPIO-errors/20261009-182634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
patch link:    https://lore.kernel.org/r/20261009112634.33436-1-phucduc.bui%40gmail.com
patch subject: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
config: powerpc64-randconfig-1000-20261010 (https://download.01.org/0day-ci/archive/20261010/202610100943.RQhhOoh8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100943.RQhhOoh8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100943.RQhhOoh8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-mcp23s08.c:617:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     617 |                 return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
         |                                           ^~~
   drivers/pinctrl/pinctrl-mcp23s08.c:592:17: note: initialize the variable 'ret' to silence this warning
     592 |         int status, ret;
         |                        ^
         |                         = 0
   1 warning generated.


vim +/ret +617 drivers/pinctrl/pinctrl-mcp23s08.c

   588	
   589	int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
   590			       unsigned int addr, unsigned int type, unsigned int base)
   591	{
   592		int status, ret;
   593		bool mirror = false;
   594		bool open_drain = false;
   595	
   596		mutex_init(&mcp->lock);
   597	
   598		mcp->dev = dev;
   599		mcp->addr = addr;
   600	
   601		mcp->irq_active_high = false;
   602	
   603		mcp->chip.direction_input = mcp23s08_direction_input;
   604		mcp->chip.get = mcp23s08_get;
   605		mcp->chip.get_multiple = mcp23s08_get_multiple;
   606		mcp->chip.direction_output = mcp23s08_direction_output;
   607		mcp->chip.set = mcp23s08_set;
   608		mcp->chip.set_multiple = mcp23s08_set_multiple;
   609	
   610		mcp->chip.base = base;
   611		mcp->chip.can_sleep = true;
   612		mcp->chip.parent = dev;
   613		mcp->chip.owner = THIS_MODULE;
   614	
   615		mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
   616		if (IS_ERR(mcp->reset_gpio))
 > 617			return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
   618	
   619		/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
   620		 * and MCP_IOCON.HAEN = 1, so we work with all chips.
   621		 */
   622	
   623		ret = mcp_read(mcp, MCP_IOCON, &status);
   624		if (ret < 0)
   625			return dev_err_probe(dev, ret, "can't identify chip %d\n", addr);
   626	
   627		mcp->irq_controller =
   628			device_property_read_bool(dev, "interrupt-controller");
   629		if (mcp->irq && mcp->irq_controller) {
   630			mcp->irq_active_high =
   631				device_property_read_bool(dev,
   632						      "microchip,irq-active-high");
   633	
   634			mirror = device_property_read_bool(dev, "microchip,irq-mirror");
   635			open_drain = device_property_read_bool(dev, "drive-open-drain");
   636		}
   637	
   638		if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
   639		     mcp->irq_active_high || open_drain) {
   640			/* mcp23s17 has IOCON twice, make sure they are in sync */
   641			status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
   642			status |= IOCON_HAEN | (IOCON_HAEN << 8);
   643			if (mcp->irq_active_high)
   644				status |= IOCON_INTPOL | (IOCON_INTPOL << 8);
   645			else
   646				status &= ~(IOCON_INTPOL | (IOCON_INTPOL << 8));
   647	
   648			if (mirror)
   649				status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
   650	
   651			if (open_drain)
   652				status |= IOCON_ODR | (IOCON_ODR << 8);
   653	
   654			if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
   655				status |= IOCON_INTCC | (IOCON_INTCC << 8);
   656	
   657			ret = mcp_write(mcp, MCP_IOCON, status);
   658			if (ret < 0)
   659				return dev_err_probe(dev, ret, "can't write IOCON %d\n", addr);
   660		}
   661	
   662		if (mcp->irq && mcp->irq_controller) {
   663			struct gpio_irq_chip *girq = &mcp->chip.irq;
   664	
   665			/*
   666			 * Disable all pin interrupts, to prevent the interrupt handler from
   667			 * calling nested handlers for any currently-enabled interrupts that
   668			 * do not (yet) have an actual handler.
   669			 */
   670			ret = mcp_write(mcp, MCP_GPINTEN, 0);
   671			if (ret < 0)
   672				return dev_err_probe(dev, ret, "can't disable interrupts\n");
   673	
   674			gpio_irq_chip_set_chip(girq, &mcp23s08_irq_chip);
   675			/* This will let us handle the parent IRQ in the driver */
   676			girq->parent_handler = NULL;
   677			girq->num_parents = 0;
   678			girq->parents = NULL;
   679			girq->default_type = IRQ_TYPE_NONE;
   680			girq->handler = handle_simple_irq;
   681			girq->threaded = true;
   682		}
   683	
   684		ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
   685		if (ret < 0)
   686			return dev_err_probe(dev, ret, "can't add GPIO chip\n");
   687	
   688		mcp->pinctrl_desc.pctlops = &mcp_pinctrl_ops;
   689		mcp->pinctrl_desc.confops = &mcp_pinconf_ops;
   690		mcp->pinctrl_desc.npins = mcp->chip.ngpio;
   691		if (mcp->pinctrl_desc.npins == 8)
   692			mcp->pinctrl_desc.pins = mcp23x08_pins;
   693		else if (mcp->pinctrl_desc.npins == 16)
   694			mcp->pinctrl_desc.pins = mcp23x17_pins;
   695		mcp->pinctrl_desc.owner = THIS_MODULE;
   696	
   697		mcp->pctldev = devm_pinctrl_register(dev, &mcp->pinctrl_desc, mcp);
   698		if (IS_ERR(mcp->pctldev))
   699			return dev_err_probe(dev, PTR_ERR(mcp->pctldev), "can't register controller\n");
   700	
   701		if (mcp->irq) {
   702			ret = mcp23s08_irq_setup(mcp);
   703			if (ret)
   704				return dev_err_probe(dev, ret, "can't setup IRQ\n");
   705		}
   706	
   707		return 0;
   708	}
   709	EXPORT_SYMBOL_GPL(mcp23s08_probe_one);
   710	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
