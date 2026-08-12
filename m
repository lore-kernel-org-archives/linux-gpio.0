Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209340DB2C
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533212; cv=none; b=swRZpqUQT4p8Ila2dvxjV21JgbA2xmNvdZCgP0mZjqcbCsYfeC5m5lJGi9s6bYw2aV58Jtn2hF7Iu9t9LeHP4ExAqI1by/7AwmbHD/5HrSgicEmtrluSMazhRHGFFH7Sx8tQj/sM0ewMu0vmcT6uLUiRJ4OxVJJRiurG+GJMrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533212; c=relaxed/simple;
	bh=bV2CoI4HIdgSKwMpjPpt4f5ZFBfeARgBMrj2nnJL2RA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SdoL4dajuifEsS/CLDkIcXqHX2QRMYrMSPR/YuaHSzIxKmU4WWSYRqUOMIhW6c71NS/CNQrjJ91nIaFlKp/pAkBStPIn29WmL3hXeUV6nQcspe9W2UwThnPzgIxL2QzpK3NASGqR5TRqcAisEY0bcd8ol5fArR70LceeBOGmsmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hr6JdP5t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hr6JdP5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786533210; x=1818069210;
  h=date:from:to:cc:subject:message-id;
  bh=bV2CoI4HIdgSKwMpjPpt4f5ZFBfeARgBMrj2nnJL2RA=;
  b=hr6JdP5t1xvUF0scCdKsmjVIQjtHg9krlQ7HJ3RfsPQGO2hr5JSQCu8/
   pOW00XW59SdvfCq6BRJqg4FZWgOMaMMp6dQgatSJD7igYI82GfltnZ4cK
   jLq6PMz6NOPjUPfduRd4CAOjNnRRIea2HKzgSr3nY/w5+Jt0mfHXMRR6q
   61xxu+AfFcGC6XFHZ+bPU/YlOcLYxpG8T2S4KId5rfWBdEsSv30xw8ctN
   xm/7TajydJXAQz4fFfwhGL98gkb+QRL0fUbrBNE/IbCIXy87DfibAIXcV
   CBZgimhZZwbltJg+xBOOwk423kMqrVYVN7hzwCFlDZpRpTIIvBJF9nkF1
   w==;
X-CSE-ConnectionGUID: 9QGWLIkFRVq8B8Kd8n5vtQ==
X-CSE-MsgGUID: y3yrAKfET3e/hLI3ebhlZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86844025"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86844025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:13:29 -0700
X-CSE-ConnectionGUID: LltNRFwHSJOJN9l27fZRYw==
X-CSE-MsgGUID: BSQDNuu6STKe3IL5tahwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="288367396"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 04:13:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu6tN-00000000QSA-2bL0;
	Wed, 12 Aug 2026 11:13:05 +0000
Date: Wed, 12 Aug 2026 19:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 44f3468a0aef1aabdad551898ab7cfa2a9d20e99
Message-ID: <202608121946.xBLoI82r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 44f3468a0aef1aabdad551898ab7cfa2a9d20e99  gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind

elapsed time: 1508m

configs tested: 208
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260811    gcc-11.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260811    gcc-11.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260811    gcc-11.5.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260811    gcc-11.5.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260811    gcc-11.5.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260811    gcc-11.5.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm                        vf610m4_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260811    gcc-13.4.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260811    gcc-13.4.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260811    gcc-13.4.0
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260811    gcc-13.4.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260811    gcc-13.4.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260811    gcc-13.4.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon                       randconfig-001    gcc-8.5.0
hexagon              randconfig-001-20260811    clang-24
hexagon              randconfig-001-20260811    gcc-8.5.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260811    clang-22
hexagon              randconfig-002-20260811    gcc-8.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260811    gcc-14
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260811    gcc-14
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260811    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260811    gcc-14
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260811    gcc-14
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260811    gcc-14
i386       buildonly-randconfig-006-20260812    clang-22
i386                          randconfig-001    clang-22
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260811    gcc-14
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260811    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260811    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260811    gcc-14
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260811    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260811    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260811    gcc-14
i386                 randconfig-007-20260812    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260811    gcc-14
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260811    gcc-14
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260811    gcc-14
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260811    gcc-14
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260811    gcc-14
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260811    gcc-14
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260811    gcc-14
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260811    gcc-15.2.0
loongarch            randconfig-001-20260811    gcc-8.5.0
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260811    clang-24
loongarch            randconfig-002-20260811    gcc-8.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                       bcm63xx_defconfig    clang-24
mips                    cu1000-neo_defconfig    gcc-16.1.0
mips                          ip22_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260811    gcc-8.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260811    gcc-8.5.0
nios2                randconfig-002-20260811    gcc-9.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-15.2.0
parisc               randconfig-001-20260811    gcc-15.2.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-002-20260811    gcc-15.2.0
parisc               randconfig-002-20260812    clang-17
powerpc              randconfig-001-20260811    gcc-15.2.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-002-20260811    gcc-15.2.0
powerpc              randconfig-002-20260812    clang-17
powerpc64            randconfig-001-20260811    gcc-15.2.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260811    gcc-15.2.0
powerpc64            randconfig-002-20260812    clang-17
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260811    clang-24
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260811    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260811    clang-24
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260811    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260811    clang-24
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260811    clang-24
sh                   randconfig-002-20260812    clang-24
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260811    gcc-8.5.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260811    gcc-8.5.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260811    gcc-8.5.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260811    gcc-8.5.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260811    gcc-8.5.0
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260811    gcc-8.5.0
um                   randconfig-002-20260812    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-12
x86_64     buildonly-randconfig-001-20260811    gcc-12
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260811    gcc-12
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260811    gcc-12
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260811    gcc-12
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260811    gcc-12
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260811    gcc-12
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260811    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260811    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260811    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260811    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260811    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260811    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260811    gcc-14
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260811    gcc-14
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260811    gcc-14
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260811    gcc-14
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260811    gcc-14
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260811    gcc-14
x86_64               randconfig-016-20260812    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260811    gcc-14
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260811    gcc-14
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260811    gcc-14
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260811    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260811    gcc-14
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260811    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260811    gcc-8.5.0
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260811    gcc-8.5.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
