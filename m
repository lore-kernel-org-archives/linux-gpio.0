Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422136;
	b=0aN+SUh5gPe9OAB/VFTPVmxZ2zyucgWp0HZBqFPIjLv5+8eNiY6EQ4p786GrJn3S2k69
	 dlEmG+lx6pQvv3Zyze2w7usx5/oqW4SslHKIkidhqUBLCQ0/ktKtrEkSYpu4WnUZayjVK
	 14qtJDOTSnoQNaNzJJYdSin5l/05yiTtNSXyM9xNQqh4Xk0IraNEdYni1b6tKDJB8JFBM
	 AI0kRowQ5KDYfh/XUt5qRHeYs40SWN2/uRhlGUX+rxYdNfkxdi+w88yROiWziTI+m/Nus
	 7sKC9rmFJn0VOf7YYtt7J6donzvNlxKurvkUU5i2HPGyOrjugG3YTfmPK1Yhv+0eLxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QIklPpiyN6o6oY2CuJHj5780nxG5PcfKjW5UIjmClXc=;
	b=LSwzZfQ3X0Q+xIrKCOL1cIZcDU31DjkJq5J//DXXe2zHNbisMH4tty8wMWeHUPg6OTj5
	 iF/P6HkB/TN+91cXKuc5CWFU2eu9wAWBAShZ4BpdaZ3gwr2DW05EgoDhlTg4lVVctHfw3
	 DF6WSntBXsAalSq0B0ICQn9E5LK3Q1Ix/QN6NhBchq6anV0GCWoAUd0hWFVLW2rXR1JMT
	 y02IARewxF/U4+JprVT0v58yaXYdT6VSD2SrEgiCaLyyOThg7yePVcgVZFhnQJ7G3+x85
	 DcUGxXImsVlFdf27oEjVqM2CoiFTXLcSd+oX4l/e/KJXieYO1+P0jbnY/htWLBHz3vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bqnc1XLa;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AB606A321
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 18:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bqnc1XLa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422136; x=1825958136;
  h=date:from:to:cc:subject:message-id;
  bh=AN5MYITYGoYFi3B8Wx+hLTOYBvkKBN7iCx+S1sUmqbA=;
  b=bqnc1XLaNVBOmOgZuX1exv89VUYpZfKKBprLy9Oc5CQTE8gGufpFIloW
   FTtBFHM9KfWHbp6QYPTvs4vQgFA0w7wMTWyRHVr9wU9oHFKiporUk3g9T
   EPgOVnqFxwoWkv7rXs/+yFcpc1mjSymI8KFbGdiUb21MwbAnIzTF39J0N
   fu6/BpTCQkKFr9pkNtKpmcCK6fQotP6Rt/GbAg4nekYxZ34JilcSzu2/4
   qIr6OIzi10toq4lDfQFiHSrIkOiwqI6RJYKkvsjM0rgQN4RBfx2WUkjfL
   6IGmw0Ngl4V7JsL369XoVnFUXol8B+vb+vrdxVmcBkqef/SpuXyKBmP1R
   g==;
X-CSE-ConnectionGUID: u4gaTFCITSabN6nVi8Ldkg==
X-CSE-MsgGUID: 449iNo1LQ2yAmJQNQWJQFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3094693"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3094693"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:35:35 -0800
X-CSE-ConnectionGUID: VyJO+OkgRc2kdYtkkWPKZQ==
X-CSE-MsgGUID: Pd5aPdWpRfS7AOogo+VxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8645014"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Nov 2026 10:35:33 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRDAR-00000000zSJ-0bZF;
	Wed, 11 Nov 2026 18:35:31 +0000
Date: Thu, 12 Nov 2026 02:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b
Message-ID: <20261112023442.o1A9Aloo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b  MAINTAINERS: Add VF610 GPIO driver support

elapsed time: 1770m

configs tested: 432
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261110    gcc-12.5.0
alpha                 randconfig-2000-20261111    gcc-8.5.0
alpha                 randconfig-2001-20261110    gcc-12.5.0
alpha                 randconfig-2001-20261111    gcc-8.5.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261111    gcc-12.5.0 smatch
alpha                randconfig-r2106-20261110    clang-24   cocci
alpha                randconfig-r2305-20261110    clang-20   sparse
alpha                randconfig-r2308-20261110    clang-17   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    gcc-16.2.0
arc                          haps_hs_defconfig    clang-17
arc                   randconfig-1000-20261111    gcc-15.3.0
arc                   randconfig-1001-20261111    gcc-15.3.0
arc                   randconfig-2000-20261110    gcc-8.5.0
arc                   randconfig-2000-20261111    gcc-14.4.0
arc                   randconfig-2001-20261110    gcc-8.5.0
arc                   randconfig-2001-20261111    gcc-14.4.0
arc                   randconfig-2002-20261110    gcc-8.5.0
arc                   randconfig-2002-20261111    gcc-14.4.0
arc                   randconfig-2003-20261110    gcc-8.5.0
arc                   randconfig-2003-20261111    gcc-14.4.0
arc                   randconfig-2004-20261110    gcc-8.5.0
arc                   randconfig-2004-20261111    gcc-14.4.0
arc                   randconfig-2005-20261110    gcc-8.5.0
arc                   randconfig-2005-20261111    gcc-14.4.0
arc                   randconfig-2200-20261110    gcc-8.5.0  smatch
arc                   randconfig-2200-20261111    gcc-16.2.0 smatch
arc                  randconfig-r2311-20261111    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                   randconfig-1000-20261111    gcc-15.3.0
arm                   randconfig-1001-20261111    gcc-15.3.0
arm                   randconfig-1002-20261111    gcc-15.3.0
arm                   randconfig-1003-20261111    gcc-15.3.0
arm                   randconfig-2000-20261110    clang-24
arm                   randconfig-2000-20261111    gcc-16.2.0
arm                   randconfig-2001-20261110    clang-24
arm                   randconfig-2001-20261111    gcc-16.2.0
arm                   randconfig-2002-20261110    clang-24
arm                   randconfig-2002-20261111    gcc-16.2.0
arm                   randconfig-2200-20261110    gcc-11.5.0 smatch
arm                   randconfig-2200-20261111    gcc-8.5.0  smatch
arm                  randconfig-r2102-20261110    gcc-12.5.0 cocci
arm                  randconfig-r2300-20261110    clang-20   sparse
arm                  randconfig-r2307-20261110    clang-17   sparse
arm                  randconfig-r2308-20261111    gcc-8.5.0  sparse
arm                  randconfig-r2310-20261111    gcc-8.5.0  sparse
arm                            sunxi_defconfig    clang-17
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261111    gcc-13.5.0
arm64                 randconfig-1001-20261111    gcc-13.5.0
arm64                 randconfig-1002-20261111    gcc-13.5.0
arm64                 randconfig-1003-20261111    gcc-13.5.0
arm64                 randconfig-2000-20261110    clang-24
arm64                 randconfig-2000-20261111    gcc-16.2.0
arm64                 randconfig-2001-20261110    clang-24
arm64                 randconfig-2001-20261111    gcc-16.2.0
arm64                 randconfig-2002-20261110    clang-24
arm64                 randconfig-2002-20261111    gcc-16.2.0
arm64                 randconfig-2200-20261110    clang-24   smatch
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261111    gcc-13.5.0
csky                  randconfig-1001-20261111    gcc-13.5.0
csky                  randconfig-2000-20261110    gcc-11.5.0
csky                  randconfig-2000-20261111    gcc-16.2.0
csky                  randconfig-2001-20261110    gcc-11.5.0
csky                  randconfig-2001-20261111    gcc-16.2.0
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                  randconfig-2200-20261111    gcc-16.2.0 smatch
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261111    clang-17
hexagon               randconfig-1001-20261111    clang-17
hexagon               randconfig-2000-20261110    gcc-11.5.0
hexagon               randconfig-2000-20261111    gcc-16.2.0
hexagon               randconfig-2001-20261110    gcc-11.5.0
hexagon               randconfig-2001-20261111    gcc-16.2.0
hexagon               randconfig-2200-20261110    clang-24   smatch
hexagon               randconfig-2200-20261111    clang-24   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-2000-20261110    clang-22
i386                  randconfig-2000-20261111    gcc-14
i386                  randconfig-2001-20261110    clang-22
i386                  randconfig-2001-20261111    gcc-14
i386                  randconfig-2002-20261110    clang-22
i386                  randconfig-2002-20261111    gcc-14
i386                  randconfig-2003-20261110    clang-22
i386                  randconfig-2003-20261111    gcc-14
i386                  randconfig-2004-20261110    clang-22
i386                  randconfig-2004-20261111    gcc-14
i386                  randconfig-2005-20261110    clang-22
i386                  randconfig-2005-20261111    gcc-14
i386                  randconfig-2100-20261110    gcc-14     cocci
i386                  randconfig-2100-20261111    gcc-14     cocci
i386                  randconfig-2101-20261110    gcc-14     cocci
i386                  randconfig-2101-20261111    gcc-14     cocci
i386                  randconfig-2102-20261110    gcc-14     cocci
i386                  randconfig-2102-20261111    gcc-14     cocci
i386                  randconfig-2103-20261110    gcc-14     cocci
i386                  randconfig-2103-20261111    gcc-14     cocci
i386                  randconfig-2104-20261110    gcc-14     cocci
i386                  randconfig-2104-20261111    gcc-14     cocci
i386                  randconfig-2105-20261110    gcc-14     cocci
i386                  randconfig-2105-20261111    gcc-14     cocci
i386                  randconfig-2200-20261110    gcc-13     smatch
i386                  randconfig-2200-20261111    gcc-14     smatch
i386                  randconfig-2300-20261110    clang-22   sparse
i386                  randconfig-2300-20261111    gcc-14     sparse
i386                  randconfig-2301-20261110    clang-22   sparse
i386                  randconfig-2301-20261111    gcc-14     sparse
i386                  randconfig-2302-20261110    clang-22   sparse
i386                  randconfig-2302-20261111    gcc-14     sparse
i386                 randconfig-r2109-20261111    clang-24   cocci
i386                 randconfig-r2309-20261110    clang-17   sparse
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261111    clang-17
loongarch             randconfig-1001-20261111    clang-17
loongarch             randconfig-2000-20261110    gcc-11.5.0
loongarch             randconfig-2000-20261111    gcc-11.5.0
loongarch             randconfig-2001-20261110    gcc-11.5.0
loongarch             randconfig-2001-20261111    gcc-11.5.0
loongarch             randconfig-2200-20261110    clang-24   smatch
loongarch             randconfig-2200-20261111    gcc-16.2.0 smatch
loongarch            randconfig-r2103-20261110    gcc-12.5.0 cocci
loongarch            randconfig-r2111-20261110    clang-24   cocci
loongarch            randconfig-r2304-20261110    clang-20   sparse
loongarch            randconfig-r2311-20261110    clang-17   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261110    gcc-12.5.0
m68k                  randconfig-2000-20261111    gcc-8.5.0
m68k                  randconfig-2001-20261110    gcc-12.5.0
m68k                  randconfig-2001-20261111    gcc-8.5.0
m68k                  randconfig-2200-20261110    gcc-16.2.0 smatch
m68k                  randconfig-2200-20261111    gcc-9.5.0  smatch
m68k                 randconfig-r2301-20261110    clang-20   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261111    gcc-8.5.0
microblaze            randconfig-2001-20261110    gcc-12.5.0
microblaze            randconfig-2001-20261111    gcc-8.5.0
microblaze            randconfig-2200-20261110    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261111    gcc-8.5.0  smatch
microblaze           randconfig-r2107-20261111    clang-24   cocci
microblaze           randconfig-r2109-20261110    clang-24   cocci
microblaze           randconfig-r2303-20261110    clang-20   sparse
microblaze           randconfig-r2310-20261110    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                  randconfig-2000-20261110    gcc-16.2.0
mips                  randconfig-2000-20261111    gcc-10.5.0
mips                  randconfig-2001-20261110    gcc-16.2.0
mips                  randconfig-2001-20261111    gcc-10.5.0
mips                  randconfig-2002-20261110    gcc-16.2.0
mips                  randconfig-2002-20261111    gcc-10.5.0
mips                  randconfig-2200-20261110    clang-17   smatch
mips                  randconfig-2200-20261111    clang-19   smatch
mips                 randconfig-r2104-20261110    gcc-12.5.0 cocci
mips                 randconfig-r2106-20261111    clang-24   cocci
mips                 randconfig-r2107-20261110    clang-24   cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261111    clang-17
nios2                 randconfig-1001-20261111    clang-17
nios2                 randconfig-2000-20261110    gcc-11.5.0
nios2                 randconfig-2000-20261111    gcc-11.5.0
nios2                 randconfig-2001-20261110    gcc-11.5.0
nios2                 randconfig-2001-20261111    gcc-11.5.0
nios2                 randconfig-2200-20261110    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261111    gcc-8.5.0  smatch
nios2                randconfig-r2101-20261110    gcc-12.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261110    gcc-16.2.0
openrisc              randconfig-2000-20261111    gcc-10.5.0
openrisc              randconfig-2001-20261110    gcc-16.2.0
openrisc              randconfig-2001-20261111    gcc-10.5.0
openrisc              randconfig-2002-20261110    gcc-16.2.0
openrisc              randconfig-2002-20261111    gcc-10.5.0
openrisc              randconfig-2200-20261110    gcc-9.5.0  smatch
openrisc              randconfig-2200-20261111    gcc-16.2.0 smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-2000-20261110    gcc-11.5.0
parisc                randconfig-2000-20261111    gcc-11.5.0
parisc                randconfig-2001-20261110    gcc-11.5.0
parisc                randconfig-2001-20261111    gcc-11.5.0
parisc                randconfig-2200-20261110    gcc-15.3.0 smatch
parisc                randconfig-2200-20261111    gcc-14.4.0 smatch
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       pcm030_defconfig    clang-17
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-2000-20261110    gcc-10.5.0
powerpc               randconfig-2000-20261111    gcc-11.5.0
powerpc               randconfig-2001-20261110    gcc-10.5.0
powerpc               randconfig-2001-20261111    gcc-11.5.0
powerpc               randconfig-2002-20261110    gcc-10.5.0
powerpc               randconfig-2002-20261111    gcc-11.5.0
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc               randconfig-2200-20261111    gcc-13.5.0 smatch
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-2000-20261110    gcc-10.5.0
powerpc64             randconfig-2000-20261111    gcc-11.5.0
powerpc64             randconfig-2001-20261110    gcc-10.5.0
powerpc64             randconfig-2001-20261111    gcc-11.5.0
powerpc64             randconfig-2002-20261110    gcc-10.5.0
powerpc64             randconfig-2002-20261111    gcc-11.5.0
powerpc64             randconfig-2200-20261110    clang-24   smatch
powerpc64             randconfig-2200-20261111    gcc-11.5.0 smatch
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261111    clang-17
riscv                 randconfig-1001-20261111    clang-17
riscv                 randconfig-2000-20261110    gcc-12.5.0
riscv                 randconfig-2000-20261111    clang-21
riscv                 randconfig-2001-20261110    gcc-12.5.0
riscv                 randconfig-2001-20261111    clang-21
riscv                 randconfig-2002-20261110    gcc-12.5.0
riscv                 randconfig-2002-20261111    clang-21
riscv                 randconfig-2003-20261110    gcc-12.5.0
riscv                 randconfig-2003-20261111    clang-21
riscv                 randconfig-2004-20261110    gcc-12.5.0
riscv                 randconfig-2004-20261111    clang-21
riscv                 randconfig-2005-20261110    gcc-12.5.0
riscv                 randconfig-2005-20261111    clang-21
riscv                 randconfig-2200-20261110    gcc-8.5.0  smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261111    clang-17
s390                  randconfig-1001-20261111    clang-17
s390                  randconfig-2000-20261110    clang-20
s390                  randconfig-2000-20261111    gcc-8.5.0
s390                  randconfig-2001-20261110    clang-20
s390                  randconfig-2001-20261111    gcc-8.5.0
s390                  randconfig-2002-20261110    clang-20
s390                  randconfig-2002-20261111    gcc-8.5.0
s390                  randconfig-2003-20261110    clang-20
s390                  randconfig-2003-20261111    gcc-8.5.0
s390                  randconfig-2004-20261110    clang-20
s390                  randconfig-2004-20261111    gcc-8.5.0
s390                  randconfig-2005-20261110    clang-20
s390                  randconfig-2005-20261111    gcc-8.5.0
s390                  randconfig-2200-20261110    clang-18   smatch
s390                 randconfig-r2108-20261111    clang-24   cocci
s390                 randconfig-r2306-20261111    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    clang-17
sh                           r7785rp_defconfig    clang-17
sh                    randconfig-1000-20261111    clang-17
sh                    randconfig-1001-20261111    clang-17
sh                    randconfig-2000-20261110    gcc-9.5.0
sh                    randconfig-2000-20261111    gcc-16.2.0
sh                    randconfig-2001-20261110    gcc-9.5.0
sh                    randconfig-2001-20261111    gcc-16.2.0
sh                    randconfig-2002-20261110    gcc-9.5.0
sh                    randconfig-2002-20261111    gcc-16.2.0
sh                    randconfig-2003-20261110    gcc-9.5.0
sh                    randconfig-2003-20261111    gcc-16.2.0
sh                    randconfig-2004-20261110    gcc-9.5.0
sh                    randconfig-2004-20261111    gcc-16.2.0
sh                    randconfig-2005-20261110    gcc-9.5.0
sh                    randconfig-2005-20261111    gcc-16.2.0
sh                    randconfig-2200-20261110    gcc-16.2.0 smatch
sh                    randconfig-2200-20261111    gcc-16.2.0 smatch
sh                   randconfig-r2105-20261110    gcc-12.5.0 cocci
sh                   randconfig-r2111-20261111    clang-24   cocci
sh                   randconfig-r2307-20261111    gcc-8.5.0  sparse
sh                    sh7770_generic_defconfig    clang-17
sh                           urquell_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-2000-20261110    gcc-14
sparc                 randconfig-2000-20261111    clang-18
sparc                 randconfig-2001-20261110    gcc-14
sparc                 randconfig-2001-20261111    clang-18
sparc                 randconfig-2200-20261110    gcc-13.5.0 smatch
sparc                 randconfig-2200-20261111    gcc-12.5.0 smatch
sparc                randconfig-r2110-20261110    clang-24   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2000-20261110    gcc-14
sparc64               randconfig-2000-20261111    clang-18
sparc64               randconfig-2001-20261110    gcc-14
sparc64               randconfig-2001-20261111    clang-18
sparc64               randconfig-2200-20261110    clang-24   smatch
sparc64               randconfig-2200-20261111    gcc-9.5.0  smatch
sparc64              randconfig-r2108-20261110    clang-24   cocci
sparc64              randconfig-r2110-20261111    clang-24   cocci
sparc64              randconfig-r2306-20261110    clang-17   sparse
sparc64              randconfig-r2309-20261111    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2000-20261110    gcc-14
um                    randconfig-2000-20261111    clang-18
um                    randconfig-2001-20261110    gcc-14
um                    randconfig-2001-20261111    clang-18
um                    randconfig-2200-20261110    gcc-14     smatch
um                    randconfig-2200-20261111    clang-24   smatch
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261111    clang-22
x86_64                randconfig-1001-20261111    clang-22
x86_64                randconfig-1002-20261111    clang-22
x86_64                randconfig-1003-20261111    clang-22
x86_64                randconfig-1004-20261111    clang-22
x86_64                randconfig-1005-20261111    clang-22
x86_64                randconfig-1006-20261111    clang-22
x86_64                randconfig-1007-20261111    clang-22
x86_64                randconfig-1008-20261111    clang-22
x86_64                randconfig-1009-20261111    clang-22
x86_64                randconfig-1010-20261111    clang-22
x86_64                randconfig-1011-20261111    clang-22
x86_64                randconfig-2000-20261110    clang-22
x86_64                randconfig-2000-20261111    clang-22
x86_64                randconfig-2001-20261110    clang-22
x86_64                randconfig-2001-20261111    clang-22
x86_64                randconfig-2002-20261110    clang-22
x86_64                randconfig-2002-20261111    clang-22
x86_64                randconfig-2003-20261110    clang-22
x86_64                randconfig-2003-20261111    clang-22
x86_64                randconfig-2004-20261110    clang-22
x86_64                randconfig-2004-20261111    clang-22
x86_64                randconfig-2005-20261110    clang-22
x86_64                randconfig-2005-20261111    clang-22
x86_64                randconfig-2100-20261110    clang-22   cocci
x86_64                randconfig-2100-20261111    clang-22   cocci
x86_64                randconfig-2101-20261110    clang-22   cocci
x86_64                randconfig-2101-20261111    clang-22   cocci
x86_64                randconfig-2102-20261110    clang-22   cocci
x86_64                randconfig-2102-20261111    clang-22   cocci
x86_64                randconfig-2103-20261110    clang-22   cocci
x86_64                randconfig-2103-20261111    clang-22   cocci
x86_64                randconfig-2104-20261110    clang-22   cocci
x86_64                randconfig-2104-20261111    clang-22   cocci
x86_64                randconfig-2105-20261110    clang-22   cocci
x86_64                randconfig-2105-20261111    clang-22   cocci
x86_64                randconfig-2200-20261110    gcc-14     smatch
x86_64                randconfig-2200-20261111    gcc-14     smatch
x86_64                randconfig-2300-20261110    clang-22   sparse
x86_64                randconfig-2300-20261111    gcc-14     sparse
x86_64                randconfig-2301-20261110    clang-22   sparse
x86_64                randconfig-2301-20261111    gcc-14     sparse
x86_64                randconfig-2302-20261110    clang-22   sparse
x86_64                randconfig-2302-20261111    gcc-14     sparse
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
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-2000-20261110    gcc-11.5.0
xtensa                randconfig-2000-20261111    gcc-16.2.0
xtensa                randconfig-2001-20261110    gcc-11.5.0
xtensa                randconfig-2001-20261111    gcc-16.2.0
xtensa                randconfig-2200-20261111    gcc-8.5.0  smatch
xtensa               randconfig-r2100-20261110    gcc-12.5.0 cocci
xtensa               randconfig-r2302-20261110    clang-20   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
