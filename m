Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161510;
	b=VhukPnHTtrI8HX/EGZm93RB17iAiQa+xa3AVXSRpEBqJcN/AsPk3s8uruvEf7gA1yLgK
	 cNEw/3pxc1D9FHvTwmoL25LbXhEwVHLqcezOei30YjsFxKL59fUB23Jder33JVZPafPzc
	 UN0TEyXoag720QMgiTmyZiV4RL0gyA/UAT6RYyWrXJb1vJQ7FbW/49oDOUZl84yY7I0Mw
	 XFuMa3dkJaNH276brKugWEZW8eccTmS2XIXoSYVk6nPQePciB+qSd9jMUKmQKU0KrIVuL
	 okQ+BKCQXJTucdLR8wsrVsRCiU22HKplN6BElKBejTQ71rkfEYQv4qZZK4fOb5682xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161510;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UU9c/tpurADhzgqDkLhTzG8U0onZ1MMW7Ow5Nr+pjOI=;
	b=17086H745EX8ioTlzSHR/75tT0C/LSHiADu3SVI5z4YlWqufo7RePhDZhXIhwjuvbH4L
	 tZuweFuAqo8/HOQ6Sovr/aUgE1ZJWjPxsWY3w+Q7aWf8hVEbgIVrrb4ZpI08djiRlx6iC
	 nhCl/Ka0+GfLHDSpzmLJIjUr5162wuf6lBMB7oXyfRVlD1HBEPBfuIMvcNRYZYxxztW+m
	 hj/z0oHwZk+jcyTjaB/uFsMPXVuw+ktg6eKmGvuNo/E+J70/l/RDcqOrNPuBwHBA230i2
	 /r6bhn/19WzweI5szIcQIWqWlEwz63/k8tRbEScQwP4Cx4l84rrXfycND4aq61z3ttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HM3POrnX;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3B606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 04:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HM3POrnX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161509; x=1824697509;
  h=date:from:to:cc:subject:message-id;
  bh=NkKN8GumtZjJn/+bxzubZJG03yVr5srE0401dKE8M6E=;
  b=HM3POrnXRTfZ93Lok1xMlk0wJ0tQBS7+TQBOEjhn3IHAuWCr4Rgvknna
   YzYcHBmjRLV6v2vS9ORo+FEbzEqQM9vP5AiZ6tWwNNHkFykXaHvJezKvH
   gngrzGa7X4Nj93heUyqTtyMNqiBAGSlSQpZhaWzEj3/vUkKlmn4t1thmf
   oOSnXVTbzJtI1v7llKgDp9KBbvP/FmRnMOctTAOG7FvglQpX8Ti8sqNNf
   4wak1Qfy+ZcGFQU1mQXXzTsSnoapBVrBrIrCbwMULXGy/LMK/KHtxnLXu
   FdMQoTjfFAcLvIbGPr/LF+shoKCWpOQlOvfX4KRlqy5OdmT1LP8T3HFGn
   A==;
X-CSE-ConnectionGUID: thRq2brDQDS/obgG3fZ6XQ==
X-CSE-MsgGUID: tCVrygiQQfG//L72hzy6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1755071"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1755071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:25:08 -0700
X-CSE-ConnectionGUID: OqP9pHCXTwKgNlJp16qbPg==
X-CSE-MsgGUID: exhLNsGgTxWB876n9m9YfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5070286"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Oct 2026 21:25:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvDk-00000000YAY-04tI;
	Wed, 28 Oct 2026 04:25:04 +0000
Date: Wed, 28 Oct 2026 12:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 15665047024e30f9c2227563d03034061c99ac2c
Message-ID: <202610281234.hQyG3SXY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 15665047024e30f9c2227563d03034061c99ac2c  gpiolib: Propagate emulated drive errors when setting arrays

elapsed time: 8162m

configs tested: 192
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261023    gcc-14.4.0
arc                   randconfig-1001-20261023    gcc-14.4.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                               allyesconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261023    gcc-14.4.0
arm                   randconfig-1001-20261023    gcc-14.4.0
arm                   randconfig-1002-20261023    gcc-14.4.0
arm                   randconfig-1003-20261023    gcc-14.4.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261023    gcc-8.5.0
arm64                 randconfig-1001-20261023    gcc-8.5.0
arm64                 randconfig-1002-20261023    gcc-8.5.0
arm64                 randconfig-1003-20261023    gcc-8.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261023    gcc-8.5.0
csky                  randconfig-1001-20261023    gcc-8.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261023    clang-17
hexagon               randconfig-1001-20261023    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261023    clang-22
i386        buildonly-randconfig-1001-20261023    clang-22
i386        buildonly-randconfig-1002-20261023    clang-22
i386        buildonly-randconfig-1003-20261023    clang-22
i386        buildonly-randconfig-1004-20261023    clang-22
i386        buildonly-randconfig-1005-20261023    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261023    gcc-14
i386                  randconfig-1001-20261023    gcc-14
i386                  randconfig-1002-20261023    gcc-14
i386                  randconfig-1003-20261023    gcc-14
i386                  randconfig-1004-20261023    gcc-14
i386                  randconfig-1005-20261023    gcc-14
i386                  randconfig-1006-20261023    gcc-14
i386                  randconfig-1007-20261023    clang-22
i386                  randconfig-1008-20261023    clang-22
i386                  randconfig-1009-20261023    clang-22
i386                  randconfig-1010-20261023    clang-22
i386                  randconfig-1011-20261023    clang-22
i386                  randconfig-1012-20261023    clang-22
i386                  randconfig-1013-20261023    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261023    clang-17
loongarch             randconfig-1001-20261023    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                           multi_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                        lemote2f_defconfig    gcc-16.2.0
mips                         omega2p_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261023    clang-17
nios2                 randconfig-1001-20261023    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261023    gcc-15.3.0
parisc                randconfig-1001-20261023    gcc-15.3.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                         fsp2_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                          ps3_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261023    gcc-15.3.0
powerpc               randconfig-1001-20261023    gcc-15.3.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261023    gcc-15.3.0
powerpc64             randconfig-1001-20261023    gcc-15.3.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261023    gcc-16.2.0
riscv                 randconfig-1001-20261023    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261023    gcc-16.2.0
s390                  randconfig-1001-20261023    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261023    gcc-16.2.0
sh                    randconfig-1001-20261023    gcc-16.2.0
sh                   sh7785lcr_32bit_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261023    clang-24
sparc                 randconfig-1001-20261023    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261023    clang-24
sparc64               randconfig-1001-20261023    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261023    clang-24
um                    randconfig-1001-20261023    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261023    clang-22
x86_64      buildonly-randconfig-1001-20261023    clang-22
x86_64      buildonly-randconfig-1002-20261023    clang-22
x86_64      buildonly-randconfig-1003-20261023    clang-22
x86_64      buildonly-randconfig-1004-20261023    clang-22
x86_64      buildonly-randconfig-1005-20261023    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261023    gcc-14
x86_64                randconfig-1000-20261024    gcc-14
x86_64                randconfig-1001-20261023    gcc-14
x86_64                randconfig-1001-20261024    gcc-14
x86_64                randconfig-1002-20261023    gcc-14
x86_64                randconfig-1002-20261024    gcc-14
x86_64                randconfig-1003-20261023    gcc-14
x86_64                randconfig-1003-20261024    gcc-14
x86_64                randconfig-1004-20261023    gcc-14
x86_64                randconfig-1004-20261024    gcc-14
x86_64                randconfig-1005-20261023    gcc-14
x86_64                randconfig-1005-20261024    gcc-14
x86_64                randconfig-1006-20261023    gcc-14
x86_64                randconfig-1007-20261023    gcc-14
x86_64                randconfig-1008-20261023    gcc-14
x86_64                randconfig-1009-20261023    gcc-14
x86_64                randconfig-1010-20261023    gcc-14
x86_64                randconfig-1011-20261023    gcc-14
x86_64                randconfig-1012-20261023    clang-22
x86_64                randconfig-1013-20261023    clang-22
x86_64                randconfig-1014-20261023    clang-22
x86_64                randconfig-1015-20261023    clang-22
x86_64                randconfig-1016-20261023    clang-22
x86_64                randconfig-1017-20261023    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261023    clang-24
xtensa                randconfig-1001-20261023    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
