Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5E346AC0
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644624; cv=none; b=MNdLnFx9bQbApSt4ICKTdrXLsoMGlwRgtb959JbvvpH1rkvwg1n9ojvCS8Xvy37m3+AAltLYqR9AhxZjpdbgOWMZjYZ/8e2C4gOTZx7M6Pn4Xxa0WUJs5Vug8kFs7eQAjZxWnyG2xciJDNW2150iqVs4sjpFRajXyKKBksjn3zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644624; c=relaxed/simple;
	bh=mMcFTA+A/mmxYFqKb5cUPwhWUPtmsp+bpHRuC1tqbds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/OKt/r/Zxf7Ela/F8dyUNI3DBDM1visySrbEmlOLk9i9u/8PcrY69YIjzurjpeY6c5JyVsTo0Dad0lXrnjpg8SjtdhY6lts+r4UOpt6853T+Q29/UVxl59HDrYnfryN4vX7OXK2AnLJxfCcKM/880b2yGCV1D1zFQ8Qg2aOfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Il4CSRdP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Il4CSRdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780644623; x=1812180623;
  h=date:from:to:cc:subject:message-id;
  bh=mMcFTA+A/mmxYFqKb5cUPwhWUPtmsp+bpHRuC1tqbds=;
  b=Il4CSRdPlbD9o1WiVwbpRS40VkM8/Bo9yl7j8jTKnNDjFQQa/DSLfT1/
   sO5sbI/TdpQCywGSI2f45pm2vRvHXOPLyWBqVu/VKy4IUJxiX4VMR3vfb
   H/CDrJpFaBWGnKSpYNDUlK9lWdR+OewwtYNhiNlSok40TroCaOP0LeHPE
   v022HRSH+SoIMPNPstp5T5Hk7au9aIoP535YZ3rT4e+08gIehvDF5C8Kj
   WgQgsiPue4WPalwBPa+5JLEyTrMmoSgOUljimbCpKL3wJQo/+BHEWLCGr
   Ij0MIepsY6F5xV3qZX5A3J2HWoewc875fSoZqXzaMFIcvsF98HP7UVqTY
   Q==;
X-CSE-ConnectionGUID: 7hZHLrjRQBG3I4SdleEzyw==
X-CSE-MsgGUID: 4i/FVHG/TPyxZEu7Ujiivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="84058354"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="84058354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:30:22 -0700
X-CSE-ConnectionGUID: XknGcl/TTD+RSxnxIWDODQ==
X-CSE-MsgGUID: BSZWnHPzTy6onJR7DMLEBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="248705441"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2026 00:30:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVP0T-00000000FgQ-3ecf;
	Fri, 05 Jun 2026 07:30:17 +0000
Date: Fri, 05 Jun 2026 15:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 57ae58c5506ade17df728d676a0c73c705f21f57
Message-ID: <202606051529.dgvxDYV6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 57ae58c5506ade17df728d676a0c73c705f21f57  Merge branch 'devel' into for-next

elapsed time: 4896m

configs tested: 305
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-17
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260603    gcc-8.5.0
arc                   randconfig-001-20260604    clang-17
arc                   randconfig-002-20260603    gcc-8.5.0
arc                   randconfig-002-20260604    clang-17
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-17
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260603    gcc-8.5.0
arm                   randconfig-001-20260604    clang-17
arm                   randconfig-002-20260603    gcc-8.5.0
arm                   randconfig-002-20260604    clang-17
arm                   randconfig-003-20260603    gcc-8.5.0
arm                   randconfig-003-20260604    clang-17
arm                   randconfig-004-20260603    gcc-8.5.0
arm                   randconfig-004-20260604    clang-17
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260603    gcc-15.2.0
arm64                 randconfig-001-20260604    clang-17
arm64                 randconfig-002-20260603    gcc-15.2.0
arm64                 randconfig-002-20260604    clang-17
arm64                 randconfig-003-20260603    gcc-15.2.0
arm64                 randconfig-003-20260604    clang-17
arm64                 randconfig-004-20260603    gcc-15.2.0
arm64                 randconfig-004-20260604    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260603    gcc-15.2.0
csky                  randconfig-001-20260604    clang-17
csky                  randconfig-002-20260603    gcc-15.2.0
csky                  randconfig-002-20260604    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260603    gcc-11.5.0
hexagon               randconfig-001-20260604    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260603    gcc-11.5.0
hexagon               randconfig-002-20260604    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260603    clang-20
i386        buildonly-randconfig-001-20260604    clang-20
i386        buildonly-randconfig-002-20260603    clang-20
i386        buildonly-randconfig-002-20260604    clang-20
i386        buildonly-randconfig-003-20260603    clang-20
i386        buildonly-randconfig-003-20260604    clang-20
i386        buildonly-randconfig-004-20260603    clang-20
i386        buildonly-randconfig-004-20260604    clang-20
i386        buildonly-randconfig-005-20260603    clang-20
i386        buildonly-randconfig-005-20260604    clang-20
i386        buildonly-randconfig-006-20260603    clang-20
i386        buildonly-randconfig-006-20260604    clang-20
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260603    clang-22
i386                  randconfig-001-20260604    clang-20
i386                  randconfig-002-20260603    clang-22
i386                  randconfig-002-20260604    clang-20
i386                  randconfig-003-20260603    clang-22
i386                  randconfig-003-20260604    clang-20
i386                  randconfig-004-20260603    clang-22
i386                  randconfig-004-20260604    clang-20
i386                  randconfig-005-20260603    clang-22
i386                  randconfig-005-20260604    clang-20
i386                  randconfig-006-20260603    clang-22
i386                  randconfig-006-20260604    clang-20
i386                  randconfig-007-20260603    clang-22
i386                  randconfig-007-20260604    clang-20
i386                  randconfig-011-20260603    clang-22
i386                  randconfig-011-20260604    gcc-14
i386                  randconfig-012-20260603    clang-22
i386                  randconfig-012-20260604    gcc-14
i386                  randconfig-013-20260603    clang-22
i386                  randconfig-013-20260604    gcc-14
i386                  randconfig-014-20260603    clang-22
i386                  randconfig-014-20260604    gcc-14
i386                  randconfig-015-20260603    clang-22
i386                  randconfig-015-20260604    gcc-14
i386                  randconfig-016-20260603    clang-22
i386                  randconfig-016-20260604    gcc-14
i386                  randconfig-017-20260603    clang-22
i386                  randconfig-017-20260604    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260603    gcc-11.5.0
loongarch             randconfig-001-20260604    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260603    gcc-11.5.0
loongarch             randconfig-002-20260604    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-17
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-17
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260603    gcc-11.5.0
nios2                 randconfig-001-20260604    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260603    gcc-11.5.0
nios2                 randconfig-002-20260604    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-17
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-17
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260603    gcc-8.5.0
parisc                randconfig-001-20260604    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260603    gcc-8.5.0
parisc                randconfig-002-20260604    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-17
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260603    gcc-8.5.0
powerpc               randconfig-001-20260604    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260603    gcc-8.5.0
powerpc               randconfig-002-20260604    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260603    gcc-8.5.0
powerpc64             randconfig-001-20260604    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260603    gcc-8.5.0
powerpc64             randconfig-002-20260604    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-17
riscv                            allyesconfig    clang-17
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    clang-23
riscv                          randconfig-001    clang-17
riscv                 randconfig-001-20260603    gcc-14.3.0
riscv                 randconfig-001-20260604    clang-17
riscv                          randconfig-002    clang-17
riscv                 randconfig-002-20260603    gcc-14.3.0
riscv                 randconfig-002-20260604    clang-17
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-17
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-17
s390                  randconfig-001-20260603    gcc-14.3.0
s390                  randconfig-001-20260604    clang-17
s390                           randconfig-002    clang-17
s390                  randconfig-002-20260603    gcc-14.3.0
s390                  randconfig-002-20260604    clang-17
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-17
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-17
sh                    randconfig-001-20260603    gcc-14.3.0
sh                    randconfig-001-20260604    clang-17
sh                             randconfig-002    clang-17
sh                    randconfig-002-20260603    gcc-14.3.0
sh                    randconfig-002-20260604    clang-17
sh                          urquell_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-17
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-11.5.0
sparc                 randconfig-001-20260603    gcc-15.2.0
sparc                 randconfig-001-20260604    gcc-11.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260603    gcc-15.2.0
sparc                 randconfig-002-20260604    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64               randconfig-001-20260603    gcc-15.2.0
sparc64               randconfig-001-20260604    gcc-11.5.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64               randconfig-002-20260603    gcc-15.2.0
sparc64               randconfig-002-20260604    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                    randconfig-001-20260603    gcc-15.2.0
um                    randconfig-001-20260604    gcc-11.5.0
um                             randconfig-002    gcc-11.5.0
um                    randconfig-002-20260603    gcc-15.2.0
um                    randconfig-002-20260604    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-17
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    clang-20
x86_64      buildonly-randconfig-001-20260603    clang-20
x86_64      buildonly-randconfig-001-20260604    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260603    clang-20
x86_64      buildonly-randconfig-002-20260604    gcc-14
x86_64               buildonly-randconfig-003    clang-20
x86_64      buildonly-randconfig-003-20260603    clang-20
x86_64      buildonly-randconfig-003-20260604    gcc-14
x86_64               buildonly-randconfig-004    clang-20
x86_64      buildonly-randconfig-004-20260603    clang-20
x86_64      buildonly-randconfig-004-20260604    gcc-14
x86_64               buildonly-randconfig-005    clang-20
x86_64      buildonly-randconfig-005-20260603    clang-20
x86_64      buildonly-randconfig-005-20260604    gcc-14
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260603    clang-20
x86_64      buildonly-randconfig-006-20260604    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260603    clang-20
x86_64                randconfig-001-20260604    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260603    clang-20
x86_64                randconfig-002-20260604    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260603    clang-20
x86_64                randconfig-003-20260604    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260603    clang-20
x86_64                randconfig-004-20260604    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260603    clang-20
x86_64                randconfig-005-20260604    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260603    clang-20
x86_64                randconfig-006-20260604    clang-20
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260603    clang-22
x86_64                randconfig-011-20260604    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260603    clang-22
x86_64                randconfig-012-20260604    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260603    clang-22
x86_64                randconfig-013-20260604    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260603    clang-22
x86_64                randconfig-014-20260604    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260603    clang-22
x86_64                randconfig-015-20260604    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260603    clang-22
x86_64                randconfig-016-20260604    clang-22
x86_64                randconfig-071-20260603    clang-22
x86_64                randconfig-071-20260604    clang-22
x86_64                randconfig-071-20260605    gcc-12
x86_64                randconfig-072-20260603    clang-22
x86_64                randconfig-072-20260604    clang-22
x86_64                randconfig-072-20260605    gcc-12
x86_64                randconfig-073-20260603    clang-22
x86_64                randconfig-073-20260604    clang-22
x86_64                randconfig-073-20260605    gcc-12
x86_64                randconfig-074-20260603    clang-22
x86_64                randconfig-074-20260604    clang-22
x86_64                randconfig-074-20260605    gcc-12
x86_64                randconfig-075-20260603    clang-22
x86_64                randconfig-075-20260604    clang-22
x86_64                randconfig-075-20260605    gcc-12
x86_64                randconfig-076-20260603    clang-22
x86_64                randconfig-076-20260604    clang-22
x86_64                randconfig-076-20260605    gcc-12
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-17
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-11.5.0
xtensa                randconfig-001-20260603    gcc-15.2.0
xtensa                randconfig-001-20260604    gcc-11.5.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                randconfig-002-20260603    gcc-15.2.0
xtensa                randconfig-002-20260604    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
