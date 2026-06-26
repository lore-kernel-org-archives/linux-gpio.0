Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED634DCE0
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505017; cv=none; b=PV9fUq2b/0cteWqz3fnpH/2u520GiLcSuSR+dyj5IUT6yRtPcsUyFhxpxuD7K5x3TLCEhunu7MbQ5k8TeAu5rztVGcxPVY+1gN86P8ptHu06fT9JqtStfyXagVtnt/7knPTtOCgcIlZvJjWAKyPbNge30MZms9LACxsBQui6JqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505017; c=relaxed/simple;
	bh=QfGrZVSiThOJ/J2WR61RKD9Udq/paJBr8MsowsZ0CWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRroRO0tPlks3m1ul2lxq/lU5YiTvPHtGtL82Wey/XYMfXdMS/0AVQck3X+azLAX+g5gYTqMxBGAFsVlY+chVnuTECe78ALvdTeOI6fXi6jrYeUEYf3mWevQpIKX2btYM7If7m9C1uoj6Xgfwig/WI/vfn+rTbu//L+zXr2q8U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNbhUYg2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNbhUYg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782505015; x=1814041015;
  h=date:from:to:cc:subject:message-id;
  bh=QfGrZVSiThOJ/J2WR61RKD9Udq/paJBr8MsowsZ0CWU=;
  b=HNbhUYg2Qu/q2Bg4VBKQ41XPSdCxgcoum686Gq8xHPn8Sy0ugBpsWwWI
   mKtVJSSflOHG5NOdEvSg4fTuxeIbWGke9sQHxudo6KAIuzzwka7SpD+rz
   DpeIVIJxZpmsVL1tBD5/9OO+DC/k0Ijcuu3UAUJkw+HLbk6ZJ0p2yuxj9
   gHb0LbekoePmknqBk5IfSSBtndBBY5i4pzsjEHD0khQK06wzGJKyWd+zH
   Rs51wsQGXE93oq8Zv+g96i73Tl/iMeIaOTK02DG/DF+7r4kQmQK/mDQ0n
   aB75uuRrjt6PkrtTBmz6ThtbDwkdn6Z1BWk2hpoxN0CZVc0KG/UOAqr/7
   Q==;
X-CSE-ConnectionGUID: 30WquF11SuSLwY71X611qQ==
X-CSE-MsgGUID: ceeDwZKBSzWETOnT4E7K1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94790270"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="94790270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 13:16:55 -0700
X-CSE-ConnectionGUID: IIzqgK3BTtq2PLKzgbXTsg==
X-CSE-MsgGUID: oXmmBPkrS9mIdwRXqEmTQQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2026 13:16:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdCyo-000000005PR-15nU;
	Fri, 26 Jun 2026 20:16:50 +0000
Date: Sat, 27 Jun 2026 04:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tzuyi Chang <tychang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 "Yu-Chun Lin" <eleanor.lin@realtek.com>
Subject: [brgl:gpio/for-next 7/8] Warning:
 drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in
 'rtd1625_gpio_info'
Message-ID: <202606270433.gAWekfd3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Hi Tzuyi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   415c63896b76fd98883e190bc7518383cb01779c
commit: a57e27c43b0315ee86c6896510d69be5257e093e [7/8] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
config: sh-randconfig-002-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270433.gAWekfd3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270433.gAWekfd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'
>> Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
