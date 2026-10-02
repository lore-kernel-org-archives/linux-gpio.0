Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F646A5FB
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931348; cv=none; b=fQvbRUcMtzQ9PLGqjKHGH65aV32ytBPMKRFYuzNlvLTwj/MpEIDVBcaQ/fiTSjZxJtcQdFKZVqLR9ACCv3FUbb5P1v7t4xs9NLqJquIpcWXePN5mI0SPWF33oGbjDYzKJtAK+IQhQVfbXzU9wpRWXiRvnmpbellMP/efHAXj6Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931348; c=relaxed/simple;
	bh=i6KppLjT7VF+y1Zjz63EyXOWeBHQK3IJXmCeJ3SNImk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AYv49XDdazfqMd60XjabHycGq7lHtDjTN+1tpOwk4Mm8RF6HIdNCQm0ubebUxO+mqPx+OfVNE7PMlKBUQX3tf4eq/Xyl6Ge4jU/AMmjXvCtoFN/PNOb3scNluBi80hx/2DHxQfQzwqisNhpPhoJ3L+NvHCide9slyBb2uqkNfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GM2nnQSX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GM2nnQSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790931346; x=1822467346;
  h=date:from:to:cc:subject:message-id;
  bh=i6KppLjT7VF+y1Zjz63EyXOWeBHQK3IJXmCeJ3SNImk=;
  b=GM2nnQSXMPKaEhT5QhqBGbU4OUt20AHWogORfJ2GZpc+u1p/iB6DkYFa
   GLKUlSMeDlEGxEvhUr1ORbCdkXmr4UbbLQ0iBUSGJOh0K6SgDCezoyxb0
   JRZxqLJ974gpxrvwLaDSN3Ew8y/+6Fi7ERWFHobUlML0X2cOmP+MMw3Bk
   JTrGhxNvqMl7L2sBeBK2YRZd40yCzhMdU72KG21EzxqQEHx1GZ6nsrkaM
   6PzhhNs5CaXlCkYj2YOZQkcp23VvRKEbfuFIa+q4p71E3c8inYE9+w7ya
   fLXTnJWt7kW+siWuSrdZIcvQKXpU0+CsRM/231pSG0OjVny8tFfbEIHvR
   A==;
X-CSE-ConnectionGUID: q2a+YaX/RWa5J9vgUFKUYQ==
X-CSE-MsgGUID: wwEwtQuaTVyJHXWx8NaItw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101859054"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101859054"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:55:43 -0700
X-CSE-ConnectionGUID: 1bPhoIl+TN2yGj5CvhHEUQ==
X-CSE-MsgGUID: cSKwqdcfTiWI/WIoEjMkFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="290587"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 02 Oct 2026 01:55:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZ3L-00000000Spc-2qoL;
	Fri, 02 Oct 2026 08:55:39 +0000
Date: Fri, 02 Oct 2026 16:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-ambarella-pinctrl] BUILD SUCCESS
 b40e9d140c24650184697882056ce00c091f6b72
Message-ID: <202610021633.aNr94vxP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-ambarella-pinctrl
branch HEAD: b40e9d140c24650184697882056ce00c091f6b72  pinctrl: ambarella: add CV75 pin controller

elapsed time: 1072m

configs tested: 317
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2105-20261001    gcc-15.2.0 cocci
alpha                randconfig-r2307-20261001    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261002    clang-17
arc                   randconfig-1001-20261002    clang-17
arc                  randconfig-r2101-20261001    gcc-13.4.0 cocci
arc                  randconfig-r2102-20261001    gcc-13.4.0 cocci
arc                  randconfig-r2308-20261001    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261002    clang-17
arm                   randconfig-1001-20261002    clang-17
arm                   randconfig-1002-20261002    clang-17
arm                   randconfig-1003-20261002    clang-17
arm                  randconfig-r2103-20261001    gcc-8.5.0  cocci
arm                  randconfig-r2201-20261001    gcc-16.1.0 smatch
arm                          s3c6400_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261002    gcc-12.5.0
arm64                 randconfig-1001-20261002    gcc-12.5.0
arm64                 randconfig-1002-20261002    gcc-12.5.0
arm64                 randconfig-1003-20261002    gcc-12.5.0
arm64                randconfig-r2104-20261002    clang-17   cocci
arm64                randconfig-r2201-20261001    gcc-16.1.0 smatch
arm64                randconfig-r2300-20261001    gcc-9.5.0  sparse
arm64                randconfig-r2303-20261001    gcc-15.2.0 sparse
arm64                randconfig-r2303-20261001    gcc-9.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261002    gcc-12.5.0
csky                  randconfig-1001-20261002    gcc-12.5.0
csky                 randconfig-r2105-20261001    clang-24   cocci
csky                 randconfig-r2302-20261001    gcc-14     sparse
csky                 randconfig-r2305-20261001    gcc-15.2.0 sparse
csky                 randconfig-r2305-20261001    gcc-9.5.0  sparse
csky                 randconfig-r2309-20261001    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261002    gcc-13.4.0
hexagon               randconfig-1001-20261002    gcc-13.4.0
hexagon              randconfig-r2103-20261001    clang-24   cocci
hexagon              randconfig-r2104-20261001    clang-24   cocci
hexagon              randconfig-r2106-20261001    clang-24   cocci
hexagon              randconfig-r2202-20261002    clang-18   smatch
hexagon              randconfig-r2300-20261001    gcc-14     sparse
hexagon              randconfig-r2303-20261001    gcc-14     sparse
hexagon              randconfig-r2304-20261001    gcc-15.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261002    clang-22
i386        buildonly-randconfig-1001-20261002    clang-22
i386        buildonly-randconfig-1002-20261002    clang-22
i386        buildonly-randconfig-1003-20261002    clang-22
i386        buildonly-randconfig-1004-20261002    clang-22
i386        buildonly-randconfig-1005-20261002    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261002    gcc-14
i386                  randconfig-1001-20261002    gcc-14
i386                  randconfig-1002-20261002    gcc-14
i386                  randconfig-1003-20261002    gcc-14
i386                  randconfig-1004-20261002    gcc-14
i386                  randconfig-1005-20261002    gcc-14
i386                  randconfig-1006-20261002    gcc-14
i386                  randconfig-1007-20261002    clang-22
i386                  randconfig-1008-20261002    clang-22
i386                  randconfig-1009-20261002    clang-22
i386                  randconfig-1010-20261002    clang-22
i386                  randconfig-1011-20261002    clang-22
i386                  randconfig-1012-20261002    clang-22
i386                  randconfig-1013-20261002    clang-22
i386                  randconfig-2100-20261001    gcc-14     cocci
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2101-20261001    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2102-20261001    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2103-20261001    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2200-20261001    clang-22   smatch
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2300-20261001    gcc-14     sparse
i386                  randconfig-2301-20261001    gcc-14     sparse
i386                  randconfig-2302-20261001    gcc-14     sparse
i386                 randconfig-r2103-20261001    gcc-9.5.0  cocci
i386                 randconfig-r2308-20261001    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261002    gcc-13.4.0
loongarch             randconfig-1001-20261002    gcc-13.4.0
loongarch            randconfig-r2102-20261001    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261001    gcc-14     cocci
loongarch            randconfig-r2107-20261001    gcc-14     cocci
loongarch            randconfig-r2107-20261001    gcc-15.2.0 cocci
loongarch            randconfig-r2201-20261001    clang-18   smatch
loongarch            randconfig-r2202-20261001    clang-21   smatch
loongarch            randconfig-r2302-20261001    gcc-15.2.0 sparse
loongarch            randconfig-r2305-20261001    gcc-15.2.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2105-20261002    clang-17   cocci
m68k                 randconfig-r2200-20261001    gcc-8.5.0  smatch
m68k                 randconfig-r2301-20261001    gcc-14     sparse
m68k                 randconfig-r2302-20261001    gcc-9.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2201-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2202-20261001    gcc-8.5.0  smatch
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261001    gcc-8.5.0  cocci
mips                 randconfig-r2102-20261001    gcc-9.5.0  cocci
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261002    gcc-13.4.0
nios2                 randconfig-1001-20261002    gcc-13.4.0
nios2                randconfig-r2100-20261001    gcc-9.5.0  cocci
nios2                randconfig-r2101-20261001    gcc-9.5.0  cocci
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2307-20261001    gcc-16.1.0 sparse
openrisc             randconfig-r2308-20261001    clang-20   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261002    gcc-14.3.0
parisc                randconfig-1001-20261002    gcc-14.3.0
parisc               randconfig-r2102-20261001    clang-24   cocci
parisc               randconfig-r2104-20261001    gcc-15.2.0 cocci
parisc               randconfig-r2106-20261001    gcc-14     cocci
parisc               randconfig-r2107-20261001    clang-24   cocci
parisc               randconfig-r2200-20261001    gcc-8.5.0  smatch
parisc               randconfig-r2302-20261001    gcc-15.2.0 sparse
parisc               randconfig-r2304-20261001    gcc-15.2.0 sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                       pcm030_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261002    gcc-14.3.0
powerpc               randconfig-1001-20261002    gcc-14.3.0
powerpc              randconfig-r2301-20261001    gcc-15.2.0 sparse
powerpc              randconfig-r2303-20261001    gcc-15.2.0 sparse
powerpc64             randconfig-1000-20261002    gcc-14.3.0
powerpc64             randconfig-1001-20261002    gcc-14.3.0
powerpc64            randconfig-r2306-20261001    gcc-16.1.0 sparse
powerpc64            randconfig-r2307-20261001    clang-24   sparse
powerpc64            randconfig-r2309-20261001    clang-20   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261002    clang-24
riscv                 randconfig-1001-20261002    clang-24
riscv                 randconfig-2000-20261001    gcc-10.5.0
riscv                 randconfig-2001-20261001    gcc-10.5.0
riscv                randconfig-r2300-20261001    gcc-15.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261002    clang-24
s390                  randconfig-1001-20261002    clang-24
s390                  randconfig-2000-20261001    gcc-10.5.0
s390                  randconfig-2001-20261001    gcc-10.5.0
s390                 randconfig-r2100-20261001    gcc-13.4.0 cocci
s390                 randconfig-r2106-20261002    clang-17   cocci
s390                 randconfig-r2306-20261001    clang-20   sparse
s390                 randconfig-r2308-20261001    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261002    clang-24
sh                    randconfig-1001-20261002    clang-24
sh                    randconfig-2000-20261001    gcc-10.5.0
sh                    randconfig-2001-20261001    gcc-10.5.0
sh                   randconfig-r2301-20261001    gcc-15.2.0 sparse
sh                   randconfig-r2306-20261001    gcc-16.1.0 sparse
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7780_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261002    clang-24
sparc                 randconfig-1001-20261002    clang-24
sparc                 randconfig-2000-20261001    clang-24
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2001-20261001    clang-24
sparc                 randconfig-2001-20261002    clang-24
sparc                randconfig-r2101-20261001    clang-24   cocci
sparc                randconfig-r2106-20261001    gcc-15.2.0 cocci
sparc                randconfig-r2200-20261001    gcc-8.5.0  smatch
sparc                randconfig-r2309-20261001    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261002    clang-24
sparc64               randconfig-1001-20261002    clang-24
sparc64               randconfig-2000-20261001    clang-24
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2001-20261001    clang-24
sparc64               randconfig-2001-20261002    clang-24
sparc64              randconfig-r2101-20261001    gcc-8.5.0  cocci
sparc64              randconfig-r2103-20261001    gcc-13.4.0 cocci
sparc64              randconfig-r2107-20261002    clang-17   cocci
sparc64              randconfig-r2301-20261001    gcc-9.5.0  sparse
sparc64              randconfig-r2304-20261001    gcc-14     sparse
sparc64              randconfig-r2307-20261001    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261002    clang-24
um                    randconfig-1001-20261002    clang-24
um                    randconfig-2000-20261001    clang-24
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2001-20261001    clang-24
um                    randconfig-2001-20261002    clang-24
um                   randconfig-r2100-20261001    clang-24   cocci
um                   randconfig-r2306-20261001    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261002    gcc-14
x86_64      buildonly-randconfig-1001-20261002    gcc-14
x86_64      buildonly-randconfig-1002-20261002    gcc-14
x86_64      buildonly-randconfig-1003-20261002    gcc-14
x86_64      buildonly-randconfig-1004-20261002    gcc-14
x86_64      buildonly-randconfig-1005-20261002    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261002    gcc-14
x86_64                randconfig-1001-20261002    gcc-14
x86_64                randconfig-1002-20261002    gcc-14
x86_64                randconfig-1003-20261002    gcc-14
x86_64                randconfig-1004-20261002    gcc-14
x86_64                randconfig-1005-20261002    gcc-14
x86_64                randconfig-1006-20261002    clang-22
x86_64                randconfig-1007-20261002    clang-22
x86_64                randconfig-1008-20261002    clang-22
x86_64                randconfig-1009-20261002    clang-22
x86_64                randconfig-1010-20261002    clang-22
x86_64                randconfig-1011-20261002    clang-22
x86_64                randconfig-1012-20261002    clang-22
x86_64                randconfig-1013-20261002    clang-22
x86_64                randconfig-1014-20261002    clang-22
x86_64                randconfig-1015-20261002    clang-22
x86_64                randconfig-1016-20261002    clang-22
x86_64                randconfig-1017-20261002    clang-22
x86_64                randconfig-2100-20261001    gcc-14     cocci
x86_64                randconfig-2101-20261001    gcc-14     cocci
x86_64                randconfig-2102-20261001    gcc-14     cocci
x86_64                randconfig-2103-20261001    gcc-14     cocci
x86_64                randconfig-2200-20261001    clang-22   smatch
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2300-20261001    gcc-14     sparse
x86_64                randconfig-2301-20261001    gcc-14     sparse
x86_64                randconfig-2302-20261001    gcc-14     sparse
x86_64               randconfig-r2105-20261001    gcc-14     cocci
x86_64               randconfig-r2202-20261001    clang-22   smatch
x86_64               randconfig-r2304-20261001    gcc-9.5.0  sparse
x86_64               randconfig-r2305-20261001    gcc-14     sparse
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
xtensa                randconfig-1000-20261002    clang-24
xtensa                randconfig-1001-20261002    clang-24
xtensa                randconfig-2000-20261001    clang-24
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2001-20261001    clang-24
xtensa                randconfig-2001-20261002    clang-24
xtensa               randconfig-r2300-20261001    gcc-15.2.0 sparse
xtensa               randconfig-r2309-20261001    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
