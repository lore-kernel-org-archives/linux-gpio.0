Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDA2D29C8;
	Sun, 30 Aug 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788118327; cv=none; b=JMFmsI4o1lYFzavXwCMBHn/QdHDr433nLWdqZA4j2fMZFobyVM7pqdQyecYV/4YZApqzyO2rORM2f5Gf0EZYtdh2VL4eGYDnM3m7Uurh2TSmCMnqE7eBgSJRXPho3czhdUgcj8CyJ4YR1O8IZxVacH5bY/pLm4p2KImyPO7ofog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788118327; c=relaxed/simple;
	bh=GF2+6d5Ki9Lkpywk+mOfcy0XeM7raY0lCN+vafb/k9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ps6dDdTMG536FkEwhg7BwNs3jA08Qd3TyrSJxoTP/OUG13UpIxCFANpLDESTly13+LDHhZbd0V241vA5PLmhCBztcWdzg7A9QN24ixb9e4HnB1MGJ51u94vocAIEdrfpl58KH/29WaXegx9FoEYMtdJk/N6NFONFd3w/h6Xelq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q00d5KZ0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q00d5KZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788118324; x=1819654324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GF2+6d5Ki9Lkpywk+mOfcy0XeM7raY0lCN+vafb/k9E=;
  b=Q00d5KZ0AiBF36LsOCPfELfUZTQAmsnBoJWLoKSN+0VjDFs7t03zQlLg
   TqnVIa58Q6BYEGxJLfiNDGHdjlyX1busCbFI7J/bK6zGvvd/WPjLVTpPg
   7C6isXa2MX1XPB0fbnQYXq40a00PFrfV5rSJdojGetgNbtdI/jdqy6+s5
   QpB3DGaZ0uI+JlMyZN5+wfC46KoggLAXhNz7POFkforbtTG3PV9jL2PBI
   NrU4Z4ff8QiEZMBgbxwpI6nyBeiw7xcsIsAGrY08ZZ0ylU4ycnM772HcG
   akw3oUNornr0nmEaypGbwrSfiDSL5Za8p/PM0x1+mxfkEvRj9k5kUII1Q
   g==;
X-CSE-ConnectionGUID: kSz+HUmfQHi/dbqdDfbSkg==
X-CSE-MsgGUID: OaHQ8G0eR6ipbk7vOCXG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88294606"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88294606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 12:32:03 -0700
X-CSE-ConnectionGUID: iIVXZHUeRDiPClN+2A6u+A==
X-CSE-MsgGUID: ATmQ9GHuQgCsXgPjH5YoiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272424132"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Aug 2026 12:32:01 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0lG2-000000000CZ-1ucC;
	Sun, 30 Aug 2026 19:31:58 +0000
Date: Sun, 30 Aug 2026 21:31:37 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linusw@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: Re: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded
 fwnode_is_gpiochip()
Message-ID: <202608302138.FQoQsbAf-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v7.2 next-20260828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Split-fwnode_is_gpiochip-helper/20260824-094232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260824074427.3226457-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260830/202608302138.FQoQsbAf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302138.FQoQsbAf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302138.FQoQsbAf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-cdev.c:15:
   include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'
     888 |         return fwnode_property_present(child, "gpio-controller");
         |                                        ^~~~~
>> drivers/gpio/gpiolib-cdev.c:1650:2: warning: implicit conversion from '__size_t' (aka 'unsigned long') to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1650 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:135:69: note: expanded from macro 'INIT_KFIFO'
     135 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
         |                       ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   1 warning and 1 error generated.


vim +1650 drivers/gpio/gpiolib-cdev.c

96c02c906a44bc2 Kent Gibson         2026-02-16  1603  
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1604  static int linereq_create(struct gpio_device *gdev, void __user *ip)
925ca36913fc7df Kent Gibson         2020-06-16  1605  {
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1606  	struct gpio_v2_line_request ulr;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1607  	struct gpio_v2_line_config *lc;
96c02c906a44bc2 Kent Gibson         2026-02-16  1608  	struct linereq *lr __free(linereq_free) = NULL;
b1a92e94560def6 Kent Gibson         2022-07-14  1609  	u64 flags, edflags;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1610  	unsigned int i;
96c02c906a44bc2 Kent Gibson         2026-02-16  1611  	int ret;
925ca36913fc7df Kent Gibson         2020-06-16  1612  
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1613  	if (copy_from_user(&ulr, ip, sizeof(ulr)))
925ca36913fc7df Kent Gibson         2020-06-16  1614  		return -EFAULT;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1615  
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1616  	if ((ulr.num_lines == 0) || (ulr.num_lines > GPIO_V2_LINES_MAX))
925ca36913fc7df Kent Gibson         2020-06-16  1617  		return -EINVAL;
925ca36913fc7df Kent Gibson         2020-06-16  1618  
e106b1dd38e723e Andy Shevchenko     2024-11-10  1619  	if (!mem_is_zero(ulr.padding, sizeof(ulr.padding)))
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1620  		return -EINVAL;
925ca36913fc7df Kent Gibson         2020-06-16  1621  
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1622  	lc = &ulr.config;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1623  	ret = gpio_v2_line_config_validate(lc, ulr.num_lines);
925ca36913fc7df Kent Gibson         2020-06-16  1624  	if (ret)
925ca36913fc7df Kent Gibson         2020-06-16  1625  		return ret;
925ca36913fc7df Kent Gibson         2020-06-16  1626  
323bbfcf1ef8836 Linus Torvalds      2026-02-21  1627  	lr = kvzalloc_flex(*lr, lines, ulr.num_lines);
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1628  	if (!lr)
925ca36913fc7df Kent Gibson         2020-06-16  1629  		return -ENOMEM;
a512635da9f7223 Kees Cook           2023-09-22  1630  	lr->num_lines = ulr.num_lines;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1631  
dc0989e3aa58dc4 Andy Shevchenko     2022-12-28  1632  	lr->gdev = gpio_device_get(gdev);
925ca36913fc7df Kent Gibson         2020-06-16  1633  
65cff70464068a8 Kent Gibson         2020-09-28  1634  	for (i = 0; i < ulr.num_lines; i++) {
73e0341992b68bb Kent Gibson         2020-09-28  1635  		lr->lines[i].req = lr;
65cff70464068a8 Kent Gibson         2020-09-28  1636  		WRITE_ONCE(lr->lines[i].sw_debounced, 0);
65cff70464068a8 Kent Gibson         2020-09-28  1637  		INIT_DELAYED_WORK(&lr->lines[i].work, debounce_work_func);
65cff70464068a8 Kent Gibson         2020-09-28  1638  	}
73e0341992b68bb Kent Gibson         2020-09-28  1639  
f188ac1251b909c Kent Gibson         2020-10-05  1640  	if (ulr.consumer[0] != '\0') {
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1641  		/* label is only initialized if consumer is set */
f188ac1251b909c Kent Gibson         2020-10-05  1642  		lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1,
925ca36913fc7df Kent Gibson         2020-06-16  1643  				     GFP_KERNEL);
96c02c906a44bc2 Kent Gibson         2026-02-16  1644  		if (!lr->label)
96c02c906a44bc2 Kent Gibson         2026-02-16  1645  			return -ENOMEM;
925ca36913fc7df Kent Gibson         2020-06-16  1646  	}
925ca36913fc7df Kent Gibson         2020-06-16  1647  
a54756cb24eafac Kent Gibson         2020-09-28  1648  	mutex_init(&lr->config_mutex);
73e0341992b68bb Kent Gibson         2020-09-28  1649  	init_waitqueue_head(&lr->wait);
35d848e7a1cbba2 Kent Gibson         2024-05-29 @1650  	INIT_KFIFO(lr->events);
73e0341992b68bb Kent Gibson         2020-09-28  1651  	lr->event_buffer_size = ulr.event_buffer_size;
73e0341992b68bb Kent Gibson         2020-09-28  1652  	if (lr->event_buffer_size == 0)
73e0341992b68bb Kent Gibson         2020-09-28  1653  		lr->event_buffer_size = ulr.num_lines * 16;
73e0341992b68bb Kent Gibson         2020-09-28  1654  	else if (lr->event_buffer_size > GPIO_V2_LINES_MAX * 16)
73e0341992b68bb Kent Gibson         2020-09-28  1655  		lr->event_buffer_size = GPIO_V2_LINES_MAX * 16;
73e0341992b68bb Kent Gibson         2020-09-28  1656  
73e0341992b68bb Kent Gibson         2020-09-28  1657  	atomic_set(&lr->seqno, 0);
883f91981843712 Kent Gibson         2020-07-08  1658  
925ca36913fc7df Kent Gibson         2020-06-16  1659  	/* Request each GPIO */
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1660  	for (i = 0; i < ulr.num_lines; i++) {
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1661  		u32 offset = ulr.offsets[i];
f4e14d45d7fe95f Bartosz Golaszewski 2024-01-24  1662  		struct gpio_desc *desc = gpio_device_get_desc(gdev, offset);
925ca36913fc7df Kent Gibson         2020-06-16  1663  
96c02c906a44bc2 Kent Gibson         2026-02-16  1664  		if (IS_ERR(desc))
96c02c906a44bc2 Kent Gibson         2026-02-16  1665  			return PTR_ERR(desc);
925ca36913fc7df Kent Gibson         2020-06-16  1666  
95a4eed7dd5b7c1 Andy Shevchenko     2022-02-01  1667  		ret = gpiod_request_user(desc, lr->label);
925ca36913fc7df Kent Gibson         2020-06-16  1668  		if (ret)
96c02c906a44bc2 Kent Gibson         2026-02-16  1669  			return ret;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1670  
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1671  		lr->lines[i].desc = desc;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1672  		flags = gpio_v2_line_config_flags(lc, i);
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1673  		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
925ca36913fc7df Kent Gibson         2020-06-16  1674  
925ca36913fc7df Kent Gibson         2020-06-16  1675  		ret = gpiod_set_transitory(desc, false);
925ca36913fc7df Kent Gibson         2020-06-16  1676  		if (ret < 0)
96c02c906a44bc2 Kent Gibson         2026-02-16  1677  			return ret;
925ca36913fc7df Kent Gibson         2020-06-16  1678  
b1a92e94560def6 Kent Gibson         2022-07-14  1679  		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
925ca36913fc7df Kent Gibson         2020-06-16  1680  		/*
925ca36913fc7df Kent Gibson         2020-06-16  1681  		 * Lines have to be requested explicitly for input
925ca36913fc7df Kent Gibson         2020-06-16  1682  		 * or output, else the line will be treated "as is".
925ca36913fc7df Kent Gibson         2020-06-16  1683  		 */
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1684  		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1685  			int val = gpio_v2_line_config_output_value(lc, i);
925ca36913fc7df Kent Gibson         2020-06-16  1686  
07c61d4da43fa3b Bartosz Golaszewski 2024-10-18  1687  			ret = gpiod_direction_output_nonotify(desc, val);
925ca36913fc7df Kent Gibson         2020-06-16  1688  			if (ret)
96c02c906a44bc2 Kent Gibson         2026-02-16  1689  				return ret;
3c0d9c635ae2b2c Kent Gibson         2020-09-28  1690  		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
07c61d4da43fa3b Bartosz Golaszewski 2024-10-18  1691  			ret = gpiod_direction_input_nonotify(desc);
925ca36913fc7df Kent Gibson         2020-06-16  1692  			if (ret)
96c02c906a44bc2 Kent Gibson         2026-02-16  1693  				return ret;
73e0341992b68bb Kent Gibson         2020-09-28  1694  
65cff70464068a8 Kent Gibson         2020-09-28  1695  			ret = edge_detector_setup(&lr->lines[i], lc, i,
b1a92e94560def6 Kent Gibson         2022-07-14  1696  						  edflags);
73e0341992b68bb Kent Gibson         2020-09-28  1697  			if (ret)
96c02c906a44bc2 Kent Gibson         2026-02-16  1698  				return ret;
925ca36913fc7df Kent Gibson         2020-06-16  1699  		}
925ca36913fc7df Kent Gibson         2020-06-16  1700  
b1a92e94560def6 Kent Gibson         2022-07-14  1701  		lr->lines[i].edflags = edflags;
b1a92e94560def6 Kent Gibson         2022-07-14  1702  
9ce4ed5b4db1363 Bartosz Golaszewski 2023-08-21  1703  		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
925ca36913fc7df Kent Gibson         2020-06-16  1704  
925ca36913fc7df Kent Gibson         2020-06-16  1705  		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
925ca36913fc7df Kent Gibson         2020-06-16  1706  			offset);
925ca36913fc7df Kent Gibson         2020-06-16  1707  	}
925ca36913fc7df Kent Gibson         2020-06-16  1708  
a0dda508bd66b9e Bartosz Golaszewski 2023-08-17  1709  	lr->device_unregistered_nb.notifier_call = linereq_unregistered_notify;
a0dda508bd66b9e Bartosz Golaszewski 2023-08-17  1710  	ret = blocking_notifier_chain_register(&gdev->device_notifier,
a0dda508bd66b9e Bartosz Golaszewski 2023-08-17  1711  					       &lr->device_unregistered_nb);
a0dda508bd66b9e Bartosz Golaszewski 2023-08-17  1712  	if (ret)
96c02c906a44bc2 Kent Gibson         2026-02-16  1713  		return ret;
925ca36913fc7df Kent Gibson         2020-06-16  1714  
96c02c906a44bc2 Kent Gibson         2026-02-16  1715  	FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
96c02c906a44bc2 Kent Gibson         2026-02-16  1716  		   anon_inode_getfile("gpio-line", &line_fileops, lr,
96c02c906a44bc2 Kent Gibson         2026-02-16  1717  				      O_RDONLY | O_CLOEXEC));
96c02c906a44bc2 Kent Gibson         2026-02-16  1718  	if (fdf.err)
96c02c906a44bc2 Kent Gibson         2026-02-16  1719  		return fdf.err;
96c02c906a44bc2 Kent Gibson         2026-02-16  1720  	retain_and_null_ptr(lr);
925ca36913fc7df Kent Gibson         2020-06-16  1721  
96c02c906a44bc2 Kent Gibson         2026-02-16  1722  	ulr.fd = fd_prepare_fd(fdf);
96c02c906a44bc2 Kent Gibson         2026-02-16  1723  	if (copy_to_user(ip, &ulr, sizeof(ulr)))
925ca36913fc7df Kent Gibson         2020-06-16  1724  		return -EFAULT;
925ca36913fc7df Kent Gibson         2020-06-16  1725  
96c02c906a44bc2 Kent Gibson         2026-02-16  1726  	fd_publish(fdf);
925ca36913fc7df Kent Gibson         2020-06-16  1727  
925ca36913fc7df Kent Gibson         2020-06-16  1728  	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
96c02c906a44bc2 Kent Gibson         2026-02-16  1729  		ulr.num_lines);
925ca36913fc7df Kent Gibson         2020-06-16  1730  
925ca36913fc7df Kent Gibson         2020-06-16  1731  	return 0;
925ca36913fc7df Kent Gibson         2020-06-16  1732  }
925ca36913fc7df Kent Gibson         2020-06-16  1733  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
