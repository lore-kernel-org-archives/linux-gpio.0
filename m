Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C4352005
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211567; cv=none; b=aiaCadM+8+bVn0On7A+jdGBDPVbYM5yzBHwilj6cZcwkIgRpuCEXfRh7NwXKhW5zb0zvG2ooOspROyvhjYFzGMJisObESGgp1J21zN4GPnP9pYrg0zUGZCX+Eo2xEgwP4kpHI+Sz0CL/8YlWFrmXTCRjyq+bNIzRKBL/mLAtfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211567; c=relaxed/simple;
	bh=blvtjQe6Ek2vhWoqeq4Vn3zG6mxJqoNKVp3UEhmaqFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=alCy9LQxVSsD0b83JJYPHm/S6j+ZTig57D4fWFOgsOaA4fGZEfQmUIb43tj/5sTt6Hm/0K78pzT8cmAT3hGS608z6qHoXA2PGeC9Zy8Ylw0SACw8SKqOCwnOIO2DOvWhZLnO5xae7/B3mhQW/gD+pNNOz/bvtPQBaZ5k/1ab5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIVMglgH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIVMglgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792211565; x=1823747565;
  h=date:from:to:cc:subject:message-id;
  bh=blvtjQe6Ek2vhWoqeq4Vn3zG6mxJqoNKVp3UEhmaqFw=;
  b=DIVMglgH5Zrgfodxfb7yM2NNUfYZFO7fmQ5h9cSw2hHt5eghPwMAz6id
   HmD0pS9Wbcv7rahCDN+pTulmVaXi3mYwjqjo0AlO+UN0pNLwWV0FvgJPy
   0SQOouj0gsJ5seKU7G6x47dmx5m8q3d3JdNR7Qg9asOPT07In2mumGcgl
   eomC/Ajd9KJFyW4fagwajtV6NAuhY9X7griY74y5U31vIrhAsbGLXuZhE
   CXmd4BtTfFd0oL9w5zq/XZnOrEQsSHJlYNOBoSzfGj43/mpZYWC28qmVJ
   0FspPzdiANZJKNse9I5/2okvQyd0mYV/G9Grq9/RtaFNitxIrEzxgBcaa
   g==;
X-CSE-ConnectionGUID: TDGvxkjmT1qB9xjTqp3zRw==
X-CSE-MsgGUID: 0B2R6H22SUGgXXO5UFRYFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="869182"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="869182"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 21:32:44 -0700
X-CSE-ConnectionGUID: 3fZ6KzNbTmCZxvgc2yTgYQ==
X-CSE-MsgGUID: uFx4SMSfSNCDieT5uNXLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3845285"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 16 Oct 2026 21:32:43 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHw64-00000000J4U-3kot;
	Sat, 17 Oct 2026 04:32:40 +0000
Date: Sat, 17 Oct 2026 12:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6e648fe0b51f9cc15dbc63391bb723ac037d686c
Message-ID: <202610171243.QieWASLc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6e648fe0b51f9cc15dbc63391bb723ac037d686c  Merge branch 'devel' into for-next

elapsed time: 902m

configs tested: 572
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261015    gcc-9.5.0  cocci
alpha                randconfig-r2102-20261014    gcc-12.5.0 cocci
alpha                randconfig-r2103-20261014    gcc-11.5.0 cocci
alpha                randconfig-r2103-20261015    gcc-9.5.0  cocci
alpha                randconfig-r2104-20261015    gcc-16.1.0 cocci
alpha                randconfig-r2105-20261014    gcc-10.5.0 cocci
alpha                randconfig-r2109-20261014    gcc-13.4.0 cocci
alpha                randconfig-r2304-20261016    gcc-11.5.0 sparse
alpha                randconfig-r2306-20261014    gcc-16.1.0 sparse
alpha                randconfig-r2308-20261015    clang-22   sparse
alpha                randconfig-r2311-20261014    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261017    gcc-10.5.0
arc                   randconfig-1001-20261017    gcc-10.5.0
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2000-20261015    gcc-15.2.0
arc                   randconfig-2000-20261016    gcc-8.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                   randconfig-2001-20261015    gcc-15.2.0
arc                   randconfig-2001-20261016    gcc-8.5.0
arc                  randconfig-r2101-20261015    clang-18   cocci
arc                  randconfig-r2104-20261015    gcc-15.2.0 cocci
arc                  randconfig-r2105-20261014    gcc-11.5.0 cocci
arc                  randconfig-r2106-20261015    gcc-15.2.0 cocci
arc                  randconfig-r2107-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261015    gcc-12.5.0 cocci
arc                  randconfig-r2107-20261015    gcc-16.1.0 cocci
arc                  randconfig-r2109-20261015    clang-24   cocci
arc                  randconfig-r2306-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2306-20261015    gcc-16.1.0 sparse
arc                  randconfig-r2306-20261015    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261014    gcc-16.1.0 sparse
arc                  randconfig-r2308-20261015    gcc-16.1.0 sparse
arc                  randconfig-r2309-20261015    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       footbridge_defconfig    clang-24
arm                         multi_v5_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261017    gcc-10.5.0
arm                   randconfig-1001-20261017    gcc-10.5.0
arm                   randconfig-1002-20261017    gcc-10.5.0
arm                   randconfig-1003-20261017    gcc-10.5.0
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2000-20261015    gcc-15.2.0
arm                   randconfig-2000-20261016    gcc-8.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                   randconfig-2001-20261015    gcc-15.2.0
arm                   randconfig-2001-20261016    gcc-8.5.0
arm                  randconfig-r2108-20261015    clang-24   cocci
arm                  randconfig-r2110-20261016    gcc-8.5.0  cocci
arm                  randconfig-r2200-20261015    clang-18   smatch
arm                  randconfig-r2305-20261016    gcc-11.5.0 sparse
arm                  randconfig-r2307-20261014    gcc-16.1.0 sparse
arm                  randconfig-r2309-20261015    clang-22   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261017    clang-24
arm64                 randconfig-1001-20261017    clang-24
arm64                 randconfig-1002-20261017    clang-24
arm64                 randconfig-1003-20261017    clang-24
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2000-20261015    gcc-16.1.0
arm64                 randconfig-2000-20261016    gcc-12.5.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261015    gcc-16.1.0
arm64                 randconfig-2001-20261016    gcc-12.5.0
arm64                randconfig-r2100-20261014    gcc-13.4.0 cocci
arm64                randconfig-r2107-20261015    clang-22   cocci
arm64                randconfig-r2107-20261015    gcc-15.2.0 cocci
arm64                randconfig-r2109-20261014    gcc-15.2.0 cocci
arm64                randconfig-r2201-20261014    clang-24   smatch
arm64                randconfig-r2201-20261015    clang-24   smatch
arm64                randconfig-r2303-20261015    clang-17   sparse
arm64                randconfig-r2305-20261014    clang-24   sparse
arm64                randconfig-r2307-20261015    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261017    clang-24
csky                  randconfig-1001-20261017    clang-24
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2000-20261015    gcc-16.1.0
csky                  randconfig-2000-20261016    gcc-12.5.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                  randconfig-2001-20261015    gcc-16.1.0
csky                  randconfig-2001-20261016    gcc-12.5.0
csky                 randconfig-r2100-20261014    gcc-12.5.0 cocci
csky                 randconfig-r2101-20261014    gcc-15.2.0 cocci
csky                 randconfig-r2103-20261016    gcc-16.1.0 cocci
csky                 randconfig-r2104-20261014    gcc-11.5.0 cocci
csky                 randconfig-r2107-20261014    gcc-11.5.0 cocci
csky                 randconfig-r2108-20261014    gcc-13.4.0 cocci
csky                 randconfig-r2108-20261016    gcc-16.1.0 cocci
csky                 randconfig-r2109-20261015    clang-19   cocci
csky                 randconfig-r2109-20261015    gcc-10.5.0 cocci
csky                 randconfig-r2109-20261015    gcc-9.5.0  cocci
csky                 randconfig-r2109-20261016    gcc-16.1.0 cocci
csky                 randconfig-r2110-20261015    gcc-16.1.0 cocci
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2300-20261015    clang-17   sparse
csky                 randconfig-r2303-20261014    clang-24   sparse
csky                 randconfig-r2303-20261015    clang-24   sparse
csky                 randconfig-r2307-20261015    gcc-16.1.0 sparse
csky                 randconfig-r2310-20261014    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261017    clang-21
hexagon               randconfig-1001-20261017    clang-21
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2000-20261015    gcc-16.1.0
hexagon               randconfig-2000-20261016    gcc-12.5.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261015    gcc-16.1.0
hexagon               randconfig-2001-20261016    gcc-12.5.0
hexagon              randconfig-r2103-20261015    clang-19   cocci
hexagon              randconfig-r2104-20261014    gcc-10.5.0 cocci
hexagon              randconfig-r2106-20261016    gcc-8.5.0  cocci
hexagon              randconfig-r2107-20261014    gcc-10.5.0 cocci
hexagon              randconfig-r2202-20261015    clang-24   smatch
hexagon              randconfig-r2302-20261015    clang-24   sparse
hexagon              randconfig-r2305-20261014    clang-24   sparse
hexagon              randconfig-r2305-20261015    clang-17   sparse
hexagon              randconfig-r2305-20261015    gcc-16.1.0 sparse
hexagon              randconfig-r2306-20261015    clang-24   sparse
hexagon              randconfig-r2308-20261015    clang-24   sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261017    gcc-14
i386        buildonly-randconfig-1001-20261017    gcc-14
i386        buildonly-randconfig-1002-20261017    gcc-14
i386        buildonly-randconfig-1003-20261017    gcc-14
i386        buildonly-randconfig-1004-20261017    gcc-14
i386        buildonly-randconfig-1005-20261017    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261017    clang-22
i386                  randconfig-1001-20261017    clang-22
i386                  randconfig-1002-20261017    clang-22
i386                  randconfig-1003-20261017    clang-22
i386                  randconfig-1004-20261017    clang-22
i386                  randconfig-1005-20261017    clang-22
i386                  randconfig-1006-20261017    clang-22
i386                  randconfig-1007-20261017    clang-22
i386                  randconfig-1008-20261017    clang-22
i386                  randconfig-1009-20261017    clang-22
i386                  randconfig-1010-20261017    clang-22
i386                  randconfig-1011-20261017    clang-22
i386                  randconfig-1012-20261017    clang-22
i386                  randconfig-1013-20261017    clang-22
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2000-20261015    gcc-15.2.0
i386                  randconfig-2000-20261016    gcc-8.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2001-20261015    gcc-15.2.0
i386                  randconfig-2001-20261016    gcc-8.5.0
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2100-20261015    gcc-14     cocci
i386                  randconfig-2100-20261016    clang-22   cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2101-20261015    gcc-14     cocci
i386                  randconfig-2101-20261016    clang-22   cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2102-20261015    gcc-14     cocci
i386                  randconfig-2102-20261016    clang-22   cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2103-20261015    gcc-14     cocci
i386                  randconfig-2103-20261016    clang-22   cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2104-20261015    gcc-14     cocci
i386                  randconfig-2104-20261016    clang-22   cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2105-20261015    gcc-14     cocci
i386                  randconfig-2105-20261016    clang-22   cocci
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2200-20261015    clang-22   smatch
i386                  randconfig-2200-20261016    clang-22   smatch
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2300-20261015    gcc-14     sparse
i386                  randconfig-2300-20261016    clang-22   sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2301-20261015    gcc-14     sparse
i386                  randconfig-2301-20261016    clang-22   sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                  randconfig-2302-20261015    gcc-14     sparse
i386                  randconfig-2302-20261016    clang-22   sparse
i386                 randconfig-r2102-20261015    clang-19   cocci
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261015    clang-22   cocci
i386                 randconfig-r2300-20261014    clang-24   sparse
i386                 randconfig-r2304-20261014    gcc-14     sparse
i386                 randconfig-r2305-20261014    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261017    clang-21
loongarch             randconfig-1001-20261017    clang-21
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2000-20261015    gcc-8.5.0
loongarch             randconfig-2000-20261016    gcc-11.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261015    gcc-8.5.0
loongarch             randconfig-2001-20261016    gcc-11.5.0
loongarch            randconfig-r2101-20261014    gcc-11.5.0 cocci
loongarch            randconfig-r2102-20261015    clang-18   cocci
loongarch            randconfig-r2105-20261015    gcc-16.1.0 cocci
loongarch            randconfig-r2108-20261015    clang-19   cocci
loongarch            randconfig-r2300-20261015    gcc-16.1.0 sparse
loongarch            randconfig-r2301-20261014    clang-24   sparse
loongarch            randconfig-r2301-20261016    gcc-11.5.0 sparse
loongarch            randconfig-r2302-20261014    gcc-8.5.0  sparse
loongarch            randconfig-r2305-20261015    clang-17   sparse
loongarch            randconfig-r2311-20261015    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2100-20261015    clang-19   cocci
m68k                 randconfig-r2103-20261014    gcc-13.4.0 cocci
m68k                 randconfig-r2103-20261015    clang-24   cocci
m68k                 randconfig-r2108-20261014    gcc-12.5.0 cocci
m68k                 randconfig-r2108-20261014    gcc-15.2.0 cocci
m68k                 randconfig-r2108-20261015    gcc-10.5.0 cocci
m68k                 randconfig-r2200-20261015    gcc-8.5.0  smatch
m68k                 randconfig-r2302-20261015    clang-17   sparse
m68k                 randconfig-r2307-20261015    clang-22   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20261015    clang-18   cocci
microblaze           randconfig-r2202-20261014    gcc-9.5.0  smatch
microblaze           randconfig-r2301-20261015    clang-17   sparse
microblaze           randconfig-r2306-20261015    clang-22   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip30_defconfig    clang-24
mips                 randconfig-r2100-20261015    clang-24   cocci
mips                 randconfig-r2101-20261014    gcc-13.4.0 cocci
mips                 randconfig-r2101-20261015    clang-24   cocci
mips                 randconfig-r2111-20261015    gcc-15.2.0 cocci
mips                 randconfig-r2200-20261016    clang-24   smatch
mips                 randconfig-r2301-20261014    clang-24   sparse
mips                 randconfig-r2302-20261014    clang-24   sparse
mips                 randconfig-r2303-20261014    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261014    gcc-16.1.0 sparse
mips                    sb1250_swarm_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261017    clang-21
nios2                 randconfig-1001-20261017    clang-21
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2000-20261015    gcc-8.5.0
nios2                 randconfig-2000-20261016    gcc-11.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261015    gcc-8.5.0
nios2                 randconfig-2001-20261016    gcc-11.5.0
nios2                randconfig-r2105-20261015    gcc-15.2.0 cocci
nios2                randconfig-r2109-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2110-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2200-20261014    gcc-11.5.0 smatch
nios2                randconfig-r2304-20261014    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261016    gcc-16.1.0 cocci
openrisc             randconfig-r2105-20261014    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261015    gcc-12.5.0 cocci
openrisc             randconfig-r2201-20261015    gcc-9.5.0  smatch
openrisc             randconfig-r2300-20261015    clang-24   sparse
openrisc             randconfig-r2301-20261015    gcc-16.1.0 sparse
openrisc             randconfig-r2302-20261014    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261017    gcc-15.2.0
parisc                randconfig-1001-20261017    gcc-15.2.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2000-20261015    gcc-8.5.0
parisc                randconfig-2000-20261016    gcc-11.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc                randconfig-2001-20261015    gcc-8.5.0
parisc                randconfig-2001-20261016    gcc-11.5.0
parisc               randconfig-r2105-20261015    clang-22   cocci
parisc               randconfig-r2106-20261014    gcc-10.5.0 cocci
parisc               randconfig-r2106-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2201-20261015    gcc-11.5.0 smatch
parisc               randconfig-r2202-20261016    gcc-8.5.0  smatch
parisc               randconfig-r2300-20261014    gcc-14     sparse
parisc               randconfig-r2303-20261014    gcc-14     sparse
parisc               randconfig-r2303-20261015    clang-17   sparse
parisc               randconfig-r2303-20261015    gcc-16.1.0 sparse
parisc               randconfig-r2304-20261015    clang-24   sparse
parisc               randconfig-r2310-20261015    gcc-8.5.0  sparse
parisc               randconfig-r2311-20261015    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc               randconfig-1000-20261017    gcc-15.2.0
powerpc               randconfig-1001-20261017    gcc-15.2.0
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2000-20261015    clang-22
powerpc               randconfig-2001-20261014    clang-22
powerpc               randconfig-2001-20261015    clang-22
powerpc              randconfig-r2100-20261014    gcc-15.2.0 cocci
powerpc              randconfig-r2105-20261016    gcc-8.5.0  cocci
powerpc              randconfig-r2106-20261015    clang-24   cocci
powerpc              randconfig-r2108-20261014    gcc-11.5.0 cocci
powerpc              randconfig-r2108-20261015    clang-18   cocci
powerpc              randconfig-r2111-20261014    gcc-10.5.0 cocci
powerpc              randconfig-r2111-20261015    gcc-12.5.0 cocci
powerpc              randconfig-r2111-20261016    gcc-8.5.0  cocci
powerpc              randconfig-r2200-20261015    clang-24   smatch
powerpc              randconfig-r2202-20261015    gcc-8.5.0  smatch
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2302-20261015    gcc-14     sparse
powerpc              randconfig-r2304-20261014    clang-24   sparse
powerpc              randconfig-r2308-20261014    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261014    gcc-16.1.0 sparse
powerpc              randconfig-r2310-20261014    gcc-8.5.0  sparse
powerpc              randconfig-r2311-20261015    clang-24   sparse
powerpc64             randconfig-1000-20261017    gcc-15.2.0
powerpc64             randconfig-1001-20261017    gcc-15.2.0
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2000-20261015    clang-22
powerpc64             randconfig-2001-20261014    clang-22
powerpc64             randconfig-2001-20261015    clang-22
powerpc64            randconfig-r2101-20261014    gcc-12.5.0 cocci
powerpc64            randconfig-r2101-20261016    gcc-16.1.0 cocci
powerpc64            randconfig-r2103-20261015    clang-18   cocci
powerpc64            randconfig-r2103-20261015    gcc-10.5.0 cocci
powerpc64            randconfig-r2104-20261015    gcc-12.5.0 cocci
powerpc64            randconfig-r2110-20261015    gcc-12.5.0 cocci
powerpc64            randconfig-r2302-20261014    gcc-14     sparse
powerpc64            randconfig-r2304-20261014    gcc-8.5.0  sparse
powerpc64            randconfig-r2304-20261015    clang-17   sparse
powerpc64            randconfig-r2305-20261015    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261017    clang-19
riscv                 randconfig-1001-20261017    clang-19
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2000-20261015    gcc-9.5.0
riscv                 randconfig-2000-20261016    gcc-16.1.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261015    gcc-9.5.0
riscv                 randconfig-2001-20261016    gcc-16.1.0
riscv                randconfig-r2107-20261015    clang-24   cocci
riscv                randconfig-r2110-20261015    clang-22   cocci
riscv                randconfig-r2110-20261015    clang-24   cocci
riscv                randconfig-r2111-20261014    gcc-11.5.0 cocci
riscv                randconfig-r2300-20261016    gcc-11.5.0 sparse
riscv                randconfig-r2301-20261015    clang-24   sparse
riscv                randconfig-r2302-20261015    clang-17   sparse
riscv                randconfig-r2303-20261015    gcc-14     sparse
riscv                randconfig-r2305-20261015    gcc-14     sparse
riscv                randconfig-r2307-20261014    gcc-16.1.0 sparse
riscv                randconfig-r2310-20261015    clang-22   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261017    clang-19
s390                  randconfig-1001-20261017    clang-19
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2000-20261015    gcc-9.5.0
s390                  randconfig-2000-20261016    gcc-16.1.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                  randconfig-2001-20261015    gcc-9.5.0
s390                  randconfig-2001-20261016    gcc-16.1.0
s390                 randconfig-r2102-20261015    gcc-9.5.0  cocci
s390                 randconfig-r2103-20261014    gcc-15.2.0 cocci
s390                 randconfig-r2105-20261015    clang-24   cocci
s390                 randconfig-r2109-20261014    gcc-12.5.0 cocci
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2201-20261015    gcc-8.5.0  smatch
s390                 randconfig-r2202-20261015    gcc-9.5.0  smatch
s390                 randconfig-r2300-20261015    gcc-14     sparse
s390                 randconfig-r2301-20261015    clang-17   sparse
s390                 randconfig-r2304-20261015    clang-17   sparse
s390                 randconfig-r2305-20261014    gcc-14     sparse
s390                 randconfig-r2310-20261014    gcc-16.1.0 sparse
s390                 randconfig-r2310-20261015    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261017    clang-19
sh                    randconfig-1001-20261017    clang-19
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2000-20261015    gcc-9.5.0
sh                    randconfig-2000-20261016    gcc-16.1.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                    randconfig-2001-20261015    gcc-9.5.0
sh                    randconfig-2001-20261016    gcc-16.1.0
sh                   randconfig-r2101-20261015    gcc-10.5.0 cocci
sh                   randconfig-r2106-20261015    gcc-12.5.0 cocci
sh                   randconfig-r2106-20261015    gcc-16.1.0 cocci
sh                   randconfig-r2108-20261015    gcc-9.5.0  cocci
sh                   randconfig-r2201-20261014    gcc-11.5.0 smatch
sh                   randconfig-r2201-20261015    gcc-10.5.0 smatch
sh                   randconfig-r2309-20261014    gcc-8.5.0  sparse
sh                   randconfig-r2309-20261015    clang-24   sparse
sh                   randconfig-r2311-20261014    gcc-8.5.0  sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261017    gcc-15.2.0
sparc                 randconfig-1001-20261017    gcc-15.2.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2000-20261015    gcc-15.2.0
sparc                 randconfig-2000-20261016    gcc-12.5.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261015    gcc-15.2.0
sparc                 randconfig-2001-20261016    gcc-12.5.0
sparc                randconfig-r2100-20261015    gcc-10.5.0 cocci
sparc                randconfig-r2102-20261016    gcc-16.1.0 cocci
sparc                randconfig-r2103-20261014    gcc-12.5.0 cocci
sparc                randconfig-r2104-20261015    clang-24   cocci
sparc                randconfig-r2106-20261015    clang-22   cocci
sparc                randconfig-r2300-20261014    gcc-8.5.0  sparse
sparc                randconfig-r2306-20261014    gcc-16.1.0 sparse
sparc                randconfig-r2310-20261015    clang-24   sparse
sparc                        sparc32_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261017    gcc-15.2.0
sparc64               randconfig-1001-20261017    gcc-15.2.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2000-20261015    gcc-15.2.0
sparc64               randconfig-2000-20261016    gcc-12.5.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261015    gcc-15.2.0
sparc64               randconfig-2001-20261016    gcc-12.5.0
sparc64              randconfig-r2100-20261014    gcc-11.5.0 cocci
sparc64              randconfig-r2101-20261015    clang-19   cocci
sparc64              randconfig-r2101-20261015    gcc-9.5.0  cocci
sparc64              randconfig-r2102-20261014    gcc-13.4.0 cocci
sparc64              randconfig-r2102-20261015    clang-24   cocci
sparc64              randconfig-r2102-20261015    gcc-10.5.0 cocci
sparc64              randconfig-r2104-20261016    gcc-8.5.0  cocci
sparc64              randconfig-r2110-20261015    gcc-15.2.0 cocci
sparc64              randconfig-r2111-20261015    clang-24   cocci
sparc64              randconfig-r2201-20261016    gcc-12.5.0 smatch
sparc64              randconfig-r2202-20261014    clang-22   smatch
sparc64              randconfig-r2202-20261015    gcc-9.5.0  smatch
sparc64              randconfig-r2301-20261014    gcc-8.5.0  sparse
sparc64              randconfig-r2302-20261015    gcc-16.1.0 sparse
sparc64              randconfig-r2307-20261015    clang-24   sparse
sparc64              randconfig-r2308-20261014    gcc-16.1.0 sparse
sparc64              randconfig-r2311-20261015    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261017    gcc-15.2.0
um                    randconfig-1001-20261017    gcc-15.2.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2000-20261015    gcc-15.2.0
um                    randconfig-2000-20261016    gcc-12.5.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                    randconfig-2001-20261015    gcc-15.2.0
um                    randconfig-2001-20261016    gcc-12.5.0
um                   randconfig-r2102-20261014    gcc-11.5.0 cocci
um                   randconfig-r2102-20261014    gcc-15.2.0 cocci
um                   randconfig-r2104-20261014    gcc-8.5.0  cocci
um                   randconfig-r2107-20261016    gcc-8.5.0  cocci
um                   randconfig-r2109-20261015    clang-18   cocci
um                   randconfig-r2110-20261014    gcc-8.5.0  cocci
um                   randconfig-r2200-20261014    clang-17   smatch
um                   randconfig-r2300-20261015    clang-17   sparse
um                   randconfig-r2303-20261014    clang-24   sparse
um                   randconfig-r2304-20261015    gcc-16.1.0 sparse
um                   randconfig-r2309-20261015    gcc-16.1.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261017    gcc-14
x86_64      buildonly-randconfig-1001-20261017    gcc-14
x86_64      buildonly-randconfig-1002-20261017    gcc-14
x86_64      buildonly-randconfig-1003-20261017    gcc-14
x86_64      buildonly-randconfig-1004-20261017    gcc-14
x86_64      buildonly-randconfig-1005-20261017    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261017    gcc-14
x86_64                randconfig-1001-20261017    gcc-14
x86_64                randconfig-1002-20261017    gcc-14
x86_64                randconfig-1003-20261017    gcc-14
x86_64                randconfig-1004-20261017    gcc-14
x86_64                randconfig-1005-20261017    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2000-20261015    clang-22
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2001-20261015    clang-22
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2100-20261015    clang-22   cocci
x86_64                randconfig-2100-20261016    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2101-20261015    clang-22   cocci
x86_64                randconfig-2101-20261016    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2102-20261015    clang-22   cocci
x86_64                randconfig-2102-20261016    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2103-20261015    clang-22   cocci
x86_64                randconfig-2103-20261016    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2104-20261015    clang-22   cocci
x86_64                randconfig-2104-20261016    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2105-20261015    clang-22   cocci
x86_64                randconfig-2105-20261016    clang-22   cocci
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2200-20261015    clang-22   smatch
x86_64                randconfig-2200-20261016    gcc-14     smatch
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2300-20261015    gcc-14     sparse
x86_64                randconfig-2300-20261016    clang-22   sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2301-20261015    gcc-14     sparse
x86_64                randconfig-2301-20261016    clang-22   sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64                randconfig-2302-20261015    gcc-14     sparse
x86_64                randconfig-2302-20261016    clang-22   sparse
x86_64               randconfig-r2104-20261015    clang-22   cocci
x86_64               randconfig-r2106-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2111-20261014    gcc-8.5.0  cocci
x86_64               randconfig-r2200-20261014    gcc-14     smatch
x86_64               randconfig-r2200-20261015    clang-22   smatch
x86_64               randconfig-r2301-20261014    gcc-14     sparse
x86_64               randconfig-r2301-20261015    gcc-14     sparse
x86_64               randconfig-r2303-20261016    gcc-11.5.0 sparse
x86_64               randconfig-r2304-20261015    gcc-14     sparse
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
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261017    gcc-15.2.0
xtensa                randconfig-1001-20261017    gcc-15.2.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2000-20261015    gcc-15.2.0
xtensa                randconfig-2000-20261016    gcc-12.5.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261015    gcc-15.2.0
xtensa                randconfig-2001-20261016    gcc-12.5.0
xtensa               randconfig-r2111-20261015    gcc-16.1.0 cocci
xtensa               randconfig-r2202-20261014    gcc-14.3.0 smatch
xtensa               randconfig-r2202-20261015    gcc-11.5.0 smatch
xtensa               randconfig-r2302-20261016    gcc-11.5.0 sparse
xtensa               randconfig-r2308-20261015    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
