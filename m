Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692387;
	b=xx9+kKQG+88C5FXC43kARhzzomVXzTsEFs1JYIkN72YV+ptZqgJ8dsYYc/RFS+sD1vGO
	 s3rNCUxEDpqgtmLg8H+tozvmkJo7A6vJbgr4C6owV8ptlzOfgLpEahwFvL9loa1Ti7Jtj
	 Bmk1odIyxQLfyOx0J1CjW6GRby4rVP9N2G4xo/YPfrH1vrQd/mdnmR4bT5K5UPEkpWSvF
	 ldcLRU6Cq1XKZl4MEoNC6lQ9JdemEnPEbd5PizMm4Htpfis3pTDbDNZVJoZwgmdX8Sak3
	 ysr7gSkPpxW/2dFciHx1g+MVtwxeSJu2MzRpFIyFUv8b9C9Yk+5waoHFUHxT6e7oXGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692387;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zrAdLyJWB7ZYJXjbssS+5/CeD7hLTxmHcYYCGIcfJ+o=;
	b=GfeVNuj53sjajW/0wB9WAFnOOdH3NDJic7CAIbzMna97sCmOJdHH608JZgtUEquf+kcG
	 +RhA9SMeZAD3u5OztMnynPZmXS7sRwfu8uMvd/0afP+vVgx6083t/4yZQNbl+eg1AtK9h
	 ZtljdHnqSIA/ewARj2a4OnK1BcVL9KoC+h5qnoClCmSWqUwdHs4/02SX0PE22ivIq/QV8
	 VQfjwRxUOdj5I5Jmaf6ByPgvR4a3hLPoNGvzhKeg04LfHvVLaO6p1z8shGE3UXkyS/hOc
	 nHepZ+OCeNDbqKsXw7lpW4wkc7KzAw2ciHWZLo/4mI7yy6+ZwN9geDphxdLD9m4AVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hL3ocRoJ;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B64606A32E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 11:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B64606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hL3ocRoJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795692386; x=1827228386;
  h=date:from:to:cc:subject:message-id;
  bh=CuesZbYbxWzIlRvGELBh/DTDLrbfGSkSQcw90qt4kZI=;
  b=hL3ocRoJD7Y4sWqECELuSKKVIm2YvCPAsm2XRKAeJwu2BbeIhv44Nk+4
   hnDuXOZLIIolpcIIUAXtHAqmec/V1Fa4WV5m5ZtCZfuUTT88w9sVotKh3
   t1N4SIfU+eRTNKWXOXDKvBas58OFyMRG8izdrcf3Cnpy03JWKi9TVkeIK
   oXpJTJg+wdjTGv1aiAw/tlNYORpjAhn4wQU0F1kQCXoP9wRolYzd5OE8h
   9P1A4YjIW1L+HFAuv7k0ZUxzROm40ti+V9XEfRTKj+h7vOLPBJWn8ntsp
   CAirPwEYqzr1o0aGPE4StjnY53BqcuLqm5ogQiiO5cKOdIM3LybR/ez6e
   A==;
X-CSE-ConnectionGUID: nunG+0v4SqKmrCKzJTOOsQ==
X-CSE-MsgGUID: PMaIUQK0RfW9RCJh2XzLkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4501333"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4501333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 03:26:25 -0800
X-CSE-ConnectionGUID: lqfmykIeRryx6tErSK6VRA==
X-CSE-MsgGUID: BdA/fBXoRJ233Gfn9UuxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12639267"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 03:26:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWXcK-00000001Twu-40Pi;
	Thu, 26 Nov 2026 11:26:20 +0000
Date: Thu, 26 Nov 2026 19:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 f5239d07f7c1d8685f6fef15064d62239075f1e3
Message-ID: <20261126192531.ZOsVvTWF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: f5239d07f7c1d8685f6fef15064d62239075f1e3  pinctrl: amd: Steer GPIO interrupt to low power/efficiency cores

elapsed time: 980m

configs tested: 604
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261125    gcc-8.5.0
alpha                 randconfig-2000-20261126    gcc-13.5.0
alpha                 randconfig-2001-20261125    gcc-8.5.0
alpha                 randconfig-2001-20261126    gcc-13.5.0
alpha                 randconfig-2200-20261125    gcc-10.5.0 smatch
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                randconfig-r2100-20261126    gcc-10.5.0 cocci
alpha                randconfig-r2107-20261126    gcc-14     cocci
alpha                randconfig-r2110-20261126    clang-24   cocci
alpha                randconfig-r2111-20261126    gcc-14.4.0 cocci
alpha                randconfig-r2301-20261125    gcc-11.5.0 sparse
alpha                randconfig-r2309-20261125    gcc-8.5.0  sparse
alpha                randconfig-r2311-20261125    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    gcc-16.2.0
arc                         nsim_700_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261126    gcc-16.2.0
arc                   randconfig-1001-20261126    gcc-16.2.0
arc                   randconfig-2000-20261125    gcc-10.5.0
arc                   randconfig-2000-20261126    gcc-9.5.0
arc                   randconfig-2001-20261125    gcc-10.5.0
arc                   randconfig-2001-20261126    gcc-9.5.0
arc                   randconfig-2002-20261125    gcc-10.5.0
arc                   randconfig-2002-20261126    gcc-9.5.0
arc                   randconfig-2003-20261125    gcc-10.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261125    gcc-10.5.0
arc                   randconfig-2004-20261126    gcc-9.5.0
arc                   randconfig-2005-20261125    gcc-10.5.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261125    gcc-14.4.0 smatch
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                  randconfig-r2103-20261125    gcc-11.5.0 cocci
arc                  randconfig-r2106-20261126    gcc-14     cocci
arc                  randconfig-r2106-20261126    gcc-14.4.0 cocci
arc                  randconfig-r2108-20261126    gcc-14     cocci
arc                  randconfig-r2303-20261126    gcc-14.4.0 sparse
arc                  randconfig-r2304-20261125    gcc-11.5.0 sparse
arc                  randconfig-r2306-20261126    clang-18   sparse
arc                  randconfig-r2308-20261126    gcc-8.5.0  sparse
arc                  randconfig-r2309-20261126    gcc-12.5.0 sparse
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                             mmp2_defconfig    clang-24
arm                            omap1_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261126    gcc-16.2.0
arm                   randconfig-1001-20261126    gcc-16.2.0
arm                   randconfig-1002-20261126    gcc-16.2.0
arm                   randconfig-1003-20261126    gcc-16.2.0
arm                   randconfig-2000-20261125    clang-22
arm                   randconfig-2000-20261126    gcc-11.5.0
arm                   randconfig-2001-20261125    clang-22
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2002-20261125    clang-22
arm                   randconfig-2002-20261126    gcc-11.5.0
arm                   randconfig-2200-20261125    clang-21   smatch
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                  randconfig-r2101-20261126    clang-24   cocci
arm                  randconfig-r2105-20261125    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261126    clang-24   cocci
arm                  randconfig-r2107-20261125    gcc-9.5.0  cocci
arm                  randconfig-r2304-20261126    clang-22   sparse
arm                  randconfig-r2306-20261125    gcc-8.5.0  sparse
arm                  randconfig-r2311-20261126    clang-18   sparse
arm                          s3c6400_defconfig    gcc-16.2.0
arm                         spear6xx_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             alldefconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261126    gcc-8.5.0
arm64                 randconfig-1001-20261126    gcc-8.5.0
arm64                 randconfig-1002-20261126    gcc-8.5.0
arm64                 randconfig-1003-20261126    gcc-8.5.0
arm64                 randconfig-2000-20261125    clang-22
arm64                 randconfig-2000-20261126    gcc-11.5.0
arm64                 randconfig-2001-20261125    clang-22
arm64                 randconfig-2001-20261126    gcc-11.5.0
arm64                 randconfig-2002-20261125    clang-22
arm64                 randconfig-2002-20261126    gcc-11.5.0
arm64                 randconfig-2200-20261125    gcc-13.5.0 smatch
arm64                 randconfig-2200-20261126    clang-24   smatch
arm64                randconfig-r2103-20261126    clang-24   cocci
arm64                randconfig-r2104-20261125    gcc-8.5.0  cocci
arm64                randconfig-r2109-20261126    gcc-14.4.0 cocci
arm64                randconfig-r2301-20261126    clang-22   sparse
arm64                randconfig-r2302-20261126    clang-22   sparse
arm64                randconfig-r2310-20261126    clang-18   sparse
arm64                randconfig-r2311-20261126    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261126    gcc-8.5.0
csky                  randconfig-1001-20261126    gcc-8.5.0
csky                  randconfig-2000-20261125    gcc-14.4.0
csky                  randconfig-2000-20261126    gcc-13.5.0
csky                  randconfig-2001-20261125    gcc-14.4.0
csky                  randconfig-2001-20261126    gcc-13.5.0
csky                  randconfig-2200-20261125    gcc-16.2.0 smatch
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
csky                 randconfig-r2102-20261126    clang-24   cocci
csky                 randconfig-r2103-20261126    clang-18   cocci
csky                 randconfig-r2103-20261126    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261125    gcc-11.5.0 cocci
csky                 randconfig-r2108-20261125    gcc-9.5.0  cocci
csky                 randconfig-r2305-20261125    gcc-12     sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261126    gcc-11.5.0
hexagon               randconfig-1001-20261126    gcc-11.5.0
hexagon               randconfig-2000-20261125    gcc-14.4.0
hexagon               randconfig-2000-20261126    gcc-13.5.0
hexagon               randconfig-2001-20261125    gcc-14.4.0
hexagon               randconfig-2001-20261126    gcc-13.5.0
hexagon               randconfig-2200-20261125    clang-17   smatch
hexagon               randconfig-2200-20261126    clang-17   smatch
hexagon              randconfig-r2103-20261126    gcc-10.5.0 cocci
hexagon              randconfig-r2104-20261126    gcc-8.5.0  cocci
hexagon              randconfig-r2109-20261126    clang-24   cocci
hexagon              randconfig-r2302-20261126    gcc-11.5.0 sparse
hexagon              randconfig-r2307-20261126    gcc-12.5.0 sparse
hexagon              randconfig-r2309-20261126    clang-18   sparse
hexagon              randconfig-r2309-20261126    gcc-8.5.0  sparse
hexagon              randconfig-r2311-20261126    clang-24   sparse
hexagon              randconfig-r2311-20261126    gcc-10.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261126    gcc-14
i386        buildonly-randconfig-1001-20261126    gcc-14
i386        buildonly-randconfig-1002-20261126    gcc-14
i386        buildonly-randconfig-1003-20261126    gcc-14
i386        buildonly-randconfig-1004-20261126    gcc-14
i386        buildonly-randconfig-1005-20261126    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261126    clang-22
i386                  randconfig-1001-20261126    clang-22
i386                  randconfig-1002-20261126    clang-22
i386                  randconfig-1003-20261126    clang-22
i386                  randconfig-1004-20261126    clang-22
i386                  randconfig-1005-20261126    clang-22
i386                  randconfig-1006-20261126    clang-22
i386                  randconfig-2000-20261125    gcc-14
i386                  randconfig-2000-20261126    clang-22
i386                  randconfig-2001-20261125    gcc-14
i386                  randconfig-2001-20261126    clang-22
i386                  randconfig-2002-20261125    gcc-14
i386                  randconfig-2002-20261126    clang-22
i386                  randconfig-2003-20261125    gcc-14
i386                  randconfig-2003-20261126    clang-22
i386                  randconfig-2004-20261125    gcc-14
i386                  randconfig-2004-20261126    clang-22
i386                  randconfig-2005-20261125    gcc-14
i386                  randconfig-2005-20261126    clang-22
i386                  randconfig-2100-20261125    clang-22   cocci
i386                  randconfig-2100-20261126    clang-22   cocci
i386                  randconfig-2101-20261125    clang-22   cocci
i386                  randconfig-2101-20261126    clang-22   cocci
i386                  randconfig-2102-20261125    clang-22   cocci
i386                  randconfig-2102-20261126    clang-22   cocci
i386                  randconfig-2103-20261125    clang-22   cocci
i386                  randconfig-2103-20261126    clang-22   cocci
i386                  randconfig-2104-20261125    clang-22   cocci
i386                  randconfig-2104-20261126    clang-22   cocci
i386                  randconfig-2105-20261125    clang-22   cocci
i386                  randconfig-2105-20261126    clang-22   cocci
i386                  randconfig-2200-20261125    clang-22   smatch
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2300-20261125    clang-22   sparse
i386                  randconfig-2300-20261126    gcc-14     sparse
i386                  randconfig-2301-20261125    clang-22   sparse
i386                  randconfig-2301-20261126    gcc-14     sparse
i386                  randconfig-2302-20261125    clang-22   sparse
i386                  randconfig-2302-20261126    gcc-14     sparse
i386                 randconfig-r2102-20261125    gcc-11.5.0 cocci
i386                 randconfig-r2106-20261125    gcc-14     cocci
i386                 randconfig-r2109-20261126    clang-22   cocci
i386                 randconfig-r2110-20261126    gcc-14     cocci
i386                 randconfig-r2111-20261126    clang-24   cocci
i386                 randconfig-r2301-20261125    gcc-12     sparse
i386                 randconfig-r2303-20261125    gcc-12     sparse
i386                 randconfig-r2304-20261125    gcc-12     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261126    gcc-11.5.0
loongarch             randconfig-1001-20261126    gcc-11.5.0
loongarch             randconfig-2000-20261125    clang-19
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2001-20261125    clang-19
loongarch             randconfig-2001-20261126    gcc-12.5.0
loongarch             randconfig-2200-20261125    clang-18   smatch
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2101-20261126    clang-24   cocci
loongarch            randconfig-r2102-20261126    clang-24   cocci
loongarch            randconfig-r2106-20261125    gcc-9.5.0  cocci
loongarch            randconfig-r2300-20261126    clang-22   sparse
loongarch            randconfig-r2307-20261126    gcc-10.5.0 sparse
m68k                              alldefconfig    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261125    gcc-8.5.0
m68k                  randconfig-2000-20261126    gcc-13.5.0
m68k                  randconfig-2001-20261125    gcc-8.5.0
m68k                  randconfig-2001-20261126    gcc-13.5.0
m68k                  randconfig-2200-20261125    gcc-15.3.0 smatch
m68k                 randconfig-r2101-20261125    gcc-11.5.0 cocci
m68k                 randconfig-r2104-20261126    gcc-10.5.0 cocci
m68k                 randconfig-r2109-20261126    clang-24   cocci
m68k                 randconfig-r2110-20261126    gcc-14.4.0 cocci
m68k                 randconfig-r2309-20261126    clang-18   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261125    gcc-8.5.0
microblaze            randconfig-2000-20261126    gcc-13.5.0
microblaze            randconfig-2001-20261125    gcc-8.5.0
microblaze            randconfig-2001-20261126    gcc-13.5.0
microblaze            randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze           randconfig-r2100-20261126    clang-24   cocci
microblaze           randconfig-r2107-20261126    clang-24   cocci
microblaze           randconfig-r2109-20261125    gcc-9.5.0  cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    clang-24
mips                       loongson3_defconfig    clang-24
mips                         maltaup_defconfig    clang-20
mips                         omega2p_defconfig    clang-24
mips                  randconfig-2000-20261125    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-16.2.0
mips                  randconfig-2001-20261125    gcc-16.2.0
mips                  randconfig-2001-20261126    gcc-16.2.0
mips                  randconfig-2002-20261125    gcc-16.2.0
mips                  randconfig-2002-20261126    gcc-16.2.0
mips                  randconfig-2200-20261125    clang-24   smatch
mips                  randconfig-2200-20261126    gcc-15.3.0 smatch
mips                 randconfig-r2106-20261126    clang-24   cocci
mips                 randconfig-r2108-20261126    clang-24   cocci
mips                 randconfig-r2109-20261125    gcc-14     cocci
mips                 randconfig-r2109-20261126    clang-24   cocci
mips                 randconfig-r2110-20261125    gcc-9.5.0  cocci
mips                 randconfig-r2300-20261125    gcc-12     sparse
mips                    sb1250_swarm_defconfig    clang-20
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261126    gcc-11.5.0
nios2                 randconfig-1001-20261126    gcc-11.5.0
nios2                 randconfig-2000-20261125    clang-19
nios2                 randconfig-2000-20261126    gcc-12.5.0
nios2                 randconfig-2001-20261125    clang-19
nios2                 randconfig-2001-20261126    gcc-12.5.0
nios2                 randconfig-2200-20261125    gcc-8.5.0  smatch
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                randconfig-r2100-20261125    gcc-8.5.0  cocci
nios2                randconfig-r2104-20261126    clang-18   cocci
nios2                randconfig-r2106-20261126    clang-24   cocci
nios2                randconfig-r2108-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2111-20261126    clang-22   cocci
nios2                randconfig-r2300-20261125    gcc-11.5.0 sparse
nios2                randconfig-r2300-20261126    gcc-11.5.0 sparse
nios2                randconfig-r2307-20261126    clang-18   sparse
nios2                randconfig-r2310-20261126    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261125    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261125    gcc-16.2.0
openrisc              randconfig-2001-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261125    gcc-16.2.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc             randconfig-r2102-20261125    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261126    gcc-10.5.0 cocci
openrisc             randconfig-r2304-20261126    gcc-14.4.0 sparse
openrisc             randconfig-r2305-20261126    gcc-11.5.0 sparse
openrisc             randconfig-r2306-20261126    clang-18   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261126    gcc-13.5.0
parisc                randconfig-1001-20261126    gcc-13.5.0
parisc                randconfig-2000-20261125    clang-19
parisc                randconfig-2000-20261126    gcc-12.5.0
parisc                randconfig-2001-20261125    clang-19
parisc                randconfig-2001-20261126    gcc-12.5.0
parisc                randconfig-2200-20261125    gcc-12.5.0 smatch
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2107-20261125    gcc-14     cocci
parisc               randconfig-r2111-20261126    clang-24   cocci
parisc               randconfig-r2111-20261126    gcc-14     cocci
parisc               randconfig-r2306-20261126    gcc-12.5.0 sparse
parisc               randconfig-r2307-20261126    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261126    clang-24   sparse
parisc               randconfig-r2310-20261126    gcc-12.5.0 sparse
parisc               randconfig-r2310-20261126    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                       chrp32_defconfig    clang-24
powerpc                    currituck_defconfig    gcc-16.2.0
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    clang-20
powerpc                    motionpro_defconfig    gcc-16.2.0
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261126    gcc-13.5.0
powerpc               randconfig-1001-20261126    gcc-13.5.0
powerpc               randconfig-2000-20261125    gcc-9.5.0
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2001-20261125    gcc-9.5.0
powerpc               randconfig-2001-20261126    clang-24
powerpc               randconfig-2002-20261125    gcc-9.5.0
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc              randconfig-r2100-20261125    gcc-11.5.0 cocci
powerpc              randconfig-r2110-20261126    clang-24   cocci
powerpc              randconfig-r2111-20261125    gcc-14     cocci
powerpc              randconfig-r2302-20261126    gcc-14.4.0 sparse
powerpc              randconfig-r2303-20261126    clang-22   sparse
powerpc              randconfig-r2305-20261126    clang-22   sparse
powerpc              randconfig-r2306-20261126    gcc-8.5.0  sparse
powerpc              randconfig-r2308-20261126    gcc-10.5.0 sparse
powerpc              randconfig-r2310-20261125    gcc-8.5.0  sparse
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc                      tqm5200_defconfig    clang-20
powerpc                       tqm8xx_defconfig    clang-20
powerpc                          wii_defconfig    gcc-16.2.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261126    gcc-13.5.0
powerpc64             randconfig-1001-20261126    gcc-13.5.0
powerpc64             randconfig-2000-20261125    gcc-9.5.0
powerpc64             randconfig-2000-20261126    clang-24
powerpc64             randconfig-2001-20261125    gcc-9.5.0
powerpc64             randconfig-2001-20261126    clang-24
powerpc64             randconfig-2002-20261125    gcc-9.5.0
powerpc64             randconfig-2002-20261126    clang-24
powerpc64             randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2101-20261126    clang-18   cocci
powerpc64            randconfig-r2104-20261126    clang-24   cocci
powerpc64            randconfig-r2108-20261125    gcc-14     cocci
powerpc64            randconfig-r2306-20261126    clang-24   sparse
powerpc64            randconfig-r2308-20261126    clang-18   sparse
powerpc64            randconfig-r2309-20261126    gcc-10.5.0 sparse
powerpc64            randconfig-r2311-20261126    clang-18   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_virt_defconfig    gcc-16.2.0
riscv                 randconfig-1001-20261126    clang-20
riscv                 randconfig-2000-20261125    gcc-13.5.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2001-20261125    gcc-13.5.0
riscv                 randconfig-2001-20261126    gcc-10.5.0
riscv                 randconfig-2002-20261125    gcc-13.5.0
riscv                 randconfig-2002-20261126    gcc-10.5.0
riscv                 randconfig-2003-20261125    gcc-13.5.0
riscv                 randconfig-2003-20261126    gcc-10.5.0
riscv                 randconfig-2004-20261125    gcc-13.5.0
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2005-20261125    gcc-13.5.0
riscv                 randconfig-2005-20261126    gcc-10.5.0
riscv                 randconfig-2200-20261125    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                randconfig-r2102-20261126    gcc-10.5.0 cocci
riscv                randconfig-r2103-20261125    gcc-8.5.0  cocci
riscv                randconfig-r2107-20261126    clang-22   cocci
riscv                randconfig-r2107-20261126    clang-24   cocci
riscv                randconfig-r2110-20261125    gcc-14     cocci
riscv                randconfig-r2302-20261125    gcc-12     sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261126    clang-20
s390                  randconfig-1001-20261126    clang-20
s390                  randconfig-2000-20261125    clang-24
s390                  randconfig-2000-20261126    clang-24
s390                  randconfig-2001-20261125    clang-24
s390                  randconfig-2001-20261126    clang-24
s390                  randconfig-2002-20261125    clang-24
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2003-20261125    clang-24
s390                  randconfig-2003-20261126    clang-24
s390                  randconfig-2004-20261125    clang-24
s390                  randconfig-2004-20261126    clang-24
s390                  randconfig-2005-20261125    clang-24
s390                  randconfig-2005-20261126    clang-24
s390                  randconfig-2200-20261125    gcc-15.3.0 smatch
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                 randconfig-r2102-20261126    gcc-8.5.0  cocci
s390                 randconfig-r2105-20261126    clang-24   cocci
s390                 randconfig-r2107-20261126    gcc-14.4.0 cocci
s390                 randconfig-r2300-20261126    gcc-14.4.0 sparse
s390                 randconfig-r2301-20261126    gcc-14.4.0 sparse
s390                 randconfig-r2303-20261125    gcc-11.5.0 sparse
s390                 randconfig-r2305-20261125    gcc-11.5.0 sparse
s390                 randconfig-r2310-20261126    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    clang-20
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261126    clang-20
sh                    randconfig-1001-20261126    clang-20
sh                    randconfig-2000-20261125    gcc-14.4.0
sh                    randconfig-2000-20261126    gcc-9.5.0
sh                    randconfig-2001-20261125    gcc-14.4.0
sh                    randconfig-2001-20261126    gcc-9.5.0
sh                    randconfig-2002-20261125    gcc-14.4.0
sh                    randconfig-2002-20261126    gcc-9.5.0
sh                    randconfig-2003-20261125    gcc-14.4.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2004-20261125    gcc-14.4.0
sh                    randconfig-2004-20261126    gcc-9.5.0
sh                    randconfig-2005-20261125    gcc-14.4.0
sh                    randconfig-2005-20261126    gcc-9.5.0
sh                    randconfig-2200-20261125    gcc-14.4.0 smatch
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                   randconfig-r2104-20261125    gcc-11.5.0 cocci
sh                    rts7751r2dplus_defconfig    clang-20
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    clang-24
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261126    clang-17
sparc                 randconfig-1001-20261126    clang-17
sparc                 randconfig-2000-20261125    gcc-8.5.0
sparc                 randconfig-2000-20261126    gcc-8.5.0
sparc                 randconfig-2001-20261125    gcc-8.5.0
sparc                 randconfig-2001-20261126    gcc-8.5.0
sparc                 randconfig-2200-20261125    gcc-14.4.0 smatch
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                randconfig-r2101-20261126    gcc-10.5.0 cocci
sparc                randconfig-r2101-20261126    gcc-8.5.0  cocci
sparc                randconfig-r2102-20261126    clang-18   cocci
sparc                randconfig-r2108-20261126    clang-24   cocci
sparc                randconfig-r2110-20261126    clang-22   cocci
sparc                randconfig-r2111-20261125    gcc-9.5.0  cocci
sparc                randconfig-r2307-20261126    clang-18   sparse
sparc                randconfig-r2308-20261125    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261126    clang-17
sparc64               randconfig-1001-20261126    clang-17
sparc64               randconfig-2000-20261125    gcc-8.5.0
sparc64               randconfig-2000-20261126    gcc-8.5.0
sparc64               randconfig-2001-20261125    gcc-8.5.0
sparc64               randconfig-2001-20261126    gcc-8.5.0
sparc64               randconfig-2200-20261125    gcc-15.3.0 smatch
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64              randconfig-r2108-20261126    clang-24   cocci
sparc64              randconfig-r2304-20261126    gcc-11.5.0 sparse
sparc64              randconfig-r2305-20261126    gcc-14.4.0 sparse
sparc64              randconfig-r2307-20261126    clang-24   sparse
sparc64              randconfig-r2309-20261126    clang-24   sparse
sparc64              randconfig-r2310-20261126    clang-18   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261126    clang-17
um                    randconfig-1001-20261126    clang-17
um                    randconfig-2000-20261125    gcc-8.5.0
um                    randconfig-2000-20261126    gcc-8.5.0
um                    randconfig-2001-20261125    gcc-8.5.0
um                    randconfig-2001-20261126    gcc-8.5.0
um                    randconfig-2200-20261125    clang-17   smatch
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2100-20261126    clang-24   cocci
um                   randconfig-r2105-20261126    clang-18   cocci
um                   randconfig-r2105-20261126    clang-24   cocci
um                   randconfig-r2109-20261126    gcc-14     cocci
um                   randconfig-r2301-20261126    gcc-11.5.0 sparse
um                   randconfig-r2302-20261125    gcc-11.5.0 sparse
um                   randconfig-r2308-20261126    gcc-12.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-20
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261126    clang-22
x86_64      buildonly-randconfig-1001-20261126    clang-22
x86_64      buildonly-randconfig-1002-20261126    clang-22
x86_64      buildonly-randconfig-1003-20261126    clang-22
x86_64      buildonly-randconfig-1004-20261126    clang-22
x86_64      buildonly-randconfig-1005-20261126    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261126    clang-22
x86_64                randconfig-1001-20261126    clang-22
x86_64                randconfig-1002-20261126    clang-22
x86_64                randconfig-1003-20261126    clang-22
x86_64                randconfig-1004-20261126    clang-22
x86_64                randconfig-1005-20261126    clang-22
x86_64                randconfig-2000-20261125    gcc-14
x86_64                randconfig-2000-20261126    clang-22
x86_64                randconfig-2001-20261125    gcc-14
x86_64                randconfig-2001-20261126    clang-22
x86_64                randconfig-2002-20261125    gcc-14
x86_64                randconfig-2002-20261126    clang-22
x86_64                randconfig-2003-20261125    gcc-14
x86_64                randconfig-2003-20261126    clang-22
x86_64                randconfig-2004-20261125    gcc-14
x86_64                randconfig-2004-20261126    clang-22
x86_64                randconfig-2005-20261125    gcc-14
x86_64                randconfig-2005-20261126    clang-22
x86_64                randconfig-2100-20261125    clang-22   cocci
x86_64                randconfig-2100-20261126    gcc-14     cocci
x86_64                randconfig-2101-20261125    clang-22   cocci
x86_64                randconfig-2101-20261126    gcc-14     cocci
x86_64                randconfig-2102-20261125    clang-22   cocci
x86_64                randconfig-2102-20261126    gcc-14     cocci
x86_64                randconfig-2103-20261125    clang-22   cocci
x86_64                randconfig-2103-20261126    gcc-14     cocci
x86_64                randconfig-2104-20261125    clang-22   cocci
x86_64                randconfig-2104-20261126    gcc-14     cocci
x86_64                randconfig-2105-20261125    clang-22   cocci
x86_64                randconfig-2105-20261126    gcc-14     cocci
x86_64                randconfig-2200-20261125    gcc-14     smatch
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2300-20261125    clang-22   sparse
x86_64                randconfig-2300-20261126    gcc-14     sparse
x86_64                randconfig-2301-20261125    clang-22   sparse
x86_64                randconfig-2301-20261126    gcc-14     sparse
x86_64                randconfig-2302-20261125    clang-22   sparse
x86_64                randconfig-2302-20261126    gcc-14     sparse
x86_64               randconfig-r2100-20261126    gcc-8.5.0  cocci
x86_64               randconfig-r2105-20261126    gcc-8.5.0  cocci
x86_64               randconfig-r2106-20261126    clang-22   cocci
x86_64               randconfig-r2108-20261126    clang-22   cocci
x86_64               randconfig-r2303-20261126    gcc-11.5.0 sparse
x86_64               randconfig-r2307-20261125    gcc-8.5.0  sparse
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
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261126    clang-17
xtensa                randconfig-1001-20261126    clang-17
xtensa                randconfig-2000-20261125    gcc-14.4.0
xtensa                randconfig-2000-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261125    gcc-14.4.0
xtensa                randconfig-2001-20261126    gcc-13.5.0
xtensa                randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261126    clang-18   cocci
xtensa               randconfig-r2101-20261125    gcc-8.5.0  cocci
xtensa               randconfig-r2107-20261126    clang-24   cocci
xtensa               randconfig-r2111-20261126    clang-24   cocci
xtensa               randconfig-r2306-20261126    gcc-10.5.0 sparse
xtensa               randconfig-r2311-20261126    gcc-12.5.0 sparse
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
