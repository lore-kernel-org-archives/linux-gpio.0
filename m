Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45137C92E
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580266; cv=none; b=aUZ7HzABbJeRTHI3cTAKeKSlOpnN02t9Qt7gdONGJpya6nW4uM7U/1EYECzTIAK+L57zXRWtNSvN2L71U4mebu23K/tMP+v+P12I/Da6ciabHnH1ouEuZNUn3LNJUHg7EBR36lupPjl4k9Cb4/1pIjOJ/KB1UMiGNuvwJ8GlfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580266; c=relaxed/simple;
	bh=bcjnP3hZYGuw+wqWZwcR23OGXMN+wQxp/pXgRdteQfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YJFdqdxLk5pDEGzcJfnOOQ3IhkQnEItxrWhtmAqVX5hY/4df8yKE5Pcg2kcTUciexWOk2eLdsyWhSkGbgQnQ6copyePQjb/yrqbh6pmjElgdIf7+TdH7oyImJ3TsOF9Zx2qYzuGmfDhZ0isNYE2rnGXVVI8i0QFME9XDv/Y5Gtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8+a16i4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8+a16i4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781580264; x=1813116264;
  h=date:from:to:cc:subject:message-id;
  bh=bcjnP3hZYGuw+wqWZwcR23OGXMN+wQxp/pXgRdteQfk=;
  b=E8+a16i4Tl9VfHYIBOQNosh/j1Tl7QDbhz6y+H1O/uE1wTo+702ivGuT
   F0uyCBw0OTaEYU+woFZ/N+er6eYvtiU5FjW9b6NKO/WvDEmK0u6IhOD8r
   e0Q52sp7uf5Y+jVdA2nC8TEgr1Fq3cHYIa0C0hCPdd52JxI5o/JyW32cJ
   BV00K+mHoV296t1y92zAudmOzpKuIUbbTs078AaHzIW94m87tVo7TJzwo
   +H/LJgAU5WWqhLgajwICKw/1DifZFiTb6GFbcJ40Dbam1UuSCBHo6+d3f
   9vDCZBklXNx5qTwN/ZLsiAMsiyQCWvyTjYv/EUzLJwOZkfGVscG5JRdsT
   A==;
X-CSE-ConnectionGUID: P85T2eUmT8i7zfvpf7PHVQ==
X-CSE-MsgGUID: EEEQmMisTLGNv9HzayXYtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82440909"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82440909"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 20:24:23 -0700
X-CSE-ConnectionGUID: aZrIpfmoQsWnxewGtSkGUQ==
X-CSE-MsgGUID: LSn/RTO8RT+gc3kMTThP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="252627382"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2026 20:24:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZKPT-00000000SfI-1Rbf;
	Tue, 16 Jun 2026 03:24:19 +0000
Date: Tue, 16 Jun 2026 11:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 8b2c4f88c6ee86efdbc81bed1684e13e2efebd53
Message-ID: <202606161152.Pmw8mEUz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 8b2c4f88c6ee86efdbc81bed1684e13e2efebd53  pinctrl: Export pinctrl_get_group_selector()

elapsed time: 836m

configs tested: 197
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
arm64                 randconfig-002-20260616    gcc-13.4.0
arm64                 randconfig-003-20260616    gcc-13.4.0
arm64                 randconfig-004-20260616    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260616    gcc-13.4.0
csky                  randconfig-002-20260616    gcc-13.4.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260616    clang-23
hexagon               randconfig-002-20260616    clang-23
i386                             allmodconfig    clang-22
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
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260616    clang-23
nios2                 randconfig-002-20260616    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260616    gcc-8.5.0
parisc                randconfig-002-20260616    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      ep88xc_defconfig    gcc-16.1.0
powerpc                      pmac32_defconfig    clang-23
powerpc               randconfig-001-20260616    gcc-8.5.0
powerpc               randconfig-002-20260616    gcc-8.5.0
powerpc64             randconfig-001-20260616    gcc-8.5.0
powerpc64             randconfig-002-20260616    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-13.4.0
riscv                 randconfig-001-20260615    clang-19
riscv                 randconfig-001-20260616    gcc-16.1.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260615    gcc-16.1.0
riscv                 randconfig-002-20260616    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260615    gcc-11.5.0
s390                  randconfig-001-20260616    gcc-16.1.0
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260615    clang-23
s390                  randconfig-002-20260616    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-14.3.0
sh                    randconfig-001-20260615    gcc-16.1.0
sh                    randconfig-001-20260616    gcc-16.1.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260615    gcc-10.5.0
sh                    randconfig-002-20260616    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260616    gcc-8.5.0
sparc                 randconfig-002-20260616    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260616    gcc-8.5.0
sparc64               randconfig-002-20260616    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260616    gcc-8.5.0
um                    randconfig-002-20260616    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
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
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260616    gcc-8.5.0
xtensa                randconfig-002-20260616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
