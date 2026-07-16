Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301932F75B
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170796; cv=none; b=JC7j7imtf0qoIoiiUwzis5KUXZ3KMCMk4G/qAOcl9OVLJBY3PcDjBlIQPi4VC3hmaG515eLmoDW/vZND9c+zxTgdoWjt2J1+KGzGxSZqL37wu64hVtlWDbe5Z+vO2J7X5fLndOxR8otXac4rDrjJ0qfiHM48hiQFqKsqD/A4zqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170796; c=relaxed/simple;
	bh=tWlB8Bx4E1LhdU0gUIDsowdS4KnfQlG9BguMtBr/RKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MXWciVeYFvqbSbTR7KMsvnzBXhcMq26bnbpVSHpJVshwTxryCw7XZnRH9SWVX1vrb6cSqX1YQUKxlnKMhpyC+YTvBvGUG9MeQsZwMRupLga8HhXa++Z8hTErEHd+LUXTyZzI9HLQqVSglsx3xEu93Faly7nSRySX1wBKj8t6Gx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRizVsY7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRizVsY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784170794; x=1815706794;
  h=date:from:to:cc:subject:message-id;
  bh=tWlB8Bx4E1LhdU0gUIDsowdS4KnfQlG9BguMtBr/RKE=;
  b=PRizVsY7fEniwusoavAPdH8GYpCgexZ+QXCA4Zh21dYbk44yZDwgazj4
   gA+s4RUW+l7ag+CTPXN3EN2uHVjIGrjxntUS75TI8G8yfJHC0xxIcMWIB
   ptdtK62U4xxhTnNMRHD/HuNoaB2fzbWywsDUJO3eoRZWt5yzctmDsdiH8
   cnqwr67djJx3bvKJJhMV1eNTdR9zWXJmMQLz2yduuMXuMM2dEFK+Yqfl3
   um/BI4aQUPcF/hSU7+qBg5p1qO3ZC0zXU8/TSGyypKYyuV5EMsiPNUonV
   bmjrY3YiOvpwGmtj75y0aiBAI4GD2JdqbBzMK/9rQsHl7X5Wi9mZPvabv
   A==;
X-CSE-ConnectionGUID: g9Si92PYS0a8gqQ1HMbKVA==
X-CSE-MsgGUID: ZaFNtTUCS3ayNrihALNhBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84704406"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84704406"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:59:53 -0700
X-CSE-ConnectionGUID: rMuw8h8LQfGUCs5ITlQoCg==
X-CSE-MsgGUID: pw2MeaI8SpCw1NpUtNV9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="252959234"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jul 2026 19:59:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkCK6-00000000OFe-1hkW;
	Thu, 16 Jul 2026 02:59:47 +0000
Date: Thu, 16 Jul 2026 10:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 a8e59e3ac9f7f7154e0e80f45933799da8b4dc89
Message-ID: <202607161008.ot3rJ2hR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a8e59e3ac9f7f7154e0e80f45933799da8b4dc89  gpio: bd72720: make read-only const arrays regs static

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com

    Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

Warning ids grouped by kconfigs:

recent_errors
|-- arc-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- nios2-randconfig-001-20260715
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- nios2-randconfig-002-20260715
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
`-- riscv-allmodconfig
    `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info

elapsed time: 721m

configs tested: 156
configs skipped: 22

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260716    clang-23
arc                   randconfig-002-20260716    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260716    clang-23
arm                   randconfig-002-20260716    clang-23
arm                   randconfig-003-20260716    clang-23
arm                   randconfig-004-20260716    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260716    gcc-12.5.0
arm64                 randconfig-002-20260716    gcc-12.5.0
arm64                 randconfig-003-20260716    gcc-12.5.0
arm64                 randconfig-004-20260716    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260716    gcc-12.5.0
csky                  randconfig-002-20260716    gcc-12.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260715    clang-17
hexagon               randconfig-001-20260716    clang-20
hexagon               randconfig-002-20260715    clang-17
hexagon               randconfig-002-20260716    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260716    clang-22
i386                  randconfig-002-20260716    clang-22
i386                  randconfig-003-20260716    clang-22
i386                  randconfig-004-20260716    clang-22
i386                  randconfig-005-20260716    clang-22
i386                  randconfig-006-20260716    clang-22
i386                  randconfig-007-20260716    clang-22
i386                  randconfig-011-20260716    clang-22
i386                  randconfig-012-20260716    clang-22
i386                  randconfig-013-20260716    clang-22
i386                  randconfig-014-20260716    clang-22
i386                  randconfig-015-20260716    clang-22
i386                  randconfig-016-20260716    clang-22
i386                  randconfig-017-20260716    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260715    gcc-16.1.0
loongarch             randconfig-001-20260716    clang-20
loongarch             randconfig-002-20260715    gcc-16.1.0
loongarch             randconfig-002-20260716    clang-20
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260715    gcc-11.5.0
nios2                 randconfig-001-20260716    clang-20
nios2                 randconfig-002-20260715    gcc-11.5.0
nios2                 randconfig-002-20260716    clang-20
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260716    clang-19
parisc                randconfig-002-20260716    clang-19
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260716    clang-19
powerpc               randconfig-002-20260716    clang-19
powerpc64             randconfig-001-20260716    clang-19
powerpc64             randconfig-002-20260716    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260716    clang-17
riscv                 randconfig-002-20260716    clang-17
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                  randconfig-001-20260716    clang-17
s390                  randconfig-002-20260716    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260716    clang-17
sh                    randconfig-002-20260716    clang-17
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260716    gcc-13.4.0
sparc                 randconfig-002-20260716    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260716    gcc-13.4.0
sparc64               randconfig-002-20260716    gcc-13.4.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260716    gcc-13.4.0
um                    randconfig-002-20260716    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260716    gcc-14
x86_64      buildonly-randconfig-002-20260716    gcc-14
x86_64      buildonly-randconfig-003-20260716    gcc-14
x86_64      buildonly-randconfig-004-20260716    gcc-14
x86_64      buildonly-randconfig-005-20260716    gcc-14
x86_64      buildonly-randconfig-006-20260716    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260716    clang-22
x86_64                randconfig-002-20260716    clang-22
x86_64                randconfig-003-20260716    clang-22
x86_64                randconfig-004-20260716    clang-22
x86_64                randconfig-005-20260716    clang-22
x86_64                randconfig-006-20260716    clang-22
x86_64                randconfig-013-20260716    gcc-14
x86_64                randconfig-016-20260716    gcc-14
x86_64                randconfig-074-20260716    gcc-14
x86_64                randconfig-076-20260716    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260716    gcc-13.4.0
xtensa                randconfig-002-20260716    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
