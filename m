Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925224;
	b=ZMh6oU8eWL8Mqcn6c+JgSzWt+nDm0kJdLBfoaGk6mmHGqbKsJt7rcjbsOeEGsAGUw6uT
	 qtSYzmCuX9n1Q8b+Hsca9sNE+c0axOmSdhKI6ISz2DpYKYcd1Ac40EJq3K3a7wAec1/a6
	 SmlDuxld/ebxV8RwGOOjMye4W97FdxZO6FBgCXWgPddrux0sV9Qp7U1vsVgVQ9Fo30Pef
	 A1yWLJ1htpHvgYT0KFZi+Af5pylV8BQ5n4dgEGUK+aE/ElXmNpihCz1VOHB8pyWgoanY3
	 pU5BCydT2qPdoaI0eCLN9jQ+AjrGVQR1T9Lx9T5b5luAv0czTLooDNFoVBQtWqDZ/ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925224;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mFRMG42N5K4ywJFtglLp0IuF/qyoH8tSFmfXPk4AZ/0=;
	b=xw4D5uN//rgZyKhilC3uEWHvRwLZR/jT+r18fuGwh5wlStY9UAE+s9jjiyCtmaIPIkPj
	 C9YOS4U27NPIYpDgm/sD6z/TuXT/bRAkeDFlApzmSrDnmmhlAEua/gga06CnxUN2rGMh5
	 9HJaD8C86ctrhN0Zm2Eltlnw/5TGttY9n2D00MQYjp4bApiL4omcq6CCGJQ/JoT0febKE
	 8TPlp0rmxCYgAiUbnRw5lbh7c7Ph3zoWgYV2ytms8DaH+WtXcew/P5oZcZ90nqC0rTHZ9
	 2RaQdzCYXUd/7w5yuGvm3L1Ov3TREnWc/cseHXAaKSuj0m75CWOVg6eTxeblTKg44Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNQJCsf1;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94421606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94421606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNQJCsf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794925223; x=1826461223;
  h=date:from:to:cc:subject:message-id;
  bh=/OUNlwD8nhTYm4KDFKUr2TVsf77mjiYGM2zQ0ZMvl0Y=;
  b=nNQJCsf18dlAuUbst4nDJUQrIQPLO+5Eq8BvsCqDG5JPVGTKPQhWgbaR
   Ld6p3Trd8+1bhp6jMwRoYuHLRv+vyJ5Hjbe9+39DQIZJzvAQjNp3hQopl
   fzMoFm5wzYOVuMvuKDFLtGnrC6eDjN1Sn7s+BrnTkPT7yscFkHOcfSlT/
   4Vj9SCXcOckZWb5jiX3Jlw0eKfJVN1Lre0ZVjMR79cuPbXZ3luh4RvoC4
   wpyYYmmfAUIoyHanPyiKpfPulyXLwRywYcTJ8wffmGC68wBbgKcUSZGbW
   c1qTvbFQQmpsbkivZBhUsk/0opse5wbBcJ+SUR2/5I0ZlyUdZwRIMYJj4
   A==;
X-CSE-ConnectionGUID: Wi+UgH0gTY6Vn+SOd8571w==
X-CSE-MsgGUID: UAqlHihpTE+ekCIIq/mwHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3611231"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3611231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:20:23 -0800
X-CSE-ConnectionGUID: 6p4wOiDtRWGmjmHjYiz+Rw==
X-CSE-MsgGUID: /Hs9iNmmSyqZi208ASby8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9755024"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 06:20:22 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTK2l-00000001BlF-28HQ;
	Tue, 17 Nov 2026 14:20:19 +0000
Date: Tue, 17 Nov 2026 22:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 3e68810e7c109ae4cc23541f36a1a9fc8ed65700
Message-ID: <20261117222010.Efn3QPoD-lkp@intel.com>
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
branch HEAD: 3e68810e7c109ae4cc23541f36a1a9fc8ed65700  Merge tag 'v7.4-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

elapsed time: 1411m

configs tested: 435
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261116    gcc-10.5.0
alpha                 randconfig-2000-20261116    gcc-8.5.0
alpha                 randconfig-2001-20261116    gcc-10.5.0
alpha                 randconfig-2001-20261116    gcc-15.3.0
alpha                 randconfig-2200-20261116    gcc-15.3.0 smatch
alpha                randconfig-r2100-20261116    gcc-13.5.0 cocci
alpha                randconfig-r2103-20261116    gcc-15.3.0 cocci
alpha                randconfig-r2104-20261116    gcc-13.5.0 cocci
alpha                randconfig-r2111-20261116    gcc-16.2.0 cocci
alpha                randconfig-r2301-20261116    gcc-13.5.0 sparse
alpha                randconfig-r2306-20261116    gcc-12.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261117    gcc-13.5.0
arc                   randconfig-1001-20261117    gcc-13.5.0
arc                   randconfig-2000-20261116    gcc-13.5.0
arc                   randconfig-2001-20261116    gcc-11.5.0
arc                   randconfig-2001-20261116    gcc-13.5.0
arc                   randconfig-2002-20261116    gcc-13.5.0
arc                   randconfig-2003-20261116    gcc-11.5.0
arc                   randconfig-2003-20261116    gcc-13.5.0
arc                   randconfig-2004-20261116    gcc-13.5.0
arc                   randconfig-2004-20261116    gcc-9.5.0
arc                   randconfig-2005-20261116    gcc-11.5.0
arc                   randconfig-2005-20261116    gcc-13.5.0
arc                   randconfig-2200-20261116    gcc-15.3.0 smatch
arc                   randconfig-2200-20261117    gcc-8.5.0  smatch
arc                  randconfig-r2302-20261116    gcc-8.5.0  sparse
arc                  randconfig-r2310-20261116    clang-20   sparse
arc                            tb10x_defconfig    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          axm55xx_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.2.0
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261117    gcc-13.5.0
arm                   randconfig-1001-20261117    gcc-13.5.0
arm                   randconfig-1002-20261117    gcc-13.5.0
arm                   randconfig-1003-20261117    gcc-13.5.0
arm                   randconfig-2000-20261116    gcc-15.3.0
arm                   randconfig-2001-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-15.3.0
arm                   randconfig-2200-20261116    gcc-13.5.0 smatch
arm                  randconfig-r2103-20261116    gcc-12.5.0 cocci
arm                  randconfig-r2110-20261116    clang-24   cocci
arm                            spitz_defconfig    clang-24
arm64                             alldefconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261117    gcc-16.2.0
arm64                 randconfig-1001-20261117    gcc-16.2.0
arm64                 randconfig-1002-20261117    gcc-16.2.0
arm64                 randconfig-1003-20261117    gcc-16.2.0
arm64                 randconfig-2000-20261116    gcc-15.3.0
arm64                 randconfig-2001-20261116    gcc-15.3.0
arm64                 randconfig-2002-20261116    gcc-15.3.0
arm64                 randconfig-2200-20261116    gcc-8.5.0  smatch
arm64                randconfig-r2301-20261116    clang-24   sparse
csky                              alldefconfig    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261117    gcc-16.2.0
csky                  randconfig-1001-20261117    gcc-16.2.0
csky                  randconfig-2000-20261116    gcc-16.2.0
csky                  randconfig-2001-20261116    gcc-16.2.0
csky                  randconfig-2200-20261116    gcc-16.2.0 smatch
csky                 randconfig-r2105-20261116    gcc-16.2.0 cocci
csky                 randconfig-r2303-20261116    clang-24   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261117    clang-17
hexagon               randconfig-1001-20261117    clang-17
hexagon               randconfig-2000-20261116    gcc-16.2.0
hexagon               randconfig-2001-20261116    gcc-16.2.0
hexagon               randconfig-2200-20261116    clang-17   smatch
hexagon              randconfig-r2107-20261116    clang-24   cocci
hexagon              randconfig-r2111-20261116    clang-24   cocci
hexagon              randconfig-r2303-20261116    gcc-11.5.0 sparse
hexagon              randconfig-r2304-20261116    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261117    clang-22
i386        buildonly-randconfig-1001-20261117    clang-22
i386        buildonly-randconfig-1002-20261117    clang-22
i386        buildonly-randconfig-1003-20261117    clang-22
i386        buildonly-randconfig-1004-20261117    clang-22
i386        buildonly-randconfig-1005-20261117    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261117    gcc-14
i386                  randconfig-1001-20261117    gcc-14
i386                  randconfig-1002-20261117    gcc-14
i386                  randconfig-1003-20261117    gcc-14
i386                  randconfig-1004-20261117    gcc-14
i386                  randconfig-1005-20261117    gcc-14
i386                  randconfig-1006-20261117    gcc-14
i386                  randconfig-1007-20261117    clang-22
i386                  randconfig-1008-20261117    clang-22
i386                  randconfig-1009-20261117    clang-22
i386                  randconfig-1010-20261117    clang-22
i386                  randconfig-1011-20261117    clang-22
i386                  randconfig-1012-20261117    clang-22
i386                  randconfig-1013-20261117    clang-22
i386                  randconfig-2000-20261116    gcc-14
i386                  randconfig-2001-20261116    gcc-14
i386                  randconfig-2002-20261116    gcc-14
i386                  randconfig-2003-20261116    gcc-14
i386                  randconfig-2004-20261116    gcc-14
i386                  randconfig-2005-20261116    gcc-14
i386                  randconfig-2100-20261116    gcc-14     cocci
i386                  randconfig-2101-20261116    gcc-14     cocci
i386                  randconfig-2102-20261116    gcc-14     cocci
i386                  randconfig-2103-20261116    gcc-14     cocci
i386                  randconfig-2104-20261116    gcc-14     cocci
i386                  randconfig-2105-20261116    gcc-14     cocci
i386                  randconfig-2200-20261116    gcc-14     smatch
i386                  randconfig-2300-20261116    gcc-14     sparse
i386                  randconfig-2301-20261116    gcc-14     sparse
i386                  randconfig-2302-20261116    gcc-14     sparse
i386                 randconfig-r2101-20261116    gcc-13.5.0 cocci
i386                 randconfig-r2302-20261116    clang-24   sparse
i386                 randconfig-r2311-20261116    clang-20   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261117    clang-17
loongarch             randconfig-1001-20261117    clang-17
loongarch             randconfig-2000-20261116    gcc-11.5.0
loongarch             randconfig-2000-20261117    gcc-8.5.0
loongarch             randconfig-2001-20261116    gcc-11.5.0
loongarch             randconfig-2001-20261117    gcc-8.5.0
loongarch            randconfig-r2100-20261116    clang-24   cocci
loongarch            randconfig-r2305-20261116    clang-24   sparse
loongarch            randconfig-r2311-20261116    gcc-12.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                             q40_defconfig    clang-24
m68k                  randconfig-2000-20261116    gcc-10.5.0
m68k                  randconfig-2000-20261116    gcc-12.5.0
m68k                  randconfig-2001-20261116    gcc-10.5.0
m68k                  randconfig-2200-20261116    gcc-14.4.0 smatch
m68k                 randconfig-r2107-20261116    clang-24   cocci
m68k                 randconfig-r2300-20261116    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261116    gcc-10.5.0
microblaze            randconfig-2000-20261116    gcc-8.5.0
microblaze            randconfig-2001-20261116    gcc-10.5.0
microblaze            randconfig-2001-20261116    gcc-15.3.0
microblaze            randconfig-2200-20261116    gcc-11.5.0 smatch
microblaze           randconfig-r2302-20261116    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-24
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-24
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261116    gcc-13.5.0
mips                  randconfig-2001-20261116    gcc-13.5.0
mips                  randconfig-2002-20261116    gcc-13.5.0
mips                  randconfig-2200-20261116    gcc-8.5.0  smatch
mips                 randconfig-r2301-20261116    gcc-11.5.0 sparse
mips                 randconfig-r2309-20261116    gcc-12.5.0 sparse
mips                          rt305x_defconfig    clang-24
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261117    clang-17
nios2                 randconfig-1001-20261117    clang-17
nios2                 randconfig-2000-20261116    gcc-11.5.0
nios2                 randconfig-2000-20261117    gcc-8.5.0
nios2                 randconfig-2001-20261116    gcc-11.5.0
nios2                 randconfig-2001-20261117    gcc-8.5.0
nios2                 randconfig-2200-20261116    gcc-11.5.0 smatch
nios2                randconfig-r2105-20261116    gcc-13.5.0 cocci
nios2                randconfig-r2305-20261116    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261116    gcc-13.5.0
openrisc              randconfig-2001-20261116    gcc-13.5.0
openrisc              randconfig-2002-20261116    gcc-13.5.0
openrisc              randconfig-2200-20261116    gcc-15.3.0 smatch
openrisc             randconfig-r2108-20261116    clang-24   cocci
openrisc             randconfig-r2109-20261116    gcc-16.2.0 cocci
openrisc             randconfig-r2303-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2304-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2306-20261116    gcc-12.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261117    gcc-9.5.0
parisc                randconfig-1001-20261117    gcc-9.5.0
parisc                randconfig-2000-20261116    gcc-11.5.0
parisc                randconfig-2000-20261117    gcc-8.5.0
parisc                randconfig-2001-20261116    gcc-11.5.0
parisc                randconfig-2001-20261117    gcc-8.5.0
parisc                randconfig-2200-20261116    gcc-8.5.0  smatch
parisc               randconfig-r2102-20261116    gcc-12.5.0 cocci
parisc               randconfig-r2103-20261116    gcc-13.5.0 cocci
parisc               randconfig-r2109-20261116    clang-24   cocci
parisc               randconfig-r2307-20261116    gcc-12.5.0 sparse
parisc               randconfig-r2309-20261116    gcc-12.5.0 sparse
parisc               randconfig-r2310-20261116    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                  canyonlands_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    gcc-16.2.0
powerpc                mpc834x_itxgp_defconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                       pasemi_defconfig    gcc-16.2.0
powerpc                       pcm030_defconfig    clang-24
powerpc                       pmac32_defconfig    clang-24
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261117    gcc-9.5.0
powerpc               randconfig-1001-20261117    gcc-9.5.0
powerpc               randconfig-2000-20261116    clang-17
powerpc               randconfig-2000-20261116    clang-24
powerpc               randconfig-2001-20261116    clang-17
powerpc               randconfig-2001-20261116    clang-24
powerpc               randconfig-2002-20261116    clang-17
powerpc               randconfig-2002-20261116    gcc-8.5.0
powerpc               randconfig-2200-20261116    clang-22   smatch
powerpc                      skiroot_defconfig    clang-24
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261117    gcc-9.5.0
powerpc64             randconfig-1001-20261117    gcc-9.5.0
powerpc64             randconfig-2000-20261116    clang-17
powerpc64             randconfig-2000-20261116    gcc-10.5.0
powerpc64             randconfig-2001-20261116    clang-17
powerpc64             randconfig-2002-20261116    clang-17
powerpc64             randconfig-2002-20261116    gcc-14.4.0
powerpc64             randconfig-2200-20261116    clang-19   smatch
powerpc64            randconfig-r2104-20261116    gcc-15.3.0 cocci
powerpc64            randconfig-r2108-20261116    gcc-16.2.0 cocci
powerpc64            randconfig-r2305-20261116    gcc-11.5.0 sparse
powerpc64            randconfig-r2308-20261116    gcc-12.5.0 sparse
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261117    clang-24
riscv                 randconfig-1001-20261117    clang-24
riscv                 randconfig-2000-20261116    clang-20
riscv                 randconfig-2001-20261116    clang-20
riscv                 randconfig-2002-20261116    clang-20
riscv                 randconfig-2003-20261116    clang-20
riscv                 randconfig-2004-20261116    clang-20
riscv                 randconfig-2005-20261116    clang-20
riscv                 randconfig-2200-20261116    clang-24   smatch
riscv                randconfig-r2101-20261116    clang-17   cocci
riscv                randconfig-r2308-20261116    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261117    clang-24
s390                  randconfig-1001-20261117    clang-24
s390                  randconfig-2000-20261116    clang-17
s390                  randconfig-2001-20261116    clang-17
s390                  randconfig-2002-20261116    clang-17
s390                  randconfig-2003-20261116    clang-17
s390                  randconfig-2004-20261116    clang-17
s390                  randconfig-2005-20261116    clang-17
s390                  randconfig-2200-20261116    gcc-10.5.0 smatch
s390                 randconfig-r2300-20261116    clang-24   sparse
s390                 randconfig-r2304-20261116    gcc-11.5.0 sparse
s390                 randconfig-r2310-20261116    gcc-12.5.0 sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261117    clang-24
sh                    randconfig-1001-20261117    clang-24
sh                    randconfig-2000-20261116    gcc-15.3.0
sh                    randconfig-2001-20261116    gcc-15.3.0
sh                    randconfig-2002-20261116    gcc-15.3.0
sh                    randconfig-2003-20261116    gcc-15.3.0
sh                    randconfig-2004-20261116    gcc-15.3.0
sh                    randconfig-2005-20261116    gcc-15.3.0
sh                    randconfig-2200-20261116    gcc-15.3.0 smatch
sh                   randconfig-r2101-20261116    gcc-15.3.0 cocci
sh                   randconfig-r2309-20261116    clang-20   sparse
sh                   randconfig-r2311-20261116    gcc-12.5.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                            se7750_defconfig    clang-24
sh                            sh2007_defconfig    clang-24
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261117    gcc-15.3.0
sparc                 randconfig-1001-20261117    gcc-15.3.0
sparc                 randconfig-2000-20261116    gcc-14
sparc                 randconfig-2000-20261116    gcc-16.2.0
sparc                 randconfig-2001-20261116    gcc-14
sparc                 randconfig-2001-20261116    gcc-15.3.0
sparc                 randconfig-2200-20261116    gcc-15.3.0 smatch
sparc                randconfig-r2100-20261116    gcc-15.3.0 cocci
sparc                randconfig-r2110-20261116    gcc-14.4.0 cocci
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261117    gcc-15.3.0
sparc64               randconfig-1001-20261117    gcc-15.3.0
sparc64               randconfig-2000-20261116    clang-20
sparc64               randconfig-2000-20261116    gcc-14
sparc64               randconfig-2001-20261116    clang-20
sparc64               randconfig-2001-20261116    gcc-14
sparc64               randconfig-2200-20261116    gcc-8.5.0  smatch
sparc64              randconfig-r2102-20261116    gcc-15.3.0 cocci
sparc64              randconfig-r2104-20261116    gcc-13.5.0 cocci
sparc64              randconfig-r2106-20261116    clang-20   cocci
sparc64              randconfig-r2106-20261116    clang-24   cocci
sparc64              randconfig-r2306-20261116    clang-20   sparse
sparc64              randconfig-r2307-20261116    clang-20   sparse
um                                alldefconfig    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261117    gcc-15.3.0
um                    randconfig-1001-20261117    gcc-15.3.0
um                    randconfig-2000-20261116    gcc-14
um                    randconfig-2001-20261116    gcc-14
um                    randconfig-2200-20261116    gcc-14     smatch
um                    randconfig-2200-20261117    clang-21   smatch
um                   randconfig-r2102-20261116    gcc-13.5.0 cocci
um                   randconfig-r2105-20261116    gcc-15.3.0 cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261117    gcc-13
x86_64      buildonly-randconfig-1001-20261117    gcc-13
x86_64      buildonly-randconfig-1002-20261117    gcc-13
x86_64      buildonly-randconfig-1003-20261117    gcc-13
x86_64      buildonly-randconfig-1004-20261117    gcc-13
x86_64      buildonly-randconfig-1005-20261117    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261117    clang-22
x86_64                randconfig-1001-20261117    clang-22
x86_64                randconfig-1002-20261117    clang-22
x86_64                randconfig-1003-20261117    clang-22
x86_64                randconfig-1004-20261117    clang-22
x86_64                randconfig-1005-20261117    clang-22
x86_64                randconfig-1006-20261117    gcc-14
x86_64                randconfig-1007-20261117    gcc-14
x86_64                randconfig-1008-20261117    gcc-14
x86_64                randconfig-1009-20261117    gcc-14
x86_64                randconfig-1010-20261117    gcc-14
x86_64                randconfig-1011-20261117    gcc-14
x86_64                randconfig-1012-20261117    gcc-14
x86_64                randconfig-1013-20261117    gcc-14
x86_64                randconfig-1014-20261117    gcc-14
x86_64                randconfig-1015-20261117    gcc-14
x86_64                randconfig-1016-20261117    gcc-14
x86_64                randconfig-1017-20261117    gcc-14
x86_64                randconfig-2000-20261116    gcc-14
x86_64                randconfig-2001-20261116    gcc-14
x86_64                randconfig-2002-20261116    gcc-14
x86_64                randconfig-2003-20261116    gcc-14
x86_64                randconfig-2004-20261116    gcc-14
x86_64                randconfig-2005-20261116    gcc-14
x86_64                randconfig-2100-20261116    gcc-14     cocci
x86_64                randconfig-2101-20261116    gcc-14     cocci
x86_64                randconfig-2102-20261116    gcc-14     cocci
x86_64                randconfig-2103-20261116    gcc-14     cocci
x86_64                randconfig-2104-20261116    gcc-14     cocci
x86_64                randconfig-2105-20261116    gcc-14     cocci
x86_64                randconfig-2200-20261116    clang-22   smatch
x86_64                randconfig-2300-20261116    gcc-14     sparse
x86_64                randconfig-2301-20261116    gcc-14     sparse
x86_64                randconfig-2302-20261116    gcc-14     sparse
x86_64               randconfig-r2308-20261116    clang-20   sparse
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
xtensa                randconfig-1000-20261117    gcc-15.3.0
xtensa                randconfig-1001-20261117    gcc-15.3.0
xtensa                randconfig-2000-20261116    gcc-16.2.0
xtensa                randconfig-2001-20261116    gcc-16.2.0
xtensa               randconfig-r2307-20261116    gcc-12.5.0 sparse
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
