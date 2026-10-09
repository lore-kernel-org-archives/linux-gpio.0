Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73723B3C17
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550183; cv=none; b=AoXa2pGQso89aluC/LUPHANzhvkPm1oWgUnaBf6cW/hfME4rbBLq9P3ysVkQkFJ949JReUhGVa855LpXqtyYg4P3+N0zfihOlvHHx1ny5QongzfZZ84ugzLIRpgjxxREA/xfxdyHVGjQ1ZSn2gDG0bhs/kFaZKmzxEMxUx1ugd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550183; c=relaxed/simple;
	bh=cyxnQhsk0wXtYrKZnB0N47aV0zg06gjmhKD4oWfs68E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aT3iHSlZwxxRfASBtlhoR0/ct4gRTpN1xG0sE7V26886aZkgdfUfzCYY7IJxZWQI/dpBkzpOJpOpV7oCwTaEFwlKzbY+Gx1QYJYE6Yr/we5oFTkxbLB3757Xrlh4xUG9r8g62JFeOHNfxlmp1rZxMGF3xUtNFRgfLC3QY4W4WxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4MMa/l5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4MMa/l5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791550176; x=1823086176;
  h=date:from:to:cc:subject:message-id;
  bh=cyxnQhsk0wXtYrKZnB0N47aV0zg06gjmhKD4oWfs68E=;
  b=I4MMa/l531VYfpmEBdFh4Ie+r8iZ4PJZBFufyVmgD7dlyYgtXs2jbByX
   LHUdR4qBR7T/jZ/yraQZYMyfcHCV0qdT9IIhAm1J5VntQdb0jeNPhggK7
   BbEgbJ3SnYD+Zlkk6Ik5zJR/5dYVgcqLZvPtWZzVIeZ3XTE30IiQ3lfJ/
   qB+jw44amASaXFgq5fn3W3/9W0iy9+/JSayAY3fUZ4GG4hTJkX9AGGk0X
   Tm4y4QdmCQ2Fdc1VN7UYhUckiiQBedp25S4YymBYBJXsPl7hDLKhQFEvP
   /RDIFW247nOLuxcCMc6lxG3mnf4r1Q4AzSEE/MSEwIHjBmjI77tQWb7bP
   A==;
X-CSE-ConnectionGUID: kojkMEpSRACQeF+yrbrJcg==
X-CSE-MsgGUID: HtC7q0s9TPCZmRw6r8oqQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="247995"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="247995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:49:27 -0700
X-CSE-ConnectionGUID: JWTQ2vRaRli5QKYo4G+Nfg==
X-CSE-MsgGUID: fLnaT4WBRCOWY0smwZ0hxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="320222"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2026 05:49:25 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFA2N-000000005mo-0a3o;
	Fri, 09 Oct 2026 12:49:23 +0000
Date: Fri, 09 Oct 2026 20:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 2430546e8d00b1a00fa85f71b666777bc9e3db27
Message-ID: <202610092056.6NsErH0t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 2430546e8d00b1a00fa85f71b666777bc9e3db27  Merge tag 'pinctrl-qcom-updates-for-v7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

Unverified Error/Warning (likely false positive, kindly check if interested):

    drivers/pinctrl/sunplus/sppctl.c:980:1: internal compiler error: in final_scan_insn_1, at final.cc:2823

Error/Warning ids grouped by kconfigs:

recent_errors
`-- csky-allmodconfig
    `-- drivers-pinctrl-sunplus-sppctl.c:internal-compiler-error:in-final_scan_insn_1-at-final.cc

elapsed time: 1424m

configs tested: 386
configs skipped: 10

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
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2000-20261009    gcc-16.1.0
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
s390                  randconfig-2000-20261009    gcc-16.1.0
s390                  randconfig-2001-20261008    gcc-11.5.0
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
sparc                 randconfig-2000-20261009    clang-17
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
sparc64               randconfig-2000-20261009    clang-17
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
x86_64                randconfig-2101-20261009    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
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
xtensa                randconfig-2000-20261009    clang-17
xtensa                randconfig-2001-20261008    gcc-14
xtensa                randconfig-2001-20261009    clang-17
xtensa               randconfig-r2104-20261008    clang-24   cocci
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2309-20261008    clang-24   sparse
xtensa               randconfig-r2309-20261008    gcc-15.2.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
