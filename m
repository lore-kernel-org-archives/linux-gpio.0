Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F110D1D5CC6
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580026; cv=none; b=nqquZYj7jcM2Rol9fBXawlL2tzfxXG8L8cDNsv4gIy0OMyuiIKl47JsegO2iUaaHlft7zbcXGhzllgH2e7edR9yRYz3pFRzl8KORGreu+p11+evmNmC5Ss0TfclN//VEwEZ/e4GOS8hvbLUL1NOzX7TAcqqdQhMkmSHkjHg0YDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580026; c=relaxed/simple;
	bh=VQziDhZpdM2IxRfP6Xa+WQLvg6UF8FMjDxTS+BWIOVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2pywc3+YqsMYCKn7SLplwlwbaKqXkPG+v43NrivG4yAweqYfUShKYVZX2GLfOa1JxEqB5oyEjs+0Ovlf42RUcK5EJTE7jYTn+XdbY0QINd7bMYMSyzZew3z24m9NBjdn2wPr3VxCac213VCQVU1/FHArpaDMzFJnMI9Y/n6DMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TluGQy8x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TluGQy8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781580024; x=1813116024;
  h=date:from:to:cc:subject:message-id;
  bh=VQziDhZpdM2IxRfP6Xa+WQLvg6UF8FMjDxTS+BWIOVg=;
  b=TluGQy8xG+0drTX95AUkyQQQMROm70AfSodyL2tiY3rKB2VWDlFyUdJZ
   jGRxXUM/eHQVrY5k9iZvcyj7WUAYD9ADZi4y4XuxBpHlvb0bNV0GjfMz/
   AUIKWVvdxbI3B9rVYAQL+u7r/6zIxE3q/YNyZnx7FyExWun+6FA6NrZ5b
   iYgaWN05j+C25aOpQfN4UzFZkr+BsHvMz9ITPxzp79sU3WXVYfX3zpGOw
   zSeLz9Hyx8y4JUNntt1BiU6BFyhIvq2wdFKvTFbDV2Z1UfA49W6iNCaxH
   cA5y00QUN1zzlxh3vP04jSHxL6E7x8iI2VMmHUfIBVWD7Xa5CDZtZrA23
   g==;
X-CSE-ConnectionGUID: udPjSYmnSSKpEDWmx2kPPQ==
X-CSE-MsgGUID: cos2Vw6rQ7KogUpIYk5Mlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92893494"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="92893494"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 20:20:23 -0700
X-CSE-ConnectionGUID: SLqFb5/CTBKLKZpZnGvkOA==
X-CSE-MsgGUID: zIjxsN6NSn+O7Nyw8C7eYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247510934"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2026 20:20:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZKLb-00000000Sf8-0oGn;
	Tue, 16 Jun 2026 03:20:19 +0000
Date: Tue, 16 Jun 2026 11:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 3bd25818aebd8dc6cdc44cb9356a539e98a76c6c
Message-ID: <202606161103.riVvHyjG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 3bd25818aebd8dc6cdc44cb9356a539e98a76c6c  Merge branch 'devel' into for-next

elapsed time: 832m

configs tested: 206
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-001-20260616    gcc-9.5.0
arc                   randconfig-002-20260616    gcc-9.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                       imx_v4_v5_defconfig    clang-23
arm                   randconfig-001-20260616    gcc-9.5.0
arm                   randconfig-002-20260616    gcc-9.5.0
arm                   randconfig-003-20260616    gcc-9.5.0
arm                   randconfig-004-20260616    gcc-9.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260616    gcc-13.4.0
arm64                 randconfig-001-20260616    gcc-8.5.0
arm64                 randconfig-002-20260616    gcc-13.4.0
arm64                 randconfig-002-20260616    gcc-15.2.0
arm64                 randconfig-003-20260616    gcc-13.4.0
arm64                 randconfig-004-20260616    gcc-11.5.0
arm64                 randconfig-004-20260616    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260616    gcc-13.4.0
csky                  randconfig-001-20260616    gcc-15.2.0
csky                  randconfig-002-20260616    gcc-13.4.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260616    clang-23
hexagon               randconfig-002-20260616    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260616    clang-22
i386        buildonly-randconfig-002-20260616    clang-22
i386        buildonly-randconfig-003-20260616    clang-22
i386        buildonly-randconfig-004-20260616    clang-22
i386        buildonly-randconfig-005-20260616    clang-22
i386        buildonly-randconfig-006-20260616    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260616    gcc-14
i386                  randconfig-002-20260616    gcc-14
i386                  randconfig-003-20260616    gcc-14
i386                  randconfig-004-20260616    gcc-14
i386                  randconfig-005-20260616    gcc-14
i386                  randconfig-006-20260616    gcc-14
i386                  randconfig-007-20260616    gcc-14
i386                  randconfig-011-20260616    clang-22
i386                  randconfig-012-20260616    clang-22
i386                  randconfig-013-20260616    clang-22
i386                  randconfig-014-20260616    clang-22
i386                  randconfig-015-20260616    clang-22
i386                  randconfig-016-20260616    clang-22
i386                  randconfig-017-20260616    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260616    clang-23
loongarch             randconfig-002-20260616    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260616    clang-23
nios2                 randconfig-002-20260616    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260616    gcc-8.5.0
parisc                randconfig-002-20260616    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                      ep88xc_defconfig    gcc-16.1.0
powerpc                      pmac32_defconfig    clang-23
powerpc               randconfig-001-20260616    gcc-8.5.0
powerpc               randconfig-002-20260616    gcc-8.5.0
powerpc64             randconfig-001-20260616    gcc-8.5.0
powerpc64             randconfig-002-20260616    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260615    clang-19
riscv                 randconfig-001-20260616    gcc-16.1.0
riscv                 randconfig-002-20260615    gcc-16.1.0
riscv                 randconfig-002-20260616    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260615    gcc-11.5.0
s390                  randconfig-001-20260616    gcc-16.1.0
s390                  randconfig-002-20260615    clang-23
s390                  randconfig-002-20260616    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260615    gcc-16.1.0
sh                    randconfig-001-20260616    gcc-16.1.0
sh                    randconfig-002-20260615    gcc-10.5.0
sh                    randconfig-002-20260616    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260616    gcc-8.5.0
sparc                 randconfig-002-20260616    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260616    gcc-8.5.0
sparc64               randconfig-002-20260616    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260616    gcc-8.5.0
um                    randconfig-002-20260616    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260616    gcc-14
x86_64      buildonly-randconfig-002-20260616    gcc-14
x86_64      buildonly-randconfig-003-20260616    gcc-14
x86_64      buildonly-randconfig-004-20260616    gcc-14
x86_64      buildonly-randconfig-005-20260616    gcc-14
x86_64      buildonly-randconfig-006-20260616    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260616    clang-22
x86_64                randconfig-002-20260616    clang-22
x86_64                randconfig-003-20260616    clang-22
x86_64                randconfig-004-20260616    clang-22
x86_64                randconfig-005-20260616    clang-22
x86_64                randconfig-006-20260616    clang-22
x86_64                randconfig-011-20260616    clang-22
x86_64                randconfig-012-20260616    clang-22
x86_64                randconfig-013-20260616    clang-22
x86_64                randconfig-014-20260616    clang-22
x86_64                randconfig-015-20260616    clang-22
x86_64                randconfig-016-20260616    clang-22
x86_64                randconfig-071-20260616    gcc-14
x86_64                randconfig-072-20260616    gcc-14
x86_64                randconfig-073-20260616    gcc-14
x86_64                randconfig-074-20260616    gcc-14
x86_64                randconfig-075-20260616    gcc-14
x86_64                randconfig-076-20260616    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260616    gcc-8.5.0
xtensa                randconfig-002-20260616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
