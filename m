Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC4A3C4B93
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201728; cv=none; b=PqspX3eurpm7P4NyTAfvZg5C2upXs/pwCoRtIwXDVMeZWP1Fz5m9HGYgoYQ/TlgjYY+MGZJdCZIHbYd0mSqbk6A8beCGQOJnEg1yyUPbEbY2LHbwjwg0ThKmtc+fWQBUrMcny7yudRGQOLGD3+U/YRy53sjLUYhAAiKpQufiqv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201728; c=relaxed/simple;
	bh=QolHjFx4dZ8Ev26x3wek7+GU3hbp5nxV99BhUvWqdT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kc8pvK8ykQSYSiReyydPouxyt+E8wnJoPfjqxYJQhXoRo3hOnojI4JPNkfyBidnho6XCNU28+lyotTK2kO6sLXFFgINIwpgjfk8ouveWMynESZLAAiefk0NQEcw8F1MwqZtqIXjtcrop1vllTZIXasefk19PS2RzMOEIJcVt+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7vuhtny; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7vuhtny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782201727; x=1813737727;
  h=date:from:to:cc:subject:message-id;
  bh=QolHjFx4dZ8Ev26x3wek7+GU3hbp5nxV99BhUvWqdT0=;
  b=Y7vuhtnyFcNZ0r2aI5oA9zFU50B7AEpjqJn69fTQlsCyQ/NM4friSz+p
   O9iEhN/vuaLYMheXHJswW4OKUL7dWw26ep18MlzuNTqROlKpETG5R0Kbx
   j9/5kbsC5+BrMWl3UzmPLQSgNOv7NCnseEJ78/IB+DGg66JyQTG0S0sXN
   j5A2Cs2eK+D4+YIXBX4sRHqNtyh6hxXuqGRWyqwV/5e8hyz6DptU2JSuI
   Gn6GcqcYH796f1Kq7qgStcLN8pqFRZIBUu5Wx8qx749TC5Vqz8Kbnpi1Q
   KiY6hgS3rDcuP+yGZ6bZ5q0hHH1X3Lx9QkC57ngTMxyIFl8bc7GNOQqhW
   Q==;
X-CSE-ConnectionGUID: 4eD9ywQTQTGENY1R7R6cjw==
X-CSE-MsgGUID: 58YHgseKTh2NY6R8pe0B1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83030790"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="83030790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:02:07 -0700
X-CSE-ConnectionGUID: AIYHUiLdSFGm01poXomz2A==
X-CSE-MsgGUID: AWV22rGbQNObFeF9vaPPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="243096810"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 01:02:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbw54-000000002Kz-2E5u;
	Tue, 23 Jun 2026 08:02:02 +0000
Date: Tue, 23 Jun 2026 16:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 9068c631d5af20000d873e4f299fa0bac4e294d9
Message-ID: <202606231631.JqVmM4b4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 9068c631d5af20000d873e4f299fa0bac4e294d9  gpio: tb10x: fix struct tb10x_gpio kernel-doc

elapsed time: 735m

configs tested: 196
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260623    clang-23
arc                   randconfig-002-20260623    clang-23
arc                           tb10x_defconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260623    clang-23
arm                   randconfig-002-20260623    clang-23
arm                   randconfig-003-20260623    clang-23
arm                   randconfig-004-20260623    clang-23
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260623    gcc-14.3.0
arm64                 randconfig-002-20260623    gcc-14.3.0
arm64                 randconfig-003-20260623    gcc-14.3.0
arm64                 randconfig-004-20260623    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260623    gcc-14.3.0
csky                  randconfig-002-20260623    gcc-14.3.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260623    gcc-11.5.0
hexagon               randconfig-001-20260623    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260623    gcc-11.5.0
hexagon               randconfig-002-20260623    gcc-8.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260623    gcc-14
i386        buildonly-randconfig-002-20260623    gcc-14
i386        buildonly-randconfig-003-20260623    gcc-14
i386        buildonly-randconfig-004-20260623    gcc-14
i386        buildonly-randconfig-005-20260623    gcc-14
i386        buildonly-randconfig-006-20260623    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260623    clang-22
i386                  randconfig-002-20260623    clang-22
i386                  randconfig-003-20260623    clang-22
i386                  randconfig-004-20260623    clang-22
i386                  randconfig-005-20260623    clang-22
i386                  randconfig-006-20260623    clang-22
i386                  randconfig-007-20260623    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260623    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260623    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260623    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260623    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260623    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260623    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260623    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260623    gcc-11.5.0
loongarch             randconfig-001-20260623    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260623    gcc-11.5.0
loongarch             randconfig-002-20260623    gcc-8.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                       m5249evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260623    gcc-11.5.0
nios2                 randconfig-001-20260623    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260623    gcc-11.5.0
nios2                 randconfig-002-20260623    gcc-8.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260623    gcc-11.5.0
parisc                randconfig-002-20260623    gcc-11.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      ppc44x_defconfig    clang-17
powerpc               randconfig-001-20260623    gcc-11.5.0
powerpc               randconfig-002-20260623    gcc-11.5.0
powerpc64             randconfig-001-20260623    gcc-11.5.0
powerpc64             randconfig-002-20260623    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260623    gcc-8.5.0
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260623    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260623    gcc-8.5.0
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260623    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260623    gcc-8.5.0
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260623    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260623    gcc-8.5.0
sparc                 randconfig-002-20260623    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260623    gcc-8.5.0
sparc64               randconfig-002-20260623    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260623    gcc-8.5.0
um                    randconfig-002-20260623    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260623    clang-22
x86_64      buildonly-randconfig-002-20260623    clang-22
x86_64      buildonly-randconfig-003-20260623    clang-22
x86_64      buildonly-randconfig-004-20260623    clang-22
x86_64      buildonly-randconfig-005-20260623    clang-22
x86_64      buildonly-randconfig-006-20260623    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260623    gcc-14
x86_64                randconfig-002-20260623    gcc-14
x86_64                randconfig-003-20260623    gcc-14
x86_64                randconfig-004-20260623    gcc-14
x86_64                randconfig-005-20260623    gcc-14
x86_64                randconfig-006-20260623    gcc-14
x86_64                randconfig-011-20260623    gcc-14
x86_64                randconfig-012-20260623    gcc-14
x86_64                randconfig-013-20260623    gcc-14
x86_64                randconfig-014-20260623    gcc-14
x86_64                randconfig-015-20260623    gcc-14
x86_64                randconfig-016-20260623    gcc-14
x86_64                randconfig-071-20260623    gcc-14
x86_64                randconfig-072-20260623    gcc-14
x86_64                randconfig-073-20260623    gcc-14
x86_64                randconfig-074-20260623    gcc-14
x86_64                randconfig-075-20260623    gcc-14
x86_64                randconfig-076-20260623    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260623    gcc-8.5.0
xtensa                randconfig-002-20260623    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
