Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14607472084
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 23:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293412; cv=none; b=Wa8SjmCmzgT7HmFglWxvdqwbXCCi88LbspAqdWQLz6EOyCbPk6rdvsbqtcBBe6O+HT4mv2YD/t9TUukkUF3yo3qvcBwdxuSUVk/CA0KUYBYzZKg9etsSkpYGko7n/YBR/BLeMa9CLGjrFH4JXj2yfOzv3syH8+vsV5UsdH4WsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293412; c=relaxed/simple;
	bh=Sua5zCZY98Rapel/r394gSOOkeXsrjuh3l6ohhvB9Os=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uV2GCqKh31dMIu4pgJ1FecxixVyWTrDfkNn4had7vb80XrqhW6L5FiNoxa+1e2D23nBSAFJ8GOUiVLQtcIZl9TNy5YSfPMoCV3Wd4EJWl+aEcaCfgp3qakOAewAVs59S6kMlN+NPwxE1NVQv2hdK7DDYK8mU86vgQMT/FPWQnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJlHLSf6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJlHLSf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790293410; x=1821829410;
  h=date:from:to:cc:subject:message-id;
  bh=Sua5zCZY98Rapel/r394gSOOkeXsrjuh3l6ohhvB9Os=;
  b=SJlHLSf6NlMzKQY1wBS6G6XIemsCaLPsWV34PnjlFE4epeXQpdt7qW7q
   0nQG3z+zfwYkXl1G9w07Y/JJeH3HMHRZHFahAVQyG83u2uOH4CJLGbNci
   SW6VvbCi9FOBUwoItiwWmw8WDMb0CboGgg19FFc8TciHSJf1Z1lfBz4Gx
   ftR1+14g4c3jqpMe71tP4rBJdUxh/4Wso8YGIG1L/Bw2Z3o4n+B4/hwOp
   oJ4OBm7H3q7+G6SZ2cxay3N1HoIM6H4YziFxreHTJ07XQYdKVhhEwXNXF
   pq+Lxw4ca9GDtR89u+0CvrhXWwhA9k3w622u3HVMeLqFoGFwAEebLzm0N
   Q==;
X-CSE-ConnectionGUID: 0IyO7YvGSxq5LEcq1qlLLQ==
X-CSE-MsgGUID: 1UpvlaB1RdGch/RGWmda9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90300289"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90300289"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:43:29 -0700
X-CSE-ConnectionGUID: 3m9aLcfpSISo02k5NvJpIw==
X-CSE-MsgGUID: Wd8A++MqR8OhjgU1NhiXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272761252"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Sep 2026 16:43:28 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9t65-00000000Jmx-3dN8;
	Thu, 24 Sep 2026 23:43:25 +0000
Date: Fri, 25 Sep 2026 07:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-gpio-dir-imx] BUILD SUCCESS
 7077059b3fce189ede20bec28366558b1069c321
Message-ID: <202609250714.erInMZ7n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-gpio-dir-imx
branch HEAD: 7077059b3fce189ede20bec28366558b1069c321  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register

elapsed time: 4714m

configs tested: 381
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1303-20260925    gcc-14.3.0 sparse
alpha                randconfig-r1304-20260924    gcc-16.1.0 sparse
alpha                randconfig-r2102-20260923    gcc-8.5.0  cocci
alpha                randconfig-r2102-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2103-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2104-20260923    gcc-12.5.0 cocci
alpha                randconfig-r2106-20260924    gcc-14     cocci
alpha                randconfig-r2107-20260923    gcc-12.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1001-20260924    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arc                  randconfig-r2102-20260924    gcc-15.2.0 cocci
arc                  randconfig-r2202-20260923    gcc-14.3.0 smatch
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                  randconfig-r1305-20260924    gcc-16.1.0 sparse
arm                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arm                  randconfig-r2105-20260924    clang-17   cocci
arm                  randconfig-r2106-20260924    clang-17   cocci
arm                         spear6xx_defconfig    clang-24
arm                            stm32_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-16.1.0 sparse
arm64                randconfig-r1307-20260924    gcc-11.5.0 sparse
arm64                randconfig-r2106-20260923    gcc-15.2.0 cocci
arm64                randconfig-r2200-20260923    clang-24   smatch
arm64                randconfig-r2201-20260923    clang-24   smatch
arm64                randconfig-r2202-20260923    clang-24   smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1300-20260924    gcc-16.1.0 sparse
csky                 randconfig-r2107-20260923    gcc-15.2.0 cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
hexagon              randconfig-r1301-20260924    gcc-16.1.0 sparse
hexagon              randconfig-r2107-20260924    gcc-14     cocci
hexagon              randconfig-r2202-20260923    clang-24   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1005-20260924    gcc-14
i386        buildonly-randconfig-1005-20260925    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2100-20260924    gcc-14     cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2101-20260924    gcc-14     cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2102-20260924    gcc-14     cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2103-20260924    gcc-14     cocci
i386                  randconfig-2200-20260923    gcc-12     smatch
i386                  randconfig-2200-20260924    clang-22   smatch
i386                 randconfig-r2100-20260923    gcc-8.5.0  cocci
i386                 randconfig-r2107-20260923    clang-22   cocci
i386                 randconfig-r2107-20260924    clang-17   cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch            randconfig-r2105-20260923    gcc-14     cocci
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20260923    gcc-8.5.0  cocci
m68k                 randconfig-r2201-20260923    gcc-11.5.0 smatch
m68k                 randconfig-r2201-20260924    gcc-8.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r1304-20260925    gcc-14.3.0 sparse
microblaze           randconfig-r2101-20260924    gcc-11.5.0 cocci
microblaze           randconfig-r2104-20260923    clang-22   cocci
microblaze           randconfig-r2200-20260923    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r1309-20260924    gcc-11.5.0 sparse
mips                 randconfig-r2104-20260923    gcc-15.2.0 cocci
mips                 randconfig-r2201-20260923    clang-22   smatch
mips                 randconfig-r2202-20260923    gcc-8.5.0  smatch
mips                            xway_defconfig    clang-24
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
nios2                randconfig-r1303-20260924    gcc-16.1.0 sparse
nios2                randconfig-r1306-20260924    gcc-11.5.0 sparse
nios2                randconfig-r2100-20260923    gcc-15.2.0 cocci
nios2                randconfig-r2103-20260923    gcc-8.5.0  cocci
nios2                randconfig-r2105-20260923    clang-22   cocci
nios2                randconfig-r2105-20260924    gcc-14     cocci
nios2                randconfig-r2201-20260924    gcc-8.5.0  smatch
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    clang-24
openrisc             randconfig-r2100-20260923    gcc-8.5.0  cocci
openrisc             randconfig-r2106-20260923    gcc-16.1.0 cocci
openrisc             randconfig-r2200-20260924    gcc-13.4.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc                randconfig-1001-20260925    clang-24
parisc               randconfig-r1301-20260925    gcc-14.3.0 sparse
parisc               randconfig-r2100-20260923    gcc-8.5.0  cocci
parisc               randconfig-r2103-20260923    gcc-14     cocci
parisc               randconfig-r2103-20260923    gcc-8.5.0  cocci
parisc               randconfig-r2104-20260923    gcc-14     cocci
parisc               randconfig-r2202-20260923    gcc-12.5.0 smatch
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       mgcoge_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260925    clang-24
powerpc              randconfig-r2101-20260924    gcc-15.2.0 cocci
powerpc              randconfig-r2102-20260923    gcc-15.2.0 cocci
powerpc              randconfig-r2106-20260923    clang-22   cocci
powerpc              randconfig-r2200-20260923    gcc-8.5.0  smatch
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260925    clang-24
powerpc64            randconfig-r1300-20260925    gcc-14.3.0 sparse
powerpc64            randconfig-r2105-20260923    gcc-15.2.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260925    clang-24
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2001-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260924    clang-24
riscv                randconfig-r2105-20260923    gcc-12.5.0 cocci
riscv                randconfig-r2107-20260923    gcc-16.1.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-1001-20260925    clang-24
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2000-20260924    clang-24
s390                  randconfig-2001-20260923    gcc-9.5.0
s390                  randconfig-2001-20260924    clang-24
s390                 randconfig-r1308-20260924    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-1001-20260925    clang-24
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2000-20260924    clang-24
sh                    randconfig-2001-20260923    gcc-9.5.0
sh                    randconfig-2001-20260924    clang-24
sh                   randconfig-r1305-20260925    gcc-14.3.0 sparse
sh                   randconfig-r2103-20260923    gcc-15.2.0 cocci
sh                   randconfig-r2104-20260923    gcc-16.1.0 cocci
sh                   randconfig-r2202-20260924    gcc-14.3.0 smatch
sh                            se7780_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-1001-20260925    gcc-12
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2000-20260924    gcc-13.4.0
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260924    gcc-13.4.0
sparc                randconfig-r2100-20260924    gcc-15.2.0 cocci
sparc                randconfig-r2104-20260924    clang-17   cocci
sparc                randconfig-r2105-20260923    gcc-16.1.0 cocci
sparc                randconfig-r2200-20260923    gcc-8.5.0  smatch
sparc                randconfig-r2201-20260923    gcc-11.5.0 smatch
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-1001-20260925    gcc-12
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2000-20260924    gcc-13.4.0
sparc64               randconfig-2001-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260924    gcc-13.4.0
sparc64              randconfig-r2100-20260924    gcc-11.5.0 cocci
sparc64              randconfig-r2101-20260923    gcc-15.2.0 cocci
sparc64              randconfig-r2102-20260923    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1001-20260924    clang-17
um                    randconfig-1001-20260925    gcc-12
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2000-20260924    gcc-13.4.0
um                    randconfig-2001-20260923    gcc-14.3.0
um                    randconfig-2001-20260924    gcc-13.4.0
um                   randconfig-r1302-20260925    gcc-14.3.0 sparse
um                   randconfig-r2200-20260923    gcc-14     smatch
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2100-20260924    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2101-20260924    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2102-20260924    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2103-20260924    clang-22   cocci
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64               randconfig-r2100-20260923    gcc-14     cocci
x86_64               randconfig-r2101-20260923    gcc-14     cocci
x86_64               randconfig-r2102-20260923    gcc-14     cocci
x86_64               randconfig-r2103-20260924    gcc-15.2.0 cocci
x86_64               randconfig-r2104-20260924    gcc-14     cocci
x86_64               randconfig-r2106-20260923    gcc-14     cocci
x86_64               randconfig-r2107-20260923    gcc-14     cocci
x86_64               randconfig-r2201-20260923    clang-22   smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-1001-20260925    gcc-12
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2000-20260924    gcc-13.4.0
xtensa                randconfig-2001-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260924    gcc-13.4.0
xtensa               randconfig-r2102-20260923    gcc-8.5.0  cocci
xtensa               randconfig-r2106-20260923    gcc-12.5.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
