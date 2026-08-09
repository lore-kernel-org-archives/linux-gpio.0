Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE41DF26E
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 01:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786240066; cv=none; b=OSQKAmxooWFJk85CG03OxGCrrAqMvdSgH17p1ENdrpqpaetdx4q/ddDpNwmR/ITc8YYbKd8KFohnO1cyzfRHXghQXTxn9JKumObgFL69LF735+4zHgWPYbuhn73gETGLvydqFKEb6gW0+k4s9g3a1HsxTe8CqlAkCJw7BehM6PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786240066; c=relaxed/simple;
	bh=LpbIj1CfWZbnOu5iQHKZCOs+hVUx4TDNzcc8TTqMgjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uyRAn4ygd/IDtFN/uN7YioHsBOBmcdEulGm7ON0WYxM3kfy6x886CpI8caOPYFzsB8FikKRg5eLmFae5S6GzAEwOlrGl4dyNqHZjdCGBLRa6ukcGLkLgIihTfZb+rwM4ZZvoLqkX1I1GZJxgV1X1+ca4YJYIAe044hrm59d6Z3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZATEPg0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZATEPg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786240064; x=1817776064;
  h=date:from:to:cc:subject:message-id;
  bh=LpbIj1CfWZbnOu5iQHKZCOs+hVUx4TDNzcc8TTqMgjI=;
  b=QZATEPg0HCgl/uSN5E0xK5ehY704v6I+5hF+073MfTSzdoCWwCEZcfag
   buKoKgHOuZOxoLvOdcUiRGDtDk3755I47K9YuP8+zz8mATIOWAZ9tLFZl
   tjYxcoFJZSdWVHGAG0l3/Hw9WVSDayY3H060bb8Fi7j7kTCx6lXWzZrBh
   ZsYGBqbMDl0vnxoArthLNRd2RUJDiARnMYlN0fc+d+ibOBBtGdMKWd058
   UtABD+ecw0bOo1yj5zm2Vyiv77rrasEN+kHinlmGmaM1xK/2tCWrN3hPf
   uypWGp7uTfM3TZ8fA8XH+ROysj0GGkGQkQNFtZ2d/LtHw+o46cSzHwQgt
   Q==;
X-CSE-ConnectionGUID: qCP+rNKhQfOCK7CE8ebJ1w==
X-CSE-MsgGUID: IRokGP1vSSOkdsDt70QFww==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86826132"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="86826132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 18:47:43 -0700
X-CSE-ConnectionGUID: oArLnYngREO6TLC1/vVdYw==
X-CSE-MsgGUID: OawoYYzmTMGlKmggdRQzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="258417215"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Aug 2026 18:47:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wssdX-00000000LIL-2CCp;
	Sun, 09 Aug 2026 01:47:39 +0000
Date: Sun, 09 Aug 2026 09:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 465f276bb928093685c2a2b98bf0a7ccc4283b8d
Message-ID: <202608090930.IJUPGWho-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 465f276bb928093685c2a2b98bf0a7ccc4283b8d  pinctrl: fix PINCTRL_GENERIC_MUX not always being selectable

elapsed time: 1715m

configs tested: 163
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260808    gcc-9.5.0
arc                  randconfig-001-20260809    gcc-12.5.0
arc                  randconfig-002-20260808    gcc-9.5.0
arc                  randconfig-002-20260809    gcc-12.5.0
arm                  randconfig-001-20260808    gcc-9.5.0
arm                  randconfig-001-20260809    gcc-12.5.0
arm                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-002-20260809    gcc-12.5.0
arm                  randconfig-003-20260808    gcc-9.5.0
arm                  randconfig-003-20260809    gcc-12.5.0
arm                  randconfig-004-20260808    gcc-9.5.0
arm                  randconfig-004-20260809    gcc-12.5.0
arm64                         randconfig-001    gcc-11.5.0
arm64                randconfig-001-20260808    gcc-11.5.0
arm64                randconfig-002-20260808    gcc-11.5.0
arm64                randconfig-003-20260808    gcc-11.5.0
arm64                randconfig-004-20260808    gcc-11.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260808    gcc-11.5.0
csky                 randconfig-002-20260808    gcc-11.5.0
hexagon                       randconfig-001    gcc-12.5.0
hexagon              randconfig-001-20260808    gcc-16.1.0
hexagon              randconfig-001-20260809    gcc-12.5.0
hexagon              randconfig-002-20260808    gcc-16.1.0
hexagon              randconfig-002-20260809    gcc-12.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260808    clang-22
i386       buildonly-randconfig-001-20260809    clang-22
i386       buildonly-randconfig-002-20260808    clang-22
i386       buildonly-randconfig-002-20260809    clang-22
i386       buildonly-randconfig-003-20260808    clang-22
i386       buildonly-randconfig-003-20260809    clang-22
i386       buildonly-randconfig-004-20260808    clang-22
i386       buildonly-randconfig-004-20260809    clang-22
i386       buildonly-randconfig-005-20260808    clang-22
i386       buildonly-randconfig-005-20260809    clang-22
i386       buildonly-randconfig-006-20260808    clang-22
i386       buildonly-randconfig-006-20260809    clang-22
i386                 randconfig-001-20260808    clang-22
i386                 randconfig-002-20260808    clang-22
i386                 randconfig-003-20260808    clang-22
i386                 randconfig-004-20260808    clang-22
i386                 randconfig-005-20260808    clang-22
i386                 randconfig-006-20260808    clang-22
i386                 randconfig-007-20260808    clang-22
i386                 randconfig-011-20260808    clang-22
i386                 randconfig-011-20260809    clang-22
i386                 randconfig-012-20260808    clang-22
i386                 randconfig-012-20260809    clang-22
i386                 randconfig-013-20260808    clang-22
i386                 randconfig-013-20260809    clang-22
i386                 randconfig-014-20260808    clang-22
i386                 randconfig-014-20260809    clang-22
i386                 randconfig-015-20260808    clang-22
i386                 randconfig-015-20260809    clang-22
i386                 randconfig-016-20260808    clang-22
i386                 randconfig-016-20260809    clang-22
i386                 randconfig-017-20260808    clang-22
i386                 randconfig-017-20260809    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260808    gcc-16.1.0
loongarch            randconfig-001-20260809    gcc-12.5.0
loongarch            randconfig-002-20260808    gcc-16.1.0
loongarch            randconfig-002-20260809    gcc-12.5.0
mips                 decstation_64_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260808    gcc-16.1.0
nios2                randconfig-001-20260809    gcc-12.5.0
nios2                randconfig-002-20260808    gcc-16.1.0
nios2                randconfig-002-20260809    gcc-12.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260808    gcc-8.5.0
parisc               randconfig-001-20260809    gcc-8.5.0
parisc               randconfig-002-20260808    gcc-8.5.0
parisc               randconfig-002-20260809    gcc-8.5.0
powerpc              randconfig-001-20260808    gcc-8.5.0
powerpc              randconfig-001-20260809    gcc-8.5.0
powerpc              randconfig-002-20260808    gcc-8.5.0
powerpc              randconfig-002-20260809    gcc-8.5.0
powerpc64            randconfig-001-20260808    gcc-8.5.0
powerpc64            randconfig-001-20260809    gcc-8.5.0
powerpc64            randconfig-002-20260808    gcc-8.5.0
powerpc64            randconfig-002-20260809    gcc-8.5.0
riscv                randconfig-001-20260808    clang-24
riscv                randconfig-001-20260809    clang-24
riscv                randconfig-002-20260808    clang-24
riscv                randconfig-002-20260809    clang-24
s390                 randconfig-001-20260808    clang-24
s390                 randconfig-001-20260809    clang-24
s390                 randconfig-002-20260808    clang-24
s390                 randconfig-002-20260809    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260808    clang-24
sh                   randconfig-001-20260809    clang-24
sh                   randconfig-002-20260808    clang-24
sh                   randconfig-002-20260809    clang-24
sparc                         randconfig-001    gcc-11.5.0
sparc                randconfig-001-20260808    gcc-8.5.0
sparc                randconfig-001-20260809    gcc-11.5.0
sparc                randconfig-002-20260808    gcc-8.5.0
sparc                randconfig-002-20260809    gcc-11.5.0
sparc64              randconfig-001-20260808    gcc-8.5.0
sparc64              randconfig-001-20260809    gcc-11.5.0
sparc64              randconfig-002-20260808    gcc-8.5.0
sparc64              randconfig-002-20260809    gcc-11.5.0
um                   randconfig-001-20260808    gcc-8.5.0
um                   randconfig-001-20260809    gcc-11.5.0
um                   randconfig-002-20260808    gcc-8.5.0
um                   randconfig-002-20260809    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260808    gcc-14
x86_64     buildonly-randconfig-001-20260809    clang-22
x86_64     buildonly-randconfig-002-20260808    gcc-14
x86_64     buildonly-randconfig-002-20260809    clang-22
x86_64     buildonly-randconfig-003-20260808    gcc-14
x86_64     buildonly-randconfig-003-20260809    clang-22
x86_64     buildonly-randconfig-004-20260808    gcc-14
x86_64     buildonly-randconfig-004-20260809    clang-22
x86_64     buildonly-randconfig-005-20260808    gcc-14
x86_64     buildonly-randconfig-005-20260809    clang-22
x86_64     buildonly-randconfig-006-20260808    gcc-14
x86_64     buildonly-randconfig-006-20260809    clang-22
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    clang-22
x86_64               randconfig-001-20260808    clang-22
x86_64               randconfig-001-20260809    clang-22
x86_64               randconfig-002-20260808    clang-22
x86_64               randconfig-002-20260809    clang-22
x86_64               randconfig-003-20260808    clang-22
x86_64               randconfig-003-20260809    clang-22
x86_64               randconfig-004-20260808    clang-22
x86_64               randconfig-004-20260809    clang-22
x86_64               randconfig-005-20260808    clang-22
x86_64               randconfig-005-20260809    clang-22
x86_64               randconfig-006-20260808    clang-22
x86_64               randconfig-006-20260809    clang-22
x86_64               randconfig-011-20260808    clang-22
x86_64               randconfig-012-20260808    clang-22
x86_64               randconfig-013-20260808    clang-22
x86_64               randconfig-014-20260808    clang-22
x86_64               randconfig-015-20260808    clang-22
x86_64               randconfig-016-20260808    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260808    gcc-14
x86_64               randconfig-072-20260808    gcc-14
x86_64               randconfig-073-20260808    gcc-14
x86_64               randconfig-074-20260808    gcc-14
x86_64               randconfig-075-20260808    gcc-14
x86_64               randconfig-076-20260808    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa                 nommu_kc705_defconfig    gcc-16.1.0
xtensa               randconfig-001-20260808    gcc-8.5.0
xtensa               randconfig-001-20260809    gcc-11.5.0
xtensa               randconfig-002-20260808    gcc-8.5.0
xtensa               randconfig-002-20260809    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
