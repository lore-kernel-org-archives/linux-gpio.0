Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192595;
	b=4wt9Bhz+UiS2RPPI/PsTuw2Gbgu/uDHqBbsJWxV61rDUqHBGLNLJLZW0mQswmcC3hWJ4
	 C19GaQTqNtuDYyaDV8GvA+FwKUUScZr04AMl2KEKJHjqdG2yHKeIvVFpFEwJNAB8DGVg2
	 1RhILsizL1onofJzdFdSDiGB+/tuzI6LiOcvCVtbiAAc+uF6O/OP/yH5vgqfxQtqCV8Xw
	 J6+7W5CvoAVDJoFspIdRh82tt3tnSn638i2GRc8uWId+nUxyos0BJdqXssA8hhYzDsb3h
	 hcZX7u6cBhewro6IoyaCGd/dVnBRqM1t72azflmPvBIEGY4svgcsJZ8T7X4rbJ8D6XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192595;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=zP2tx9IHmPSBaTBy3k+dKpHqKY7uExvKaB3UxdVfmSQ=;
	b=FUUvizgPjWQvZaUrE4LNR5Fy8o29BYzNFcKFQ0tmhaTAyCZ6YFXmovcq9njKZjRBCMZ/
	 T6h13rgyIGsfhpSHpLunb5ajyN0xb98oOiOlttSh3Jgq9+Z8xnV71p8vgJh6JKXWlPdre
	 K48pFqY2I8iBoX2sDZafB/253DQfzvKmMdfKgtS3ft1etaixMBzctcL31IlTUCm7kD05K
	 Ru55I+jmi0a8HweLmFA2g5aXDx1owWe7tXtCQzHKT8zKi6ed69T6E7L6/8uOMzN8CSy/f
	 E9tq82GvC94paOfKjUp9hurkYdXH6TmAQmM/GAI1RVYOQr1PDduiGVjqztUK0rxsm3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFZpszNo;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8368A606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 13:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8368A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFZpszNo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793192595; x=1824728595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1/K9EX3s8C/sydlAyVJlO+45b2lGql685E2Hh/XaZg=;
  b=nFZpszNoNLdbgDdd55YNFMXWdVWAPEZ1Xv9ckQbHbulxoEu1d/nZG9xA
   sEqnS2m461uILvkg0PU+AE6ntMtSWhbTdOLyafsqPEIG0cmcdFKlWOAct
   xk+cGPp9gHm6eJr++Aawa7hjkpveEfCRxgP6bv3fZkN+Nh3FryIP0D3gM
   uSMrKoxV2JLjrqJNOzwGoGZqfXLbtR7Wt7PPjP6FFDyPNRNGlcBNoQlDt
   C59nCOTcyxLfzFweJzO+PycYJj7WNrdbBtxrsAdTz+1DGy59GvlHephvC
   gK1iCyOrl1vchGKqajx4xAdc5hXKgGH3BAmMBx7X149UegF+vlHtCXYwu
   Q==;
X-CSE-ConnectionGUID: SIxEwPbVTpazDXJrZveakQ==
X-CSE-MsgGUID: FlrqxENlTxuad8rvPLmCgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1924687"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1924687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:03:07 -0700
X-CSE-ConnectionGUID: CjoLEJL8SmSwienXkx4ECw==
X-CSE-MsgGUID: sE1MR1DxQAaLieMIxzcv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4846544"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2026 06:03:00 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM3Iq-000000004sB-3vMe;
	Wed, 28 Oct 2026 13:02:52 +0000
Date: Wed, 28 Oct 2026 14:01:56 +0100
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [brgl:gpio/for-next 19/30]
 drivers/gpio/gpio-aggregator.c:1251:3: error: field designator
 'ct_attrs_const' does not refer to any field in type 'const struct
 config_item_type'
Message-ID: <202610281324.P2QXlPxl-lkp@intel.com>
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
config: riscv-randconfig-r2101-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281324.P2QXlPxl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281324.P2QXlPxl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281324.P2QXlPxl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-aggregator.c:1251:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1251 |         .ct_attrs_const = gpio_aggregator_line_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aggregator.c:1318:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1318 |         .ct_attrs_const = gpio_aggregator_device_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


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
