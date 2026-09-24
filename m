Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46D4AA56F
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275071; cv=none; b=KT/8wP08q2/xdFBac/J7pibiJTwvjsimEUeCNHpeCk1aM2x75wi4fVWTcSte360ibD6N+A3KizE4LeUT1GtZYFR9simN2CYxN+DMHb1kcF9ncmj7I5MOUZqKEYe9rgQ76H1rjUG2QW1CJ3AN3CMCETyD7arsWQGG1dc3KJL1+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275071; c=relaxed/simple;
	bh=EnZT5IsgzUqFfRTZ5UN6cFd7dSI0pWXz7VBYlppybFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IUfCc9z3yLgsvUO2O/X0RV/zteCwHmn9eO3Rq+Jkz6i7ZBrraivy72+ON/GTjLi5JKyQNIUzh10TAqXx4viJiMvqHJELKk54Blfu9hCm3UwIj7JL/e0ZklgMCse8m6egUCl4abe4d81Jo6fXMOfMRy5JFiRK9h2KPXRrND/H4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nme/D+w4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nme/D+w4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790275069; x=1821811069;
  h=date:from:to:cc:subject:message-id;
  bh=EnZT5IsgzUqFfRTZ5UN6cFd7dSI0pWXz7VBYlppybFo=;
  b=nme/D+w4YAT8rMPfOVPfRHvPtx4sITHtzsis/KWP0UHReQzJ/UIYvJN/
   PAKqX4dB7knr0J7y1FB//IDYMzUampaXrof/Cq/Pxd3yDVJkAPQE86hWa
   fbO05OiaTUYq/TrJjYuK6y4AlJDbxTCNEFx8u5AIkesMHyZg7uwS/QFDm
   Ix+XmgdD+xtmkike8SdxzbFfW4UgW9BvmUq1C2T2/aNVb/TACNgseYc4I
   ahsjBF9QScPN5ZNMTxfPHrEX4v6RLVCxa5OH/28+YlJVBvZPKd7fUaTgP
   +GKQSJAjrzzlK60fRCymGUAmeDJ3hzL+iNYvukFVZJjBnIPInESPwpDvK
   Q==;
X-CSE-ConnectionGUID: C+PVSZwPShCPyB6CWIJomg==
X-CSE-MsgGUID: kO2zN/2kTRCtPyZBnwoVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93557483"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93557483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:37:48 -0700
X-CSE-ConnectionGUID: Tt0ZJmq+TNqirzJT7bJnCQ==
X-CSE-MsgGUID: UWS3sIMORcGGuXn2n1bjqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="274205613"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 11:37:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9oKG-00000000JOk-2MAv;
	Thu, 24 Sep 2026 18:37:44 +0000
Date: Fri, 25 Sep 2026 02:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq:for-next] BUILD SUCCESS
 09baa2f4caab013160eed975db47235e6c930af4
Message-ID: <202609250255.SB5xljCZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: 09baa2f4caab013160eed975db47235e6c930af4  Merge tag 'pwrseq-is-controllable-for-v7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into pwrseq/for-next

elapsed time: 4407m

configs tested: 285
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1304-20260924    gcc-16.1.0 sparse
alpha                randconfig-r2107-20260924    gcc-16.1.0 cocci
alpha                randconfig-r2201-20260923    gcc-8.5.0  smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1001-20260924    clang-24
arc                  randconfig-r2102-20260924    gcc-12.5.0 cocci
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           ep93xx_defconfig    clang-24
arm                         multi_v7_defconfig    clang-24
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                  randconfig-r1300-20260923    gcc-8.5.0  sparse
arm                  randconfig-r1305-20260924    gcc-16.1.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-16.1.0 sparse
arm64                randconfig-r1303-20260923    gcc-8.5.0  sparse
arm64                randconfig-r1307-20260924    gcc-11.5.0 sparse
arm64                randconfig-r2106-20260924    gcc-16.1.0 cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1300-20260924    gcc-16.1.0 sparse
csky                 randconfig-r1302-20260923    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
hexagon              randconfig-r1301-20260924    gcc-16.1.0 sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1005-20260924    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2100-20260924    gcc-14     cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2101-20260924    gcc-14     cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2102-20260924    gcc-14     cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2103-20260924    gcc-14     cocci
i386                  randconfig-2200-20260923    gcc-12     smatch
i386                  randconfig-2200-20260924    clang-22   smatch
i386                 randconfig-r2100-20260923    gcc-14     cocci
i386                 randconfig-r2202-20260924    gcc-14     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260924    gcc-12.5.0 cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r1309-20260924    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                randconfig-r1303-20260924    gcc-16.1.0 sparse
nios2                randconfig-r1305-20260923    gcc-8.5.0  sparse
nios2                randconfig-r1306-20260924    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            alldefconfig    clang-24
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc               randconfig-r1306-20260924    gcc-14     sparse
parisc               randconfig-r2104-20260924    gcc-16.1.0 cocci
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       mgcoge_defconfig    gcc-16.1.0
powerpc                      ppa8548_defconfig    clang-24
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc              randconfig-r1304-20260923    gcc-8.5.0  sparse
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64            randconfig-r1309-20260924    gcc-14     sparse
powerpc64            randconfig-r2101-20260924    gcc-12.5.0 cocci
powerpc64            randconfig-r2103-20260923    gcc-14     cocci
powerpc64            randconfig-r2201-20260924    gcc-10.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2001-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260924    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2000-20260924    clang-24
s390                  randconfig-2001-20260923    gcc-9.5.0
s390                  randconfig-2001-20260924    clang-24
s390                 randconfig-r1301-20260923    gcc-8.5.0  sparse
s390                 randconfig-r1308-20260924    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                      magicpanelr2_defconfig    clang-24
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2000-20260924    clang-24
sh                    randconfig-2001-20260923    gcc-9.5.0
sh                    randconfig-2001-20260924    clang-24
sh                   randconfig-r2101-20260923    gcc-14     cocci
sh                    rts7751r2dplus_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2000-20260924    gcc-13.4.0
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260924    gcc-13.4.0
sparc                randconfig-r1308-20260924    gcc-14     sparse
sparc                randconfig-r2105-20260924    gcc-16.1.0 cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2000-20260924    gcc-13.4.0
sparc64               randconfig-2001-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260924    gcc-13.4.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1001-20260924    clang-17
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2000-20260924    gcc-13.4.0
um                    randconfig-2001-20260923    gcc-14.3.0
um                    randconfig-2001-20260924    gcc-13.4.0
um                   randconfig-r1307-20260924    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260923    gcc-14
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260923    gcc-14
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260923    gcc-14
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260923    gcc-14
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260923    gcc-14
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260923    gcc-14
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1012-20260923    gcc-14
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260923    gcc-14
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260923    gcc-14
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260923    gcc-14
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1016-20260923    gcc-14
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1017-20260923    gcc-14
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2100-20260924    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2101-20260924    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2102-20260924    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2103-20260924    clang-22   cocci
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64               randconfig-r2102-20260923    gcc-14     cocci
x86_64               randconfig-r2103-20260924    gcc-12.5.0 cocci
x86_64               randconfig-r2200-20260924    clang-22   smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2000-20260924    gcc-13.4.0
xtensa                randconfig-2001-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260924    gcc-13.4.0
xtensa               randconfig-r2202-20260923    gcc-10.5.0 smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
