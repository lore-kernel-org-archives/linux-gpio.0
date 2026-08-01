Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392025B0A3
	for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2026 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785624843; cv=none; b=iKAtw0ccvcmaJYPotjL+db1MQFl9aJBy48hpmbtl7bZJTer0wxSm1s7e9MtQPCuzVHMsoj4yo38kY3EwSh9W7QErrDhKJ6zbNnjemLX8VGr4aT7zfsWIR0X428KL0aTcRcHmWEa0kFasB4FX4i/SZVuD6uzPhAfSpbmrXKG9VBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785624843; c=relaxed/simple;
	bh=+qC02r5wEbCmNLf17b6MW8HNzIr5f3UoblZVFfohdOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CFG34xR+OqeOD0tnZmrHqBOQhg6E0Km7StZIrSELP5y2F3n7sZECt4dxvXx2KzkAkwmIhYlBnMZBfSQXRmkRgSUXv0BdJ9dkV0F0rO1hJad6XdHTwTeNYH2GleGiemeyC+OBMifHSt/5xdg4MXouRRLkXgZtQCvCDtPv4cbtcfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQRhdKBG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQRhdKBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785624842; x=1817160842;
  h=date:from:to:cc:subject:message-id;
  bh=+qC02r5wEbCmNLf17b6MW8HNzIr5f3UoblZVFfohdOk=;
  b=nQRhdKBGwWJ1BJu0ZO7oHkRH4ipCMfzYjJveCAFJag97qxXDZ5vEhOhN
   fcGcZvZ5MfQY0W7pal8wNnubayAzWKcxAlBpMIr984zKcCgwtgkWEa5/8
   u/v+KjevwweIckX/iBnQRgauqeFr50xmy0JyO2aBooduydr1VnWTi5R1X
   Zi+mNSjlUcQy43hPBrNQlabsShT4Pd812dFYXXPFoy/POr9cP3B3SaUBd
   unAYPBLvuGMwpfd0erjl1jJ1GX6qSW3QUKt4BvS3V13Df51CXtukzxwP6
   WUQG8w61278pFdqPUbpsCLq7/xJ/svC70EMfDu7llFwcJ94hFpAPRBjUU
   A==;
X-CSE-ConnectionGUID: pMqqDoxYQX2o9sguADuPCg==
X-CSE-MsgGUID: RbWb10/sSA6Uut+LrQmVOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86295622"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86295622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 15:54:02 -0700
X-CSE-ConnectionGUID: m1ThWccITfCuuph9OXmd4g==
X-CSE-MsgGUID: AZLOVZr0RQOy4LozSRNPjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="264694626"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2026 15:54:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqIab-0000000040B-3A4P;
	Sat, 01 Aug 2026 22:53:57 +0000
Date: Sun, 02 Aug 2026 06:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 04b3818c3bbc3f68b6e856f87dca752af2cc34ee
Message-ID: <202608020608.1zjAnL2B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 04b3818c3bbc3f68b6e856f87dca752af2cc34ee  Revert "pinctrl: s32cc: implement GPIO functionality"

elapsed time: 752m

configs tested: 175
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260801    gcc-12.5.0
arc                  randconfig-001-20260802    gcc-15.2.0
arc                  randconfig-002-20260801    gcc-12.5.0
arc                  randconfig-002-20260802    gcc-15.2.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260801    gcc-12.5.0
arm                  randconfig-001-20260802    gcc-15.2.0
arm                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-002-20260802    gcc-15.2.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-003-20260802    gcc-15.2.0
arm                  randconfig-004-20260801    gcc-12.5.0
arm                  randconfig-004-20260802    gcc-15.2.0
arm64                         randconfig-001    gcc-10.5.0
arm64                randconfig-001-20260801    gcc-10.5.0
arm64                randconfig-001-20260802    gcc-9.5.0
arm64                randconfig-002-20260801    gcc-10.5.0
arm64                randconfig-002-20260802    gcc-9.5.0
arm64                randconfig-003-20260801    gcc-10.5.0
arm64                randconfig-003-20260802    gcc-9.5.0
arm64                randconfig-004-20260801    gcc-10.5.0
arm64                randconfig-004-20260802    gcc-9.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-10.5.0
csky                 randconfig-001-20260802    gcc-9.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
csky                 randconfig-002-20260802    gcc-9.5.0
hexagon              randconfig-001-20260801    gcc-16.1.0
hexagon              randconfig-001-20260802    clang-24
hexagon              randconfig-002-20260801    gcc-16.1.0
hexagon              randconfig-002-20260802    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260801    gcc-14
i386       buildonly-randconfig-001-20260802    gcc-14
i386       buildonly-randconfig-002-20260801    gcc-14
i386       buildonly-randconfig-002-20260802    gcc-14
i386       buildonly-randconfig-003-20260801    gcc-14
i386       buildonly-randconfig-003-20260802    gcc-14
i386       buildonly-randconfig-004-20260801    gcc-14
i386       buildonly-randconfig-004-20260802    gcc-14
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-005-20260802    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
i386       buildonly-randconfig-006-20260802    gcc-14
i386                 randconfig-001-20260801    clang-22
i386                 randconfig-002-20260801    clang-22
i386                 randconfig-003-20260801    clang-22
i386                 randconfig-004-20260801    clang-22
i386                 randconfig-005-20260801    clang-22
i386                 randconfig-006-20260801    clang-22
i386                 randconfig-007-20260801    clang-22
i386                 randconfig-011-20260801    gcc-14
i386                 randconfig-012-20260801    gcc-14
i386                 randconfig-013-20260801    gcc-14
i386                 randconfig-014-20260801    gcc-14
i386                 randconfig-015-20260801    gcc-14
i386                 randconfig-016-20260801    gcc-14
i386                 randconfig-017-20260801    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260801    gcc-16.1.0
loongarch            randconfig-001-20260802    clang-24
loongarch            randconfig-002-20260801    gcc-16.1.0
loongarch            randconfig-002-20260802    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260801    gcc-16.1.0
nios2                randconfig-001-20260802    clang-24
nios2                randconfig-002-20260801    gcc-16.1.0
nios2                randconfig-002-20260802    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260801    gcc-9.5.0
parisc               randconfig-001-20260802    gcc-14.3.0
parisc               randconfig-002-20260801    gcc-9.5.0
parisc               randconfig-002-20260802    gcc-14.3.0
powerpc                  bluestone_defconfig    clang-24
powerpc                  lite5200b_defconfig    clang-24
powerpc              randconfig-001-20260801    gcc-9.5.0
powerpc              randconfig-001-20260802    gcc-14.3.0
powerpc              randconfig-002-20260801    gcc-9.5.0
powerpc              randconfig-002-20260802    gcc-14.3.0
powerpc64            randconfig-001-20260801    gcc-9.5.0
powerpc64            randconfig-001-20260802    gcc-14.3.0
powerpc64            randconfig-002-20260801    gcc-9.5.0
powerpc64            randconfig-002-20260802    gcc-14.3.0
riscv                         randconfig-001    gcc-14.3.0
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-001-20260802    gcc-13.4.0
riscv                randconfig-002-20260801    gcc-14.3.0
riscv                randconfig-002-20260802    gcc-13.4.0
s390                 randconfig-001-20260801    gcc-14.3.0
s390                 randconfig-001-20260802    gcc-13.4.0
s390                 randconfig-002-20260801    gcc-14.3.0
s390                 randconfig-002-20260802    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-14.3.0
sh                   randconfig-001-20260802    gcc-13.4.0
sh                   randconfig-002-20260801    gcc-14.3.0
sh                   randconfig-002-20260802    gcc-13.4.0
sparc                randconfig-001-20260801    gcc-11.5.0
sparc                randconfig-001-20260802    gcc-12.5.0
sparc                randconfig-002-20260801    gcc-11.5.0
sparc                randconfig-002-20260802    gcc-12.5.0
sparc64              randconfig-001-20260801    gcc-11.5.0
sparc64              randconfig-001-20260802    gcc-12.5.0
sparc64              randconfig-002-20260801    gcc-11.5.0
sparc64              randconfig-002-20260802    gcc-12.5.0
um                   randconfig-001-20260801    gcc-11.5.0
um                   randconfig-001-20260802    gcc-12.5.0
um                   randconfig-002-20260801    gcc-11.5.0
um                   randconfig-002-20260802    gcc-12.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-001-20260802    gcc-12
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-002-20260802    gcc-12
x86_64     buildonly-randconfig-003-20260801    clang-22
x86_64     buildonly-randconfig-003-20260802    gcc-12
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-004-20260802    gcc-12
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-005-20260802    gcc-12
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64     buildonly-randconfig-006-20260802    gcc-12
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260801    gcc-14
x86_64               randconfig-001-20260802    clang-22
x86_64               randconfig-002-20260801    gcc-14
x86_64               randconfig-002-20260802    clang-22
x86_64               randconfig-003-20260801    gcc-14
x86_64               randconfig-003-20260802    clang-22
x86_64               randconfig-004-20260801    gcc-14
x86_64               randconfig-004-20260802    clang-22
x86_64               randconfig-005-20260801    gcc-14
x86_64               randconfig-005-20260802    clang-22
x86_64               randconfig-006-20260801    gcc-14
x86_64               randconfig-006-20260802    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260801    clang-22
x86_64               randconfig-011-20260802    clang-22
x86_64               randconfig-012-20260801    clang-22
x86_64               randconfig-012-20260802    clang-22
x86_64               randconfig-013-20260801    clang-22
x86_64               randconfig-013-20260802    clang-22
x86_64               randconfig-014-20260801    clang-22
x86_64               randconfig-014-20260802    clang-22
x86_64               randconfig-015-20260801    clang-22
x86_64               randconfig-015-20260802    clang-22
x86_64               randconfig-016-20260801    clang-22
x86_64               randconfig-016-20260802    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260801    clang-22
x86_64               randconfig-071-20260802    gcc-12
x86_64               randconfig-072-20260801    clang-22
x86_64               randconfig-072-20260802    gcc-12
x86_64               randconfig-073-20260801    clang-22
x86_64               randconfig-073-20260802    gcc-12
x86_64               randconfig-074-20260801    clang-22
x86_64               randconfig-074-20260802    gcc-12
x86_64               randconfig-075-20260801    clang-22
x86_64               randconfig-075-20260802    gcc-12
x86_64               randconfig-076-20260801    clang-22
x86_64               randconfig-076-20260802    gcc-12
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260801    gcc-11.5.0
xtensa               randconfig-001-20260802    gcc-12.5.0
xtensa               randconfig-002-20260801    gcc-11.5.0
xtensa               randconfig-002-20260802    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
