Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75B34D5964
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550175; cv=none; b=R4zJ+lB9tdMaNqa7I1TomnpCdC0TWC/Erp4lS3klQkEoSRFA50EQ1j66cbMFK1X/UVb7TAXfSc3/IJ+hVQ/KifBpTmxrtHYwqONCYe18x0cvvxmHYJJgXeC2YJHqlVJYcChovwsCrxjJHpTFpieadgomAoWPNcrDiKNcIUXJLFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550175; c=relaxed/simple;
	bh=PUclVjnlkB5wzLCK8h/taRoosdPLp1adELbgop3EHDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vc42dj68EwJuZ/C5MG5pDAwYhls5mVAW3c6vevqXa7I07k5tuWOOsrV+RVg9COKOFQD9/HHw0lOx9n2mXnc1BQYzAToRvAwNYW7Ul37KiEGNKKcI41hAgLzL51icDlxR8Qs2jydBLcEa5X88zYPP0s3TtPz5lQz1mSshKNHwhr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsNNGWSR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsNNGWSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791550168; x=1823086168;
  h=date:from:to:cc:subject:message-id;
  bh=PUclVjnlkB5wzLCK8h/taRoosdPLp1adELbgop3EHDU=;
  b=DsNNGWSREhb9wtnUGqnVG3F+DE+NHYGjY5jV9tfCbzGFipXy/BJWnepx
   qlni9BXiEuwsM+TZeDSm30BArjDUAJ115/BBtc5J6CeHhr2h+uaEOfmjA
   AhHqJdm41sGpDiUwdnIpqw6pkZSnnCM63DURAWXOrTbiY2vamWT46TUGn
   +Y9z/IpujUSkWGAaYgFZctNH27gGRnTm4glr89PXmgcGac1cl8AGZrEiI
   RxhSTkTgeID4+1FCBdpI28aaMEzBM1KF2nKU9v+3jQF/0l2/8l8MXQEUV
   kzlWHlz+0D3tNyE7djR+vVtMLuKDZhebUvdkLvyQ9yF5dU6/zKD+mOvKh
   w==;
X-CSE-ConnectionGUID: N0j82CfkTiCIQbM3LA2nWw==
X-CSE-MsgGUID: Nf5IVTB0TyumGH9pecb7eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="247993"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="247993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:49:27 -0700
X-CSE-ConnectionGUID: mlTVTSOuSNmULiTuXVEMJQ==
X-CSE-MsgGUID: mBfFfraxSB2sB+nWZ4fRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="320220"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2026 05:49:25 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFA2N-000000005mq-0kDs;
	Fri, 09 Oct 2026 12:49:23 +0000
Date: Fri, 09 Oct 2026 20:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 85b3a4d5032df9140867253dfc7611a30be7fdc6
Message-ID: <202610092011.fp6tx2iA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 85b3a4d5032df9140867253dfc7611a30be7fdc6  Merge tag 'pinctrl-qcom-fixes-for-v7.3-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

elapsed time: 1424m

configs tested: 403
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2105-20261008    gcc-8.5.0  cocci
alpha                randconfig-r2309-20261009    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arc                  randconfig-r2101-20261008    gcc-12.5.0 cocci
arc                  randconfig-r2200-20261009    gcc-14.3.0 smatch
arc                  randconfig-r2201-20261008    gcc-13.4.0 smatch
arc                  randconfig-r2306-20261009    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             mps2_defconfig    clang-24
arm                   randconfig-1000-20261009    gcc-10.5.0
arm                   randconfig-1001-20261009    gcc-10.5.0
arm                   randconfig-1002-20261009    gcc-10.5.0
arm                   randconfig-1003-20261009    gcc-10.5.0
arm                  randconfig-r2101-20261008    gcc-11.5.0 cocci
arm                  randconfig-r2102-20261009    gcc-13.4.0 cocci
arm                  randconfig-r2105-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2202-20261008    gcc-11.5.0 smatch
arm                  randconfig-r2300-20261008    gcc-13.4.0 sparse
arm                  randconfig-r2300-20261009    gcc-8.5.0  sparse
arm                  randconfig-r2301-20261008    gcc-14     sparse
arm                  randconfig-r2302-20261008    gcc-14     sparse
arm                  randconfig-r2302-20261009    gcc-8.5.0  sparse
arm                  randconfig-r2305-20261009    gcc-8.5.0  sparse
arm                  randconfig-r2308-20261008    clang-22   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2100-20261008    clang-20   cocci
arm64                randconfig-r2102-20261008    gcc-11.5.0 cocci
arm64                randconfig-r2302-20261008    clang-17   sparse
arm64                randconfig-r2303-20261008    clang-22   sparse
arm64                randconfig-r2305-20261008    gcc-14     sparse
arm64                randconfig-r2306-20261008    clang-22   sparse
arm64                randconfig-r2306-20261008    gcc-10.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2104-20261008    gcc-16.1.0 cocci
csky                 randconfig-r2105-20261008    clang-24   cocci
csky                 randconfig-r2106-20261009    gcc-14.3.0 cocci
csky                 randconfig-r2201-20261009    gcc-14.3.0 smatch
csky                 randconfig-r2306-20261008    gcc-16.1.0 sparse
csky                 randconfig-r2308-20261009    gcc-16.1.0 sparse
csky                 randconfig-r2309-20261008    gcc-16.1.0 sparse
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261009    clang-18
hexagon               randconfig-1001-20261009    clang-18
hexagon              randconfig-r2102-20261008    clang-20   cocci
hexagon              randconfig-r2300-20261008    gcc-14     sparse
hexagon              randconfig-r2301-20261008    clang-17   sparse
hexagon              randconfig-r2303-20261008    clang-24   sparse
hexagon              randconfig-r2303-20261008    gcc-13.4.0 sparse
hexagon              randconfig-r2304-20261009    gcc-14     sparse
hexagon              randconfig-r2307-20261008    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261009    clang-22
i386        buildonly-randconfig-1001-20261009    clang-22
i386        buildonly-randconfig-1002-20261009    clang-22
i386        buildonly-randconfig-1003-20261009    clang-22
i386        buildonly-randconfig-1004-20261009    clang-22
i386        buildonly-randconfig-1005-20261009    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261009    clang-22
i386                  randconfig-1001-20261009    clang-22
i386                  randconfig-1002-20261009    clang-22
i386                  randconfig-1003-20261009    clang-22
i386                  randconfig-1004-20261009    clang-22
i386                  randconfig-1005-20261009    clang-22
i386                  randconfig-1006-20261009    clang-22
i386                  randconfig-1007-20261009    clang-22
i386                  randconfig-1008-20261009    clang-22
i386                  randconfig-1009-20261009    clang-22
i386                  randconfig-1010-20261009    clang-22
i386                  randconfig-1011-20261009    clang-22
i386                  randconfig-1012-20261009    clang-22
i386                  randconfig-1013-20261009    clang-22
i386                  randconfig-2100-20261008    clang-22   cocci
i386                  randconfig-2100-20261009    clang-22   cocci
i386                  randconfig-2101-20261008    clang-22   cocci
i386                  randconfig-2101-20261009    clang-22   cocci
i386                  randconfig-2102-20261008    clang-22   cocci
i386                  randconfig-2102-20261009    clang-22   cocci
i386                  randconfig-2103-20261008    clang-22   cocci
i386                  randconfig-2103-20261009    clang-22   cocci
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2200-20261009    gcc-14     smatch
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2300-20261009    clang-22   sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2301-20261009    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                  randconfig-2302-20261009    clang-22   sparse
i386                 randconfig-r2103-20261008    clang-22   cocci
i386                 randconfig-r2202-20261008    clang-22   smatch
i386                 randconfig-r2304-20261008    gcc-14     sparse
i386                 randconfig-r2307-20261008    clang-22   sparse
i386                 randconfig-r2307-20261008    gcc-15.2.0 sparse
i386                 randconfig-r2309-20261008    clang-22   sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261009    clang-18
loongarch             randconfig-1001-20261009    clang-18
loongarch            randconfig-r2100-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2105-20261008    clang-24   cocci
loongarch            randconfig-r2105-20261008    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261009    gcc-16.1.0 smatch
loongarch            randconfig-r2202-20261009    clang-18   smatch
loongarch            randconfig-r2301-20261008    gcc-13.4.0 sparse
loongarch            randconfig-r2307-20261008    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                 randconfig-r2103-20261008    gcc-11.5.0 cocci
m68k                 randconfig-r2202-20261008    gcc-8.5.0  smatch
m68k                 randconfig-r2202-20261009    gcc-8.5.0  smatch
m68k                 randconfig-r2305-20261008    gcc-13.4.0 sparse
m68k                 randconfig-r2306-20261008    gcc-15.2.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2106-20261008    gcc-16.1.0 cocci
microblaze           randconfig-r2107-20261008    clang-24   cocci
microblaze           randconfig-r2200-20261008    gcc-8.5.0  smatch
microblaze           randconfig-r2201-20261009    gcc-8.5.0  smatch
microblaze           randconfig-r2300-20261008    clang-22   sparse
microblaze           randconfig-r2307-20261008    gcc-10.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                            ci20_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261009    gcc-12     cocci
mips                 randconfig-r2107-20261009    gcc-14.3.0 cocci
mips                 randconfig-r2202-20261008    gcc-15.2.0 smatch
mips                 randconfig-r2300-20261008    clang-17   sparse
mips                 randconfig-r2304-20261008    clang-17   sparse
mips                 randconfig-r2306-20261008    clang-24   sparse
mips                 randconfig-r2307-20261009    gcc-8.5.0  sparse
nios2                             alldefconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261009    clang-18
nios2                 randconfig-1001-20261009    clang-18
nios2                randconfig-r2100-20261008    clang-22   cocci
nios2                randconfig-r2101-20261009    gcc-12     cocci
nios2                randconfig-r2104-20261008    clang-22   cocci
nios2                randconfig-r2107-20261008    clang-22   cocci
nios2                randconfig-r2107-20261008    gcc-8.5.0  cocci
nios2                randconfig-r2300-20261008    clang-24   sparse
nios2                randconfig-r2308-20261009    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261009    gcc-12     cocci
openrisc             randconfig-r2200-20261009    gcc-10.5.0 smatch
openrisc             randconfig-r2308-20261008    gcc-16.1.0 sparse
openrisc             randconfig-r2309-20261008    gcc-10.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2100-20261009    gcc-13.4.0 cocci
parisc               randconfig-r2102-20261008    gcc-12.5.0 cocci
parisc               randconfig-r2103-20261008    clang-20   cocci
parisc               randconfig-r2103-20261008    gcc-12.5.0 cocci
parisc               randconfig-r2104-20261008    gcc-8.5.0  cocci
parisc               randconfig-r2106-20261008    clang-22   cocci
parisc               randconfig-r2106-20261008    gcc-16.1.0 cocci
parisc               randconfig-r2301-20261009    gcc-8.5.0  sparse
parisc               randconfig-r2302-20261009    gcc-14     sparse
parisc               randconfig-r2303-20261009    gcc-14     sparse
parisc               randconfig-r2305-20261009    gcc-14     sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                       chrp32_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2106-20261008    clang-24   cocci
powerpc              randconfig-r2106-20261008    gcc-8.5.0  cocci
powerpc              randconfig-r2107-20261008    clang-24   cocci
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2104-20261009    clang-17   cocci
powerpc64            randconfig-r2104-20261009    gcc-14.3.0 cocci
powerpc64            randconfig-r2106-20261008    clang-24   cocci
powerpc64            randconfig-r2107-20261008    gcc-16.1.0 cocci
powerpc64            randconfig-r2107-20261009    clang-17   cocci
powerpc64            randconfig-r2305-20261008    clang-22   sparse
powerpc64            randconfig-r2308-20261008    gcc-15.2.0 sparse
riscv                             alldefconfig    gcc-16.1.0
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261008    clang-24
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2000-20261009    gcc-16.1.0
riscv                 randconfig-2001-20261008    clang-24
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261009    gcc-16.1.0
riscv                randconfig-r2101-20261008    clang-22   cocci
riscv                randconfig-r2104-20261008    clang-24   cocci
riscv                randconfig-r2105-20261009    clang-17   cocci
riscv                randconfig-r2302-20261008    clang-22   sparse
riscv                randconfig-r2304-20261008    clang-22   sparse
riscv                randconfig-r2307-20261008    gcc-16.1.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2000-20261008    gcc-8.5.0
s390                  randconfig-2000-20261009    gcc-16.1.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                  randconfig-2001-20261008    gcc-8.5.0
s390                  randconfig-2001-20261009    gcc-16.1.0
s390                 randconfig-r2101-20261008    clang-20   cocci
s390                 randconfig-r2102-20261008    gcc-12.5.0 cocci
s390                 randconfig-r2107-20261008    gcc-16.1.0 cocci
s390                 randconfig-r2301-20261008    clang-22   sparse
s390                 randconfig-r2301-20261009    gcc-14     sparse
s390                 randconfig-r2303-20261008    gcc-14     sparse
s390                 randconfig-r2305-20261008    clang-17   sparse
s390                 randconfig-r2306-20261009    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2000-20261008    gcc-9.5.0
sh                    randconfig-2000-20261009    gcc-16.1.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sh                    randconfig-2001-20261009    gcc-16.1.0
sh                   randconfig-r2100-20261008    gcc-12.5.0 cocci
sh                   randconfig-r2101-20261009    gcc-13.4.0 cocci
sh                   randconfig-r2103-20261008    gcc-12.5.0 cocci
sh                   randconfig-r2105-20261009    gcc-14.3.0 cocci
sh                   randconfig-r2106-20261009    clang-17   cocci
sh                   randconfig-r2200-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2201-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2202-20261009    gcc-13.4.0 smatch
sh                   randconfig-r2302-20261008    clang-24   sparse
sh                   randconfig-r2304-20261008    gcc-13.4.0 sparse
sh                   randconfig-r2305-20261008    clang-24   sparse
sh                   randconfig-r2308-20261008    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2000-20261008    gcc-8.5.0
sparc                 randconfig-2000-20261009    clang-17
sparc                 randconfig-2001-20261008    gcc-11.5.0
sparc                 randconfig-2001-20261008    gcc-14
sparc                 randconfig-2001-20261009    clang-17
sparc                randconfig-r2100-20261008    gcc-11.5.0 cocci
sparc                randconfig-r2104-20261008    gcc-16.1.0 cocci
sparc                randconfig-r2200-20261008    gcc-16.1.0 smatch
sparc                randconfig-r2201-20261009    gcc-11.5.0 smatch
sparc                randconfig-r2303-20261008    clang-17   sparse
sparc                randconfig-r2304-20261008    clang-24   sparse
sparc                randconfig-r2308-20261008    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2000-20261008    gcc-16.1.0
sparc64               randconfig-2000-20261009    clang-17
sparc64               randconfig-2001-20261008    clang-20
sparc64               randconfig-2001-20261008    gcc-14
sparc64               randconfig-2001-20261009    clang-17
sparc64              randconfig-r2102-20261008    gcc-12.5.0 cocci
sparc64              randconfig-r2103-20261008    gcc-12.5.0 cocci
sparc64              randconfig-r2301-20261008    clang-24   sparse
sparc64              randconfig-r2302-20261008    gcc-13.4.0 sparse
sparc64              randconfig-r2309-20261009    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2000-20261009    clang-17
um                    randconfig-2001-20261008    gcc-14
um                    randconfig-2001-20261009    clang-17
um                   randconfig-r2102-20261009    gcc-12     cocci
um                   randconfig-r2300-20261009    gcc-14     sparse
um                   randconfig-r2303-20261009    gcc-8.5.0  sparse
um                   randconfig-r2304-20261009    gcc-8.5.0  sparse
um                   randconfig-r2308-20261008    gcc-10.5.0 sparse
um                   randconfig-r2309-20261008    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261009    clang-22
x86_64      buildonly-randconfig-1001-20261009    clang-22
x86_64      buildonly-randconfig-1002-20261009    clang-22
x86_64      buildonly-randconfig-1003-20261009    clang-22
x86_64      buildonly-randconfig-1004-20261009    clang-22
x86_64      buildonly-randconfig-1005-20261009    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261009    gcc-14
x86_64                randconfig-1001-20261009    gcc-14
x86_64                randconfig-1002-20261009    gcc-14
x86_64                randconfig-1003-20261009    gcc-14
x86_64                randconfig-1004-20261009    gcc-14
x86_64                randconfig-1005-20261009    gcc-14
x86_64                randconfig-1012-20261009    gcc-14
x86_64                randconfig-1013-20261009    gcc-14
x86_64                randconfig-1014-20261009    gcc-14
x86_64                randconfig-1015-20261009    gcc-14
x86_64                randconfig-1016-20261009    gcc-14
x86_64                randconfig-1017-20261009    gcc-14
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2100-20261009    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2101-20261008    gcc-14     cocci
x86_64                randconfig-2101-20261009    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2102-20261008    gcc-14     cocci
x86_64                randconfig-2102-20261009    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2103-20261009    clang-22   cocci
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2200-20261009    gcc-14     smatch
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2300-20261009    clang-22   sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2301-20261009    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64                randconfig-2302-20261009    clang-22   sparse
x86_64               randconfig-r2100-20261008    gcc-12.5.0 cocci
x86_64               randconfig-r2102-20261008    clang-22   cocci
x86_64               randconfig-r2103-20261009    gcc-13.4.0 cocci
x86_64               randconfig-r2105-20261008    clang-22   cocci
x86_64               randconfig-r2200-20261008    gcc-12     smatch
x86_64               randconfig-r2202-20261009    clang-22   smatch
x86_64               randconfig-r2307-20261009    gcc-16.1.0 sparse
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
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261009    clang-18
xtensa                randconfig-1001-20261009    clang-18
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2000-20261008    gcc-8.5.0
xtensa                randconfig-2000-20261009    clang-17
xtensa                randconfig-2001-20261008    gcc-14
xtensa                randconfig-2001-20261008    gcc-8.5.0
xtensa                randconfig-2001-20261009    clang-17
xtensa               randconfig-r2104-20261008    clang-24   cocci
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2309-20261008    clang-24   sparse
xtensa               randconfig-r2309-20261008    gcc-15.2.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
