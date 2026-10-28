Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193178;
	b=QfJsdfLVhue1vqo1HyPqo+2bCaHfKi4ilV1nsiqHbRfftGsRTvqDcOJNUfFJT0lh7HLB
	 i1OW/cOr4/er4kRCTI6R1ulDZVNDcUBDStCJ5zJ25GOQXKtN+dmCffqLD7cvxKd2oFNqm
	 nr0lZfSieH58Z4RQWwrUvREdpbOqttRKWzyNh+WkbPDUR7YfWSQspOpsgkBd8feaDX0zs
	 70DRAY1CSpavhDdPod4iyqeQtH4k2qQp/QdC2cR76DVmwSAC87K+/K2yaKakmaAmw6jQT
	 J0mHVaw1LP7ZOSCzncX/RT6D56WsmcJtuIAqLvj64cwq2vfV75+vcDKmdolsw2lrPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=eUefPTbo5ShNdrNR6jqhsd83mgOc0UfvV5FTQi8XHu4=;
	b=CiIutA4XGM1NJAJg154KvJkShyn9pTE/4G+aU8rRO4BeJ6lzqZtEuJpehseJ5c7+PKHW
	 1rNKNc/irNtcCMhaj2bbKvPTXFSI/kcR8F5/R2NJGUcly8F3RFWlb13xzqzBQfe1jJkJ/
	 ap2taOdhXQ2XpkZNgy3xlvWYfiGzL2C/LlXOQQ58RpR6A2NAlmH66w5+ORiKIm2jObKxb
	 kstuO3tSL979DNWJM0tYrR7+AlC+O4b6o7aV8uihlIeg2hqKq+rX1+hPnE3zSSYxKRynU
	 wHrNe+TP4n/qEZ30AA30W185Nvq1CNtUb5JMzo9Mtc8LbBu/K5+hRT82NW97Z5i7gXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crfyiaLg;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26136606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 13:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26136606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crfyiaLg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793193177; x=1824729177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBMChI9mclm6R+VIrgllkzd3PyXlySBY8XPMLe7B4Ss=;
  b=crfyiaLgJmVKp9ba2Sf+sT2BNUDYAonjmeMXzYC1WLFErAq0QNQu8jA9
   InxmXgzWKJFaeayFvIoARssDurBemX3t/cCL8dvRLNgH2AEVBBSDuOD1l
   pi2C39ezTRZLmROyo6PR5ZMTT/9bnRULEdeD2UlrZGKn0nuxHwbyyCTM5
   vZJKVLGR/froG3k90XL4Om294utV3+Np8RWRciUJOA52QNMlmfAeiMZ3h
   1Jep6pK6nWeDrBUaH/txbULd34QMPQ3MLbGUkP9eQcWKco66E4PS4Klai
   lECryeV7/V+9U1oNUuupZghmJJuOgKWrWCCC9YJuyfcgVV5Xcs6lswV4a
   g==;
X-CSE-ConnectionGUID: 7D80+bhJRheUNFaLCG/lsQ==
X-CSE-MsgGUID: HglZeKdzRmeT/pYcrKITiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1915884"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1915884"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:12:56 -0700
X-CSE-ConnectionGUID: ud3rbwg5R4usJBTv+Gqyjg==
X-CSE-MsgGUID: DACoMpaZQoyAqzVRsb5FFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6680909"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 06:12:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM3SX-000000004sJ-0FRk;
	Wed, 28 Oct 2026 13:12:53 +0000
Date: Wed, 28 Oct 2026 14:12:37 +0100
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [brgl:gpio/for-next 20/30]
 drivers/gpio/gpio-virtuser.c:1603:3: error: field designator 'ct_attrs_const'
 does not refer to any field in type 'const struct config_item_type'
Message-ID: <202610281409.XHHiFcDP-lkp@intel.com>
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
config: arm-randconfig-2001-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281409.XHHiFcDP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281409.XHHiFcDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281409.XHHiFcDP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-virtuser.c:1603:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1603 |         .ct_attrs_const = gpio_virtuser_lookup_entry_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1719:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1719 |         .ct_attrs_const = gpio_virtuser_device_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


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
