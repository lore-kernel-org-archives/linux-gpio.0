Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527418;
	b=GvPEYp9rOzcGOtqugT/j4hqJdN8lrNsBxS6TwyFwK/CllydTB7t1+4q5CeICP0kzfvLp
	 3aLcWgn648XGqIlhQh+XbEvrL3d/DTo2u8AdSg8dVzLhuLpgEkLPYu3PDVQblapHlRioI
	 khO6Z+3XKoUG8tL3ZuA5OEle/YeZQCusBFfegVGrOV4TDHjE/uEofmP891hy7o5F8yNTS
	 8rrkSeHgbs/LvID+sEiInHdfq0l/BkUTXcXKOhSp04yi0mxuYnzZabFFVGUaMFk8fX7fM
	 +/4TmJI+zAnCqthO53XfH1mWqJ6nJc8l/zrKcpFzRRB08/6agh8uvmrhi+MWTrEExvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527418;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xfWgCK53fkkWG+LTnHcY0r232FjmbZWcyaac2975KBw=;
	b=KL2WWaq6VNxjXIq4090UhP02yWAxQqPCz9WVG6f0fmt1HfRnpnLSZgIYDp3TB4g0i3NQ
	 EuXUcYrOAdB9V13cvTaUl1cPBAdDfX+G3gxwpoSpCns7e2ZSjRWnLYuj6OYfs7lecz41N
	 vl6511ZNTS1yT0niI2kIIMi0aW0sd9jkq2gYGxkQmguGItRMoHEijZphSgDDncoQWI1Qu
	 REB+yJs6sMbHfvenYDqBnfzKMivcleUULDTXrOv63VgamSYcDdnqWrnHi+Fwc3fjTN6Fr
	 9ojnuKzppDiTHq8IYWJno4E0K1+lBOMcl4RQKl7bCtH99trdomkoxHcuHLsOT6jjL5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bCzMEOSc;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B2606A321
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 20:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bCzMEOSc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792527417; x=1824063417;
  h=date:from:to:cc:subject:message-id;
  bh=MQIEM7pWr+/Jjp9j3jE9hJ3Yy7Ru2zTuat3TesyeXjY=;
  b=bCzMEOScrIR76i1KVctVGgVhzyvKiY1p75raPG4K8SLx575/uGe+G5nv
   W41whcSQ/RW59RXXKGIdHMB6/IuF5xYaU9DcOGlEyxcYI/RtiiglRtgVM
   Rrl5IfiiHWqRzFMFeQjXHRjmpGkfZe2nOZGFZPBoJR9RGH3CTnFYZEnqG
   g5LGjN5v7vt40pkYL6Ex3Trxz5/PqtLTixceQ4jzPcDkWcoidvvNpnv4W
   0MhFOP5IXRk4yLC1cNqlv3KyXOdLtmRzuEl/9Z42pDphCXaqEabJG14cx
   e+6GcshE/gqGsNmpy1u8tBAIcS1TA2UxN6j1NhaeUHzd0uriQi1ywsUQY
   w==;
X-CSE-ConnectionGUID: 9dVJrOdfRGukjsRrRH3j9A==
X-CSE-MsgGUID: JVc1a+hyRqirFW2ytBcebg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1119451"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1119451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:16:56 -0700
X-CSE-ConnectionGUID: OemyefwNQtuP/Hw8nboNXA==
X-CSE-MsgGUID: vLIRsSheQEm6z6+KTjmyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3234568"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2026 13:16:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJGGN-00000000OQU-1Yv8;
	Tue, 20 Oct 2026 20:16:47 +0000
Date: Wed, 21 Oct 2026 04:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 974d2712cb15014019595799b3ed68fef5fe9695
Message-ID: <202610210448.GdnL0F75-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 974d2712cb15014019595799b3ed68fef5fe9695  gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT

elapsed time: 1032m

configs tested: 312
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2100-20261019    gcc-10.5.0 cocci
alpha                randconfig-r2111-20261019    gcc-8.5.0  cocci
alpha                randconfig-r2200-20261019    gcc-16.2.0 smatch
alpha                randconfig-r2306-20261019    gcc-14     sparse
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261020    gcc-10.5.0
arc                   randconfig-1001-20261020    gcc-10.5.0
arc                   randconfig-2000-20261019    gcc-8.5.0
arc                   randconfig-2001-20261019    gcc-8.5.0
arc                  randconfig-r2107-20261019    gcc-8.5.0  cocci
arc                  randconfig-r2310-20261019    gcc-14     sparse
arm                                allnoconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                        netwinder_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261020    gcc-10.5.0
arm                   randconfig-1001-20261020    gcc-10.5.0
arm                   randconfig-1002-20261020    gcc-10.5.0
arm                   randconfig-1003-20261020    gcc-10.5.0
arm                   randconfig-2000-20261019    gcc-8.5.0
arm                   randconfig-2001-20261019    clang-17
arm                   randconfig-2001-20261019    gcc-8.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261020    gcc-8.5.0
arm64                 randconfig-1001-20261020    gcc-8.5.0
arm64                 randconfig-1002-20261020    gcc-8.5.0
arm64                 randconfig-1003-20261020    gcc-8.5.0
arm64                 randconfig-2000-20261019    gcc-15.3.0
arm64                 randconfig-2001-20261019    gcc-15.3.0
arm64                randconfig-r2104-20261019    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261019    gcc-8.5.0  cocci
csky                              alldefconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261020    gcc-8.5.0
csky                  randconfig-1001-20261020    gcc-8.5.0
csky                  randconfig-2000-20261019    gcc-15.3.0
csky                  randconfig-2001-20261019    gcc-15.3.0
csky                 randconfig-r2101-20261019    gcc-10.5.0 cocci
csky                 randconfig-r2102-20261019    gcc-15.3.0 cocci
csky                 randconfig-r2300-20261019    gcc-16.2.0 sparse
csky                 randconfig-r2301-20261019    gcc-16.2.0 sparse
csky                 randconfig-r2305-20261019    clang-24   sparse
hexagon                           alldefconfig    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261020    clang-17
hexagon               randconfig-1001-20261020    clang-17
hexagon               randconfig-2000-20261019    gcc-15.3.0
hexagon               randconfig-2001-20261019    gcc-15.3.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261020    clang-22
i386        buildonly-randconfig-1001-20261020    clang-22
i386        buildonly-randconfig-1002-20261020    clang-22
i386        buildonly-randconfig-1003-20261020    clang-22
i386        buildonly-randconfig-1004-20261020    clang-22
i386        buildonly-randconfig-1005-20261020    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261020    gcc-14
i386                  randconfig-1001-20261020    gcc-14
i386                  randconfig-1002-20261020    gcc-14
i386                  randconfig-1003-20261020    gcc-14
i386                  randconfig-1004-20261020    gcc-14
i386                  randconfig-1005-20261020    gcc-14
i386                  randconfig-1006-20261020    gcc-14
i386                  randconfig-1007-20261020    gcc-14
i386                  randconfig-1008-20261020    gcc-14
i386                  randconfig-1009-20261020    gcc-14
i386                  randconfig-1010-20261020    gcc-14
i386                  randconfig-1011-20261020    gcc-14
i386                  randconfig-1012-20261020    gcc-14
i386                  randconfig-1013-20261020    gcc-14
i386                  randconfig-2000-20261019    clang-22
i386                  randconfig-2000-20261019    gcc-8.5.0
i386                  randconfig-2001-20261019    clang-22
i386                  randconfig-2001-20261019    gcc-8.5.0
i386                  randconfig-2100-20261019    gcc-14     cocci
i386                  randconfig-2101-20261019    gcc-14     cocci
i386                  randconfig-2102-20261019    gcc-14     cocci
i386                  randconfig-2103-20261019    gcc-14     cocci
i386                  randconfig-2104-20261019    gcc-14     cocci
i386                  randconfig-2105-20261019    gcc-14     cocci
i386                  randconfig-2200-20261019    gcc-14     smatch
i386                  randconfig-2300-20261019    gcc-14     sparse
i386                  randconfig-2301-20261019    gcc-14     sparse
i386                  randconfig-2302-20261019    gcc-14     sparse
i386                 randconfig-r2303-20261019    gcc-16.2.0 sparse
i386                 randconfig-r2309-20261019    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261020    clang-17
loongarch             randconfig-1001-20261020    clang-17
loongarch             randconfig-2000-20261019    gcc-11.5.0
loongarch             randconfig-2001-20261019    gcc-11.5.0
loongarch            randconfig-r2307-20261019    gcc-14     sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.2.0
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                 randconfig-r2101-20261019    gcc-15.3.0 cocci
m68k                 randconfig-r2106-20261019    gcc-8.5.0  cocci
m68k                 randconfig-r2109-20261019    gcc-10.5.0 cocci
m68k                 randconfig-r2304-20261019    gcc-16.2.0 sparse
m68k                 randconfig-r2306-20261019    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261019    gcc-8.5.0  cocci
microblaze           randconfig-r2201-20261019    gcc-10.5.0 smatch
microblaze           randconfig-r2303-20261019    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            ip30_defconfig    gcc-16.2.0
mips                 malta_qemu_32r6_defconfig    gcc-16.2.0
mips                 randconfig-r2107-20261019    clang-24   cocci
mips                 randconfig-r2110-20261019    clang-24   cocci
mips                 randconfig-r2202-20261019    clang-24   smatch
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261020    clang-17
nios2                 randconfig-1001-20261020    clang-17
nios2                 randconfig-2000-20261019    gcc-11.5.0
nios2                 randconfig-2001-20261019    gcc-11.5.0
nios2                randconfig-r2106-20261019    clang-24   cocci
nios2                randconfig-r2304-20261019    clang-24   sparse
nios2                randconfig-r2307-20261019    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261019    gcc-10.5.0 sparse
nios2                randconfig-r2309-20261019    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc             randconfig-r2104-20261019    clang-24   cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.2.0
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261020    clang-17
parisc                randconfig-1001-20261020    clang-17
parisc                randconfig-2000-20261019    gcc-11.5.0
parisc                randconfig-2001-20261019    gcc-11.5.0
parisc               randconfig-r2201-20261019    gcc-15.3.0 smatch
parisc               randconfig-r2300-20261019    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261020    clang-17
powerpc               randconfig-1001-20261020    clang-17
powerpc               randconfig-2000-20261019    clang-22
powerpc               randconfig-2001-20261019    clang-22
powerpc              randconfig-r2102-20261019    gcc-10.5.0 cocci
powerpc              randconfig-r2108-20261019    gcc-10.5.0 cocci
powerpc              randconfig-r2302-20261019    clang-24   sparse
powerpc              randconfig-r2305-20261019    gcc-16.2.0 sparse
powerpc64             randconfig-1000-20261020    clang-17
powerpc64             randconfig-1001-20261020    clang-17
powerpc64             randconfig-2000-20261019    clang-22
powerpc64             randconfig-2001-20261019    clang-22
powerpc64            randconfig-r2308-20261019    clang-24   sparse
powerpc64            randconfig-r2308-20261019    gcc-14     sparse
powerpc64            randconfig-r2309-20261019    gcc-14     sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261020    gcc-11.5.0
riscv                 randconfig-1001-20261020    gcc-11.5.0
riscv                 randconfig-2000-20261019    gcc-13.5.0
riscv                 randconfig-2001-20261019    gcc-13.5.0
riscv                randconfig-r2103-20261019    gcc-10.5.0 cocci
riscv                randconfig-r2200-20261019    clang-19   smatch
riscv                randconfig-r2301-20261019    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261020    gcc-11.5.0
s390                  randconfig-1001-20261020    gcc-11.5.0
s390                  randconfig-2000-20261019    gcc-13.5.0
s390                  randconfig-2001-20261019    gcc-13.5.0
s390                 randconfig-r2105-20261019    clang-24   cocci
s390                 randconfig-r2311-20261019    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                          ap325rxa_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                          ecovec24_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261020    gcc-11.5.0
sh                    randconfig-1001-20261020    gcc-11.5.0
sh                    randconfig-2000-20261019    gcc-13.5.0
sh                    randconfig-2001-20261019    gcc-13.5.0
sh                   randconfig-r2100-20261019    gcc-15.3.0 cocci
sh                   randconfig-r2103-20261019    gcc-15.3.0 cocci
sh                   randconfig-r2311-20261019    gcc-10.5.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261020    clang-20
sparc                 randconfig-1001-20261020    clang-20
sparc                 randconfig-2000-20261019    gcc-11.5.0
sparc                 randconfig-2001-20261019    gcc-11.5.0
sparc                randconfig-r2310-20261019    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261020    clang-20
sparc64               randconfig-1001-20261020    clang-20
sparc64               randconfig-2000-20261019    gcc-11.5.0
sparc64               randconfig-2001-20261019    gcc-11.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261020    clang-20
um                    randconfig-1001-20261020    clang-20
um                    randconfig-2000-20261019    gcc-11.5.0
um                    randconfig-2001-20261019    gcc-11.5.0
um                   randconfig-r2307-20261019    clang-24   sparse
um                   randconfig-r2311-20261019    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261020    gcc-14
x86_64      buildonly-randconfig-1001-20261020    gcc-14
x86_64      buildonly-randconfig-1002-20261020    gcc-14
x86_64      buildonly-randconfig-1003-20261020    gcc-14
x86_64      buildonly-randconfig-1004-20261020    gcc-14
x86_64      buildonly-randconfig-1005-20261020    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261020    clang-22
x86_64                randconfig-1001-20261020    clang-22
x86_64                randconfig-1002-20261020    clang-22
x86_64                randconfig-1003-20261020    clang-22
x86_64                randconfig-1004-20261020    clang-22
x86_64                randconfig-1005-20261020    clang-22
x86_64                randconfig-1006-20261020    gcc-14
x86_64                randconfig-1007-20261020    gcc-14
x86_64                randconfig-1008-20261020    gcc-14
x86_64                randconfig-1009-20261020    gcc-14
x86_64                randconfig-1010-20261020    gcc-14
x86_64                randconfig-1011-20261020    gcc-14
x86_64                randconfig-1012-20261020    clang-22
x86_64                randconfig-1013-20261020    clang-22
x86_64                randconfig-1014-20261020    clang-22
x86_64                randconfig-1015-20261020    clang-22
x86_64                randconfig-1016-20261020    clang-22
x86_64                randconfig-1017-20261020    clang-22
x86_64                randconfig-2000-20261019    clang-22
x86_64                randconfig-2001-20261019    clang-22
x86_64                randconfig-2100-20261019    clang-22   cocci
x86_64                randconfig-2101-20261019    clang-22   cocci
x86_64                randconfig-2101-20261019    gcc-14     cocci
x86_64                randconfig-2102-20261019    clang-22   cocci
x86_64                randconfig-2103-20261019    clang-22   cocci
x86_64                randconfig-2103-20261019    gcc-14     cocci
x86_64                randconfig-2104-20261019    clang-22   cocci
x86_64                randconfig-2105-20261019    clang-22   cocci
x86_64                randconfig-2105-20261019    gcc-14     cocci
x86_64                randconfig-2200-20261019    clang-22   smatch
x86_64                randconfig-2300-20261019    gcc-14     sparse
x86_64                randconfig-2301-20261019    gcc-14     sparse
x86_64                randconfig-2302-20261019    gcc-14     sparse
x86_64               randconfig-r2108-20261019    gcc-15.3.0 cocci
x86_64               randconfig-r2109-20261019    gcc-15.3.0 cocci
x86_64               randconfig-r2302-20261019    gcc-16.2.0 sparse
x86_64               randconfig-r2306-20261019    gcc-13     sparse
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
xtensa                randconfig-1000-20261020    clang-20
xtensa                randconfig-1001-20261020    clang-20
xtensa                randconfig-2000-20261019    gcc-11.5.0
xtensa                randconfig-2001-20261019    gcc-11.5.0
xtensa               randconfig-r2111-20261019    clang-24   cocci
xtensa               randconfig-r2310-20261019    gcc-15.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
