Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D05C377AAA;
	Tue,  4 Aug 2026 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856844; cv=none; b=AZjmzeuqtp5pAcsMTR6AlgKFfEsBmaUEE75DLT6x8BZs48nWoxpDBUVckequ/PQS6STQa0LxJy+HC7Q1rMekl0hcnLYCwYI2JEuMw6Cpjy9YGqJf7f3EixO+K156hg67zhhgsKxgDgh3GrLdGrFpRWW1egkQkVN+TYhrdr6B8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856844; c=relaxed/simple;
	bh=597sp7wrS5NZsGOmlApZyviJDKLYPo4BUohV9Dw2AlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQbLhRSYUTp5F0vzCCjS590Z3Hgoc8YCZhW8gGPaXwVUhEnxVFRqDBfb2IPOTO3QIUybRp0uf4x4un2KJmwpNY629uH8T0dgLmBSbTefKTJhtSrLXALp/FLxgck3q1/rDb/EAxFS1jKuwMjLp6cQtNz2pUo5kPNVaxJeqEQhYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sck07cXY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sck07cXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785856841; x=1817392841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=597sp7wrS5NZsGOmlApZyviJDKLYPo4BUohV9Dw2AlI=;
  b=Sck07cXYQbe1skwauYtZxou5RlImLWkJzK5jP5cw06D00Du668xrUtvy
   XZcdfIckHZgrBtwo8gyQPIZLtCe/Xna6MZ8nuFzyJPSdqF3gh9O0SICMd
   rtTW05unJfD/P+ciJczj8chhjhkX7nBgu+gcbuH/gE0eKgWFyWFcZpnqA
   Kb1kFCY3+ioyIdCB2FiQwjUHfG52Y1KvmKMUPBoOKZNLDuAya2/vl9TcO
   5bXeo/YzzOZSoXQMK85O3zSMnNXo38yBoEOi/a/P481IiDRj+rK4lxybG
   3HiV/hYSNSzz0XUYmQ6GMIrLVbf8Eya2muNMB6sxmgjE+2pHdUK1vbf/d
   A==;
X-CSE-ConnectionGUID: O6+sm3K3REiqRS4kQJPcIw==
X-CSE-MsgGUID: B12HboDRS1my7+2M+xqBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86287101"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86287101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 08:20:40 -0700
X-CSE-ConnectionGUID: ci2R81MSQVWy4BOjYA/FxA==
X-CSE-MsgGUID: 1uFWCLXURrW07obHP42bBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="258865749"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2026 08:16:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrGsC-00000000A5h-0kAL;
	Tue, 04 Aug 2026 15:16:08 +0000
Date: Tue, 4 Aug 2026 23:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
Message-ID: <202608042358.6rKawjZd-lkp@intel.com>
References: <20260707233511.1272686-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707233511.1272686-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/gpio-mvebu-convert-to-noirq-suspend-resume-to-prevent-interrupt-storm-on-resume/20260804-155102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260707233511.1272686-1-rosenp%40gmail.com
patch subject: [PATCH] gpio: mvebu: convert to noirq suspend/resume to prevent interrupt storm on resume
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608042358.6rKawjZd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608042358.6rKawjZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608042358.6rKawjZd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-mvebu.c:1034:12: warning: 'mvebu_gpio_resume' defined but not used [-Wunused-function]
    1034 | static int mvebu_gpio_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-mvebu.c:982:12: warning: 'mvebu_gpio_suspend' defined but not used [-Wunused-function]
     982 | static int mvebu_gpio_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/mvebu_gpio_resume +1034 drivers/gpio/gpio-mvebu.c

   981	
 > 982	static int mvebu_gpio_suspend(struct device *dev)
   983	{
   984		struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
   985		int i;
   986	
   987		regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
   988			    &mvchip->out_reg);
   989		regmap_read(mvchip->regs, GPIO_IO_CONF_OFF + mvchip->offset,
   990			    &mvchip->io_conf_reg);
   991		regmap_read(mvchip->regs, GPIO_BLINK_EN_OFF + mvchip->offset,
   992			    &mvchip->blink_en_reg);
   993		regmap_read(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset,
   994			    &mvchip->in_pol_reg);
   995	
   996		switch (mvchip->soc_variant) {
   997		case MVEBU_GPIO_SOC_VARIANT_ORION:
   998		case MVEBU_GPIO_SOC_VARIANT_A8K:
   999			regmap_read(mvchip->regs, GPIO_EDGE_MASK_OFF + mvchip->offset,
  1000				    &mvchip->edge_mask_regs[0]);
  1001			regmap_read(mvchip->regs, GPIO_LEVEL_MASK_OFF + mvchip->offset,
  1002				    &mvchip->level_mask_regs[0]);
  1003			break;
  1004		case MVEBU_GPIO_SOC_VARIANT_MV78200:
  1005			for (i = 0; i < 2; i++) {
  1006				regmap_read(mvchip->regs,
  1007					    GPIO_EDGE_MASK_MV78200_OFF(i),
  1008					    &mvchip->edge_mask_regs[i]);
  1009				regmap_read(mvchip->regs,
  1010					    GPIO_LEVEL_MASK_MV78200_OFF(i),
  1011					    &mvchip->level_mask_regs[i]);
  1012			}
  1013			break;
  1014		case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
  1015			for (i = 0; i < 4; i++) {
  1016				regmap_read(mvchip->regs,
  1017					    GPIO_EDGE_MASK_ARMADAXP_OFF(i),
  1018					    &mvchip->edge_mask_regs[i]);
  1019				regmap_read(mvchip->regs,
  1020					    GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
  1021					    &mvchip->level_mask_regs[i]);
  1022			}
  1023			break;
  1024		default:
  1025			BUG();
  1026		}
  1027	
  1028		if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
  1029			mvebu_pwm_suspend(mvchip);
  1030	
  1031		return 0;
  1032	}
  1033	
> 1034	static int mvebu_gpio_resume(struct device *dev)
  1035	{
  1036		struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
  1037		int i;
  1038	
  1039		regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
  1040			     mvchip->out_reg);
  1041		regmap_write(mvchip->regs, GPIO_IO_CONF_OFF + mvchip->offset,
  1042			     mvchip->io_conf_reg);
  1043		regmap_write(mvchip->regs, GPIO_BLINK_EN_OFF + mvchip->offset,
  1044			     mvchip->blink_en_reg);
  1045		regmap_write(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset,
  1046			     mvchip->in_pol_reg);
  1047	
  1048		switch (mvchip->soc_variant) {
  1049		case MVEBU_GPIO_SOC_VARIANT_ORION:
  1050		case MVEBU_GPIO_SOC_VARIANT_A8K:
  1051			regmap_write(mvchip->regs, GPIO_EDGE_MASK_OFF + mvchip->offset,
  1052				     mvchip->edge_mask_regs[0]);
  1053			regmap_write(mvchip->regs, GPIO_LEVEL_MASK_OFF + mvchip->offset,
  1054				     mvchip->level_mask_regs[0]);
  1055			break;
  1056		case MVEBU_GPIO_SOC_VARIANT_MV78200:
  1057			for (i = 0; i < 2; i++) {
  1058				regmap_write(mvchip->regs,
  1059					     GPIO_EDGE_MASK_MV78200_OFF(i),
  1060					     mvchip->edge_mask_regs[i]);
  1061				regmap_write(mvchip->regs,
  1062					     GPIO_LEVEL_MASK_MV78200_OFF(i),
  1063					     mvchip->level_mask_regs[i]);
  1064			}
  1065			break;
  1066		case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
  1067			for (i = 0; i < 4; i++) {
  1068				regmap_write(mvchip->regs,
  1069					     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
  1070					     mvchip->edge_mask_regs[i]);
  1071				regmap_write(mvchip->regs,
  1072					     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
  1073					     mvchip->level_mask_regs[i]);
  1074			}
  1075			break;
  1076		default:
  1077			BUG();
  1078		}
  1079	
  1080		if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
  1081			mvebu_pwm_resume(mvchip);
  1082	
  1083		return 0;
  1084	}
  1085	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
