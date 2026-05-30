Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B63A3E7E
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136801; cv=none; b=Pw7KWDLAQ+0s2Ft6OiTQb6KPYSAXNjY/I/QvFy41WcaQo2wFfB9NhWmWSjCl27vrIuFfh0F4w+HY7RKwpV3O3EcdSENTzH4DFIyhPjgDb0HVlYNp2gtGNvQ6EQ20WEChM/PV53FNPceX3RKKKmHQ1/bph98DXaAHQUtY5H+HrZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136801; c=relaxed/simple;
	bh=/Biu+8iPEeT7YpT09B1+fIkbUYfzIFw/pchF4IR/Av4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VAq4k/vVNqu4r07Lq7Ry3GF87AxtokPs0/1lL+xbpvT8yS4PUEw4rtMBF6t1qwhx0P+OBS8GZXtcjF7DeGAQsMlppXBkr+QuauMZIWgaC8Pufi1bcGjpgCcPklbBu2okEZ9LSNzmMpiUZITLqWsyz2BXegXIc01U8s67SaVNqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bo8bAVfS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bo8bAVfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780136795; x=1811672795;
  h=date:from:to:cc:subject:message-id;
  bh=/Biu+8iPEeT7YpT09B1+fIkbUYfzIFw/pchF4IR/Av4=;
  b=Bo8bAVfStQfvqBjGOwFDhgAGr82TyE+soPEx96MK0BTnr9u9Ez1bRXfk
   6VJ5heXStBIYM7LfkVdGNZ9PsClUuxCvrzKgJ2/kgHVsdiUtEWjmMecZn
   zEboGlrZ3H3raTrT+82GEFYC9CmhoTW8TMKnDnLyYyqYNjH3R6cKszuoN
   fIgZ23qFAjFStJu/5HYSfRgsgyor9R7rhUs3IUG6Bbd63981QCaA9y5ab
   P90MkcynJVGEJHhKvyOSHT86FIsN9yrnkX62p3Ts7sen9np/Ej4lRMs2x
   35rwpcEfZ0rtJy0qnKXeYHkhavUrbx6IlVjXfgL2xEB11g2iUiDPDaw1D
   A==;
X-CSE-ConnectionGUID: YJ8sGLWmR2ut7lsCAgf6wA==
X-CSE-MsgGUID: aBPZUBLwSN+SBMTujsw2+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92086758"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="92086758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 03:26:34 -0700
X-CSE-ConnectionGUID: cXNuNRu4QSKNDLvyJkV1Og==
X-CSE-MsgGUID: v2lDPLxQSny+mGrJ98U2Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="243168398"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2026 03:26:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTGti-000000008KA-3bZl;
	Sat, 30 May 2026 10:26:30 +0000
Date: Sat, 30 May 2026 18:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 ef76a3a28c79b628890431aa344af633e892035b
Message-ID: <202605301805.lKIad8U4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: ef76a3a28c79b628890431aa344af633e892035b  i2c: designware: defer probe if child GpioInt controllers are not bound

elapsed time: 731m

configs tested: 195
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260530    gcc-14.3.0
arc                   randconfig-002-20260530    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                        multi_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260530    gcc-14.3.0
arm                   randconfig-002-20260530    gcc-14.3.0
arm                   randconfig-003-20260530    gcc-14.3.0
arm                   randconfig-004-20260530    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260530    gcc-8.5.0
arm64                 randconfig-002-20260530    gcc-8.5.0
arm64                 randconfig-003-20260530    gcc-8.5.0
arm64                 randconfig-004-20260530    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260530    gcc-8.5.0
csky                  randconfig-002-20260530    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260530    clang-23
hexagon               randconfig-002-20260530    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260530    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260530    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260530    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260530    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260530    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260530    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260530    clang-20
i386                  randconfig-002-20260530    clang-20
i386                  randconfig-003-20260530    clang-20
i386                  randconfig-004-20260530    clang-20
i386                  randconfig-005-20260530    clang-20
i386                  randconfig-006-20260530    clang-20
i386                  randconfig-007-20260530    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260530    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260530    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260530    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260530    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260530    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260530    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260530    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260530    clang-23
loongarch             randconfig-002-20260530    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        qi_lb60_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260530    clang-23
nios2                 randconfig-002-20260530    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260530    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260530    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260530    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260530    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260530    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260530    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260530    gcc-12.5.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260530    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260530    gcc-12.5.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260530    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260530    gcc-12.5.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260530    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260530    gcc-9.5.0
sparc                 randconfig-002-20260530    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260530    gcc-9.5.0
sparc64               randconfig-002-20260530    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260530    gcc-9.5.0
um                    randconfig-002-20260530    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260530    gcc-14
x86_64      buildonly-randconfig-002-20260530    gcc-14
x86_64      buildonly-randconfig-003-20260530    gcc-14
x86_64      buildonly-randconfig-004-20260530    gcc-14
x86_64      buildonly-randconfig-005-20260530    gcc-14
x86_64      buildonly-randconfig-006-20260530    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260530    gcc-14
x86_64                randconfig-002-20260530    gcc-14
x86_64                randconfig-003-20260530    gcc-14
x86_64                randconfig-004-20260530    gcc-14
x86_64                randconfig-005-20260530    gcc-14
x86_64                randconfig-006-20260530    gcc-14
x86_64                randconfig-011-20260530    gcc-14
x86_64                randconfig-012-20260530    gcc-14
x86_64                randconfig-013-20260530    gcc-14
x86_64                randconfig-014-20260530    gcc-14
x86_64                randconfig-015-20260530    gcc-14
x86_64                randconfig-016-20260530    gcc-14
x86_64                randconfig-071-20260530    gcc-14
x86_64                randconfig-072-20260530    gcc-14
x86_64                randconfig-073-20260530    gcc-14
x86_64                randconfig-074-20260530    gcc-14
x86_64                randconfig-075-20260530    gcc-14
x86_64                randconfig-076-20260530    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260530    gcc-9.5.0
xtensa                randconfig-002-20260530    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
