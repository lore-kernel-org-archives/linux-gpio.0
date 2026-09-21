Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005274B1285
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004551; cv=none; b=fO0HuYUwwut47od6H1gbb/bgYDrUNwlD/nwQqpmpE6uvxfkycRW3OG+vvKqutCgduTKoEqEKPPm9wGwNN3pfs0iVT2sdCo0UlOCxCvX/KhZPcOiXhZhfKAoOvMmqJYpGaNnog3RWSdmljXLFQ5JR53SxUVrQzoS39hSoCVwkjaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004551; c=relaxed/simple;
	bh=4ZFQyUfUKb/2hAZfpQW7Sj6OCvA80+UlF1pGwiNKpVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qTH4q8TmiBEPtk8hU74ZkKzvrarlyGaInPXUj/s01qhbGNu+Z3/sCNhH/LHpKpCORiYHcM/SfoxbxkAp4frQ2z3vTErTjt3Mk/+jwBe1pJe2T3WC9Yllr+aoZURQ6JdXjWv5RHi/F8j0YKMne/5L3rN1pmexF8x9gcRpomYukOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYyR1pP1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYyR1pP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790004549; x=1821540549;
  h=date:from:to:cc:subject:message-id;
  bh=4ZFQyUfUKb/2hAZfpQW7Sj6OCvA80+UlF1pGwiNKpVU=;
  b=NYyR1pP1N/e71X60JsljyhuMqkyVfjdkKDvotGCPr7O45B0pE5diokiQ
   D9tjdIna6ey+D6iJO70U2Z/7OqQLHqmnNUtotyMcW+X2lzqVQqBdccimN
   WqOTbLikoFyqEahQWb9XfGTUQWflufXvoquSNa2eXjL+p7phvc1KPnlvr
   71HwGo3yK81th/VVQivUhtp+s4xsq2CMzX/7GW/i+BJcuvckpNMYNBiYw
   STDvZuxiS8Dlmptw5MAmXApny14VKcn4DFTlFSUqQAFBIu9HreA8GZ/mW
   Ic+OMR885RExtXInm9V2wY81U3PeZznd7aO+5PAt0TarocrBGA26eo2U5
   A==;
X-CSE-ConnectionGUID: tUBRSbWWQxaK3Qbq3isflg==
X-CSE-MsgGUID: /g+3+jVxTu+hlJTtT6i9mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116057604"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="116057604"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:27:41 -0700
X-CSE-ConnectionGUID: Gg0yBjyBTIOp80eg/+AzAg==
X-CSE-MsgGUID: xjiEumu3To6LFZLxhN/q8A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Sep 2026 08:27:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8fvd-00000000Dv3-0sRw;
	Mon, 21 Sep 2026 15:27:37 +0000
Date: Mon, 21 Sep 2026 23:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-current] BUILD SUCCESS
 dcb5df182b37587d5ad6bb4388751bf5180957ac
Message-ID: <202609212353.22GaTW3l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: dcb5df182b37587d5ad6bb4388751bf5180957ac  pinctrl: qcom: qcs8300: Fix intr_target_width

elapsed time: 2902m

configs tested: 210
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20260918    clang-22
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260921    gcc-9.5.0
arc                   randconfig-1001-20260921    gcc-15.2.0
arc                  randconfig-r1306-20260921    gcc-8.5.0  sparse
arc                  randconfig-r1309-20260921    gcc-8.5.0  sparse
arc                  randconfig-r2107-20260918    clang-24
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                          lpc18xx_defconfig    clang-24
arm                   randconfig-1000-20260921    clang-24
arm                   randconfig-1001-20260921    gcc-13.4.0
arm                   randconfig-1002-20260921    gcc-15.2.0
arm                   randconfig-1003-20260921    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                randconfig-r2105-20260918    gcc-11.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260921    gcc-9.5.0
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260921    clang-18
hexagon               randconfig-1001-20260921    clang-17
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20260921    clang-22
i386        buildonly-randconfig-1001-20260921    clang-22
i386        buildonly-randconfig-1002-20260921    clang-22
i386        buildonly-randconfig-1003-20260921    clang-22
i386        buildonly-randconfig-1004-20260921    gcc-14
i386        buildonly-randconfig-1005-20260921    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-1000-20260921    clang-22
i386                  randconfig-1001-20260921    clang-22
i386                  randconfig-1002-20260921    clang-22
i386                  randconfig-1003-20260921    gcc-14
i386                  randconfig-1004-20260921    gcc-13
i386                  randconfig-1005-20260921    clang-22
i386                  randconfig-1006-20260921    clang-22
i386                  randconfig-1007-20260921    gcc-14
i386                  randconfig-1008-20260921    clang-22
i386                  randconfig-1009-20260921    gcc-14
i386                  randconfig-1010-20260921    gcc-14
i386                  randconfig-1011-20260921    clang-22
i386                  randconfig-1012-20260921    clang-22
i386                  randconfig-1013-20260921    clang-22
i386                  randconfig-2100-20260918    clang-22
i386                  randconfig-2101-20260918    clang-22
i386                  randconfig-2102-20260918    clang-22
i386                  randconfig-2103-20260918    clang-22
i386                  randconfig-2200-20260918    clang-22
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260921    clang-18
loongarch             randconfig-1001-20260921    gcc-16.1.0
loongarch            randconfig-r2107-20260918    gcc-11.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
microblaze           randconfig-r2100-20260918    clang-24
microblaze           randconfig-r2202-20260918    gcc-12.5.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2103-20260918    clang-24
mips                 randconfig-r2202-20260918    gcc-15.2.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260921    gcc-8.5.0
nios2                 randconfig-1001-20260921    gcc-11.5.0
nios2                randconfig-r2106-20260918    gcc-11.5.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260918    clang-24
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260921    gcc-8.5.0
parisc                randconfig-1001-20260921    gcc-13.4.0
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                   iss476-smp_defconfig    gcc-16.1.0
powerpc                  mpc8313_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260921    clang-17
powerpc               randconfig-1001-20260921    clang-24
powerpc              randconfig-r2105-20260918    clang-24
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260921    gcc-10.5.0
powerpc64             randconfig-1001-20260921    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260921    gcc-12.5.0
riscv                 randconfig-1001-20260921    gcc-8.5.0
riscv                 randconfig-2000-20260918    gcc-13.4.0
riscv                 randconfig-2001-20260918    gcc-13.4.0
riscv                randconfig-r1301-20260921    clang-24   sparse
riscv                randconfig-r2102-20260918    clang-22
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260921    clang-24
s390                  randconfig-1001-20260921    clang-24
s390                  randconfig-2000-20260918    gcc-13.4.0
s390                  randconfig-2001-20260918    gcc-13.4.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                         edosk7760_defconfig    gcc-16.1.0
sh                           kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260921    gcc-9.5.0
sh                    randconfig-1001-20260921    gcc-16.1.0
sh                    randconfig-2000-20260918    gcc-13.4.0
sh                    randconfig-2001-20260918    gcc-13.4.0
sh                   randconfig-r2200-20260918    gcc-16.1.0
sh                    rts7751r2dplus_defconfig    gcc-16.1.0
sh                            se7343_defconfig    gcc-16.1.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260921    gcc-8.5.0
sparc                 randconfig-1001-20260921    gcc-11.5.0
sparc                 randconfig-2000-20260918    gcc-14
sparc                 randconfig-2001-20260918    gcc-14
sparc                randconfig-r2104-20260918    clang-24
sparc                randconfig-r2106-20260918    clang-24
sparc                randconfig-r2200-20260918    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260921    clang-21
sparc64               randconfig-1001-20260921    clang-22
sparc64               randconfig-2000-20260918    gcc-14
sparc64               randconfig-2001-20260918    gcc-14
sparc64              randconfig-r2102-20260918    clang-24
sparc64              randconfig-r2103-20260918    clang-22
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260921    gcc-14
um                    randconfig-1001-20260921    gcc-14
um                    randconfig-2000-20260918    gcc-14
um                    randconfig-2001-20260918    gcc-14
um                   randconfig-r2104-20260918    gcc-11.5.0
um                   randconfig-r2201-20260918    gcc-14
um                            x86_64_defconfig    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260921    clang-22
x86_64      buildonly-randconfig-1001-20260921    gcc-13
x86_64      buildonly-randconfig-1002-20260921    clang-22
x86_64      buildonly-randconfig-1003-20260921    clang-22
x86_64      buildonly-randconfig-1005-20260921    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260921    gcc-13
x86_64                randconfig-1001-20260921    clang-22
x86_64                randconfig-1002-20260921    gcc-14
x86_64                randconfig-1003-20260921    gcc-14
x86_64                randconfig-1004-20260921    clang-22
x86_64                randconfig-1005-20260921    clang-22
x86_64                randconfig-1006-20260921    gcc-14
x86_64                randconfig-1007-20260921    clang-22
x86_64                randconfig-1008-20260921    clang-22
x86_64                randconfig-1009-20260921    clang-22
x86_64                randconfig-1010-20260921    gcc-14
x86_64                randconfig-1011-20260921    clang-22
x86_64                randconfig-1013-20260921    clang-22
x86_64                randconfig-1015-20260921    clang-22
x86_64                randconfig-2100-20260918    clang-22
x86_64                randconfig-2101-20260918    clang-22
x86_64                randconfig-2102-20260918    clang-22
x86_64                randconfig-2103-20260918    clang-22
x86_64                randconfig-2200-20260918    gcc-14
x86_64               randconfig-r2100-20260918    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                            rhel-9.4-ltp    clang-22
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260921    gcc-11.5.0
xtensa                randconfig-1001-20260921    gcc-9.5.0
xtensa                randconfig-2000-20260918    gcc-14
xtensa                randconfig-2001-20260918    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
