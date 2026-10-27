Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137170;
	b=X8FxlMPTYXXym46b5ZnvQ4UCd80cdrS1XywPCsaRRPFnd0NNuNiW3UvFCYRZv8/f7Ayq
	 qj4ZVMQGteL5vuWoE2M2bcAYQaaexOiqYCkkLEtXtssFLj2eNCLwhXUHCTTFq1W5AUp+u
	 UMzqUEdYRImu/MdPsMI6Woh+9tYF5kw6ljT+YkTEUbbWXA1IyMDfR5v4MT/MSVzvD+iOp
	 TK31XLo0QYSffJkRWhH7YdX+FDybyj2kwLegcg2ZUefhg1vHZVKtB9Hou4F2VWcs9aTyM
	 mxj7IvaqofDRwg+1s+NiNLZimR1SOZTkyKTjrdnZR0LjdyGREGo5r5Zkrum+i2a3j7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137170;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4GXeP08bgvoykkJgxN2dmrQoAZwfl6HubMgv3/nDyyY=;
	b=qq0no5ExbO31w5v4Jvj1BOJC4yjIsIYDvRrNEBXZbHXLna08SmwWDt1J77TVzlJ/WYdn
	 DgW0RY55UiTHKBQ6/wP5fZ88yOnhB4ypdScuj/djblZ7z1bifb6FYDWxWi8iafMfqH9JI
	 DnwE+/an+TWXZvr9pQi3Em8RJ4C0/ehWeegS0sAy+/VgDyp+ZPu3ufvCIVYiIYmR0+N2v
	 EEf3fkaOuSKm8uY/dXrC6q0w9ZPlk8eBwcptb7jp8GQC6nzDr4xJ2dlmS9jJXKRqxioTn
	 LPNe1Jb85ZUua5bOdR43gpXp/QrKjFj1ebe2Jq00iOP2pEk9G1RYBoVrk/4pb/iEIvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BBDRQ8Kb;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A262606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 21:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A262606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BBDRQ8Kb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793137169; x=1824673169;
  h=date:from:to:cc:subject:message-id;
  bh=BGrw7ZJmnHS+DOlD4gFmM0YE204yj2kwVlbMC5eJfj4=;
  b=BBDRQ8KbTnnKVqrj3O1Z5lZevevKZkhb/UlszDaSKjslMH4OpGI2mdOR
   wps+FacnlxxyiOfY/tb/AP4Fhg1jTuwebIujcCwB0kXtko9bj0a9KfT6H
   tldrz572oRcvfK7LSnjK7mK7rbiU7Lz7odW5cTtmRzgsdi0jAHDJbv7q5
   ZKcEpa0IV0oy6a3cy7kXUVIwXqrIW+DHSpqW60DWIKj7i0EQN6eEIaoq/
   4J1nIdvltvwyCzDOLVYAIjadKpXkNWhCek6kti1ob8ZOaGEhJlCrye9k9
   rRkHzON/zUi3Oku6s5c14QJjpwybkcPOOkoEEp8++CPWOUBQ0EjB79Ieq
   Q==;
X-CSE-ConnectionGUID: +GV8g2LFRDWQ3a5If8R9TQ==
X-CSE-MsgGUID: QfBw9YIYSRiZgiWmse8trA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1864505"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1864505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 14:39:28 -0700
X-CSE-ConnectionGUID: JiLhx5cXSo6Hjpn7QOY5Qg==
X-CSE-MsgGUID: DuhjFmN3T/eFBeskwIPvlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4998842"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Oct 2026 14:39:28 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLotB-00000000XnA-02fH;
	Tue, 27 Oct 2026 21:39:25 +0000
Date: Wed, 28 Oct 2026 05:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 f33a24cc012d34f25bb9942681bd478a1757b806
Message-ID: <202610280505.i7BBuVtx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: f33a24cc012d34f25bb9942681bd478a1757b806  pinctrl: stm32: program the EXTI mux from .alloc instead of .activate

Error/Warning ids grouped by kconfigs:

recent_errors
`-- csky-allmodconfig
    `-- drivers-pinctrl-sunplus-sppctl.c:internal-compiler-error:in-final_scan_insn_1-at-final.cc

elapsed time: 6353m

configs tested: 190
configs skipped: 4

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261024    clang-24
arc                   randconfig-1001-20261024    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261024    clang-24
arm                   randconfig-1001-20261024    clang-24
arm                   randconfig-1002-20261024    clang-24
arm                   randconfig-1003-20261024    clang-24
arm                          socfpga_defconfig    gcc-16.2.0
arm                            stm32_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261024    gcc-10.5.0
arm64                 randconfig-1001-20261024    gcc-10.5.0
arm64                 randconfig-1002-20261024    gcc-10.5.0
arm64                 randconfig-1003-20261024    gcc-10.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261024    gcc-10.5.0
csky                  randconfig-1001-20261024    gcc-10.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261024    clang-24
hexagon               randconfig-1001-20261024    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261024    clang-22
i386        buildonly-randconfig-1001-20261024    clang-22
i386        buildonly-randconfig-1002-20261024    clang-22
i386        buildonly-randconfig-1003-20261024    clang-22
i386        buildonly-randconfig-1004-20261024    clang-22
i386        buildonly-randconfig-1005-20261024    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261024    clang-22
i386                  randconfig-1001-20261024    clang-22
i386                  randconfig-1002-20261024    clang-22
i386                  randconfig-1003-20261024    clang-22
i386                  randconfig-1004-20261024    clang-22
i386                  randconfig-1005-20261024    clang-22
i386                  randconfig-1006-20261024    clang-22
i386                  randconfig-1007-20261024    gcc-14
i386                  randconfig-1008-20261024    gcc-14
i386                  randconfig-1009-20261024    gcc-14
i386                  randconfig-1010-20261024    gcc-14
i386                  randconfig-1011-20261024    gcc-14
i386                  randconfig-1012-20261024    gcc-14
i386                  randconfig-1013-20261024    gcc-14
loongarch                         alldefconfig    gcc-16.2.0
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261024    clang-24
loongarch             randconfig-1001-20261024    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                             mac_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            ci20_defconfig    gcc-16.2.0
mips                         omega2p_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261024    clang-24
nios2                 randconfig-1001-20261024    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261024    clang-24
parisc                randconfig-1001-20261024    clang-24
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261024    clang-24
powerpc               randconfig-1001-20261024    clang-24
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261024    clang-24
powerpc64             randconfig-1001-20261024    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261024    gcc-11.5.0
riscv                 randconfig-1001-20261024    gcc-11.5.0
riscv                         rzfive_defconfig    gcc-16.2.0
s390                              alldefconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261024    gcc-11.5.0
s390                  randconfig-1001-20261024    gcc-11.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261024    gcc-11.5.0
sh                    randconfig-1001-20261024    gcc-11.5.0
sh                           rsk7201_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261024    gcc-14
sparc                 randconfig-1001-20261024    gcc-14
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261024    gcc-14
sparc64               randconfig-1001-20261024    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261024    gcc-14
um                    randconfig-1001-20261024    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261024    gcc-14
x86_64      buildonly-randconfig-1001-20261024    gcc-14
x86_64      buildonly-randconfig-1002-20261024    gcc-14
x86_64      buildonly-randconfig-1003-20261024    gcc-14
x86_64      buildonly-randconfig-1004-20261024    gcc-14
x86_64      buildonly-randconfig-1005-20261024    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261024    gcc-14
x86_64                randconfig-1001-20261024    gcc-14
x86_64                randconfig-1002-20261024    gcc-14
x86_64                randconfig-1003-20261024    gcc-14
x86_64                randconfig-1004-20261024    gcc-14
x86_64                randconfig-1005-20261024    gcc-14
x86_64                randconfig-1006-20261024    gcc-13
x86_64                randconfig-1007-20261024    gcc-13
x86_64                randconfig-1008-20261024    gcc-13
x86_64                randconfig-1009-20261024    gcc-13
x86_64                randconfig-1010-20261024    gcc-13
x86_64                randconfig-1011-20261024    gcc-13
x86_64                randconfig-1012-20261024    clang-22
x86_64                randconfig-1013-20261024    clang-22
x86_64                randconfig-1014-20261024    clang-22
x86_64                randconfig-1015-20261024    clang-22
x86_64                randconfig-1016-20261024    clang-22
x86_64                randconfig-1017-20261024    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261024    gcc-14
xtensa                randconfig-1001-20261024    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
