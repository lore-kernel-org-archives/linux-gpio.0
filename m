Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0492FDC5E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388939; cv=none; b=Di16QN0wYHCEaFnNm9vh9l4lmQe8gTasMYviVxz03/QFD5yQX6jyVkkx2A554wau/RcOFcf4Z/zW0UckQRetNadq0Qi0A5EW02QsZCk3C7IuuCzviQUSfn9Wsb1OxHigXYy9daD4zy366kluq7a6gzskPsyuADTPX11JJjWdUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388939; c=relaxed/simple;
	bh=fWaFF89JyQpNW2toSzlPwWO1xDZ9CcO5Y1JeZ1OPOJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R9PdQLn/Wq88urXHohrd/sfhkBA/bsJq4eJ7cGZoMfnPVyVrtxQF2R3pmyQqO1E6JS/hWnOhZHq0RrWfk2JKyP/e5dLHaErmTjAUH3J0jupZpdZobDZmPh+2bgV0tGIgg2gXrwDSSPmEvdtt1m87MF28ywu5CJDxjywhKVvRlhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZltDNYx4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZltDNYx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783388938; x=1814924938;
  h=date:from:to:cc:subject:message-id;
  bh=fWaFF89JyQpNW2toSzlPwWO1xDZ9CcO5Y1JeZ1OPOJw=;
  b=ZltDNYx4mPqtsNBl5aNEDcgF15bC3gTlKbilzWQ8g5MKCPf45qsizNE2
   sy/G5g6ZHaeZzpHceNA33OEMjg1xnOssbjsYtlUX1f8SO1TX0/ET77s2v
   g7fjpBRJHwhyLFN0go1DJWZ99gYJCdZR+DqeEnmrtlogmTNfCPDCIaBCh
   PBi1EYF3Pr2v04c50LXGnHSuVyFTL9WFr68pP9hnGsad8uplQkLdrDEWg
   4NoFPieLk8/N8mNngDDUT4RrCd9X5adfcXgPimG5vYXc7SjTrhgpnaQSc
   Nnu3NSjubUX6+p652j11q3+Slvx1aU0yRPQ5EzvfIiEJZc9sfcPGgfHun
   A==;
X-CSE-ConnectionGUID: jiZnouYQRl2toVXL2pOGXw==
X-CSE-MsgGUID: EPlzr/nHTpuyztNg0lGqrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84218689"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="84218689"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 18:48:57 -0700
X-CSE-ConnectionGUID: AqRsyTM9TMip8dZUpvOkIg==
X-CSE-MsgGUID: DAPnkCgdSxO69Hhekyv/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="253393412"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Jul 2026 18:48:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wguvc-00000000Evz-43wC;
	Tue, 07 Jul 2026 01:48:52 +0000
Date: Tue, 07 Jul 2026 09:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 db4a79713ed8e252d5e4edf6eaaa80948b6855a2
Message-ID: <202607070933.F8yU9VSu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: db4a79713ed8e252d5e4edf6eaaa80948b6855a2  gpios: palmas: add .get_direction() op

elapsed time: 892m

configs tested: 146
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260707    gcc-14.3.0
arc                   randconfig-002-20260707    gcc-12.5.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-16.1.0
arm                   randconfig-001-20260707    gcc-8.5.0
arm                   randconfig-002-20260707    clang-17
arm                   randconfig-003-20260707    clang-17
arm                   randconfig-004-20260707    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                 randconfig-001-20260707    clang-23
arm64                 randconfig-002-20260707    clang-18
arm64                 randconfig-003-20260707    clang-23
arm64                 randconfig-004-20260707    clang-17
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                  randconfig-001-20260707    gcc-16.1.0
csky                  randconfig-002-20260707    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260706    clang-17
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260706    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260707    clang-22
i386        buildonly-randconfig-002-20260707    clang-22
i386        buildonly-randconfig-003-20260707    clang-22
i386        buildonly-randconfig-004-20260707    gcc-14
i386        buildonly-randconfig-005-20260707    clang-22
i386        buildonly-randconfig-006-20260707    clang-22
i386                                defconfig    clang-22
i386                  randconfig-001-20260707    gcc-13
i386                  randconfig-002-20260707    clang-22
i386                  randconfig-003-20260707    clang-22
i386                  randconfig-004-20260707    gcc-14
i386                  randconfig-005-20260707    clang-22
i386                  randconfig-006-20260707    clang-22
i386                  randconfig-007-20260707    clang-22
i386                  randconfig-011-20260707    gcc-14
i386                  randconfig-012-20260707    gcc-14
i386                  randconfig-014-20260707    gcc-14
i386                  randconfig-015-20260707    gcc-14
i386                  randconfig-016-20260707    gcc-14
i386                  randconfig-017-20260707    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260706    gcc-16.1.0
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260706    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260706    gcc-11.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260706    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260707    gcc-15.2.0
parisc                randconfig-002-20260707    gcc-9.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     asp8347_defconfig    clang-23
powerpc               randconfig-001-20260707    clang-23
powerpc               randconfig-002-20260707    gcc-14.3.0
powerpc64             randconfig-001-20260707    gcc-8.5.0
powerpc64             randconfig-002-20260707    clang-22
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260707    gcc-14.3.0
riscv                 randconfig-002-20260707    gcc-8.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260707    clang-21
s390                  randconfig-002-20260707    gcc-13.4.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260707    gcc-16.1.0
sh                    randconfig-002-20260707    gcc-16.1.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260707    gcc-13.4.0
sparc                 randconfig-002-20260707    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260707    gcc-8.5.0
sparc64               randconfig-002-20260707    clang-23
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260707    clang-18
um                    randconfig-002-20260707    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-002-20260707    clang-22
x86_64      buildonly-randconfig-004-20260707    clang-22
x86_64      buildonly-randconfig-006-20260707    clang-22
x86_64                              defconfig    gcc-14
x86_64                randconfig-002-20260707    gcc-14
x86_64                randconfig-011-20260707    clang-22
x86_64                randconfig-012-20260707    gcc-14
x86_64                randconfig-013-20260707    clang-22
x86_64                randconfig-014-20260707    gcc-14
x86_64                randconfig-015-20260707    gcc-14
x86_64                randconfig-016-20260707    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260707    gcc-8.5.0
xtensa                randconfig-002-20260707    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
