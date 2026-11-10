Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270350;
	b=2ebiS9qSUssvNlYFjQUBN9HY6MJ1ZrYjQtA7kyIfxxuQbd0w9Q3sEIPWN9u2+fWbxNJe
	 CPdOLbsnc2EKgIqnIB1kvbpGEZ/XjsE2t1KPjo9NDdq8z8u2LVnq4+rwWx3XEexlfT+/0
	 ShkG5Ax9c3VnY5F8HXETle1pywswZKYx6dJEkyp5n/B7vX6v/KMlO53X1qih/bhu6dtWM
	 g4sSe/llb2zzkci6iILYtvwSrj3NNcvLoRrYWPuJL0qwfjyjvWl4EzLL4CyKNa1YNFuAX
	 A3i89ix2+Enkqr0X1RYF4YUbZ7N89pupGhv9wGoESVGAj4XPmAbOPcJZrLwvrtsBfZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270350;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zHlUpuz46o4DWiiKFuGrTDAKXgFbbERpLxGrMJYiB/Y=;
	b=hPz2DQQWJCwDdU1x1hcZku3SmDNStswFBezlDEvnhEAdLBmTKvcPEnsigJPYAkbuYwTQ
	 zFke6lpsKoD2CNcEpX9luqyzmGn3Rb31fVZxzDSFBjfqRNgBzKHMJBJvnZPuFP8lxWHDk
	 YOMDmyOp8bHKNKzGtJFGbJIM/YuJzHr9ZR5X4bGk6N+gpmDUx1JwiH6KlwfM8QJJwgtJv
	 CJms1HvZ1zJx7Rh/qIyAQJGcLZMiRGUIAv9rr3DCTDNiX/Vsxvj9839fI2skk3JRSjyVu
	 GMq+iWWttjxS9UOughowlMxLL0kFv+uZ+mFmXTTBxVS2ok8Z6qyWiO5P82HN0CtG7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHx5Axtm;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C4606A330
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 00:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2C4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHx5Axtm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794270349; x=1825806349;
  h=date:from:to:cc:subject:message-id;
  bh=5XdVzQ0EMhOpNv6IN1f8EKVMXQ4c+l6Qvbyxr2s8VDY=;
  b=DHx5AxtmR4lPtkN+qerM+z47ZQFdnOEEDdCgNAB1c85Rl2l2FJv2AIsm
   SBIr+JgHSi1efcep/bJFTvDnybo6HdYAbBj7jrADMNO5yGudoe8shiGhk
   k+676yaz1iSw9AlO7W1PF9R39HBGK7Bs/et5NAoIC6tjK/ogT3r+YwrJR
   SAQyiOsHUxn6rWc/9fHQMoiH+tPiXFNNCx2GhQAWS5pEq0u9gMX9MPu7p
   csuNwwFVJ8/1xuJdR4g3UVyTNTTtDEXSL7iNwliYLL9H+AZ1UZzOT2FiT
   gSzig9KI17Xtp7OnZ3FDlqx2eZ1G/Wcy000TbyTpsp1MFosAvUwtaflqY
   g==;
X-CSE-ConnectionGUID: 4Wtil/cOSc+v9TmcNFAVDg==
X-CSE-MsgGUID: T8LIYwKXT7eHeu0rINJFHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2899046"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2899046"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:25:48 -0800
X-CSE-ConnectionGUID: SVJ3Ci4jQxWjJINVzrsb3A==
X-CSE-MsgGUID: aR8aWb7xQheaNTlw7Er7nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8139535"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Nov 2026 16:25:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQZgG-00000000vbv-0ja4;
	Tue, 10 Nov 2026 00:25:44 +0000
Date: Tue, 10 Nov 2026 08:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:master] BUILD SUCCESS
 fd2d5e9417a86d015a4c7b9759d2d3d6182fcd7b
Message-ID: <20261110082458.dp82TXib-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git master
branch HEAD: fd2d5e9417a86d015a4c7b9759d2d3d6182fcd7b  device property: Fix fwnode_name_eq() for empty node names

elapsed time: 910m

configs tested: 287
configs skipped: 4

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
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-17
arm                       integrator_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                             mmp2_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-1001-20261110    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-1013-20261110    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-1001-20261110    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip27_defconfig    clang-17
mips                            jazz_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-1001-20261110    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    clang-17
powerpc                      ppa8548_defconfig    clang-17
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc                         warp_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261110    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-1001-20261110    clang-24
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-1001-20261110    clang-24
sh                           rsk7201_defconfig    clang-24
sh                            se7751_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261109    clang-22
x86_64                randconfig-1017-20261110    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
