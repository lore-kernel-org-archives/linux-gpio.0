Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0994282F1D
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973872; cv=none; b=XP7HyRbw6WS1jmONDyqJDeZ1y7YvVGRTCjGt6NZT67mcoXNcy7JjA5CLtCS5U8PNQT0cvqJUy+m+9DgcDO1jwe/ZY0d+9TH1iQDVKdJSV1XR0FoRGSADU319fy44n6H/xGMJcOZ/iCnGjled3txufbXYnhkKFlr61MoMS+MMH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973872; c=relaxed/simple;
	bh=5Fh0yL9P68B0p1IvAuazUNQqXGhLg84Hc20gmpP8zUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jlm5kXrVIU1Br677fMlRe9sp8hHhK/CjmlksVELlz0CiYQaOEyfyGTpKdSXMBkvU9QYhs8MN3k/CTLUSg3yO340gweGaFY1b+lKfdwla1UPYkCKohhCxO0iOOYWbTjxJHHIsM1y5fwCtY123GZ9pPjxUWMLMa7zOp13kVxiILYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+T4P8HV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+T4P8HV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791973871; x=1823509871;
  h=date:from:to:cc:subject:message-id;
  bh=5Fh0yL9P68B0p1IvAuazUNQqXGhLg84Hc20gmpP8zUc=;
  b=G+T4P8HV7iMaXOtih0wIDiw2aonENEzt/zFYbE4CTfYLTmaXYusdI3a5
   Ywhmf6ttYZTFjZrbQohXZr68xHq3+OD/8SbxNFiyxnHXwdB5iapU1/rIg
   +Tf+Yb5hgb9nTz4W2htbNcJHcSgKjUdMe1mTZ/SZt6B+Gjwb948gYql4q
   37W9vHBi8jD6t1uQ20yznd86YyFRDlUGIrA84JuFoVFmb3G0TbdzN5Vh+
   eF1ESzsFysDEkPI6DSJG2zoGal95oh627+eBEJ3fxOCRw9zp8zqJuGSRJ
   gfiKxycDLeriUlVDtfe7Vylge5w5vwsaLhC97CFve8aTW+KlOCkNB+jr0
   A==;
X-CSE-ConnectionGUID: T0p+sHKqTDOS9rl7PKV/Qw==
X-CSE-MsgGUID: X0oxLR5nREWe/fNgzOuGnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="723826"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="723826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:31:10 -0700
X-CSE-ConnectionGUID: 1ts5T7cXR5CSy5t/qiKO/A==
X-CSE-MsgGUID: 8ak4lwtVQd6fDTrctQSxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1739434"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2026 03:31:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGwGI-00000000EWh-0c8P;
	Wed, 14 Oct 2026 10:31:06 +0000
Date: Wed, 14 Oct 2026 18:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 bdacd2542f3c1b2b411fa86ee1f39de19cce6562
Message-ID: <202610141826.xNDzOpzX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: bdacd2542f3c1b2b411fa86ee1f39de19cce6562  Merge branch 'devel' into for-next

elapsed time: 1052m

configs tested: 270
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.1.0
alpha                    allyesconfig    gcc-16.1.0
alpha                       defconfig    gcc-16.1.0
alpha       randconfig-r2110-20261012    gcc-10.5.0 cocci
arc                      allmodconfig    clang-24
arc                       allnoconfig    gcc-16.1.0
arc                      allyesconfig    clang-24
arc                         defconfig    gcc-16.1.0
arc          randconfig-1000-20261014    clang-17
arc          randconfig-1001-20261014    clang-17
arc          randconfig-2000-20261012    gcc-16.1.0
arc          randconfig-2001-20261012    gcc-16.1.0
arc         randconfig-r2200-20261012    gcc-16.1.0 smatch
arm                       allnoconfig    gcc-16.1.0
arm                      allyesconfig    clang-24
arm                         defconfig    gcc-16.1.0
arm          randconfig-1000-20261014    clang-17
arm          randconfig-1001-20261014    clang-17
arm          randconfig-1002-20261014    clang-17
arm          randconfig-1003-20261014    clang-17
arm          randconfig-2000-20261012    gcc-16.1.0
arm          randconfig-2001-20261012    gcc-16.1.0
arm         randconfig-r2107-20261012    gcc-9.5.0  cocci
arm         randconfig-r2306-20261012    gcc-12.5.0 sparse
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.1.0
arm64                       defconfig    gcc-16.1.0
arm64        randconfig-2000-20261012    clang-22
arm64        randconfig-2000-20261012    gcc-16.1.0
arm64        randconfig-2001-20261012    gcc-11.5.0
arm64        randconfig-2001-20261012    gcc-16.1.0
arm64       randconfig-r2101-20261012    gcc-15.2.0 cocci
arm64       randconfig-r2108-20261012    gcc-15.2.0 cocci
arm64       randconfig-r2201-20261012    gcc-10.5.0 smatch
arm64       randconfig-r2303-20261012    clang-24   sparse
arm64       randconfig-r2305-20261012    clang-24   sparse
arm64       randconfig-r2311-20261012    gcc-12.5.0 sparse
csky                     allmodconfig    gcc-16.1.0
csky                      allnoconfig    gcc-16.1.0
csky                        defconfig    gcc-16.1.0
csky         randconfig-2000-20261012    gcc-14.3.0
csky         randconfig-2000-20261012    gcc-16.1.0
csky         randconfig-2001-20261012    gcc-16.1.0
csky        randconfig-r2106-20261012    gcc-14     cocci
csky        randconfig-r2111-20261012    gcc-10.5.0 cocci
csky        randconfig-r2200-20261012    gcc-10.5.0 smatch
csky        randconfig-r2302-20261012    clang-24   sparse
hexagon                  allmodconfig    gcc-16.1.0
hexagon                   allnoconfig    gcc-16.1.0
hexagon                     defconfig    gcc-16.1.0
hexagon      randconfig-1000-20261014    clang-18
hexagon      randconfig-1001-20261014    clang-18
hexagon      randconfig-2000-20261012    clang-17
hexagon      randconfig-2000-20261012    gcc-16.1.0
hexagon      randconfig-2001-20261012    clang-24
hexagon      randconfig-2001-20261012    gcc-16.1.0
hexagon     randconfig-r2102-20261012    clang-19   cocci
hexagon     randconfig-r2102-20261012    clang-24   cocci
hexagon     randconfig-r2109-20261012    clang-24   cocci
hexagon     randconfig-r2110-20261012    gcc-14     cocci
i386                     allmodconfig    clang-22
i386                      allnoconfig    gcc-16.1.0
i386                        defconfig    gcc-16.1.0
i386         randconfig-1000-20261014    clang-22
i386         randconfig-1001-20261014    clang-22
i386         randconfig-1002-20261014    clang-22
i386         randconfig-1003-20261014    clang-22
i386         randconfig-1004-20261014    clang-22
i386         randconfig-1005-20261014    clang-22
i386         randconfig-1006-20261014    clang-22
i386         randconfig-2000-20261012    gcc-16.1.0
i386         randconfig-2001-20261012    gcc-16.1.0
i386         randconfig-2100-20261012    clang-22   cocci
i386         randconfig-2101-20261012    clang-22   cocci
i386         randconfig-2102-20261012    clang-22   cocci
i386         randconfig-2103-20261012    clang-22   cocci
i386         randconfig-2104-20261012    clang-22   cocci
i386         randconfig-2105-20261012    clang-22   cocci
i386         randconfig-2200-20261012    clang-22   smatch
i386         randconfig-2300-20261012    clang-22   sparse
i386         randconfig-2300-20261012    gcc-14     sparse
i386         randconfig-2301-20261012    gcc-14     sparse
i386         randconfig-2302-20261012    clang-22   sparse
i386         randconfig-2302-20261012    gcc-14     sparse
i386        randconfig-r2307-20261012    gcc-12.5.0 sparse
i386        randconfig-r2310-20261012    gcc-12.5.0 sparse
i386        randconfig-r2311-20261012    clang-22   sparse
loongarch                allmodconfig    clang-24
loongarch                 allnoconfig    gcc-16.1.0
loongarch                   defconfig    clang-24
loongarch    randconfig-1000-20261014    clang-18
loongarch    randconfig-1001-20261014    clang-18
loongarch    randconfig-2000-20261012    gcc-11.5.0
loongarch    randconfig-2001-20261012    gcc-11.5.0
loongarch   randconfig-r2101-20261012    clang-24   cocci
loongarch   randconfig-r2106-20261012    gcc-10.5.0 cocci
loongarch   randconfig-r2201-20261012    clang-20   smatch
loongarch   randconfig-r2302-20261012    clang-24   sparse
m68k                     allmodconfig    gcc-16.1.0
m68k                      allnoconfig    gcc-16.1.0
m68k                     allyesconfig    clang-24
m68k                        defconfig    clang-24
m68k        randconfig-r2201-20261012    gcc-13.4.0 smatch
m68k        randconfig-r2305-20261012    clang-24   sparse
microblaze                allnoconfig    gcc-16.1.0
microblaze               allyesconfig    gcc-16.1.0
microblaze                  defconfig    clang-24
microblaze  randconfig-r2109-20261012    gcc-15.2.0 cocci
microblaze  randconfig-r2300-20261012    clang-24   sparse
microblaze  randconfig-r2308-20261012    gcc-12.5.0 sparse
mips                      allnoconfig    gcc-16.1.0
mips                     allyesconfig    gcc-16.1.0
mips                  ath79_defconfig    gcc-16.1.0
mips        randconfig-r2100-20261012    clang-24   cocci
mips        randconfig-r2103-20261012    gcc-15.2.0 cocci
mips        randconfig-r2304-20261012    clang-24   sparse
nios2                    allmodconfig    clang-20
nios2                     allnoconfig    clang-24
nios2                       defconfig    clang-24
nios2        randconfig-1000-20261014    clang-18
nios2        randconfig-1001-20261014    clang-18
nios2        randconfig-2000-20261012    gcc-11.5.0
nios2        randconfig-2001-20261012    gcc-11.5.0
nios2       randconfig-r2107-20261012    gcc-10.5.0 cocci
nios2       randconfig-r2108-20261012    clang-24   cocci
openrisc                 allmodconfig    clang-20
openrisc                  allnoconfig    clang-24
openrisc           de0_nano_defconfig    gcc-16.1.0
openrisc                    defconfig    gcc-16.1.0
openrisc    randconfig-r2104-20261012    gcc-14     cocci
parisc                   allmodconfig    gcc-16.1.0
parisc                    allnoconfig    clang-24
parisc                   allyesconfig    clang-17
parisc                      defconfig    gcc-16.1.0
parisc       randconfig-1000-20261014    clang-22
parisc       randconfig-1001-20261014    clang-22
parisc       randconfig-2000-20261012    gcc-11.5.0
parisc       randconfig-2001-20261012    gcc-11.5.0
parisc      randconfig-r2105-20261012    gcc-9.5.0  cocci
parisc      randconfig-r2110-20261012    gcc-9.5.0  cocci
parisc      randconfig-r2111-20261012    gcc-9.5.0  cocci
parisc64                 alldefconfig    gcc-16.1.0
parisc64                    defconfig    clang-24
powerpc                   allnoconfig    clang-24
powerpc              pasemi_defconfig    gcc-16.1.0
powerpc      randconfig-1000-20261014    clang-22
powerpc      randconfig-1001-20261014    clang-22
powerpc      randconfig-2000-20261012    clang-24
powerpc      randconfig-2000-20261012    gcc-14
powerpc      randconfig-2001-20261012    gcc-13.4.0
powerpc      randconfig-2001-20261012    gcc-14
powerpc     randconfig-r2103-20261012    clang-24   cocci
powerpc     randconfig-r2106-20261012    gcc-9.5.0  cocci
powerpc     randconfig-r2108-20261012    clang-22   cocci
powerpc     randconfig-r2109-20261012    gcc-8.5.0  cocci
powerpc     randconfig-r2309-20261012    clang-22   sparse
powerpc64    randconfig-1000-20261014    clang-22
powerpc64    randconfig-1001-20261014    clang-22
powerpc64    randconfig-2000-20261012    gcc-10.5.0
powerpc64    randconfig-2000-20261012    gcc-14
powerpc64    randconfig-2001-20261012    gcc-11.5.0
powerpc64    randconfig-2001-20261012    gcc-14
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    clang-24
riscv                    allyesconfig    clang-24
riscv                       defconfig    gcc-16.1.0
riscv        randconfig-2000-20261012    gcc-14.3.0
riscv        randconfig-2001-20261012    gcc-14.3.0
riscv       randconfig-r2102-20261012    gcc-15.2.0 cocci
riscv       randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv       randconfig-r2202-20261012    clang-24   smatch
s390                     allmodconfig    clang-17
s390                      allnoconfig    clang-24
s390                  debug_defconfig    gcc-16.1.0
s390                        defconfig    gcc-16.1.0
s390         randconfig-2000-20261012    gcc-14.3.0
s390         randconfig-2001-20261012    gcc-14.3.0
s390        randconfig-r2101-20261012    clang-18   cocci
s390        randconfig-r2105-20261012    gcc-14     cocci
s390        randconfig-r2111-20261012    gcc-14     cocci
s390        randconfig-r2202-20261012    gcc-14.3.0 smatch
s390        randconfig-r2306-20261012    clang-22   sparse
s390        randconfig-r2309-20261012    gcc-12.5.0 sparse
s390        randconfig-r2310-20261012    clang-22   sparse
sh                       allmodconfig    gcc-16.1.0
sh                        allnoconfig    clang-24
sh                       allyesconfig    clang-17
sh                 ap325rxa_defconfig    gcc-16.1.0
sh                          defconfig    gcc-14
sh           randconfig-2000-20261012    gcc-14.3.0
sh           randconfig-2001-20261012    gcc-14.3.0
sh          randconfig-r2300-20261012    clang-24   sparse
sh          randconfig-r2301-20261012    clang-24   sparse
sh                   se7619_defconfig    gcc-16.1.0
sh                  urquell_defconfig    gcc-16.1.0
sparc                     allnoconfig    clang-24
sparc                       defconfig    gcc-16.1.0
sparc        randconfig-2000-20261012    gcc-14.3.0
sparc        randconfig-2000-20261012    gcc-8.5.0
sparc        randconfig-2001-20261012    gcc-8.5.0
sparc       randconfig-r2100-20261012    gcc-15.2.0 cocci
sparc64                  allmodconfig    clang-20
sparc64                     defconfig    gcc-14
sparc64      randconfig-2000-20261012    gcc-11.5.0
sparc64      randconfig-2000-20261012    gcc-8.5.0
sparc64      randconfig-2001-20261012    gcc-8.5.0
sparc64     randconfig-r2200-20261012    clang-20   smatch
um                       allmodconfig    clang-17
um                        allnoconfig    clang-24
um                       allyesconfig    gcc-16.1.0
um                          defconfig    gcc-14
um                     i386_defconfig    gcc-14
um           randconfig-2000-20261012    clang-24
um           randconfig-2000-20261012    gcc-8.5.0
um           randconfig-2001-20261012    gcc-14
um           randconfig-2001-20261012    gcc-8.5.0
um          randconfig-r2202-20261012    clang-17   smatch
um          randconfig-r2307-20261012    clang-22   sparse
um                   x86_64_defconfig    gcc-14
x86_64                   allmodconfig    clang-22
x86_64                    allnoconfig    clang-24
x86_64                      defconfig    gcc-14
x86_64                          kexec    clang-22
x86_64       randconfig-1006-20261014    gcc-14
x86_64       randconfig-1007-20261014    gcc-14
x86_64       randconfig-1008-20261014    gcc-14
x86_64       randconfig-1009-20261014    gcc-14
x86_64       randconfig-1010-20261014    gcc-14
x86_64       randconfig-1011-20261014    gcc-14
x86_64       randconfig-2000-20261012    clang-22
x86_64       randconfig-2000-20261012    gcc-14
x86_64       randconfig-2001-20261012    gcc-14
x86_64       randconfig-2100-20261012    clang-22   cocci
x86_64       randconfig-2101-20261012    clang-22   cocci
x86_64       randconfig-2101-20261012    gcc-14     cocci
x86_64       randconfig-2102-20261012    clang-22   cocci
x86_64       randconfig-2103-20261012    clang-22   cocci
x86_64       randconfig-2104-20261012    clang-22   cocci
x86_64       randconfig-2105-20261012    clang-22   cocci
x86_64       randconfig-2200-20261012    gcc-14     smatch
x86_64       randconfig-2300-20261012    clang-22   sparse
x86_64       randconfig-2300-20261012    gcc-14     sparse
x86_64       randconfig-2301-20261012    clang-22   sparse
x86_64       randconfig-2301-20261012    gcc-14     sparse
x86_64       randconfig-2302-20261012    clang-22   sparse
x86_64       randconfig-2302-20261012    gcc-14     sparse
x86_64      randconfig-r2104-20261012    gcc-10.5.0 cocci
x86_64      randconfig-r2105-20261012    gcc-10.5.0 cocci
x86_64      randconfig-r2107-20261012    gcc-14     cocci
x86_64      randconfig-r2304-20261012    clang-24   sparse
x86_64      randconfig-r2308-20261012    clang-22   sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                   rhel-9.4-bpf    gcc-14
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                 rhel-9.4-kunit    gcc-14
x86_64                   rhel-9.4-ltp    clang-22
x86_64                   rhel-9.4-ltp    gcc-14
x86_64                  rhel-9.4-rust    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    clang-24
xtensa                   allyesconfig    clang-20
xtensa       randconfig-2000-20261012    gcc-8.5.0
xtensa       randconfig-2001-20261012    gcc-8.5.0
xtensa      randconfig-r2100-20261012    gcc-13.4.0 cocci
xtensa      randconfig-r2104-20261012    gcc-9.5.0  cocci
xtensa      randconfig-r2301-20261012    clang-24   sparse
xtensa      randconfig-r2303-20261012    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
