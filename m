Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05573EF0AD
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773688054; cv=none; b=fHrX+wTIBpwcdyXPuMdVEy7SK0Z3kNoX76fdSb+3GaAcdahbEH0XBcx/PONTYQZREO3eUCqelBrxuDPqvVVuZLU6k5FeAREfLeb8zmpUqkmVv0d5EWnlF4DAAGth7Fj1ahZggPO3SJ5W93b3wjKDQwkxL3hAHSqmG+1W2iuIqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773688054; c=relaxed/simple;
	bh=ehGJjgsA+o+9bWpZneD1210XdwNZEy7L3vc+jBTWX74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qwCGU15TWtRdo2InuWjRB9Xzo961fXvEO+RZGRIz6ToAAceqzgVNDyeGtoYLk3GkiF9eC1Nl//BhHaKGrclqf4CN9Tkq/XC73xqz68/0LrS8/s5ilXuebMALzXnwXIBhDMZGojc8mJYD0QWx9YI4kLC3/JQQBYjCAW2vOq1+NSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLuRbUZP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLuRbUZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773688048; x=1805224048;
  h=date:from:to:cc:subject:message-id;
  bh=ehGJjgsA+o+9bWpZneD1210XdwNZEy7L3vc+jBTWX74=;
  b=aLuRbUZPa5ZOLvwckbPSdXBIokDZNGry/q/EkhuJ1FAXlFcqu04RwqfB
   pBkP6axL1qePnOCnMSHgqmet2VhOgZa0rTuBoceX22dsr3h/9v/5UUg9x
   rS3Rt727VYaS1xpddqbE+b1zEeAoN6MYdSHJenDtCsAcbWOzz8K3wulY1
   82LgoczOuivoa49Hql0LbUICWvM2/Ay+QLgpwh/5HZHlUqQUKnXwOTW90
   VEr3gQXcjKOWfIYfom1sMSAtubcOxzEvMBJCzJkT00XiI+MnDXC+xR4Nj
   d8a0dMi9u/G6KWvY3GHAFOHjGu2Oy6YKJ8mVLaPR6SHzG5QqdHWUQvtJb
   A==;
X-CSE-ConnectionGUID: qx2kdTcOTd+0WUwfYLdxqg==
X-CSE-MsgGUID: xxSZMON8TfegbEBwqlR47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="97323535"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="97323535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 12:07:27 -0700
X-CSE-ConnectionGUID: oB1Mqv2iRdCLxZOhf5Hv4Q==
X-CSE-MsgGUID: 22SOPBD2Q7+dj69G5J4j/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222225256"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 12:07:26 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2DHf-0000000019y-1HYz;
	Mon, 16 Mar 2026 19:07:23 +0000
Date: Tue, 17 Mar 2026 03:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless] BUILD SUCCESS WITH
 WARNING f498eb811e7dd7b968743a9bba20710a5070c0be
Message-ID: <202603170306.3zD4Ut8P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
branch HEAD: f498eb811e7dd7b968743a9bba20710a5070c0be  wifi: ath9k: Obtain system GPIOS from descriptors

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202603162011.BYf9zG1R-lkp@intel.com

    drivers/gpio/gpio-ath79.c:264:1: warning: no return statement in function returning non-void [-Wreturn-type]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r072-20260317
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- arc-randconfig-001-20260317
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- arc-randconfig-002-20260317
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- parisc-randconfig-002-20260317
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- s390-allyesconfig
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sparc-randconfig-002-20260316
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- x86_64-buildonly-randconfig-004-20260316
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
`-- xtensa-randconfig-r073-20260317
    `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void

elapsed time: 1433m

configs tested: 93
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260317    gcc-9.5.0
arc                   randconfig-002-20260317    gcc-13.4.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260317    clang-23
arm                   randconfig-002-20260317    clang-23
arm                   randconfig-003-20260317    clang-23
arm                   randconfig-004-20260317    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                  randconfig-001-20260317    gcc-14
i386                  randconfig-002-20260317    clang-20
i386                  randconfig-003-20260317    gcc-14
i386                  randconfig-004-20260317    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260317    gcc-11.5.0
parisc                randconfig-002-20260317    gcc-14.3.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260317    gcc-8.5.0
powerpc               randconfig-002-20260317    clang-23
powerpc64             randconfig-001-20260317    gcc-8.5.0
powerpc64             randconfig-002-20260317    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260316    gcc-8.5.0
sparc                 randconfig-002-20260316    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64               randconfig-001-20260316    gcc-8.5.0
sparc64               randconfig-002-20260316    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                    randconfig-001-20260316    gcc-14
um                    randconfig-002-20260316    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260316    gcc-14
x86_64      buildonly-randconfig-002-20260316    clang-20
x86_64      buildonly-randconfig-003-20260316    clang-20
x86_64      buildonly-randconfig-004-20260316    gcc-14
x86_64      buildonly-randconfig-005-20260316    gcc-14
x86_64      buildonly-randconfig-006-20260316    clang-20
x86_64                randconfig-001-20260316    gcc-14
x86_64                randconfig-002-20260316    clang-20
x86_64                randconfig-003-20260316    clang-20
x86_64                randconfig-004-20260316    gcc-14
x86_64                randconfig-005-20260316    clang-20
x86_64                randconfig-006-20260316    clang-20
x86_64                randconfig-011-20260316    gcc-14
x86_64                randconfig-012-20260316    gcc-14
x86_64                randconfig-013-20260316    gcc-14
x86_64                randconfig-014-20260316    gcc-14
x86_64                randconfig-015-20260316    clang-20
x86_64                randconfig-016-20260316    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260316    gcc-15.2.0
xtensa                randconfig-002-20260316    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
