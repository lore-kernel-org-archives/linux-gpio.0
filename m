Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787926;
	b=fwZmyJv4t2cOyOch7O211Qxg/Uq+PubigWHlRFGmvmsx+ELn2hVdqMxsm/EFtn9V/YIm
	 gZKehksPmtDGBKhz2LegeFcDcJEJwph+LeiwdtvW/rBfYLK5Wwz6RYHgdiup5oWip6noX
	 UoCoxGQUTulf8GNhFLVFQEEPJb/ZklmdW38Tw3ihqJZzdxaihZY9U3DNTZeGEgFlcoYN7
	 n3pnNyeIV3pRADl9/SeY2wEOvbeCSPqbUmLkZgytxkB4GLTX6UHc19Jh3krozpGu2xI/z
	 W1qruf0At1YQYcO4x5QLnv9fkHi3vtDTShSvtdspDa/r5JkM56Ij0/z8qqbo8p53hsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787926;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+R1QEsWTxEUKzTDt9y/V6+JRUK57D62rA0kU7bKmtxI=;
	b=PCAO0fuag4RLhJDejiUMHPy8B/iEZPo65fBIZ7cWCM5Xi1rdUR4PW1PWaVN+JWnd2HVR
	 zxEztPgyiL7pcrp57qShbgw7qYA3gVLZU9y7DoaMxajsUA3mrQ7dm+uudtvctyAQOdTrI
	 mi39LM1jEYeDRCNdfgllJ+I4JoZPfw7QtUb0lwvMI2NjMnWm99Ix/hpjVDYkuvi0vJG9v
	 1luaY18TpTB/hOvrs5V065E0V13R4S5bBN2VW3brX7Mxbjeu3MDJbWNvH3l9ENrVm+jqD
	 /XV9PonksMuiOHol40miBHxdOYK7FzW7p1H35Q8WzrIx5oD1KHYsshpy55YH4u/Gfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JQ2Yak0U;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE3606A31F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 13:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CE3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JQ2Yak0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795787924; x=1827323924;
  h=date:from:to:cc:subject:message-id;
  bh=hQzOstLeQPpNz4+CQ8wDrkeQf+9fb98z6g/RYty/HAQ=;
  b=JQ2Yak0U4AQvOpmWTH6TpYvjrVL7vVuH03gsyyKqFUjyiFPYUpKNYT6R
   cGYtKJt3f4acMXq4XYFgjC8N1bpiinE18fSwkGwdlZIvCUNElUe4wK5cm
   obTKrrpGY6911TGBxpnPPoK8SjOWvGwqI9Dv2XJ/5TTZrDM8sdA5E5IOC
   EfpmC76CVJbCtfi+PJk8IXsrsRJSd8kVI9syLkqix2LhQWDpCvfPjd3Ww
   DxS1m919c/dbWxDAAhBhT6a4r7isKVT0RLiCWJ6b1RUbQNBzIJW5487Q+
   YEbCw2EpK8YhdY9tgwCz4PRquHxkPAX9x8VmNnlWm8jEnQSdGaHURDJMT
   w==;
X-CSE-ConnectionGUID: UITWybihTbuS9D+GZS1TTw==
X-CSE-MsgGUID: +5RPFYP8TpC46lxjjxNAtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4711915"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4711915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 05:58:43 -0800
X-CSE-ConnectionGUID: RR11K6mhS7m3sVDVPhr/rw==
X-CSE-MsgGUID: sqnQqz//S/qA6xSOVjXBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12735667"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2026 05:58:42 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWwTH-00000001WB0-3Fso;
	Fri, 27 Nov 2026 13:58:39 +0000
Date: Fri, 27 Nov 2026 21:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 62a41997c1553b723a7a333c0246d0646ebd2c95
Message-ID: <20261127215744.HLyJYeTJ-lkp@intel.com>
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
branch HEAD: 62a41997c1553b723a7a333c0246d0646ebd2c95  gpio: mvebu: validate ngpios before use

elapsed time: 1010m

configs tested: 484
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261126    gcc-13.5.0
alpha                 randconfig-2000-20261127    gcc-16.2.0
alpha                 randconfig-2001-20261126    gcc-13.5.0
alpha                 randconfig-2001-20261127    gcc-16.2.0
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261127    gcc-12.5.0 smatch
alpha                randconfig-r2105-20261126    gcc-14.4.0 cocci
alpha                randconfig-r2111-20261126    gcc-14.4.0 cocci
alpha                randconfig-r2306-20261126    gcc-16.2.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261127    gcc-8.5.0
arc                   randconfig-1001-20261127    gcc-8.5.0
arc                   randconfig-2000-20261126    gcc-9.5.0
arc                   randconfig-2001-20261126    gcc-9.5.0
arc                   randconfig-2002-20261126    gcc-9.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261126    gcc-9.5.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                   randconfig-2200-20261127    gcc-16.2.0 smatch
arc                  randconfig-r2101-20261126    gcc-14.4.0 cocci
arc                  randconfig-r2105-20261126    gcc-10.5.0 cocci
arc                  randconfig-r2106-20261126    gcc-14.4.0 cocci
arc                  randconfig-r2107-20261126    gcc-11.5.0 cocci
arc                  randconfig-r2301-20261127    gcc-12     sparse
arc                  randconfig-r2302-20261126    gcc-10.5.0 sparse
arc                  randconfig-r2309-20261126    gcc-16.2.0 sparse
arc                  randconfig-r2310-20261126    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261127    gcc-8.5.0
arm                   randconfig-1001-20261127    gcc-8.5.0
arm                   randconfig-1002-20261127    gcc-8.5.0
arm                   randconfig-1003-20261127    gcc-8.5.0
arm                   randconfig-2000-20261126    gcc-11.5.0
arm                   randconfig-2000-20261127    gcc-10.5.0
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2001-20261127    gcc-10.5.0
arm                   randconfig-2002-20261126    gcc-11.5.0
arm                   randconfig-2002-20261127    gcc-10.5.0
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                   randconfig-2200-20261127    gcc-10.5.0 smatch
arm                  randconfig-r2103-20261126    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261126    clang-24   cocci
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261127    gcc-8.5.0
arm64                 randconfig-1001-20261127    gcc-8.5.0
arm64                 randconfig-1002-20261127    gcc-8.5.0
arm64                 randconfig-1003-20261127    gcc-8.5.0
arm64                 randconfig-2000-20261126    gcc-11.5.0
arm64                 randconfig-2000-20261127    gcc-10.5.0
arm64                 randconfig-2001-20261126    gcc-11.5.0
arm64                 randconfig-2001-20261127    gcc-10.5.0
arm64                 randconfig-2002-20261126    gcc-11.5.0
arm64                 randconfig-2002-20261127    gcc-10.5.0
arm64                 randconfig-2200-20261126    clang-24   smatch
arm64                randconfig-r2104-20261126    gcc-8.5.0  cocci
arm64                randconfig-r2106-20261127    gcc-11.5.0 cocci
arm64                randconfig-r2107-20261126    gcc-10.5.0 cocci
arm64                randconfig-r2109-20261126    gcc-14.4.0 cocci
arm64                randconfig-r2300-20261126    gcc-16.2.0 sparse
arm64                randconfig-r2303-20261127    gcc-12     sparse
arm64                randconfig-r2307-20261126    gcc-9.5.0  sparse
arm64                randconfig-r2309-20261126    clang-22   sparse
arm64                randconfig-r2311-20261126    gcc-16.2.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261127    gcc-8.5.0
csky                  randconfig-1001-20261127    gcc-8.5.0
csky                  randconfig-2000-20261126    gcc-13.5.0
csky                  randconfig-2000-20261126    gcc-16.2.0
csky                  randconfig-2001-20261126    gcc-13.5.0
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
csky                  randconfig-2200-20261127    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261126    gcc-14.4.0 cocci
csky                 randconfig-r2110-20261127    gcc-11.5.0 cocci
csky                 randconfig-r2111-20261126    gcc-10.5.0 cocci
csky                 randconfig-r2302-20261127    gcc-12     sparse
csky                 randconfig-r2304-20261126    gcc-12.5.0 sparse
csky                 randconfig-r2306-20261126    clang-22   sparse
csky                 randconfig-r2310-20261126    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261127    gcc-9.5.0
hexagon               randconfig-1001-20261127    gcc-9.5.0
hexagon               randconfig-2000-20261126    clang-24
hexagon               randconfig-2000-20261126    gcc-13.5.0
hexagon               randconfig-2001-20261126    clang-17
hexagon               randconfig-2001-20261126    gcc-13.5.0
hexagon               randconfig-2200-20261126    clang-17   smatch
hexagon              randconfig-r2104-20261126    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261126    gcc-10.5.0 cocci
hexagon              randconfig-r2108-20261126    gcc-10.5.0 cocci
hexagon              randconfig-r2303-20261126    gcc-12.5.0 sparse
hexagon              randconfig-r2305-20261126    gcc-16.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261127    clang-22
i386        buildonly-randconfig-1001-20261127    clang-22
i386        buildonly-randconfig-1002-20261127    clang-22
i386        buildonly-randconfig-1003-20261127    clang-22
i386        buildonly-randconfig-1004-20261127    clang-22
i386        buildonly-randconfig-1005-20261127    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261127    clang-22
i386                  randconfig-1001-20261127    clang-22
i386                  randconfig-1002-20261127    clang-22
i386                  randconfig-1003-20261127    clang-22
i386                  randconfig-1004-20261127    clang-22
i386                  randconfig-1005-20261127    clang-22
i386                  randconfig-1006-20261127    clang-22
i386                  randconfig-2000-20261126    clang-22
i386                  randconfig-2000-20261127    gcc-14
i386                  randconfig-2001-20261126    clang-22
i386                  randconfig-2001-20261127    gcc-14
i386                  randconfig-2002-20261126    clang-22
i386                  randconfig-2002-20261127    gcc-14
i386                  randconfig-2003-20261126    clang-22
i386                  randconfig-2003-20261127    gcc-14
i386                  randconfig-2004-20261126    clang-22
i386                  randconfig-2004-20261127    gcc-14
i386                  randconfig-2005-20261126    clang-22
i386                  randconfig-2005-20261127    gcc-14
i386                  randconfig-2100-20261126    clang-22   cocci
i386                  randconfig-2101-20261126    clang-22   cocci
i386                  randconfig-2102-20261126    clang-22   cocci
i386                  randconfig-2103-20261126    clang-22   cocci
i386                  randconfig-2104-20261126    clang-22   cocci
i386                  randconfig-2105-20261126    clang-22   cocci
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2300-20261126    gcc-14     sparse
i386                  randconfig-2301-20261126    gcc-14     sparse
i386                  randconfig-2302-20261126    gcc-14     sparse
i386                 randconfig-r2111-20261127    gcc-11.5.0 cocci
i386                 randconfig-r2302-20261126    gcc-16.2.0 sparse
i386                 randconfig-r2305-20261126    gcc-12.5.0 sparse
i386                 randconfig-r2308-20261126    clang-22   sparse
i386                 randconfig-r2308-20261126    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261127    gcc-9.5.0
loongarch             randconfig-1001-20261127    gcc-9.5.0
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2001-20261126    gcc-12.5.0
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch             randconfig-2200-20261127    clang-18   smatch
loongarch            randconfig-r2109-20261126    clang-24   cocci
loongarch            randconfig-r2110-20261126    clang-24   cocci
loongarch            randconfig-r2301-20261126    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261126    gcc-13.5.0
m68k                  randconfig-2000-20261127    gcc-16.2.0
m68k                  randconfig-2001-20261126    gcc-13.5.0
m68k                  randconfig-2001-20261127    gcc-16.2.0
m68k                  randconfig-2200-20261126    gcc-8.5.0  smatch
m68k                  randconfig-2200-20261127    gcc-9.5.0  smatch
m68k                 randconfig-r2105-20261126    gcc-8.5.0  cocci
m68k                 randconfig-r2110-20261126    gcc-14.4.0 cocci
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261126    gcc-13.5.0
microblaze            randconfig-2000-20261127    gcc-16.2.0
microblaze            randconfig-2001-20261126    gcc-13.5.0
microblaze            randconfig-2001-20261127    gcc-16.2.0
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze            randconfig-2200-20261127    gcc-16.2.0 smatch
microblaze           randconfig-r2100-20261127    gcc-8.5.0  cocci
microblaze           randconfig-r2102-20261126    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261126    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261126    clang-24   cocci
microblaze           randconfig-r2111-20261126    clang-24   cocci
microblaze           randconfig-r2301-20261126    gcc-12.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-16.2.0
mips                  randconfig-2000-20261127    gcc-14.4.0
mips                  randconfig-2001-20261126    gcc-16.2.0
mips                  randconfig-2001-20261127    gcc-14.4.0
mips                  randconfig-2002-20261126    gcc-16.2.0
mips                  randconfig-2002-20261127    gcc-14.4.0
mips                  randconfig-2200-20261126    gcc-15.3.0 smatch
mips                 randconfig-r2101-20261126    gcc-8.5.0  cocci
mips                 randconfig-r2106-20261126    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261126    clang-24   cocci
mips                 randconfig-r2304-20261127    gcc-12     sparse
mips                 randconfig-r2306-20261126    gcc-16.2.0 sparse
mips                 randconfig-r2309-20261126    gcc-9.5.0  sparse
mips                 randconfig-r2310-20261126    clang-22   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261127    gcc-9.5.0
nios2                 randconfig-1001-20261127    gcc-9.5.0
nios2                 randconfig-2000-20261126    gcc-12.5.0
nios2                 randconfig-2001-20261126    gcc-12.5.0
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                 randconfig-2200-20261127    gcc-8.5.0  smatch
nios2                randconfig-r2100-20261126    gcc-8.5.0  cocci
nios2                randconfig-r2102-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2104-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2107-20261127    gcc-11.5.0 cocci
nios2                randconfig-r2108-20261126    clang-24   cocci
nios2                randconfig-r2108-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2109-20261126    gcc-11.5.0 cocci
nios2                randconfig-r2300-20261126    gcc-12.5.0 sparse
nios2                randconfig-r2303-20261126    gcc-10.5.0 sparse
nios2                randconfig-r2304-20261126    gcc-10.5.0 sparse
nios2                randconfig-r2306-20261126    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2000-20261127    gcc-14.4.0
openrisc              randconfig-2001-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261127    gcc-14.4.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261127    gcc-14.4.0
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc              randconfig-2200-20261127    gcc-12.5.0 smatch
openrisc             randconfig-r2110-20261126    gcc-11.5.0 cocci
openrisc             randconfig-r2302-20261126    gcc-12.5.0 sparse
openrisc             randconfig-r2303-20261126    gcc-16.2.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261127    gcc-12.5.0
parisc                randconfig-1001-20261127    gcc-12.5.0
parisc                randconfig-2000-20261126    gcc-12.5.0
parisc                randconfig-2001-20261126    gcc-12.5.0
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2101-20261126    gcc-8.5.0  cocci
parisc               randconfig-r2102-20261127    gcc-8.5.0  cocci
parisc               randconfig-r2111-20261126    clang-24   cocci
parisc               randconfig-r2300-20261127    gcc-12     sparse
parisc               randconfig-r2311-20261126    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261127    gcc-12.5.0
powerpc               randconfig-1001-20261127    gcc-12.5.0
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2001-20261126    clang-24
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc               randconfig-2200-20261127    clang-24   smatch
powerpc              randconfig-r2101-20261126    gcc-14.4.0 cocci
powerpc              randconfig-r2102-20261126    gcc-8.5.0  cocci
powerpc              randconfig-r2104-20261126    gcc-14.4.0 cocci
powerpc              randconfig-r2105-20261126    gcc-8.5.0  cocci
powerpc              randconfig-r2109-20261126    gcc-10.5.0 cocci
powerpc              randconfig-r2300-20261126    gcc-10.5.0 sparse
powerpc              randconfig-r2304-20261126    gcc-16.2.0 sparse
powerpc              randconfig-r2305-20261126    gcc-10.5.0 sparse
powerpc              randconfig-r2307-20261126    clang-22   sparse
powerpc              randconfig-r2311-20261126    gcc-9.5.0  sparse
powerpc64             randconfig-1000-20261127    gcc-12.5.0
powerpc64             randconfig-1001-20261127    gcc-12.5.0
powerpc64             randconfig-2000-20261126    clang-24
powerpc64             randconfig-2001-20261126    clang-24
powerpc64             randconfig-2002-20261126    clang-24
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2102-20261126    gcc-14.4.0 cocci
powerpc64            randconfig-r2108-20261126    clang-24   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261127    gcc-12.5.0
riscv                 randconfig-1001-20261127    gcc-12.5.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2000-20261127    clang-17
riscv                 randconfig-2001-20261126    gcc-10.5.0
riscv                 randconfig-2001-20261127    clang-17
riscv                 randconfig-2002-20261126    gcc-10.5.0
riscv                 randconfig-2002-20261127    clang-17
riscv                 randconfig-2003-20261126    gcc-10.5.0
riscv                 randconfig-2003-20261127    clang-17
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2004-20261127    clang-17
riscv                 randconfig-2005-20261126    gcc-10.5.0
riscv                 randconfig-2005-20261127    clang-17
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261127    gcc-13.5.0 smatch
riscv                randconfig-r2100-20261126    gcc-8.5.0  cocci
riscv                randconfig-r2101-20261126    gcc-8.5.0  cocci
riscv                randconfig-r2101-20261127    gcc-8.5.0  cocci
riscv                randconfig-r2105-20261126    clang-22   cocci
riscv                randconfig-r2105-20261126    gcc-14.4.0 cocci
riscv                randconfig-r2106-20261126    clang-24   cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261127    gcc-12.5.0
s390                  randconfig-1001-20261127    gcc-12.5.0
s390                  randconfig-2000-20261126    clang-18
s390                  randconfig-2000-20261126    clang-24
s390                  randconfig-2000-20261127    clang-24
s390                  randconfig-2001-20261126    clang-24
s390                  randconfig-2001-20261126    gcc-8.5.0
s390                  randconfig-2001-20261127    clang-24
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2002-20261127    clang-24
s390                  randconfig-2003-20261126    clang-18
s390                  randconfig-2003-20261126    clang-24
s390                  randconfig-2003-20261127    clang-24
s390                  randconfig-2004-20261126    clang-24
s390                  randconfig-2004-20261126    gcc-10.5.0
s390                  randconfig-2004-20261127    clang-24
s390                  randconfig-2005-20261126    clang-21
s390                  randconfig-2005-20261126    clang-24
s390                  randconfig-2005-20261127    clang-24
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                  randconfig-2200-20261127    clang-18   smatch
s390                 randconfig-r2100-20261126    gcc-8.5.0  cocci
s390                 randconfig-r2102-20261126    gcc-8.5.0  cocci
s390                 randconfig-r2104-20261126    clang-17   cocci
s390                 randconfig-r2107-20261126    clang-24   cocci
s390                 randconfig-r2107-20261126    gcc-14.4.0 cocci
s390                 randconfig-r2308-20261126    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261127    gcc-12.5.0
sh                    randconfig-1001-20261127    gcc-12.5.0
sh                    randconfig-2000-20261126    gcc-9.5.0
sh                    randconfig-2000-20261127    gcc-12.5.0
sh                    randconfig-2001-20261126    gcc-9.5.0
sh                    randconfig-2001-20261127    gcc-12.5.0
sh                    randconfig-2002-20261126    gcc-9.5.0
sh                    randconfig-2002-20261127    gcc-12.5.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2003-20261127    gcc-12.5.0
sh                    randconfig-2004-20261126    gcc-9.5.0
sh                    randconfig-2004-20261127    gcc-12.5.0
sh                    randconfig-2005-20261126    gcc-9.5.0
sh                    randconfig-2005-20261127    gcc-12.5.0
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                   randconfig-r2103-20261126    gcc-8.5.0  cocci
sh                   randconfig-r2104-20261126    clang-22   cocci
sh                   randconfig-r2104-20261127    gcc-8.5.0  cocci
sh                   randconfig-r2108-20261127    gcc-11.5.0 cocci
sh                   randconfig-r2109-20261127    gcc-11.5.0 cocci
sh                   randconfig-r2308-20261126    gcc-16.2.0 sparse
sh                   randconfig-r2310-20261126    gcc-16.2.0 sparse
sh                   randconfig-r2311-20261126    gcc-16.2.0 sparse
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261127    gcc-14
sparc                 randconfig-1001-20261127    gcc-14
sparc                 randconfig-2000-20261126    gcc-8.5.0
sparc                 randconfig-2001-20261126    gcc-8.5.0
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                 randconfig-2200-20261127    gcc-12.5.0 smatch
sparc                randconfig-r2103-20261126    clang-22   cocci
sparc                randconfig-r2103-20261127    gcc-8.5.0  cocci
sparc                randconfig-r2108-20261126    gcc-11.5.0 cocci
sparc                randconfig-r2110-20261126    gcc-10.5.0 cocci
sparc                randconfig-r2309-20261126    gcc-16.2.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261127    gcc-14
sparc64               randconfig-1001-20261127    gcc-14
sparc64               randconfig-2000-20261126    gcc-8.5.0
sparc64               randconfig-2001-20261126    gcc-8.5.0
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64               randconfig-2200-20261127    clang-20   smatch
sparc64              randconfig-r2103-20261126    gcc-14.4.0 cocci
sparc64              randconfig-r2103-20261126    gcc-8.5.0  cocci
sparc64              randconfig-r2109-20261126    clang-24   cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261127    gcc-14
um                    randconfig-1001-20261127    gcc-14
um                    randconfig-2000-20261126    gcc-8.5.0
um                    randconfig-2001-20261126    gcc-8.5.0
um                    randconfig-2200-20261126    gcc-12     smatch
um                    randconfig-2200-20261127    clang-24   smatch
um                   randconfig-r2100-20261126    clang-22   cocci
um                   randconfig-r2103-20261126    gcc-14.4.0 cocci
um                   randconfig-r2105-20261127    gcc-8.5.0  cocci
um                   randconfig-r2111-20261126    gcc-11.5.0 cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261127    gcc-14
x86_64      buildonly-randconfig-1001-20261127    gcc-14
x86_64      buildonly-randconfig-1002-20261127    gcc-14
x86_64      buildonly-randconfig-1003-20261127    gcc-14
x86_64      buildonly-randconfig-1004-20261127    gcc-14
x86_64      buildonly-randconfig-1005-20261127    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261127    gcc-14
x86_64                randconfig-1001-20261127    gcc-14
x86_64                randconfig-1002-20261127    gcc-14
x86_64                randconfig-1003-20261127    gcc-14
x86_64                randconfig-1004-20261127    gcc-14
x86_64                randconfig-1005-20261127    gcc-14
x86_64                randconfig-2000-20261126    clang-22
x86_64                randconfig-2001-20261126    clang-22
x86_64                randconfig-2001-20261126    gcc-14
x86_64                randconfig-2002-20261126    clang-22
x86_64                randconfig-2003-20261126    clang-22
x86_64                randconfig-2004-20261126    clang-22
x86_64                randconfig-2005-20261126    clang-22
x86_64                randconfig-2100-20261126    gcc-14     cocci
x86_64                randconfig-2100-20261127    clang-22   cocci
x86_64                randconfig-2101-20261126    gcc-14     cocci
x86_64                randconfig-2101-20261127    clang-22   cocci
x86_64                randconfig-2102-20261126    gcc-14     cocci
x86_64                randconfig-2102-20261127    clang-22   cocci
x86_64                randconfig-2103-20261126    gcc-14     cocci
x86_64                randconfig-2103-20261127    clang-22   cocci
x86_64                randconfig-2104-20261126    gcc-14     cocci
x86_64                randconfig-2104-20261127    clang-22   cocci
x86_64                randconfig-2105-20261126    gcc-14     cocci
x86_64                randconfig-2105-20261127    clang-22   cocci
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2200-20261127    gcc-14     smatch
x86_64                randconfig-2300-20261126    gcc-14     sparse
x86_64                randconfig-2301-20261126    gcc-14     sparse
x86_64                randconfig-2302-20261126    gcc-14     sparse
x86_64               randconfig-r2100-20261126    gcc-8.5.0  cocci
x86_64               randconfig-r2101-20261126    clang-22   cocci
x86_64               randconfig-r2103-20261126    gcc-14     cocci
x86_64               randconfig-r2301-20261126    gcc-10.5.0 sparse
x86_64               randconfig-r2305-20261127    gcc-12     sparse
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
xtensa                randconfig-1000-20261127    gcc-14
xtensa                randconfig-1001-20261127    gcc-14
xtensa                randconfig-2000-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261126    gcc-15.3.0
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa                randconfig-2200-20261127    gcc-10.5.0 smatch
xtensa               randconfig-r2100-20261126    gcc-14.4.0 cocci
xtensa               randconfig-r2101-20261126    gcc-8.5.0  cocci
xtensa               randconfig-r2102-20261126    clang-22   cocci
xtensa               randconfig-r2307-20261126    gcc-16.2.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
