Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97D399017
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239895; cv=none; b=EL5vS1AtFNZiFXSG2shPmxKqA0O7v1lBFqDf5p1lt6wusRcrjNGm8+5qd+cGQGt0ngqX3rl5uh4tEAIUT9rlMIzj6HnbZhrx9+SfMr+n+GLx368JawkxqqoobglXL+opKSQ4xFJjo0SiWjyjhKQvH2OQzxJkpTXVwpr+NZotS4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239895; c=relaxed/simple;
	bh=kH3wGQYHnKS2zHD/H1s4FtVkAtzljJ+T0SmuSM5tgK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOHkUW2D3TGcSajplX5MTB+ysjguKr1w747Xk2jCX8R6USGyoqTgn27rwJaE+E2EOKtWZf30cGaF+gfn+Plj/j3W2OAMO68dSk4+ptoThZ7yBsPv2z21dga4JXwz2zZP5t4+OgYxMODQ3D7yCAdCIBAF1i70e5LnoeRfRcHUY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODSz6BC9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODSz6BC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781239892; x=1812775892;
  h=date:from:to:cc:subject:message-id;
  bh=kH3wGQYHnKS2zHD/H1s4FtVkAtzljJ+T0SmuSM5tgK0=;
  b=ODSz6BC9Y8Dzql2ySf/BpTAbiNuFbNFhz3og8iKjCsQe1AsEGO7gDcC1
   bJ+UGUF5y8LUWASEANucb9C1Jrhu2J0pkMjv2Dyh2ezkYX1flGGC6U9VQ
   56F7BK2j0tKD2LoU0f6NpVdGTS6unit/pnjQpw07mfnWXvBgIEZxQpQDC
   VKiXi5ns7H5L9BN4nsVPCnY5sD26LOm7N+U2LEEQGeO5yi8ORs0jy8aW9
   7cmNh1ZjfgGRiZWoFpV08QDMY8JbR8vc7Ql13qJRssuVBiLn404TFb/6p
   1ygYxoedcCHM2G1QBgZhvf3F68UJVwbiUvGNPiN63uNP1OPrp3Eui2I2O
   w==;
X-CSE-ConnectionGUID: 8eqKh2H0QUO+RISWRj1QKg==
X-CSE-MsgGUID: rLRWSmW+SZ+cFbD7zLotBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107500559"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="107500559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:51:31 -0700
X-CSE-ConnectionGUID: hCwuH7XFRUiaHnYynnYGmw==
X-CSE-MsgGUID: Gg0vuvkxSIqmY7i7z5g8JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="240363016"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2026 21:51:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtrb-00000000OKr-28RA;
	Fri, 12 Jun 2026 04:51:27 +0000
Date: Fri, 12 Jun 2026 12:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 981aefd53b3cdafae0e45332a1023b80d67f52be
Message-ID: <202606121210.uIkpcdcn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 981aefd53b3cdafae0e45332a1023b80d67f52be  pinctrl: qcom: Register functions before enabling pinctrl

elapsed time: 918m

configs tested: 118
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                        nsim_700_defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260612    gcc-13.4.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260612    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260612    gcc-11.5.0
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260612    gcc-10.5.0
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260612    gcc-11.5.0
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260612    gcc-13.4.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-011-20260612    clang-22
i386                  randconfig-012-20260612    clang-22
i386                  randconfig-013-20260612    clang-22
i386                  randconfig-014-20260612    clang-22
i386                  randconfig-015-20260612    gcc-14
i386                  randconfig-016-20260612    gcc-14
i386                  randconfig-017-20260612    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch             randconfig-002-20260612    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-002-20260612    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260612    gcc-13.4.0
riscv                 randconfig-002-20260612    clang-23
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260612    clang-23
s390                  randconfig-002-20260612    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260612    gcc-11.5.0
sh                    randconfig-002-20260612    gcc-13.4.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260612    clang-22
x86_64      buildonly-randconfig-002-20260612    gcc-14
x86_64      buildonly-randconfig-003-20260612    clang-22
x86_64      buildonly-randconfig-004-20260612    clang-22
x86_64      buildonly-randconfig-005-20260612    clang-22
x86_64      buildonly-randconfig-006-20260612    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260612    gcc-14
x86_64                randconfig-012-20260612    clang-22
x86_64                randconfig-013-20260612    clang-22
x86_64                randconfig-014-20260612    gcc-14
x86_64                randconfig-015-20260612    gcc-14
x86_64                randconfig-016-20260612    gcc-14
x86_64                randconfig-071-20260612    gcc-14
x86_64                randconfig-072-20260612    gcc-12
x86_64                randconfig-073-20260612    clang-22
x86_64                randconfig-074-20260612    clang-22
x86_64                randconfig-075-20260612    clang-22
x86_64                randconfig-076-20260612    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
