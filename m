Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507308;
	b=X78KfVV9mMKoWF5ZTzsMbQKt8JHyv6CjAj8QV1SRSz4D0QJ0PK1bw0Me+Ph30YnLMS2C
	 FFOP+oWGoLyjRRQ4ADrE8uFy3FG+ZgSTYdWFhipUQDNtYpcX8ocYhqqFoyq6Q6EbzyiYl
	 f5nMPWFgZNuyn3oAkEPsV+QOGVvuaPzstz4tME+mazPXkVzevLxQDSr7jB1n/ugVa7Ky9
	 qZEB/b2bPPpqb+JSpX946aEM4r3MP0qptTKUOGDJ6gd9jkAMB0bxcfs/42bbooWCy3UOG
	 71LP0I9aZxWjlmV5O5PMWhygfmf+dOxONn0HmYUM6tZzavT0Z1jy+Wl5PFGTxXMU2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507308;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=60fuj6gJ4ZzVZCc3QbeEL3fJ+3TRuc4Ag9o0ICFDBAc=;
	b=GtUuxzqs13cVFpItTloPN/p+279Pw/5FPbQtgl5AP4y/muECWK+vWgdBfSbLplaPQGHI
	 ypVA0fCSHlupJrBfPtxN0qul6UYqdRvjCM41qdaHnR/Vew3vM/aROB8e4QxQ8RpvvR2A1
	 xPclzYKugxktrSg+WMOTclKXe0lmNM8RFUEHEavJOSUMdqBHxzLDHXkWRJ0K6CqB3Rx0T
	 Fo4l8KL46ieU/9518nR1v15/yP5Yt+UAgTB9OhwxnCKob2JAumagnPP5oWHHY0jBbvU21
	 YVvBTkwK7DNRh0QPudP54z5HFiEZx1OtDJvApxqdK1y0V9a82SRnziHhx7QY/mZYLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKz9PZ+K;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE21606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 08:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKz9PZ+K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795507307; x=1827043307;
  h=date:from:to:cc:subject:message-id;
  bh=D6S7HH/s8gO8B9w3bo4LpkF5z1PnzEbLz0vpzi2iHHc=;
  b=BKz9PZ+K0tjR7coHF9Sn71X2EOohpRA2SgGtd1QFJxjFvsU5db0LZ5Fn
   mWd/N1GPRkOenObQKEDJMlLboMpwmQrU/bKF41gueYgjdO6ZO7g4xCQjC
   nWy6cnywa8Edg9Jv/1F6nLgAD24Qci0UOgv/h+KamUp293aVybzVqHIex
   ZNRDK42Lcd1syyvMkdDHzEB3sK/zHI+PVrmJx6WWZvlMmpLRLfHZYkEjQ
   hWHnLpl+JDP084Sm1oiArFasrIQRGYKuKVh8wRrE4TNtPWtlBAVW1v8Cy
   yabwIQwGffremwEczb4sVLq9kmjcIlBLEIHv4eD5SG7ofypbckKt1RP6X
   Q==;
X-CSE-ConnectionGUID: AANJeEtRSUuK/iireeNnmQ==
X-CSE-MsgGUID: +Z5EktzXShOnbqRp+uNBhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4351224"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4351224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:38:37 -0800
X-CSE-ConnectionGUID: ROCGTTgiTOCDDHU6pNcZGQ==
X-CSE-MsgGUID: 05CStQ/uQJCRn5kOGcmOIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11591588"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Nov 2026 23:38:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVl6m-00000001Om4-15vS;
	Tue, 24 Nov 2026 07:38:32 +0000
Date: Tue, 24 Nov 2026 15:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 d4dc896fa2bdfd7d1a78911598a0fa3e3c831d92
Message-ID: <20261124153818.Fa59Cj8j-lkp@intel.com>
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
branch HEAD: d4dc896fa2bdfd7d1a78911598a0fa3e3c831d92  chardev: GPIO common access methods: repair non-kernel-doc comment

elapsed time: 901m

configs tested: 511
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261123    gcc-8.5.0
alpha                 randconfig-2000-20261124    gcc-11.5.0
alpha                 randconfig-2001-20261123    gcc-8.5.0
alpha                 randconfig-2001-20261124    gcc-11.5.0
alpha                 randconfig-2200-20261123    gcc-12.5.0 smatch
alpha                 randconfig-2200-20261124    gcc-8.5.0  smatch
alpha                randconfig-r2103-20261124    gcc-16.2.0 cocci
alpha                randconfig-r2302-20261123    gcc-8.5.0  sparse
alpha                randconfig-r2304-20261123    gcc-8.5.0  sparse
alpha                randconfig-r2307-20261124    gcc-8.5.0  sparse
alpha                randconfig-r2310-20261123    gcc-10.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261124    clang-24
arc                   randconfig-1001-20261124    clang-24
arc                   randconfig-2000-20261123    gcc-12.5.0
arc                   randconfig-2000-20261124    gcc-11.5.0
arc                   randconfig-2001-20261123    gcc-12.5.0
arc                   randconfig-2001-20261124    gcc-11.5.0
arc                   randconfig-2002-20261123    gcc-12.5.0
arc                   randconfig-2002-20261124    gcc-11.5.0
arc                   randconfig-2003-20261123    gcc-12.5.0
arc                   randconfig-2003-20261124    gcc-11.5.0
arc                   randconfig-2004-20261123    gcc-12.5.0
arc                   randconfig-2004-20261124    gcc-11.5.0
arc                   randconfig-2005-20261123    gcc-12.5.0
arc                   randconfig-2005-20261124    gcc-11.5.0
arc                   randconfig-2200-20261123    gcc-12.5.0 smatch
arc                   randconfig-2200-20261124    gcc-8.5.0  smatch
arc                  randconfig-r2100-20261124    gcc-12.5.0 cocci
arc                  randconfig-r2102-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261124    gcc-16.2.0 cocci
arc                  randconfig-r2109-20261123    clang-20   cocci
arc                  randconfig-r2309-20261124    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          at91_dt_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ep93xx_defconfig    clang-24
arm                       footbridge_defconfig    clang-24
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20261124    clang-24
arm                   randconfig-1001-20261124    clang-24
arm                   randconfig-1002-20261124    clang-24
arm                   randconfig-1003-20261124    clang-24
arm                   randconfig-2000-20261123    gcc-8.5.0
arm                   randconfig-2000-20261124    clang-17
arm                   randconfig-2001-20261123    gcc-8.5.0
arm                   randconfig-2001-20261124    clang-17
arm                   randconfig-2002-20261123    gcc-8.5.0
arm                   randconfig-2002-20261124    clang-17
arm                   randconfig-2200-20261123    gcc-8.5.0  smatch
arm                   randconfig-2200-20261124    clang-17   smatch
arm                  randconfig-r2306-20261123    clang-24   sparse
arm                  randconfig-r2308-20261123    clang-24   sparse
arm                          s5pv210_defconfig    clang-24
arm                         spear3xx_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261124    gcc-8.5.0
arm64                 randconfig-1001-20261124    gcc-8.5.0
arm64                 randconfig-1002-20261124    gcc-8.5.0
arm64                 randconfig-1003-20261124    gcc-8.5.0
arm64                 randconfig-2000-20261123    gcc-8.5.0
arm64                 randconfig-2000-20261124    clang-17
arm64                 randconfig-2001-20261123    gcc-8.5.0
arm64                 randconfig-2001-20261124    clang-17
arm64                 randconfig-2002-20261123    gcc-8.5.0
arm64                 randconfig-2002-20261124    clang-17
arm64                 randconfig-2200-20261123    clang-17   smatch
arm64                 randconfig-2200-20261124    gcc-16.2.0 smatch
arm64                randconfig-r2303-20261123    gcc-8.5.0  sparse
arm64                randconfig-r2304-20261124    gcc-16.2.0 sparse
arm64                randconfig-r2306-20261123    gcc-10.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261124    gcc-8.5.0
csky                  randconfig-1001-20261124    gcc-8.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2000-20261124    gcc-16.2.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2001-20261124    gcc-16.2.0
csky                  randconfig-2200-20261123    gcc-16.2.0 smatch
csky                  randconfig-2200-20261124    gcc-15.3.0 smatch
csky                 randconfig-r2105-20261123    gcc-8.5.0  cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261124    gcc-10.5.0
hexagon               randconfig-1001-20261124    gcc-10.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2000-20261124    gcc-16.2.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261124    gcc-16.2.0
hexagon               randconfig-2200-20261123    clang-24   smatch
hexagon              randconfig-r2107-20261123    clang-20   cocci
hexagon              randconfig-r2300-20261123    gcc-14.4.0 sparse
hexagon              randconfig-r2307-20261123    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261124    gcc-12
i386        buildonly-randconfig-1001-20261124    gcc-12
i386        buildonly-randconfig-1002-20261124    gcc-12
i386        buildonly-randconfig-1003-20261124    gcc-12
i386        buildonly-randconfig-1004-20261124    gcc-12
i386        buildonly-randconfig-1005-20261124    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261124    gcc-14
i386                  randconfig-1001-20261124    gcc-14
i386                  randconfig-1002-20261124    gcc-14
i386                  randconfig-1003-20261124    gcc-14
i386                  randconfig-1004-20261124    gcc-14
i386                  randconfig-1005-20261124    gcc-14
i386                  randconfig-1006-20261124    gcc-14
i386                  randconfig-2000-20261123    gcc-14
i386                  randconfig-2000-20261124    gcc-14
i386                  randconfig-2001-20261123    gcc-14
i386                  randconfig-2001-20261124    gcc-14
i386                  randconfig-2002-20261123    gcc-14
i386                  randconfig-2002-20261124    gcc-14
i386                  randconfig-2003-20261123    gcc-14
i386                  randconfig-2003-20261124    gcc-14
i386                  randconfig-2004-20261123    gcc-14
i386                  randconfig-2004-20261124    gcc-14
i386                  randconfig-2005-20261123    gcc-14
i386                  randconfig-2005-20261124    gcc-14
i386                  randconfig-2100-20261123    clang-22   cocci
i386                  randconfig-2100-20261124    gcc-14     cocci
i386                  randconfig-2101-20261123    clang-22   cocci
i386                  randconfig-2101-20261124    gcc-14     cocci
i386                  randconfig-2102-20261123    clang-22   cocci
i386                  randconfig-2102-20261124    gcc-14     cocci
i386                  randconfig-2103-20261123    clang-22   cocci
i386                  randconfig-2103-20261124    gcc-14     cocci
i386                  randconfig-2104-20261123    clang-22   cocci
i386                  randconfig-2104-20261124    gcc-14     cocci
i386                  randconfig-2105-20261123    clang-22   cocci
i386                  randconfig-2105-20261124    gcc-14     cocci
i386                  randconfig-2200-20261123    gcc-14     smatch
i386                  randconfig-2200-20261124    clang-22   smatch
i386                  randconfig-2300-20261123    gcc-14     sparse
i386                  randconfig-2300-20261124    gcc-14     sparse
i386                  randconfig-2301-20261123    gcc-14     sparse
i386                  randconfig-2301-20261124    gcc-14     sparse
i386                  randconfig-2302-20261123    gcc-14     sparse
i386                  randconfig-2302-20261124    gcc-14     sparse
i386                 randconfig-r2106-20261123    clang-20   cocci
i386                 randconfig-r2300-20261123    gcc-8.5.0  sparse
i386                 randconfig-r2309-20261123    clang-24   sparse
i386                 randconfig-r2310-20261123    clang-24   sparse
i386                 randconfig-r2311-20261124    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261124    gcc-10.5.0
loongarch             randconfig-1001-20261124    gcc-10.5.0
loongarch             randconfig-2000-20261123    gcc-16.2.0
loongarch             randconfig-2000-20261124    clang-18
loongarch             randconfig-2001-20261123    gcc-16.2.0
loongarch             randconfig-2001-20261124    clang-18
loongarch             randconfig-2200-20261123    clang-24   smatch
loongarch             randconfig-2200-20261124    gcc-16.2.0 smatch
loongarch            randconfig-r2104-20261123    gcc-12.5.0 cocci
loongarch            randconfig-r2108-20261123    clang-20   cocci
loongarch            randconfig-r2110-20261124    gcc-10.5.0 cocci
loongarch            randconfig-r2306-20261124    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261124    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-24
m68k                        m5235evb_defconfig    clang-24
m68k                       m54418evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261123    gcc-8.5.0
m68k                  randconfig-2000-20261124    gcc-11.5.0
m68k                  randconfig-2001-20261123    gcc-8.5.0
m68k                  randconfig-2001-20261124    gcc-11.5.0
m68k                  randconfig-2200-20261123    gcc-8.5.0  smatch
m68k                  randconfig-2200-20261124    gcc-10.5.0 smatch
m68k                 randconfig-r2101-20261123    gcc-12.5.0 cocci
m68k                 randconfig-r2102-20261123    gcc-12.5.0 cocci
m68k                 randconfig-r2103-20261123    gcc-12.5.0 cocci
m68k                 randconfig-r2105-20261124    gcc-16.2.0 cocci
m68k                 randconfig-r2108-20261124    gcc-10.5.0 cocci
m68k                 randconfig-r2300-20261124    clang-18   sparse
m68k                 randconfig-r2303-20261123    gcc-14.4.0 sparse
m68k                 randconfig-r2305-20261123    gcc-8.5.0  sparse
m68k                 randconfig-r2308-20261123    gcc-10.5.0 sparse
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261123    gcc-8.5.0
microblaze            randconfig-2000-20261124    gcc-11.5.0
microblaze            randconfig-2001-20261124    gcc-11.5.0
microblaze            randconfig-2200-20261123    gcc-16.2.0 smatch
microblaze            randconfig-2200-20261124    gcc-8.5.0  smatch
microblaze           randconfig-r2301-20261123    gcc-8.5.0  sparse
microblaze           randconfig-r2303-20261124    clang-18   sparse
microblaze           randconfig-r2303-20261124    gcc-16.2.0 sparse
microblaze           randconfig-r2308-20261124    gcc-8.5.0  sparse
microblaze           randconfig-r2309-20261123    gcc-10.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          cobalt_defconfig    clang-24
mips                     maltaup_xpa_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261123    gcc-10.5.0
mips                  randconfig-2000-20261124    gcc-16.2.0
mips                  randconfig-2001-20261123    gcc-10.5.0
mips                  randconfig-2001-20261124    gcc-16.2.0
mips                  randconfig-2002-20261123    gcc-10.5.0
mips                  randconfig-2002-20261124    gcc-16.2.0
mips                  randconfig-2200-20261123    gcc-14.4.0 smatch
mips                  randconfig-2200-20261124    clang-20   smatch
mips                 randconfig-r2101-20261124    gcc-12.5.0 cocci
mips                 randconfig-r2304-20261124    clang-18   sparse
mips                            rs90_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261124    gcc-10.5.0
nios2                 randconfig-1001-20261124    gcc-10.5.0
nios2                 randconfig-2000-20261123    gcc-16.2.0
nios2                 randconfig-2000-20261124    clang-18
nios2                 randconfig-2001-20261123    gcc-16.2.0
nios2                 randconfig-2001-20261124    clang-18
nios2                 randconfig-2200-20261123    gcc-8.5.0  smatch
nios2                 randconfig-2200-20261124    gcc-11.5.0 smatch
nios2                randconfig-r2100-20261124    gcc-16.2.0 cocci
nios2                randconfig-r2104-20261124    gcc-12.5.0 cocci
nios2                randconfig-r2107-20261124    gcc-8.5.0  cocci
nios2                randconfig-r2308-20261124    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261123    gcc-10.5.0
openrisc              randconfig-2000-20261124    gcc-16.2.0
openrisc              randconfig-2001-20261123    gcc-10.5.0
openrisc              randconfig-2001-20261124    gcc-16.2.0
openrisc              randconfig-2002-20261123    gcc-10.5.0
openrisc              randconfig-2002-20261124    gcc-16.2.0
openrisc              randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc              randconfig-2200-20261124    gcc-11.5.0 smatch
openrisc             randconfig-r2101-20261123    gcc-8.5.0  cocci
openrisc             randconfig-r2101-20261124    gcc-16.2.0 cocci
openrisc             randconfig-r2103-20261124    gcc-12.5.0 cocci
openrisc             randconfig-r2300-20261124    gcc-16.2.0 sparse
openrisc             randconfig-r2310-20261124    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261124    clang-24
parisc                randconfig-1001-20261124    clang-24
parisc                randconfig-2000-20261123    gcc-16.2.0
parisc                randconfig-2000-20261124    clang-18
parisc                randconfig-2001-20261123    gcc-16.2.0
parisc                randconfig-2001-20261124    clang-18
parisc                randconfig-2200-20261123    gcc-14.4.0 smatch
parisc                randconfig-2200-20261124    gcc-9.5.0  smatch
parisc               randconfig-r2106-20261124    gcc-10.5.0 cocci
parisc               randconfig-r2109-20261124    gcc-8.5.0  cocci
parisc               randconfig-r2305-20261123    gcc-14.4.0 sparse
parisc               randconfig-r2307-20261124    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                        ebony_defconfig    clang-24
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261124    clang-24
powerpc               randconfig-1001-20261124    clang-24
powerpc               randconfig-2000-20261123    clang-21
powerpc               randconfig-2000-20261124    clang-24
powerpc               randconfig-2001-20261123    clang-21
powerpc               randconfig-2001-20261124    clang-24
powerpc               randconfig-2002-20261123    clang-21
powerpc               randconfig-2002-20261124    clang-24
powerpc               randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc               randconfig-2200-20261124    clang-21   smatch
powerpc              randconfig-r2106-20261124    gcc-8.5.0  cocci
powerpc              randconfig-r2110-20261124    gcc-8.5.0  cocci
powerpc              randconfig-r2111-20261124    gcc-8.5.0  cocci
powerpc              randconfig-r2301-20261124    clang-18   sparse
powerpc              randconfig-r2311-20261123    gcc-10.5.0 sparse
powerpc                      skiroot_defconfig    clang-24
powerpc                     socrates_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc                      tqm8541_defconfig    gcc-16.2.0
powerpc                      tqm8560_defconfig    gcc-16.2.0
powerpc                       tqm8xx_defconfig    clang-24
powerpc64             randconfig-1000-20261124    clang-24
powerpc64             randconfig-1001-20261124    clang-24
powerpc64             randconfig-2000-20261123    clang-21
powerpc64             randconfig-2000-20261124    clang-24
powerpc64             randconfig-2001-20261123    clang-21
powerpc64             randconfig-2001-20261124    clang-24
powerpc64             randconfig-2002-20261123    clang-21
powerpc64             randconfig-2002-20261124    clang-24
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64             randconfig-2200-20261124    gcc-12.5.0 smatch
powerpc64            randconfig-r2100-20261123    gcc-8.5.0  cocci
powerpc64            randconfig-r2305-20261124    gcc-16.2.0 sparse
powerpc64            randconfig-r2310-20261124    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261124    gcc-11.5.0
riscv                 randconfig-1001-20261124    gcc-11.5.0
riscv                 randconfig-2000-20261123    gcc-11.5.0
riscv                 randconfig-2000-20261124    gcc-16.2.0
riscv                 randconfig-2001-20261123    gcc-11.5.0
riscv                 randconfig-2001-20261124    gcc-16.2.0
riscv                 randconfig-2002-20261123    gcc-11.5.0
riscv                 randconfig-2002-20261124    gcc-16.2.0
riscv                 randconfig-2003-20261123    gcc-11.5.0
riscv                 randconfig-2003-20261124    gcc-16.2.0
riscv                 randconfig-2004-20261123    gcc-11.5.0
riscv                 randconfig-2004-20261124    gcc-16.2.0
riscv                 randconfig-2005-20261123    gcc-11.5.0
riscv                 randconfig-2005-20261124    gcc-16.2.0
riscv                 randconfig-2200-20261123    clang-17   smatch
riscv                 randconfig-2200-20261124    gcc-14.4.0 smatch
riscv                randconfig-r2105-20261124    gcc-12.5.0 cocci
riscv                randconfig-r2110-20261123    clang-20   cocci
riscv                randconfig-r2111-20261124    gcc-10.5.0 cocci
riscv                randconfig-r2302-20261123    gcc-14.4.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261124    gcc-11.5.0
s390                  randconfig-1001-20261124    gcc-11.5.0
s390                  randconfig-2000-20261123    clang-20
s390                  randconfig-2000-20261124    clang-24
s390                  randconfig-2001-20261123    clang-20
s390                  randconfig-2001-20261124    clang-24
s390                  randconfig-2002-20261123    clang-20
s390                  randconfig-2002-20261124    clang-24
s390                  randconfig-2003-20261123    clang-20
s390                  randconfig-2003-20261124    clang-24
s390                  randconfig-2004-20261123    clang-20
s390                  randconfig-2004-20261124    clang-24
s390                  randconfig-2005-20261123    clang-20
s390                  randconfig-2005-20261124    clang-24
s390                  randconfig-2200-20261123    clang-24   smatch
s390                  randconfig-2200-20261124    clang-24   smatch
s390                 randconfig-r2107-20261124    gcc-10.5.0 cocci
s390                 randconfig-r2301-20261123    gcc-14.4.0 sparse
s390                 randconfig-r2311-20261124    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                             migor_defconfig    clang-24
sh                    randconfig-1000-20261124    gcc-11.5.0
sh                    randconfig-1001-20261124    gcc-11.5.0
sh                    randconfig-2000-20261123    gcc-16.2.0
sh                    randconfig-2000-20261124    gcc-11.5.0
sh                    randconfig-2001-20261123    gcc-16.2.0
sh                    randconfig-2001-20261124    gcc-11.5.0
sh                    randconfig-2002-20261123    gcc-16.2.0
sh                    randconfig-2002-20261124    gcc-11.5.0
sh                    randconfig-2003-20261123    gcc-16.2.0
sh                    randconfig-2003-20261124    gcc-11.5.0
sh                    randconfig-2004-20261123    gcc-16.2.0
sh                    randconfig-2004-20261124    gcc-11.5.0
sh                    randconfig-2005-20261123    gcc-16.2.0
sh                    randconfig-2005-20261124    gcc-11.5.0
sh                    randconfig-2200-20261123    gcc-16.2.0 smatch
sh                    randconfig-2200-20261124    gcc-16.2.0 smatch
sh                   randconfig-r2102-20261124    gcc-16.2.0 cocci
sh                   randconfig-r2111-20261123    clang-20   cocci
sh                   randconfig-r2302-20261124    gcc-16.2.0 sparse
sh                   randconfig-r2304-20261123    gcc-14.4.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    clang-24
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7721_defconfig    gcc-16.2.0
sh                            se7780_defconfig    clang-24
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261124    clang-24
sparc                 randconfig-1001-20261124    clang-24
sparc                 randconfig-2000-20261123    gcc-9.5.0
sparc                 randconfig-2000-20261124    gcc-8.5.0
sparc                 randconfig-2001-20261123    gcc-9.5.0
sparc                 randconfig-2001-20261124    gcc-8.5.0
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                 randconfig-2200-20261124    gcc-11.5.0 smatch
sparc                randconfig-r2105-20261123    gcc-12.5.0 cocci
sparc                randconfig-r2108-20261124    gcc-8.5.0  cocci
sparc                randconfig-r2109-20261124    gcc-10.5.0 cocci
sparc                randconfig-r2301-20261124    gcc-16.2.0 sparse
sparc                randconfig-r2307-20261123    gcc-10.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261124    clang-24
sparc64               randconfig-1001-20261124    clang-24
sparc64               randconfig-2000-20261123    gcc-9.5.0
sparc64               randconfig-2000-20261124    gcc-8.5.0
sparc64               randconfig-2001-20261123    gcc-9.5.0
sparc64               randconfig-2001-20261124    gcc-8.5.0
sparc64               randconfig-2200-20261123    clang-22   smatch
sparc64               randconfig-2200-20261124    clang-24   smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261124    clang-24
um                    randconfig-1001-20261124    clang-24
um                    randconfig-2000-20261123    gcc-9.5.0
um                    randconfig-2000-20261124    gcc-8.5.0
um                    randconfig-2001-20261123    gcc-9.5.0
um                    randconfig-2001-20261124    gcc-8.5.0
um                    randconfig-2200-20261123    clang-21   smatch
um                    randconfig-2200-20261124    gcc-14     smatch
um                   randconfig-r2103-20261123    gcc-8.5.0  cocci
um                   randconfig-r2306-20261124    gcc-8.5.0  sparse
um                   randconfig-r2311-20261123    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261124    gcc-14
x86_64      buildonly-randconfig-1001-20261124    gcc-14
x86_64      buildonly-randconfig-1002-20261124    gcc-14
x86_64      buildonly-randconfig-1003-20261124    gcc-14
x86_64      buildonly-randconfig-1004-20261124    gcc-14
x86_64      buildonly-randconfig-1005-20261124    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261124    gcc-12
x86_64                randconfig-1001-20261124    gcc-12
x86_64                randconfig-1002-20261124    gcc-12
x86_64                randconfig-1003-20261124    gcc-12
x86_64                randconfig-1004-20261124    gcc-12
x86_64                randconfig-1005-20261124    gcc-12
x86_64                randconfig-2000-20261123    gcc-14
x86_64                randconfig-2000-20261124    gcc-14
x86_64                randconfig-2001-20261123    gcc-14
x86_64                randconfig-2001-20261124    gcc-14
x86_64                randconfig-2002-20261123    gcc-14
x86_64                randconfig-2002-20261124    gcc-14
x86_64                randconfig-2003-20261123    gcc-14
x86_64                randconfig-2003-20261124    gcc-14
x86_64                randconfig-2004-20261123    gcc-14
x86_64                randconfig-2004-20261124    gcc-14
x86_64                randconfig-2005-20261123    gcc-14
x86_64                randconfig-2005-20261124    gcc-14
x86_64                randconfig-2100-20261123    clang-22   cocci
x86_64                randconfig-2100-20261124    gcc-14     cocci
x86_64                randconfig-2101-20261123    clang-22   cocci
x86_64                randconfig-2101-20261124    gcc-14     cocci
x86_64                randconfig-2102-20261123    clang-22   cocci
x86_64                randconfig-2102-20261124    gcc-14     cocci
x86_64                randconfig-2103-20261123    clang-22   cocci
x86_64                randconfig-2103-20261124    gcc-14     cocci
x86_64                randconfig-2104-20261123    clang-22   cocci
x86_64                randconfig-2104-20261124    gcc-14     cocci
x86_64                randconfig-2105-20261123    clang-22   cocci
x86_64                randconfig-2105-20261124    gcc-14     cocci
x86_64                randconfig-2200-20261123    gcc-14     smatch
x86_64                randconfig-2200-20261124    gcc-14     smatch
x86_64                randconfig-2300-20261123    gcc-14     sparse
x86_64                randconfig-2300-20261124    gcc-14     sparse
x86_64                randconfig-2301-20261123    gcc-14     sparse
x86_64                randconfig-2301-20261124    gcc-14     sparse
x86_64                randconfig-2302-20261123    gcc-14     sparse
x86_64                randconfig-2302-20261124    gcc-14     sparse
x86_64               randconfig-r2102-20261124    gcc-12.5.0 cocci
x86_64               randconfig-r2104-20261123    gcc-8.5.0  cocci
x86_64               randconfig-r2302-20261124    clang-18   sparse
x86_64               randconfig-r2305-20261124    clang-18   sparse
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
xtensa                randconfig-1000-20261124    clang-24
xtensa                randconfig-1001-20261124    clang-24
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2000-20261124    gcc-16.2.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261124    gcc-16.2.0
xtensa                randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261124    gcc-9.5.0  smatch

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
