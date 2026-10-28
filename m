Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191918;
	b=MqqE5UoU47nCj7Bs56+Vwsn/6b/148t7auK0o2WKqgNMkqA4D4qAB6Iqf9ki4dTeZvhb
	 CICB3RO0B+hx/OhVW9QGQl88gqTYsmiyrceVjbg08s2xrE9FQjmatB0LYEovkUpoRg2yW
	 tJobPWKnlRzJdxzwOkT3LwWGsjNKICiqiig3N56dDoz+mYOGx1IdzHD6RhevgBLaP0IyQ
	 n9derSB6mHvIp6pDOz5v9toAewWnamdKJc1riGb04jrDW/QR06eSOsPDSouzuKMUoqJU0
	 FIRhqH5bEkagoMh8Sgumn5661aubS8pAP8hHelc0jMv9SwQqY8baIlBfD5zlW5GQd2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191918;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=O9lQTxHhrDDZBaYhoxDihJAEQpEwXxBwUYif7fMqA4Y=;
	b=oqnNNTO8UKT6wMIF9si8BuS5M3VRbb2qFyE0ZQixmo78LmM5rvtDnOFEaEhxjCj8f3lI
	 gFfuJW90rFyWrXynTCcIjpUwipQV80TeVzujHy2HZ5/xMDcc3z98M3G9FDa8CiyeoXP1a
	 mHplPxln6+ooAAqxabOvUnEz993xEfIAwcOYeCtEntE5YeCzJKgecgmIO+++aSSO1U0d1
	 hv90rnOaO7mYiP1DuBffO7V9txj0Lbl04ghvrvAigi+ZhRmA5ZVvGeMm1FwH1IlOFR7uL
	 woUHOqN5Mo6TVLstmi99Zif4tykwD53wIARQqBrwDJKG1D8LjWKifwKB4aLhORPEp8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLIW7Mf5;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3EC606A31F
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3EC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLIW7Mf5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793191917; x=1824727917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQkK7PFAdKklMS6gCoUL/ys4WtGBpYO+wvVN198lPt8=;
  b=mLIW7Mf5R7s6rr6IG0dfs9cPW1sAjWWep6kmdlxGDjPPAD3wccYlJRME
   25FFqUCpOOaYoax4HQuu6WjybMhRxn2CLAdkGRs4bCrdIE4AIXKOdePGm
   irhW2GBdbchkU6Aq7OyPTb6KHE4EQrKguoHm0y01gdAYE9zcgPJAmr+mv
   FfCwpHhwQUBmKnwaLBKtHVYfh/OzsYN2unfD5oPUyenvxWl72321mmDQ/
   nfui5yHm5MTpul8/XabX3ObbsyjZ7bRQ95RTiUaVarq3HXPG1lA/U9KXP
   0GWW219rSmikfpHTj3Jj/VeK+Wt9/vNhH1W3fDaoYf6mUyU5iNhPPufur
   Q==;
X-CSE-ConnectionGUID: 5AG4rDy6Sb2vHd1AUTS0yA==
X-CSE-MsgGUID: u496nfpRTXaidWmWtaQUzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2016628"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2016628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:51:57 -0700
X-CSE-ConnectionGUID: 9HYSjOfJRYm/Zs5b9kQbsQ==
X-CSE-MsgGUID: 2QZnF2oaSrWvL1iW1QqPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4874432"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 05:51:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM38C-000000004rt-33tE;
	Wed, 28 Oct 2026 12:51:52 +0000
Date: Wed, 28 Oct 2026 13:51:14 +0100
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [brgl:gpio/for-next 20/30]
 drivers/gpio/gpio-virtuser.c:1603:10: error: 'const struct config_item_type'
 has no member named 'ct_attrs_const'
Message-ID: <202610281320.OShGuP6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   5e826d71d4839d8471784d968274823f1f492eb5
commit: a67ab3994716e1bfe86b53330d1cf2f5bf6bfbad [20/30] gpio: virtuser: constify struct configfs_attribute
config: openrisc-randconfig-r2200-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281320.OShGuP6l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281320.OShGuP6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281320.OShGuP6l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-virtuser.c:1603:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1603 |         .ct_attrs_const = gpio_virtuser_lookup_entry_config_attrs,
         |          ^~~~~~~~~~~~~~
>> drivers/gpio/gpio-virtuser.c:1603:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1603 |         .ct_attrs_const = gpio_virtuser_lookup_entry_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1603:27: note: (near initialization for 'gpio_virtuser_lookup_entry_config_group_type.ct_group_ops')
   drivers/gpio/gpio-virtuser.c:1719:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1719 |         .ct_attrs_const = gpio_virtuser_device_config_attrs,
         |          ^~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1719:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1719 |         .ct_attrs_const = gpio_virtuser_device_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1719:27: note: (near initialization for 'gpio_virtuser_device_config_group_type.ct_group_ops')
   drivers/gpio/gpio-virtuser.c:1719:27: warning: initialized field overwritten [-Woverride-init]
   drivers/gpio/gpio-virtuser.c:1719:27: note: (near initialization for 'gpio_virtuser_device_config_group_type.ct_group_ops')


vim +1603 drivers/gpio/gpio-virtuser.c

  1599	
  1600	static const struct
  1601	config_item_type gpio_virtuser_lookup_entry_config_group_type = {
  1602		.ct_item_ops	= &gpio_virtuser_lookup_entry_config_item_ops,
> 1603		.ct_attrs_const	= gpio_virtuser_lookup_entry_config_attrs,
  1604		.ct_owner	= THIS_MODULE,
  1605	};
  1606	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
