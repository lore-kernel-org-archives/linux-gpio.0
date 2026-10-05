Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43736434996
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191843; cv=none; b=arVI38hHWwMc9/YtxEQibC5yu71i+pBDnpx3qQDzFv8BVVvGtchRXft8LMtai8WlAFtM4ct55MYOHICR5LCWfkm3bhmxwqBVpxd5iq84lAwXKoxYNDcB3bJ7CUuVy35M81WGVXKjI8a8RcQfV6ar+28u1aLFgEBKo05zZTYqa4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191843; c=relaxed/simple;
	bh=IYbdapOg6ii/cYrmwY2lwpqGa1WcGDn85sWcL0/aRNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O+y1SaMECKbZ6mlAAmZO7fKbjRwnnyX816sAhv9RxwRZD4EZ6TeRX6uFL3GTrBS0Zi51XU19Oi9GM6O8Mt4Ayd8GVWzOkTzoS3iJBtXcV6ca+7b+MXzYFVq6nl8GyoyGEyA0p17bHz6eiprz0XKfdEnXwzhAZGUQbECjKLESlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtMiTnfZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtMiTnfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791191841; x=1822727841;
  h=date:from:to:cc:subject:message-id;
  bh=IYbdapOg6ii/cYrmwY2lwpqGa1WcGDn85sWcL0/aRNY=;
  b=gtMiTnfZnOrbEE0mg1IUW8quj/il1Pzi2ljW3zwux9eXDCEesKXYcrzq
   woNzaZrIWqgMEfad6DsSKUIRVeLtlgjvcmx2cYOZa6yfIN82BjqhH6mR+
   HTw2m+vHlEGtvEnRp8vtao5xMQWnKVEBDcj8oNFFloco1W5XA4mY8FCnb
   3BDC7qoPybMnI+VqTOQMJmm8kSS9BnDqfvCPMhBQYAz55ari2qPSCAY3x
   D4TeGpj/j9utiFBF6gsKaHKbKMPP5YnCSQRhB4dqMjOOTI76ABhAtd9Ky
   kgB+g/zWmld8sQSbq5VVqTATChWlD3/wTBDp8ULmxfsO0+Ptw/44D+zx7
   Q==;
X-CSE-ConnectionGUID: X9vGFTW9SPONHQXgWyrDww==
X-CSE-MsgGUID: vGc9PyevQl+6kT4laeWSig==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="108235769"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="108235769"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 02:17:20 -0700
X-CSE-ConnectionGUID: WPHqAnjDSGOpYnoktrS/cg==
X-CSE-MsgGUID: rBhpkKSdTviXyK29P8/hEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="275403009"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2026 02:17:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDeou-0000000007P-02g2;
	Mon, 05 Oct 2026 09:17:16 +0000
Date: Mon, 05 Oct 2026 17:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 7efa1a1953cd6b20b23a3524d5b4b81789c6ef25
Message-ID: <202610051753.EFqAkz7N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 7efa1a1953cd6b20b23a3524d5b4b81789c6ef25  gpio: mpsse: fix race when arming the IRQ poll worker

elapsed time: 932m

configs tested: 331
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261004    gcc-11.5.0 cocci
alpha                randconfig-r2102-20261004    gcc-10.5.0 cocci
alpha                randconfig-r2105-20261004    clang-24   cocci
alpha                randconfig-r2201-20261004    gcc-14.3.0 smatch
alpha                randconfig-r2301-20261004    clang-24   sparse
alpha                randconfig-r2302-20261004    gcc-8.5.0  sparse
alpha                randconfig-r2309-20261004    clang-19   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                         nsimosci_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                  randconfig-r2302-20261004    clang-24   sparse
arc                  randconfig-r2309-20261004    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                        imx_v4_v5_defconfig    gcc-16.1.0
arm                         keystone_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                  randconfig-r2107-20261004    gcc-14.3.0 cocci
arm                  randconfig-r2201-20261004    gcc-13.4.0 smatch
arm                  randconfig-r2202-20261004    gcc-11.5.0 smatch
arm                  randconfig-r2302-20261004    clang-20   sparse
arm                  randconfig-r2304-20261004    gcc-16.1.0 sparse
arm                  randconfig-r2306-20261004    gcc-14.3.0 sparse
arm                         spear6xx_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm                          wpcm450_defconfig    gcc-16.1.0
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                randconfig-r2100-20261004    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261004    clang-20   sparse
arm64                randconfig-r2305-20261004    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                 randconfig-r2202-20261004    gcc-16.1.0 smatch
csky                 randconfig-r2304-20261004    clang-20   sparse
csky                 randconfig-r2304-20261004    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon              randconfig-r2102-20261004    gcc-11.5.0 cocci
hexagon              randconfig-r2106-20261004    clang-22   cocci
hexagon              randconfig-r2200-20261004    clang-24   smatch
hexagon              randconfig-r2201-20261004    clang-24   smatch
hexagon              randconfig-r2300-20261004    clang-24   sparse
hexagon              randconfig-r2304-20261004    gcc-8.5.0  sparse
hexagon              randconfig-r2307-20261004    gcc-14.3.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1005-20261005    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1007-20261005    clang-22
i386                  randconfig-1008-20261005    clang-22
i386                  randconfig-1009-20261005    clang-22
i386                  randconfig-1010-20261005    clang-22
i386                  randconfig-1011-20261005    clang-22
i386                  randconfig-1012-20261005    clang-22
i386                  randconfig-1013-20261005    clang-22
i386                  randconfig-2100-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    clang-22   cocci
i386                  randconfig-2102-20261004    clang-22   cocci
i386                  randconfig-2103-20261004    clang-22   cocci
i386                  randconfig-2200-20261004    clang-22   smatch
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                 randconfig-r2100-20261004    clang-24   cocci
i386                 randconfig-r2100-20261004    gcc-11.5.0 cocci
i386                 randconfig-r2104-20261004    clang-22   cocci
i386                 randconfig-r2303-20261004    clang-20   sparse
i386                 randconfig-r2305-20261004    gcc-8.5.0  sparse
i386                 randconfig-r2308-20261004    gcc-14.3.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch            randconfig-r2302-20261004    gcc-16.1.0 sparse
loongarch            randconfig-r2306-20261004    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r2102-20261004    gcc-11.5.0 cocci
m68k                 randconfig-r2103-20261004    gcc-11.5.0 cocci
m68k                 randconfig-r2200-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2202-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2307-20261004    gcc-9.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2100-20261004    gcc-10.5.0 cocci
microblaze           randconfig-r2107-20261004    clang-22   cocci
microblaze           randconfig-r2305-20261004    clang-20   sparse
microblaze           randconfig-r2305-20261004    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261004    gcc-11.5.0 cocci
mips                 randconfig-r2106-20261004    gcc-14.3.0 cocci
mips                 randconfig-r2307-20261004    gcc-14.3.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                randconfig-r2100-20261004    gcc-11.5.0 cocci
nios2                randconfig-r2103-20261004    clang-24   cocci
nios2                randconfig-r2107-20261004    clang-24   cocci
nios2                randconfig-r2300-20261004    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261004    gcc-11.5.0 cocci
openrisc             randconfig-r2105-20261004    gcc-14.3.0 cocci
openrisc             randconfig-r2306-20261004    clang-19   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc               randconfig-r2201-20261004    gcc-15.2.0 smatch
parisc               randconfig-r2306-20261004    gcc-9.5.0  sparse
parisc               randconfig-r2307-20261004    clang-19   sparse
parisc               randconfig-r2308-20261004    gcc-14.3.0 sparse
parisc               randconfig-r2308-20261004    gcc-9.5.0  sparse
parisc               randconfig-r2309-20261004    gcc-14.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                    bluestone_defconfig    gcc-16.1.0
powerpc                         cell_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc              randconfig-r2101-20261004    gcc-11.5.0 cocci
powerpc              randconfig-r2104-20261004    clang-24   cocci
powerpc              randconfig-r2106-20261004    clang-24   cocci
powerpc              randconfig-r2300-20261004    gcc-8.5.0  sparse
powerpc              randconfig-r2301-20261004    gcc-16.1.0 sparse
powerpc              randconfig-r2304-20261004    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261004    gcc-14.3.0 sparse
powerpc                     sam440ep_defconfig    gcc-16.1.0
powerpc                      tqm8540_defconfig    gcc-16.1.0
powerpc                      tqm8555_defconfig    gcc-16.1.0
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64            randconfig-r2202-20261004    clang-24   smatch
powerpc64            randconfig-r2301-20261004    clang-20   sparse
powerpc64            randconfig-r2306-20261004    gcc-16.1.0 sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-2000-20261004    gcc-11.5.0
riscv                 randconfig-2001-20261004    gcc-11.5.0
riscv                randconfig-r2101-20261004    clang-24   cocci
riscv                randconfig-r2102-20261004    clang-24   cocci
riscv                randconfig-r2103-20261004    gcc-11.5.0 cocci
riscv                randconfig-r2107-20261004    clang-22   cocci
riscv                randconfig-r2200-20261004    gcc-11.5.0 smatch
riscv                randconfig-r2301-20261004    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-2000-20261004    gcc-11.5.0
s390                  randconfig-2001-20261004    gcc-11.5.0
s390                 randconfig-r2101-20261004    gcc-11.5.0 cocci
s390                 randconfig-r2103-20261004    gcc-10.5.0 cocci
s390                 randconfig-r2202-20261004    gcc-9.5.0  smatch
s390                 randconfig-r2301-20261004    gcc-8.5.0  sparse
s390                 randconfig-r2302-20261004    gcc-8.5.0  sparse
s390                 randconfig-r2303-20261004    gcc-16.1.0 sparse
s390                 randconfig-r2303-20261004    gcc-8.5.0  sparse
s390                 randconfig-r2308-20261004    clang-19   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-2000-20261004    gcc-11.5.0
sh                    randconfig-2001-20261004    gcc-11.5.0
sh                   randconfig-r2104-20261004    gcc-10.5.0 cocci
sh                   randconfig-r2104-20261004    gcc-14.3.0 cocci
sh                   randconfig-r2105-20261004    clang-22   cocci
sh                   randconfig-r2105-20261004    gcc-10.5.0 cocci
sh                           rsk7201_defconfig    gcc-16.1.0
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                            se7750_defconfig    gcc-16.1.0
sh                               ul2_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-2000-20261004    clang-17
sparc                 randconfig-2001-20261004    clang-17
sparc                randconfig-r2105-20261004    clang-22   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-2000-20261004    clang-17
sparc64               randconfig-2001-20261004    clang-17
sparc64              randconfig-r2101-20261004    gcc-10.5.0 cocci
sparc64              randconfig-r2303-20261004    gcc-8.5.0  sparse
sparc64              randconfig-r2307-20261004    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1001-20261005    clang-24
um                    randconfig-2000-20261004    clang-17
um                    randconfig-2001-20261004    clang-17
um                   randconfig-r2303-20261004    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1012-20261005    gcc-14
x86_64                randconfig-1013-20261005    gcc-14
x86_64                randconfig-1014-20261005    gcc-14
x86_64                randconfig-1015-20261005    gcc-14
x86_64                randconfig-1016-20261005    gcc-14
x86_64                randconfig-1017-20261005    gcc-14
x86_64                randconfig-2100-20261004    gcc-14     cocci
x86_64                randconfig-2101-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2200-20261004    gcc-14     smatch
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64               randconfig-r2104-20261004    clang-22   cocci
x86_64               randconfig-r2106-20261004    clang-22   cocci
x86_64               randconfig-r2107-20261004    gcc-10.5.0 cocci
x86_64               randconfig-r2308-20261004    gcc-16.1.0 sparse
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
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261005    clang-24
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-2000-20261004    clang-17
xtensa                randconfig-2001-20261004    clang-17
xtensa               randconfig-r2106-20261004    gcc-10.5.0 cocci
xtensa               randconfig-r2200-20261004    gcc-15.2.0 smatch
xtensa               randconfig-r2300-20261004    gcc-16.1.0 sparse
xtensa               randconfig-r2305-20261004    gcc-8.5.0  sparse
xtensa               randconfig-r2309-20261004    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
