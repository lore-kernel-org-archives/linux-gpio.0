Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187593;
	b=z2T8El20vTwSzrtPHSsRmOhp1uEN6l1MR1GaeroYyrofzYyVqYdBplUKUu9r5fSI2A25
	 OKPatdethdIJos2EESk5WPBhw1tCHGo5Qb7CaqlQMKD8U5gG1MKpceePBUHbIIjY7tnkM
	 +GjRWzsl4oB08ANUKnYw7U97ZsloPCBz8kGEM8JhrsTEBOfSTTR2VL3YEfS9RlwJqahIc
	 At1oAI2onB5sG4M9ytOxwA5X7roWMSpHlAgkVPFKVtXCqbdGwH8tqtsLovoNlP3xJ9UC9
	 8PMIuCcPVjIGYZL8jztOLLqPLk/5R4J0DPw7xmKIujHeA4t2NIPF5St+gXROLIEljyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=0FODrjNxzB5MvPvQ84udigeiOH/4245t9NIBABFazGQ=;
	b=KZILc1typXO8cbUQVFrKw2ZYPDAzH6FiiWhLcoR9q+EOtLgcYr0aUpnMcynOW9NQ6eY5
	 YW/a2a5vrE1WPuS0VPzjXs7IliED23Q/lbmimMgTbcb2vZI2FhDtdOSP994AB7xjUqtEZ
	 SMtaTvwoc2yOMgahE5hMHXqZLzUUfoaunMPvuVLnMgmQnKkgltDNfxPHynRPtVkieZZtk
	 e0YRaI7TN+stVYCCDOyrJ5YdiF/x3i1TTHq3yeB6wm8EfgKgWNuWj8vLTWTPfjSPGW01c
	 8t3wh0KexkmwGmqTqZxYav1C60rCPm0xiU3q9j3d5Mj9fWa/TOUIBq3yyyJwopIO1tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhVJRJKu;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A4606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 11:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhVJRJKu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793187593; x=1824723593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBW3PVgVFFDTxgfjHNZTcuotQZPONMB0aCC8Ww0DpZY=;
  b=EhVJRJKu3ACZUfoHMUsx5Q93fFOJz6+hgWR1Tq1JuPfEg2nwj8PoaFkt
   0AdaENmKq18hKAyJXZDWEaYU7RByLUDEPgT1fy+79sCNYWAWivgfB2iE9
   HWxVL993of2B8wch+FmcEW+H19FdYvcC2McHak9s4P/acBjG+iUwt6i2y
   xeh66gX648zeah3GLJyofXqXbQXH741JTv088Fu/vTRveTKhkxNg16vDj
   SDaDfkFpagSlV6iQSDyCYv1ehBPupTgX30iC2ZVR4khPqMsIn1gcRaNVH
   A/DsfldEZDE/b3+4qX/NkbmYA7VDUleVURCAphXGTqLeg52cRdodBX3tO
   w==;
X-CSE-ConnectionGUID: j9wxG6vLSsSRVrww10pUFw==
X-CSE-MsgGUID: lUWoDGInT1mPmoGoeKHqPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1895045"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1895045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:39:52 -0700
X-CSE-ConnectionGUID: 8AGDxEgASSiXb6Rss4TxoA==
X-CSE-MsgGUID: y95OQI4AR42cZzCY6WLC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5187312"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2026 04:39:51 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM20R-000000004qx-3DFH;
	Wed, 28 Oct 2026 11:39:47 +0000
Date: Wed, 28 Oct 2026 12:39:24 +0100
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [brgl:gpio/for-next 19/30]
 drivers/gpio/gpio-aggregator.c:1251:10: error: 'const struct
 config_item_type' has no member named 'ct_attrs_const'
Message-ID: <202610281215.PpynnBO9-lkp@intel.com>
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
commit: 59abcfeb59426e7575e80be53b7024a151def2b2 [19/30] gpio: aggregator: constify struct configfs_attribute
config: openrisc-randconfig-r2200-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281215.PpynnBO9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281215.PpynnBO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281215.PpynnBO9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-aggregator.c:1251:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1251 |         .ct_attrs_const = gpio_aggregator_line_attrs,
         |          ^~~~~~~~~~~~~~
>> drivers/gpio/gpio-aggregator.c:1251:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1251 |         .ct_attrs_const = gpio_aggregator_line_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aggregator.c:1251:27: note: (near initialization for 'gpio_aggregator_line_type.ct_group_ops')
   drivers/gpio/gpio-aggregator.c:1318:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1318 |         .ct_attrs_const = gpio_aggregator_device_attrs,
         |          ^~~~~~~~~~~~~~
   drivers/gpio/gpio-aggregator.c:1318:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1318 |         .ct_attrs_const = gpio_aggregator_device_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aggregator.c:1318:27: note: (near initialization for 'gpio_aggregator_device_type.ct_group_ops')
   drivers/gpio/gpio-aggregator.c:1318:27: warning: initialized field overwritten [-Woverride-init]
   drivers/gpio/gpio-aggregator.c:1318:27: note: (near initialization for 'gpio_aggregator_device_type.ct_group_ops')


vim +1251 drivers/gpio/gpio-aggregator.c

  1248	
  1249	static const struct config_item_type gpio_aggregator_line_type = {
  1250		.ct_item_ops	= &gpio_aggregator_line_item_ops,
> 1251		.ct_attrs_const	= gpio_aggregator_line_attrs,
  1252		.ct_owner	= THIS_MODULE,
  1253	};
  1254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
