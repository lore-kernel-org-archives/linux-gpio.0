Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F612367CF
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 02:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342982; cv=none; b=WliEhpyL1XYuF8Zj8OHGJWxwzAZjeAB0X6z01ej3kRQbnEJwMNW0UcKXqrYPuWVCLbjL9X5Qr9mPCtOmimGMejwGGcAqgRqQRcHW9SK1Bvt8B8EPTdJJ7HbaVB8JCwRgJgS4Bo8hhog5zRPp/tURJsod389niewTODqO++DWD84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342982; c=relaxed/simple;
	bh=D6YRMLqVcMWRrledZ1X1b+8z1ZsbNogBIhATXyRX0H0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZpxU08I/s07itQyv0EUYUR7wSxqyQHlokb8Um9cfEJpT8ibznejTUT5bVmxaVtruAb1sG3M7+v4Mb4d4KPOox16tin2n1vbQr4V52as7GVzvhvXhCN+DTaezVrrQDP0dl/sIQl7nhciXJwFffRr8Iuo2YtV0JjbESbs0UikmkmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHORTRh8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHORTRh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784342981; x=1815878981;
  h=date:from:to:cc:subject:message-id;
  bh=D6YRMLqVcMWRrledZ1X1b+8z1ZsbNogBIhATXyRX0H0=;
  b=VHORTRh8qDm86QvrC3hQkZxcy5tlhdWAc/3tjKUoom35vQ2TIYQUNeVK
   8hZWiHV/v5N7lfEnyeJlB+rffjKT9p2U9RQ5F5TFedfco3kGKAeAyxs70
   L54RcW0UQwWTg5GjaUibeSsEJ1dyqcyItGoMNwiZF0ZxtzK+MY100Dx83
   7XlpQLdEK5aWBFUFVmp1QL39wV1SdTYa7hctrFBnpjHbxTF/e+RTTugtk
   iJXrxt2GTIIPH376QfzCSokDgUZ3nw7bxy1X5x/t98hZuJMolqfcWvX0v
   ueQnb/P8avCDcRNIxiLM0DzoCXZvIKg9Y38L7+lLOXQZmA8Wk0gVj9I89
   Q==;
X-CSE-ConnectionGUID: S6hO2sckS1i2LRcFbHp8GQ==
X-CSE-MsgGUID: qs4CRIuvR72W5IEL3XKCFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85038129"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85038129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 19:49:41 -0700
X-CSE-ConnectionGUID: RYqjTjAwQH+fRKAGNfN13g==
X-CSE-MsgGUID: gFHbNIQZTEeCH8ojD4hoGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="256378187"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2026 19:49:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkv7K-00000000TP1-1zO3;
	Sat, 18 Jul 2026 02:49:32 +0000
Date: Sat, 18 Jul 2026 10:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 9dc325327babe7f159e84cbe9380a45342da0585
Message-ID: <202607181005.EwwG5qES-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 9dc325327babe7f159e84cbe9380a45342da0585  gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock

elapsed time: 1990m

configs tested: 17
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
alpha            defconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
arm        u8500_defconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
i386          allmodconfig    gcc-14
loongarch        defconfig    clang-24
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    gcc-11.5.0
parisc        allmodconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
parisc           defconfig    gcc-16.1.0
sh               defconfig    gcc-16.1.0
x86_64               kexec    clang-22
x86_64        rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
