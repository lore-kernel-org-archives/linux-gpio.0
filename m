Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598025;
	b=fx4CGacAwWuxq5yzsxCOdIaXhcf86sgVlbQ5I7mGH/OxjIquDoA1fPlpSHrA1ptZ5f8e
	 wXEq5X6Gon8hVEyI1P0gIB8jEKUdkbAUEnbLXhmb6pjzSWSV3n6LvnVbBXZLWpNgN0kxz
	 8H2lV9sVflfgx8Hn2DOBCRYfk+HZ1+8jz6ZElWXx44PeIVDJAOd3cT9g0g1BEdqscmuRN
	 Jgna1g+/gfcYvVK8vocZvKFZP79aNAICR1jYEl10UT51MMvUXv/EH2cHxGU0Xhmm2OeNN
	 KewC2aO0nT5lB25AL/vPTAmTKdXusfd0dauCrOd2YaVfHIr0CXCxSPYB6vOmULpuE9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598025;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=whWEtwP3Lsfjo7OMgV7EyoVjnue2XUlTY1G20XtIwXY=;
	b=EhBxXVBBTszzKQslf+rhQrlxpbR6ONlSNQaJjZtK9PBMTDqsh4aawrobmKbq8inlRxut
	 EKacRWsEUlZ9qUHSoFLd4XRROTD2c+gIwypS7UG0Gf5aGaZNwR+EpD0q25Ksd4sHN2U24
	 VK4bwaOqbR+NpSBsRSw/vakiWlFHZ/CKxNA4NOS+f5kDGwlUGcrzSkvmxKZyjmmAU/+XV
	 bzVkxVSaMBO9SkulWu4Vh7UUIbiJsuXwKDRq+QEEY4LHBiMjXqCnxS6+wXJD0K+nJRUk3
	 4L0mbE1h9piR7k+HMXX3a+WS2YoyjY773tI8LJ40z9WlxTLf3rDUhdoTTKIeksSl9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBHg3NSB;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45B5606A687
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 09:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45B5606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBHg3NSB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795598025; x=1827134025;
  h=date:from:to:cc:subject:message-id;
  bh=r5pnJXcmCXJc1WmMb+k4NdXJ6b9Fa0NqwIP8N/gnpQI=;
  b=NBHg3NSBxG7eE61P0TPr21BFFWldie4qhGO7taqdCwlEow7K38ycszP0
   YSnqCMUBFWee7Ayb2Yk+GNpiqBuY3XPA41VHhbRhTHsvSq9SLie94Pcae
   YrzGnRc4gBz/ycAXWPQSBl66mT1Q8ar+3vJ9xpd5GL2taEu0xcv70jnGK
   abZsOgII3orpNf324d0Bp5chDbyI4BudJb6kqdRnrWE/PwOg9IxxYMGEM
   VsIZybIcYhn+/yQ81m2jT345lt64YU6wkSmQ12LcDHq66xGI/bvVGefIg
   mlNyxMAnvpFdqtQTcM4d6nBTAPN9H5X0HunBls9SiuHVcSyrs6Wc2QLiD
   w==;
X-CSE-ConnectionGUID: yQTmN4G6SzOXhCYpvivUSw==
X-CSE-MsgGUID: vEqrMHKWRRGwmsZihmRRvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4482554"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4482554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:13:42 -0800
X-CSE-ConnectionGUID: 6e+87YU6SoaavK0rH+1bQQ==
X-CSE-MsgGUID: hjBoQHxUReGlcPWvnVR4EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12098525"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2026 01:13:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW94M-00000001REE-0SJq;
	Wed, 25 Nov 2026 09:13:38 +0000
Date: Wed, 25 Nov 2026 17:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 1f7d535465a5568187cbdfec3beb734bfb5e5015
Message-ID: <20261125171307.DA53J973-lkp@intel.com>
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
branch HEAD: 1f7d535465a5568187cbdfec3beb734bfb5e5015  gpiolib: remove the shared GPIO proxies before freeing the remaining IRQs

elapsed time: 958m

configs tested: 602
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261124    gcc-11.5.0
alpha                 randconfig-2001-20261124    gcc-11.5.0
alpha                 randconfig-2200-20261124    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261125    gcc-10.5.0 smatch
alpha                randconfig-r2101-20261124    clang-22   cocci
alpha                randconfig-r2103-20261124    gcc-9.5.0  cocci
alpha                randconfig-r2111-20261125    gcc-13.5.0 cocci
alpha                randconfig-r2302-20261124    clang-17   sparse
alpha                randconfig-r2303-20261125    gcc-8.5.0  sparse
alpha                randconfig-r2307-20261125    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261125    gcc-8.5.0
arc                   randconfig-1001-20261125    gcc-8.5.0
arc                   randconfig-2000-20261124    gcc-11.5.0
arc                   randconfig-2000-20261125    gcc-10.5.0
arc                   randconfig-2001-20261124    gcc-11.5.0
arc                   randconfig-2001-20261125    gcc-10.5.0
arc                   randconfig-2002-20261124    gcc-11.5.0
arc                   randconfig-2002-20261125    gcc-10.5.0
arc                   randconfig-2003-20261124    gcc-11.5.0
arc                   randconfig-2003-20261125    gcc-10.5.0
arc                   randconfig-2004-20261124    gcc-11.5.0
arc                   randconfig-2004-20261125    gcc-10.5.0
arc                   randconfig-2005-20261124    gcc-11.5.0
arc                   randconfig-2005-20261125    gcc-10.5.0
arc                   randconfig-2200-20261124    gcc-8.5.0  smatch
arc                   randconfig-2200-20261125    gcc-14.4.0 smatch
arc                  randconfig-r2101-20261124    gcc-16.2.0 cocci
arc                  randconfig-r2106-20261124    clang-24   cocci
arc                  randconfig-r2107-20261125    gcc-13.5.0 cocci
arc                  randconfig-r2110-20261124    clang-24   cocci
arc                  randconfig-r2300-20261124    clang-17   sparse
arc                  randconfig-r2300-20261124    gcc-16.2.0 sparse
arc                  randconfig-r2307-20261124    clang-24   sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    clang-17
arm                         clps711x_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                          lpc18xx_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                           moxart_defconfig    clang-17
arm                           moxart_defconfig    clang-24
arm                          mv78xx0_defconfig    clang-17
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                           pxa168_defconfig    clang-17
arm                           pxa168_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261125    gcc-8.5.0
arm                   randconfig-1001-20261125    gcc-8.5.0
arm                   randconfig-1002-20261125    gcc-8.5.0
arm                   randconfig-1003-20261125    gcc-8.5.0
arm                   randconfig-2000-20261124    clang-17
arm                   randconfig-2000-20261125    clang-22
arm                   randconfig-2001-20261124    clang-17
arm                   randconfig-2001-20261125    clang-22
arm                   randconfig-2002-20261124    clang-17
arm                   randconfig-2002-20261125    clang-22
arm                   randconfig-2200-20261124    clang-17   smatch
arm                   randconfig-2200-20261125    clang-21   smatch
arm                  randconfig-r2103-20261124    gcc-16.2.0 cocci
arm                  randconfig-r2105-20261124    gcc-16.2.0 cocci
arm                  randconfig-r2110-20261124    clang-24   cocci
arm                  randconfig-r2300-20261124    clang-22   sparse
arm                  randconfig-r2302-20261124    clang-18   sparse
arm                  randconfig-r2303-20261124    gcc-16.2.0 sparse
arm                  randconfig-r2304-20261124    gcc-16.2.0 sparse
arm                  randconfig-r2305-20261124    gcc-14.4.0 sparse
arm                  randconfig-r2307-20261124    gcc-9.5.0  sparse
arm                  randconfig-r2311-20261124    clang-24   sparse
arm                            sama7_defconfig    clang-17
arm                          socfpga_defconfig    clang-17
arm                           sp7021_defconfig    clang-24
arm                           sp7021_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261125    clang-24
arm64                 randconfig-1001-20261125    clang-24
arm64                 randconfig-1002-20261125    clang-24
arm64                 randconfig-1003-20261125    clang-24
arm64                 randconfig-2000-20261124    clang-17
arm64                 randconfig-2000-20261125    clang-22
arm64                 randconfig-2001-20261124    clang-17
arm64                 randconfig-2001-20261125    clang-22
arm64                 randconfig-2002-20261124    clang-17
arm64                 randconfig-2002-20261125    clang-22
arm64                 randconfig-2200-20261124    gcc-16.2.0 smatch
arm64                 randconfig-2200-20261125    gcc-13.5.0 smatch
arm64                randconfig-r2107-20261124    clang-24   cocci
arm64                randconfig-r2109-20261124    clang-24   cocci
arm64                randconfig-r2111-20261124    gcc-15.3.0 cocci
arm64                randconfig-r2300-20261124    gcc-16.2.0 sparse
arm64                randconfig-r2306-20261125    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261125    clang-24
csky                  randconfig-1001-20261125    clang-24
csky                  randconfig-2000-20261124    gcc-16.2.0
csky                  randconfig-2001-20261124    gcc-16.2.0
csky                  randconfig-2200-20261124    gcc-15.3.0 smatch
csky                  randconfig-2200-20261125    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261124    gcc-8.5.0  cocci
csky                 randconfig-r2104-20261124    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261124    clang-22   cocci
csky                 randconfig-r2302-20261124    gcc-14.4.0 sparse
csky                 randconfig-r2309-20261124    clang-24   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261125    gcc-11.5.0
hexagon               randconfig-1001-20261125    gcc-11.5.0
hexagon               randconfig-2000-20261124    gcc-16.2.0
hexagon               randconfig-2001-20261124    gcc-16.2.0
hexagon               randconfig-2200-20261125    clang-17   smatch
hexagon              randconfig-r2103-20261124    clang-22   cocci
hexagon              randconfig-r2107-20261124    clang-24   cocci
hexagon              randconfig-r2107-20261124    gcc-14     cocci
hexagon              randconfig-r2107-20261125    gcc-11.5.0 cocci
hexagon              randconfig-r2302-20261124    gcc-16.2.0 sparse
hexagon              randconfig-r2309-20261125    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261125    clang-22
i386        buildonly-randconfig-1001-20261125    clang-22
i386        buildonly-randconfig-1002-20261125    clang-22
i386        buildonly-randconfig-1003-20261125    clang-22
i386        buildonly-randconfig-1004-20261125    clang-22
i386        buildonly-randconfig-1005-20261125    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261125    clang-22
i386                  randconfig-1001-20261125    clang-22
i386                  randconfig-1002-20261125    clang-22
i386                  randconfig-1003-20261125    clang-22
i386                  randconfig-1004-20261125    clang-22
i386                  randconfig-1005-20261125    clang-22
i386                  randconfig-1006-20261125    clang-22
i386                  randconfig-2000-20261124    clang-22
i386                  randconfig-2000-20261124    gcc-14
i386                  randconfig-2000-20261125    gcc-14
i386                  randconfig-2001-20261124    clang-22
i386                  randconfig-2001-20261124    gcc-14
i386                  randconfig-2001-20261125    gcc-14
i386                  randconfig-2002-20261124    gcc-14
i386                  randconfig-2002-20261125    gcc-14
i386                  randconfig-2003-20261124    clang-22
i386                  randconfig-2003-20261124    gcc-14
i386                  randconfig-2003-20261125    gcc-14
i386                  randconfig-2004-20261124    gcc-14
i386                  randconfig-2004-20261125    gcc-14
i386                  randconfig-2005-20261124    gcc-14
i386                  randconfig-2005-20261125    gcc-14
i386                  randconfig-2100-20261124    gcc-14     cocci
i386                  randconfig-2101-20261124    gcc-14     cocci
i386                  randconfig-2102-20261124    gcc-14     cocci
i386                  randconfig-2103-20261124    gcc-14     cocci
i386                  randconfig-2104-20261124    gcc-14     cocci
i386                  randconfig-2105-20261124    gcc-14     cocci
i386                  randconfig-2200-20261124    clang-22   smatch
i386                  randconfig-2200-20261125    clang-22   smatch
i386                  randconfig-2300-20261124    clang-22   sparse
i386                  randconfig-2300-20261124    gcc-14     sparse
i386                  randconfig-2301-20261124    gcc-14     sparse
i386                  randconfig-2302-20261124    clang-22   sparse
i386                  randconfig-2302-20261124    gcc-14     sparse
i386                 randconfig-r2103-20261124    gcc-16.2.0 cocci
i386                 randconfig-r2104-20261124    clang-22   cocci
i386                 randconfig-r2109-20261124    gcc-14     cocci
i386                 randconfig-r2300-20261124    clang-18   sparse
i386                 randconfig-r2300-20261124    gcc-14.4.0 sparse
i386                 randconfig-r2301-20261124    gcc-16.2.0 sparse
i386                 randconfig-r2303-20261124    clang-22   sparse
i386                 randconfig-r2303-20261124    gcc-14.4.0 sparse
i386                 randconfig-r2305-20261124    gcc-16.2.0 sparse
i386                 randconfig-r2306-20261124    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261125    gcc-11.5.0
loongarch             randconfig-1001-20261125    gcc-11.5.0
loongarch             randconfig-2000-20261124    clang-18
loongarch             randconfig-2000-20261125    clang-19
loongarch             randconfig-2001-20261124    clang-18
loongarch             randconfig-2001-20261125    clang-19
loongarch             randconfig-2200-20261124    gcc-16.2.0 smatch
loongarch             randconfig-2200-20261125    clang-18   smatch
loongarch            randconfig-r2100-20261124    gcc-16.2.0 cocci
loongarch            randconfig-r2100-20261124    gcc-9.5.0  cocci
loongarch            randconfig-r2106-20261125    gcc-11.5.0 cocci
loongarch            randconfig-r2304-20261124    gcc-14.4.0 sparse
loongarch            randconfig-r2306-20261125    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261124    gcc-11.5.0
m68k                  randconfig-2001-20261124    gcc-11.5.0
m68k                  randconfig-2200-20261124    gcc-10.5.0 smatch
m68k                  randconfig-2200-20261125    gcc-15.3.0 smatch
m68k                 randconfig-r2102-20261124    gcc-9.5.0  cocci
m68k                 randconfig-r2107-20261124    clang-20   cocci
m68k                 randconfig-r2300-20261124    gcc-15.3.0 sparse
m68k                 randconfig-r2300-20261125    gcc-8.5.0  sparse
m68k                 randconfig-r2301-20261125    gcc-8.5.0  sparse
m68k                 randconfig-r2308-20261124    gcc-9.5.0  sparse
m68k                           sun3x_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261124    gcc-11.5.0
microblaze            randconfig-2001-20261124    gcc-11.5.0
microblaze            randconfig-2200-20261124    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze           randconfig-r2104-20261125    gcc-12.5.0 cocci
microblaze           randconfig-r2105-20261124    gcc-8.5.0  cocci
microblaze           randconfig-r2106-20261125    gcc-13.5.0 cocci
microblaze           randconfig-r2107-20261124    gcc-11.5.0 cocci
microblaze           randconfig-r2108-20261124    gcc-15.3.0 cocci
microblaze           randconfig-r2108-20261125    gcc-13.5.0 cocci
microblaze           randconfig-r2301-20261124    gcc-14.4.0 sparse
microblaze           randconfig-r2302-20261124    gcc-16.2.0 sparse
microblaze           randconfig-r2305-20261124    clang-17   sparse
microblaze           randconfig-r2305-20261125    gcc-8.5.0  sparse
microblaze           randconfig-r2309-20261124    gcc-9.5.0  sparse
microblaze           randconfig-r2310-20261125    gcc-13.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    clang-17
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    clang-17
mips                  decstation_r4k_defconfig    clang-17
mips                            gcw0_defconfig    clang-24
mips                            ip30_defconfig    clang-17
mips                            ip30_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    clang-24
mips                  randconfig-2000-20261124    clang-20
mips                  randconfig-2000-20261124    gcc-16.2.0
mips                  randconfig-2000-20261125    gcc-16.2.0
mips                  randconfig-2001-20261124    clang-20
mips                  randconfig-2001-20261124    gcc-16.2.0
mips                  randconfig-2001-20261125    gcc-16.2.0
mips                  randconfig-2002-20261124    clang-24
mips                  randconfig-2002-20261124    gcc-16.2.0
mips                  randconfig-2002-20261125    gcc-16.2.0
mips                  randconfig-2200-20261124    clang-20   smatch
mips                  randconfig-2200-20261125    clang-24   smatch
mips                 randconfig-r2100-20261124    gcc-16.2.0 cocci
mips                 randconfig-r2101-20261124    gcc-16.2.0 cocci
mips                 randconfig-r2108-20261125    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261124    gcc-14     cocci
mips                          rt305x_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261125    gcc-11.5.0
nios2                 randconfig-1001-20261125    gcc-11.5.0
nios2                 randconfig-2000-20261124    clang-18
nios2                 randconfig-2000-20261125    clang-19
nios2                 randconfig-2001-20261124    clang-18
nios2                 randconfig-2001-20261125    clang-19
nios2                 randconfig-2200-20261124    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261125    gcc-8.5.0  smatch
nios2                randconfig-r2100-20261124    clang-22   cocci
nios2                randconfig-r2104-20261124    gcc-16.2.0 cocci
nios2                randconfig-r2104-20261124    gcc-9.5.0  cocci
nios2                randconfig-r2108-20261124    clang-20   cocci
nios2                randconfig-r2109-20261125    gcc-13.5.0 cocci
nios2                randconfig-r2111-20261124    clang-24   cocci
nios2                randconfig-r2111-20261124    gcc-14     cocci
nios2                randconfig-r2304-20261124    clang-22   sparse
nios2                randconfig-r2305-20261124    clang-22   sparse
nios2                randconfig-r2305-20261124    gcc-15.3.0 sparse
nios2                randconfig-r2306-20261124    gcc-9.5.0  sparse
nios2                randconfig-r2307-20261125    gcc-13.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261124    gcc-16.2.0
openrisc              randconfig-2000-20261125    gcc-16.2.0
openrisc              randconfig-2001-20261124    gcc-11.5.0
openrisc              randconfig-2001-20261124    gcc-16.2.0
openrisc              randconfig-2001-20261125    gcc-16.2.0
openrisc              randconfig-2002-20261124    gcc-16.2.0
openrisc              randconfig-2002-20261125    gcc-16.2.0
openrisc              randconfig-2200-20261124    gcc-11.5.0 smatch
openrisc              randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc             randconfig-r2102-20261124    clang-22   cocci
openrisc             randconfig-r2103-20261124    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261124    gcc-16.2.0 cocci
openrisc             randconfig-r2106-20261124    gcc-15.3.0 cocci
openrisc             randconfig-r2110-20261125    gcc-11.5.0 cocci
openrisc             randconfig-r2111-20261124    clang-24   cocci
openrisc             randconfig-r2111-20261124    gcc-11.5.0 cocci
openrisc             randconfig-r2304-20261124    clang-17   sparse
openrisc             randconfig-r2310-20261125    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261125    clang-24
parisc                randconfig-1001-20261125    clang-24
parisc                randconfig-2000-20261124    clang-18
parisc                randconfig-2000-20261125    clang-19
parisc                randconfig-2001-20261124    clang-18
parisc                randconfig-2001-20261125    clang-19
parisc                randconfig-2200-20261124    gcc-9.5.0  smatch
parisc                randconfig-2200-20261125    gcc-12.5.0 smatch
parisc               randconfig-r2301-20261124    gcc-15.3.0 sparse
parisc               randconfig-r2304-20261125    gcc-8.5.0  sparse
parisc               randconfig-r2311-20261124    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                  mpc836x_rdk_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261125    clang-24
powerpc               randconfig-1001-20261125    clang-24
powerpc               randconfig-2000-20261124    clang-17
powerpc               randconfig-2000-20261124    clang-24
powerpc               randconfig-2000-20261125    gcc-9.5.0
powerpc               randconfig-2001-20261124    clang-24
powerpc               randconfig-2001-20261124    gcc-10.5.0
powerpc               randconfig-2001-20261125    gcc-9.5.0
powerpc               randconfig-2002-20261124    clang-24
powerpc               randconfig-2002-20261125    gcc-9.5.0
powerpc               randconfig-2200-20261124    clang-21   smatch
powerpc               randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc              randconfig-r2100-20261124    gcc-8.5.0  cocci
powerpc              randconfig-r2102-20261124    clang-22   cocci
powerpc              randconfig-r2102-20261124    gcc-16.2.0 cocci
powerpc              randconfig-r2104-20261124    gcc-16.2.0 cocci
powerpc              randconfig-r2106-20261124    clang-20   cocci
powerpc              randconfig-r2106-20261124    clang-24   cocci
powerpc              randconfig-r2301-20261124    clang-18   sparse
powerpc              randconfig-r2302-20261124    clang-22   sparse
powerpc              randconfig-r2304-20261124    gcc-15.3.0 sparse
powerpc              randconfig-r2311-20261125    gcc-13.5.0 sparse
powerpc                      tqm8555_defconfig    clang-17
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261125    clang-24
powerpc64             randconfig-1001-20261125    clang-24
powerpc64             randconfig-2000-20261124    clang-24
powerpc64             randconfig-2000-20261125    gcc-9.5.0
powerpc64             randconfig-2001-20261124    clang-22
powerpc64             randconfig-2001-20261124    clang-24
powerpc64             randconfig-2001-20261125    gcc-9.5.0
powerpc64             randconfig-2002-20261124    clang-24
powerpc64             randconfig-2002-20261125    gcc-9.5.0
powerpc64             randconfig-2200-20261124    gcc-12.5.0 smatch
powerpc64             randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64            randconfig-r2101-20261124    clang-22   cocci
powerpc64            randconfig-r2102-20261124    gcc-8.5.0  cocci
powerpc64            randconfig-r2105-20261124    clang-22   cocci
powerpc64            randconfig-r2105-20261124    gcc-16.2.0 cocci
powerpc64            randconfig-r2105-20261125    gcc-12.5.0 cocci
powerpc64            randconfig-r2108-20261124    clang-24   cocci
powerpc64            randconfig-r2110-20261124    clang-24   cocci
powerpc64            randconfig-r2303-20261124    clang-17   sparse
powerpc64            randconfig-r2310-20261124    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261125    gcc-8.5.0
riscv                 randconfig-1001-20261125    gcc-8.5.0
riscv                 randconfig-2000-20261124    gcc-16.2.0
riscv                 randconfig-2000-20261125    gcc-13.5.0
riscv                 randconfig-2001-20261124    gcc-16.2.0
riscv                 randconfig-2001-20261125    gcc-13.5.0
riscv                 randconfig-2002-20261124    gcc-16.2.0
riscv                 randconfig-2002-20261125    gcc-13.5.0
riscv                 randconfig-2003-20261124    gcc-16.2.0
riscv                 randconfig-2003-20261125    gcc-13.5.0
riscv                 randconfig-2004-20261124    gcc-16.2.0
riscv                 randconfig-2004-20261125    gcc-13.5.0
riscv                 randconfig-2005-20261124    gcc-16.2.0
riscv                 randconfig-2005-20261125    gcc-13.5.0
riscv                 randconfig-2200-20261124    gcc-14.4.0 smatch
riscv                 randconfig-2200-20261125    gcc-8.5.0  smatch
riscv                randconfig-r2102-20261124    gcc-16.2.0 cocci
riscv                randconfig-r2106-20261124    clang-24   cocci
riscv                randconfig-r2107-20261124    clang-24   cocci
riscv                randconfig-r2109-20261125    gcc-11.5.0 cocci
riscv                randconfig-r2110-20261124    gcc-11.5.0 cocci
riscv                randconfig-r2111-20261124    clang-20   cocci
riscv                randconfig-r2303-20261124    gcc-15.3.0 sparse
riscv                randconfig-r2305-20261124    clang-18   sparse
riscv                randconfig-r2305-20261124    gcc-16.2.0 sparse
riscv                randconfig-r2306-20261124    clang-24   sparse
riscv                randconfig-r2308-20261124    clang-24   sparse
riscv                randconfig-r2311-20261124    gcc-9.5.0  sparse
riscv                randconfig-r2311-20261125    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261125    gcc-8.5.0
s390                  randconfig-1001-20261125    gcc-8.5.0
s390                  randconfig-2000-20261124    clang-24
s390                  randconfig-2000-20261125    clang-24
s390                  randconfig-2001-20261124    clang-24
s390                  randconfig-2001-20261125    clang-24
s390                  randconfig-2002-20261124    clang-24
s390                  randconfig-2002-20261125    clang-24
s390                  randconfig-2003-20261124    clang-24
s390                  randconfig-2003-20261125    clang-24
s390                  randconfig-2004-20261124    clang-24
s390                  randconfig-2004-20261125    clang-24
s390                  randconfig-2005-20261124    clang-24
s390                  randconfig-2005-20261125    clang-24
s390                  randconfig-2200-20261124    clang-24   smatch
s390                  randconfig-2200-20261125    gcc-15.3.0 smatch
s390                 randconfig-r2102-20261125    gcc-12.5.0 cocci
s390                 randconfig-r2103-20261125    gcc-12.5.0 cocci
s390                 randconfig-r2106-20261124    gcc-14     cocci
s390                 randconfig-r2110-20261124    clang-20   cocci
s390                 randconfig-r2111-20261125    gcc-11.5.0 cocci
s390                 randconfig-r2303-20261124    clang-18   sparse
s390                 randconfig-r2308-20261125    gcc-13.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    clang-24
sh                    randconfig-1000-20261125    gcc-8.5.0
sh                    randconfig-1001-20261125    gcc-8.5.0
sh                    randconfig-2000-20261124    gcc-11.5.0
sh                    randconfig-2000-20261125    gcc-14.4.0
sh                    randconfig-2001-20261124    gcc-11.5.0
sh                    randconfig-2001-20261125    gcc-14.4.0
sh                    randconfig-2002-20261124    gcc-11.5.0
sh                    randconfig-2002-20261125    gcc-14.4.0
sh                    randconfig-2003-20261124    gcc-11.5.0
sh                    randconfig-2003-20261125    gcc-14.4.0
sh                    randconfig-2004-20261124    gcc-11.5.0
sh                    randconfig-2004-20261125    gcc-14.4.0
sh                    randconfig-2005-20261124    gcc-11.5.0
sh                    randconfig-2005-20261125    gcc-14.4.0
sh                    randconfig-2200-20261124    gcc-16.2.0 smatch
sh                    randconfig-2200-20261125    gcc-14.4.0 smatch
sh                   randconfig-r2100-20261125    gcc-12.5.0 cocci
sh                   randconfig-r2103-20261124    clang-22   cocci
sh                   randconfig-r2106-20261124    gcc-11.5.0 cocci
sh                   randconfig-r2107-20261124    gcc-15.3.0 cocci
sh                   randconfig-r2109-20261124    gcc-11.5.0 cocci
sh                   randconfig-r2302-20261124    gcc-15.3.0 sparse
sh                   randconfig-r2307-20261124    clang-24   sparse
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7780_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261125    gcc-12
sparc                 randconfig-1001-20261125    gcc-12
sparc                 randconfig-2000-20261124    gcc-8.5.0
sparc                 randconfig-2000-20261125    gcc-8.5.0
sparc                 randconfig-2001-20261124    gcc-8.5.0
sparc                 randconfig-2001-20261125    gcc-8.5.0
sparc                 randconfig-2200-20261124    gcc-11.5.0 smatch
sparc                 randconfig-2200-20261125    gcc-14.4.0 smatch
sparc                randconfig-r2102-20261124    gcc-16.2.0 cocci
sparc                randconfig-r2104-20261124    gcc-16.2.0 cocci
sparc                randconfig-r2108-20261124    clang-24   cocci
sparc                randconfig-r2109-20261124    clang-24   cocci
sparc                randconfig-r2302-20261125    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261124    clang-24   sparse
sparc                randconfig-r2310-20261124    clang-24   sparse
sparc64                           alldefconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261125    gcc-12
sparc64               randconfig-1001-20261125    gcc-12
sparc64               randconfig-2000-20261124    gcc-8.5.0
sparc64               randconfig-2000-20261125    gcc-8.5.0
sparc64               randconfig-2001-20261124    gcc-8.5.0
sparc64               randconfig-2001-20261125    gcc-8.5.0
sparc64               randconfig-2200-20261124    clang-24   smatch
sparc64               randconfig-2200-20261125    gcc-15.3.0 smatch
sparc64              randconfig-r2105-20261124    gcc-9.5.0  cocci
sparc64              randconfig-r2108-20261124    gcc-14     cocci
sparc64              randconfig-r2109-20261124    clang-20   cocci
sparc64              randconfig-r2109-20261124    gcc-15.3.0 cocci
sparc64              randconfig-r2310-20261124    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261125    gcc-12
um                    randconfig-1001-20261125    gcc-12
um                    randconfig-2000-20261124    gcc-8.5.0
um                    randconfig-2000-20261125    gcc-8.5.0
um                    randconfig-2001-20261124    gcc-8.5.0
um                    randconfig-2001-20261125    gcc-8.5.0
um                    randconfig-2200-20261124    gcc-14     smatch
um                    randconfig-2200-20261125    clang-17   smatch
um                   randconfig-r2100-20261124    clang-22   cocci
um                   randconfig-r2101-20261124    gcc-9.5.0  cocci
um                   randconfig-r2101-20261125    gcc-12.5.0 cocci
um                   randconfig-r2103-20261124    gcc-16.2.0 cocci
um                   randconfig-r2301-20261124    gcc-16.2.0 sparse
um                   randconfig-r2304-20261124    clang-18   sparse
um                   randconfig-r2308-20261124    clang-24   sparse
um                   randconfig-r2308-20261125    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261125    clang-22
x86_64      buildonly-randconfig-1001-20261125    clang-22
x86_64      buildonly-randconfig-1002-20261125    clang-22
x86_64      buildonly-randconfig-1003-20261125    clang-22
x86_64      buildonly-randconfig-1004-20261125    clang-22
x86_64      buildonly-randconfig-1005-20261125    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261125    clang-22
x86_64                randconfig-1001-20261125    clang-22
x86_64                randconfig-1002-20261125    clang-22
x86_64                randconfig-1003-20261125    clang-22
x86_64                randconfig-1004-20261125    clang-22
x86_64                randconfig-1005-20261125    clang-22
x86_64                randconfig-2000-20261124    gcc-14
x86_64                randconfig-2000-20261125    gcc-14
x86_64                randconfig-2001-20261124    gcc-14
x86_64                randconfig-2001-20261125    gcc-14
x86_64                randconfig-2002-20261124    gcc-14
x86_64                randconfig-2002-20261125    gcc-14
x86_64                randconfig-2003-20261124    gcc-14
x86_64                randconfig-2003-20261125    gcc-14
x86_64                randconfig-2004-20261124    gcc-14
x86_64                randconfig-2004-20261125    gcc-14
x86_64                randconfig-2005-20261124    gcc-14
x86_64                randconfig-2005-20261125    gcc-14
x86_64                randconfig-2100-20261124    gcc-14     cocci
x86_64                randconfig-2100-20261125    clang-22   cocci
x86_64                randconfig-2101-20261124    gcc-14     cocci
x86_64                randconfig-2101-20261125    clang-22   cocci
x86_64                randconfig-2102-20261124    gcc-14     cocci
x86_64                randconfig-2102-20261125    clang-22   cocci
x86_64                randconfig-2103-20261124    gcc-14     cocci
x86_64                randconfig-2103-20261125    clang-22   cocci
x86_64                randconfig-2104-20261124    gcc-14     cocci
x86_64                randconfig-2104-20261125    clang-22   cocci
x86_64                randconfig-2105-20261124    gcc-14     cocci
x86_64                randconfig-2105-20261125    clang-22   cocci
x86_64                randconfig-2200-20261124    gcc-14     smatch
x86_64                randconfig-2200-20261125    gcc-14     smatch
x86_64                randconfig-2300-20261124    gcc-14     sparse
x86_64                randconfig-2301-20261124    gcc-14     sparse
x86_64                randconfig-2302-20261124    gcc-14     sparse
x86_64               randconfig-r2109-20261124    clang-24   cocci
x86_64               randconfig-r2110-20261124    gcc-15.3.0 cocci
x86_64               randconfig-r2301-20261124    clang-22   sparse
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
xtensa                   audio_kc705_defconfig    clang-17
xtensa                           iss_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261125    gcc-12
xtensa                randconfig-1001-20261125    gcc-12
xtensa                randconfig-2000-20261124    gcc-16.2.0
xtensa                randconfig-2001-20261124    gcc-16.2.0
xtensa                randconfig-2200-20261124    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa               randconfig-r2100-20261124    gcc-16.2.0 cocci
xtensa               randconfig-r2101-20261124    gcc-16.2.0 cocci
xtensa               randconfig-r2108-20261124    clang-24   cocci
xtensa               randconfig-r2108-20261124    gcc-11.5.0 cocci
xtensa               randconfig-r2110-20261125    gcc-13.5.0 cocci
xtensa               randconfig-r2111-20261124    clang-24   cocci
xtensa               randconfig-r2301-20261124    clang-17   sparse
xtensa               randconfig-r2309-20261125    gcc-13.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
