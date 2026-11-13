Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611316;
	b=I5eJRVsEKZ8JxYLvRwXWJxXk2aWeTHXAiWulVsH+UXSUbAeQ97ZZiIlQfu7RrhoOA6FP
	 HfY9XZ22rd2rjsEk7BQaYm6DkQIH/1QKvR9otxKvrJBri/PsvOi6VQ8f7XtjKofWJtQb5
	 sgLfaHO00lJaTLGaC0lfr6hnyD4OtbhsnI+lGoUgu2wAZPgmivZWvSwdYpWG1S2YbmwQT
	 MuEbuhZ5zAC5ZT34W5bnCBJ3k3iuGIkmFzxIPMgDbK/H3XNVIP/agofDUusQlkjrTGric
	 p8tHvSBE/1eQ8/KnD40DGbAF1/OxwRh3cRmj0eZ4XjAqWNf8aQhe6mryoc+xl3iIlXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611316;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6h25k3jXL2vdBmbvvyg++DtCEvMyc5XjxlvtFxJURuQ=;
	b=0vGu3Bbr0Whpgb1Mt+A6iNB1ZG2pcV95F2jvTtR5TJUSIGnpOAce2Rzui7KZONexiuhO
	 drpQxKCsczOhFjgEXFRsmJElTP5irOeBypKlLWrKJWA/OY7fr4Yhq0EgHh16INhjfnSxT
	 IZ5/uC92KsUdB/ndU2t8gq5YFpRgUZ/m0ndEMXT4NSc7Brj8z9pki0e2WGW9RMHuRj9fH
	 UwRb+sHXiCjjdvBZlQec0D3jA73NiHmA1FWUSTiahFx7Mt+gaBuREhVMWiNDProB63vIj
	 +41xzvZpk/KcwX/TBq+Ma4FILWxcdJfmw+N0LpQIeAT3Ht0ffuYUAx3KhU4QwHzUDmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I8IsGIv+;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5887606A32E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 23:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5887606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I8IsGIv+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794611315; x=1826147315;
  h=date:from:to:cc:subject:message-id;
  bh=5bEr7mYjmvkZYX+9m8F9ENVrPseo2Q1AiQ0hKUWOF0Q=;
  b=I8IsGIv+YulDJr+zV3etaaCOyw8QJNvsSylymiAgUpENvnJVQMQ7eybS
   qC41E/Nabz9pAwjQHjrBIgoo5Psp37wf68QN+xlBHE5viPrA5WzhEOowD
   BpNHvqNLjvjv0R9mgfszFWCNNcZiP6jnTJEmYWLvMrcRgMzPXxXvEoUTa
   M2gLMlz66WXvOwJ1DhsdIruTyJWVrUcn0HjGu0t6qA0ig7NAMf2JOXkg7
   gpP9nr6wE/W+oogeS8xbASIwmSEQhzkhfcRj4ikD2+55cEutDDGP8Ww6h
   /e6a2X6JH+ZNBz/ah/OkgLisTN78fKCsUBt1M6daxf1JkO1tnFN8LxGc2
   Q==;
X-CSE-ConnectionGUID: cZe/+k0TQ/qWPjU62vHPYw==
X-CSE-MsgGUID: zZ3jyImlQpq0CZ2cvLm6qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3442826"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3442826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:08:35 -0800
X-CSE-ConnectionGUID: I9gtk4tHSumqDsd9VFchhw==
X-CSE-MsgGUID: r9HdOxunQaugAnbdCkmJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8883929"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2026 15:08:33 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS0Nh-000000014Ln-41oe;
	Fri, 13 Nov 2026 23:08:29 +0000
Date: Sat, 14 Nov 2026 07:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq:for-current] BUILD SUCCESS
 b149b12f6a52997eded725ae5deae24620dbbbff
Message-ID: <20261114070804.FSYkeRkH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: b149b12f6a52997eded725ae5deae24620dbbbff  power: sequencing: pcie-m2: fix serdev controller reference leak

elapsed time: 973m

configs tested: 266
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1000-20261114    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arc                   randconfig-1001-20261114    clang-24
arc                         vdk_hs38_defconfig    gcc-16.2.0
arm                               alldefconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                          assabet_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             mps2_defconfig    clang-24
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1000-20261114    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1001-20261114    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1002-20261114    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                   randconfig-1003-20261114    clang-24
arm                            sama7_defconfig    gcc-16.2.0
arm                            stm32_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261113    gcc-15.3.0
arm64                 randconfig-1000-20261114    gcc-16.2.0
arm64                 randconfig-1001-20261113    gcc-15.3.0
arm64                 randconfig-1001-20261114    gcc-16.2.0
arm64                 randconfig-1002-20261113    gcc-15.3.0
arm64                 randconfig-1002-20261114    gcc-16.2.0
arm64                 randconfig-1003-20261113    gcc-15.3.0
arm64                 randconfig-1003-20261114    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261113    gcc-15.3.0
csky                  randconfig-1000-20261114    gcc-16.2.0
csky                  randconfig-1001-20261113    gcc-15.3.0
csky                  randconfig-1001-20261114    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1000-20261114    clang-24
hexagon               randconfig-1001-20261113    clang-24
hexagon               randconfig-1001-20261114    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261113    clang-22
i386                  randconfig-1001-20261113    clang-22
i386                  randconfig-1002-20261113    clang-22
i386                  randconfig-1003-20261113    clang-22
i386                  randconfig-1004-20261113    clang-22
i386                  randconfig-1005-20261113    clang-22
i386                  randconfig-1006-20261113    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1007-20261114    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1008-20261114    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1009-20261114    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1010-20261114    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1011-20261114    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1012-20261114    clang-22
i386                  randconfig-1013-20261113    clang-22
i386                  randconfig-1013-20261114    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1000-20261114    clang-24
loongarch             randconfig-1001-20261113    clang-24
loongarch             randconfig-1001-20261114    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    clang-24
m68k                          amcore_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    clang-24
m68k                        m5475evb_defconfig    gcc-16.2.0
m68k                          nettel_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                         bcm63xx_defconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                       malta_kvm_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                         qi_lb60_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1000-20261114    clang-24
nios2                 randconfig-1001-20261113    clang-24
nios2                 randconfig-1001-20261114    clang-24
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                   or1klitex_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261113    gcc-13.5.0
parisc                randconfig-1000-20261114    gcc-8.5.0
parisc                randconfig-1001-20261113    gcc-13.5.0
parisc                randconfig-1001-20261114    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    clang-24
powerpc                        eiger_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    clang-24
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc                       pcm030_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    clang-24
powerpc               randconfig-1000-20261113    gcc-13.5.0
powerpc               randconfig-1000-20261114    gcc-8.5.0
powerpc               randconfig-1001-20261113    gcc-13.5.0
powerpc               randconfig-1001-20261114    gcc-8.5.0
powerpc                   storcenter_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc                       tqm8xx_defconfig    gcc-16.2.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261113    gcc-13.5.0
powerpc64             randconfig-1000-20261114    gcc-8.5.0
powerpc64             randconfig-1001-20261113    gcc-13.5.0
powerpc64             randconfig-1001-20261114    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1000-20261114    gcc-15.3.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261114    gcc-15.3.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1000-20261114    gcc-15.3.0
s390                  randconfig-1001-20261113    gcc-12.5.0
s390                  randconfig-1001-20261114    gcc-15.3.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    clang-24
sh                      magicpanelr2_defconfig    clang-24
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1000-20261114    gcc-15.3.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                    randconfig-1001-20261114    gcc-15.3.0
sh                    rts7751r2dplus_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1000-20261114    gcc-12.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261114    gcc-12.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1000-20261114    gcc-12.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261114    gcc-12.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1000-20261114    gcc-12.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                    randconfig-1001-20261114    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1000-20261114    gcc-14
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1001-20261114    gcc-14
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1002-20261114    gcc-14
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1003-20261114    gcc-14
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1004-20261114    gcc-14
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1005-20261114    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1012-20261114    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1013-20261114    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1014-20261114    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1015-20261114    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1016-20261114    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                randconfig-1017-20261114    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                           iss_defconfig    clang-24
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1000-20261114    gcc-12.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261114    gcc-12.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
