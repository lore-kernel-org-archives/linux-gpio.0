Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374EC547059
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 05:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790747932; cv=none; b=EjvGJi+YDKqIPf21RtWqNRbNILOBiKOM7YSlpf+13m9QJ0e8dD0KXNDtyS8n/wZQNXOkWOp0ZzT6hzLgY47AZ8pl4U29rEiJ4hD2Aub6ToPDe6xepjOpX5XOH3Y0l96iMSSto1wBADQsqQ9Icv6Vz7YojpfvcBQy/6Je9BEnSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790747932; c=relaxed/simple;
	bh=BfRZjj7LgeJvL96usU5objnoWWumkfWF3aoBImCphto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cfcCpZCJSPoO6cHHCc6xKDoo9TIjo0ZSQfcqPP6Qq7/1dUqYc6gtBZqd7SvJYW2RncwW7mS8/+bmEfhHnN4gho43VW4lcEPMIph8nA6QQDW93bYVN0eDEX4w5U+vFxivNE1slYxGqqZ8uRxvbOVIy1DQzOAs6+fLNQuJp0GWSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLTGrIFp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLTGrIFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790747930; x=1822283930;
  h=date:from:to:cc:subject:message-id;
  bh=BfRZjj7LgeJvL96usU5objnoWWumkfWF3aoBImCphto=;
  b=eLTGrIFpZfvXCA5Rf6i03duFConcpGLnIGAdj1cTqzzVGPuGVPNoPUYK
   tOKyFVl2zzQPlJRT2TPtrbHX/6y789FtE6kzX/M8bVoo3Fk4N4oe7p5hS
   N09tk2EDVnOTSYMfj8KjVAwrGg3zl5pHQggZSnDatewkh2ZYi3anuWbMU
   sf1zSSNXq29yy/uqFfhX9f8aEXOucx9MC7I3aPVafHM7k52d85SAr3T0Z
   yHvJMgMbIeuSfhB63yOicnSAnju4m7wyDaG2KRv1vMUY6hDE6iit7iyxp
   k5HcUYpR1AlCoCLlNhda+xU7wwtSochtz6/4hc+WpK4v7Ts7Uipbtd8u3
   Q==;
X-CSE-ConnectionGUID: C81MCI/STGiS6hhv4VK6yA==
X-CSE-MsgGUID: RdQYWh0PRPGSpjIYeqZF3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90376976"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90376976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:58:49 -0700
X-CSE-ConnectionGUID: dK6EkuHXRjy1OJeI8oA89A==
X-CSE-MsgGUID: hF8nbHrkSnC95soc7glqrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273680899"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Sep 2026 22:58:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBnL3-00000000QC8-37zD;
	Wed, 30 Sep 2026 05:58:45 +0000
Date: Wed, 30 Sep 2026 13:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 c4e74a7058b573617f142e07b4b5bc9eee04f4c8
Message-ID: <202609301353.rAnr8gQt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c4e74a7058b573617f142e07b4b5bc9eee04f4c8  gpio: pxa: stop reading gpio_chip::base in direction callbacks

elapsed time: 1673m

configs tested: 324
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2307-20260929    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                         nsim_700_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260930    gcc-11.5.0
arc                   randconfig-1001-20260930    gcc-11.5.0
arc                  randconfig-r2301-20260929    clang-21   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g5_defconfig    gcc-16.1.0
arm                          at91_dt_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                       footbridge_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260930    gcc-11.5.0
arm                   randconfig-1001-20260930    gcc-11.5.0
arm                   randconfig-1002-20260930    gcc-11.5.0
arm                   randconfig-1003-20260930    gcc-11.5.0
arm                  randconfig-r2202-20260929    clang-17   smatch
arm                            sama5_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260929    clang-24
arm64                 randconfig-1000-20260930    gcc-16.1.0
arm64                 randconfig-1001-20260929    clang-24
arm64                 randconfig-1001-20260930    gcc-16.1.0
arm64                 randconfig-1002-20260929    clang-24
arm64                 randconfig-1002-20260930    gcc-16.1.0
arm64                 randconfig-1003-20260929    clang-24
arm64                 randconfig-1003-20260930    gcc-16.1.0
arm64                randconfig-r2305-20260929    clang-21   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1000-20260930    gcc-16.1.0
csky                  randconfig-1001-20260929    clang-24
csky                  randconfig-1001-20260930    gcc-16.1.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260929    gcc-8.5.0
hexagon               randconfig-1000-20260930    clang-24
hexagon               randconfig-1001-20260929    gcc-8.5.0
hexagon               randconfig-1001-20260930    clang-24
hexagon              randconfig-r2106-20260929    clang-24   cocci
hexagon              randconfig-r2201-20260929    clang-19   smatch
i386                              alldefconfig    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260929    clang-22
i386        buildonly-randconfig-1000-20260930    gcc-14
i386        buildonly-randconfig-1001-20260929    clang-22
i386        buildonly-randconfig-1001-20260930    gcc-14
i386        buildonly-randconfig-1002-20260929    clang-22
i386        buildonly-randconfig-1002-20260930    gcc-14
i386        buildonly-randconfig-1003-20260929    clang-22
i386        buildonly-randconfig-1003-20260930    gcc-14
i386        buildonly-randconfig-1004-20260929    clang-22
i386        buildonly-randconfig-1004-20260930    gcc-14
i386        buildonly-randconfig-1005-20260929    clang-22
i386        buildonly-randconfig-1005-20260930    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260929    gcc-13
i386                  randconfig-1000-20260930    gcc-14
i386                  randconfig-1001-20260929    gcc-13
i386                  randconfig-1001-20260930    gcc-14
i386                  randconfig-1002-20260929    gcc-13
i386                  randconfig-1002-20260930    gcc-14
i386                  randconfig-1003-20260929    gcc-13
i386                  randconfig-1003-20260930    gcc-14
i386                  randconfig-1004-20260929    gcc-13
i386                  randconfig-1004-20260930    gcc-14
i386                  randconfig-1005-20260929    gcc-13
i386                  randconfig-1005-20260930    gcc-14
i386                  randconfig-1006-20260929    gcc-13
i386                  randconfig-1006-20260930    gcc-14
i386                  randconfig-1007-20260929    gcc-14
i386                  randconfig-1007-20260930    clang-22
i386                  randconfig-1008-20260929    gcc-14
i386                  randconfig-1008-20260930    clang-22
i386                  randconfig-1009-20260929    gcc-14
i386                  randconfig-1009-20260930    clang-22
i386                  randconfig-1010-20260929    gcc-14
i386                  randconfig-1010-20260930    clang-22
i386                  randconfig-1011-20260929    gcc-14
i386                  randconfig-1011-20260930    clang-22
i386                  randconfig-1012-20260929    gcc-14
i386                  randconfig-1012-20260930    clang-22
i386                  randconfig-1013-20260929    gcc-14
i386                  randconfig-1013-20260930    clang-22
i386                  randconfig-2100-20260929    clang-22   cocci
i386                  randconfig-2101-20260929    clang-22   cocci
i386                  randconfig-2102-20260929    clang-22   cocci
i386                  randconfig-2103-20260929    clang-22   cocci
i386                  randconfig-2200-20260929    gcc-14     smatch
i386                 randconfig-r2102-20260929    gcc-16.1.0 cocci
i386                 randconfig-r2306-20260929    gcc-14.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260929    gcc-8.5.0
loongarch             randconfig-1000-20260930    clang-24
loongarch             randconfig-1001-20260929    gcc-8.5.0
loongarch             randconfig-1001-20260930    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    gcc-16.1.0
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    gcc-16.1.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                          cobalt_defconfig    gcc-16.1.0
mips                             gpr_defconfig    gcc-16.1.0
mips                      loongson2k_defconfig    gcc-16.1.0
mips                       maltasmvp_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                           rm200_defconfig    gcc-16.1.0
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260929    gcc-8.5.0
nios2                 randconfig-1000-20260930    clang-24
nios2                 randconfig-1001-20260929    gcc-8.5.0
nios2                 randconfig-1001-20260930    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20260929    gcc-16.1.0 cocci
openrisc             randconfig-r2104-20260929    clang-24   cocci
openrisc             randconfig-r2303-20260929    clang-21   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1000-20260930    gcc-8.5.0
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc                randconfig-1001-20260930    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    gcc-16.1.0
powerpc                         fsp2_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                      ksi8560_defconfig    gcc-16.1.0
powerpc                      mpc512x_defconfig    gcc-16.1.0
powerpc                       ppc64e_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1000-20260930    gcc-8.5.0
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260930    gcc-8.5.0
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1000-20260930    gcc-8.5.0
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260930    gcc-8.5.0
powerpc64            randconfig-r2100-20260929    gcc-16.1.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260929    clang-24
riscv                 randconfig-1000-20260930    gcc-16.1.0
riscv                 randconfig-1001-20260929    clang-24
riscv                 randconfig-1001-20260930    gcc-16.1.0
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260929    gcc-9.5.0
riscv                randconfig-r2304-20260929    clang-21   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260929    clang-24
s390                  randconfig-1000-20260930    gcc-16.1.0
s390                  randconfig-1001-20260929    clang-24
s390                  randconfig-1001-20260930    gcc-16.1.0
s390                  randconfig-2000-20260929    clang-24
s390                  randconfig-2000-20260929    gcc-11.5.0
s390                  randconfig-2001-20260929    gcc-11.5.0
s390                  randconfig-2001-20260929    gcc-8.5.0
s390                 randconfig-r2101-20260929    gcc-16.1.0 cocci
s390                 randconfig-r2105-20260929    clang-24   cocci
s390                 randconfig-r2309-20260929    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                             hp6xx_defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260929    clang-24
sh                    randconfig-1000-20260930    gcc-16.1.0
sh                    randconfig-1001-20260929    clang-24
sh                    randconfig-1001-20260930    gcc-16.1.0
sh                    randconfig-2000-20260929    gcc-11.5.0
sh                    randconfig-2000-20260929    gcc-14.3.0
sh                    randconfig-2001-20260929    gcc-11.5.0
sh                    randconfig-2001-20260929    gcc-16.1.0
sh                            se7619_defconfig    gcc-16.1.0
sh                            se7705_defconfig    gcc-16.1.0
sh                              sh03_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260929    gcc-14
sparc                 randconfig-1000-20260930    clang-22
sparc                 randconfig-1001-20260929    gcc-14
sparc                 randconfig-1001-20260930    clang-22
sparc                 randconfig-2000-20260929    gcc-12.5.0
sparc                 randconfig-2000-20260929    gcc-14.3.0
sparc                 randconfig-2001-20260929    gcc-12.5.0
sparc                randconfig-r2200-20260929    gcc-8.5.0  smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260929    gcc-14
sparc64               randconfig-1000-20260930    clang-22
sparc64               randconfig-1001-20260929    gcc-14
sparc64               randconfig-1001-20260930    clang-22
sparc64               randconfig-2000-20260929    gcc-12.5.0
sparc64               randconfig-2000-20260929    gcc-8.5.0
sparc64               randconfig-2001-20260929    clang-24
sparc64               randconfig-2001-20260929    gcc-12.5.0
um                                alldefconfig    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260929    gcc-14
um                    randconfig-1000-20260930    clang-22
um                    randconfig-1001-20260929    gcc-14
um                    randconfig-1001-20260930    clang-22
um                    randconfig-2000-20260929    clang-17
um                    randconfig-2000-20260929    gcc-12.5.0
um                    randconfig-2001-20260929    gcc-12.5.0
um                    randconfig-2001-20260929    gcc-14
um                   randconfig-r2107-20260929    clang-24   cocci
um                   randconfig-r2302-20260929    clang-21   sparse
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.1.0
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260929    clang-22
x86_64      buildonly-randconfig-1000-20260930    clang-22
x86_64      buildonly-randconfig-1001-20260929    clang-22
x86_64      buildonly-randconfig-1001-20260930    clang-22
x86_64      buildonly-randconfig-1002-20260929    clang-22
x86_64      buildonly-randconfig-1002-20260930    clang-22
x86_64      buildonly-randconfig-1003-20260929    clang-22
x86_64      buildonly-randconfig-1003-20260930    clang-22
x86_64      buildonly-randconfig-1004-20260929    clang-22
x86_64      buildonly-randconfig-1004-20260930    clang-22
x86_64      buildonly-randconfig-1005-20260929    clang-22
x86_64      buildonly-randconfig-1005-20260930    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260929    clang-22
x86_64                randconfig-1000-20260930    gcc-14
x86_64                randconfig-1001-20260929    clang-22
x86_64                randconfig-1001-20260930    gcc-14
x86_64                randconfig-1002-20260929    clang-22
x86_64                randconfig-1002-20260930    gcc-14
x86_64                randconfig-1003-20260929    clang-22
x86_64                randconfig-1003-20260930    gcc-14
x86_64                randconfig-1004-20260929    clang-22
x86_64                randconfig-1004-20260930    gcc-14
x86_64                randconfig-1005-20260929    clang-22
x86_64                randconfig-1005-20260930    gcc-14
x86_64                randconfig-1006-20260929    gcc-13
x86_64                randconfig-1006-20260930    gcc-14
x86_64                randconfig-1007-20260929    gcc-13
x86_64                randconfig-1007-20260930    gcc-14
x86_64                randconfig-1008-20260929    gcc-13
x86_64                randconfig-1008-20260930    gcc-14
x86_64                randconfig-1009-20260929    gcc-13
x86_64                randconfig-1009-20260930    gcc-14
x86_64                randconfig-1010-20260929    gcc-13
x86_64                randconfig-1010-20260930    gcc-14
x86_64                randconfig-1011-20260929    gcc-13
x86_64                randconfig-1011-20260930    gcc-14
x86_64                randconfig-1012-20260930    clang-22
x86_64                randconfig-1013-20260930    clang-22
x86_64                randconfig-1014-20260930    clang-22
x86_64                randconfig-1015-20260930    clang-22
x86_64                randconfig-1016-20260930    clang-22
x86_64                randconfig-1017-20260930    clang-22
x86_64                randconfig-2100-20260929    clang-22   cocci
x86_64                randconfig-2101-20260929    clang-22   cocci
x86_64                randconfig-2102-20260929    clang-22   cocci
x86_64                randconfig-2103-20260929    clang-22   cocci
x86_64                randconfig-2200-20260929    clang-22   smatch
x86_64               randconfig-r2300-20260929    clang-21   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260929    gcc-14
xtensa                randconfig-1000-20260930    clang-22
xtensa                randconfig-1001-20260929    gcc-14
xtensa                randconfig-1001-20260930    clang-22
xtensa                randconfig-2000-20260929    gcc-12.5.0
xtensa                randconfig-2000-20260929    gcc-16.1.0
xtensa                randconfig-2001-20260929    gcc-10.5.0
xtensa                randconfig-2001-20260929    gcc-12.5.0
xtensa               randconfig-r2308-20260929    gcc-14.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
