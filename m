Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477054;
	b=eotq81X2SgG/cjBjQL9b0LmkPgGWIQ4cHhdPuvb/woSmRVeBFipYIaEZN0mCJqe1cln1
	 auO/4Dka0CZePp5aQHFf6y3M12vEGptgg28apReS+/2aVwbFYnOie1b9utWzjzl03TLjS
	 /LBMLKgz9UBbDYxvvpvLthWys6tD/R9KcWcrt36KwPsoBAnKni5pR6jhm85K7J6yPcKxE
	 dh5hQk57PrjSBS0e45I5Q5kzAzKBqbFh53mhyMzNb+YYH350Va/KWgfnbsSegMOWX8nTS
	 wRCTbfycklP3kxQdMESy822DSYtzNci1uC2MfQFOGb0ChIW5PZr8rX/yfohg79GctCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477054;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=t91NE4m4j/SyHOqKCbeb+mT12WxVSVt7cIDPnHTab38=;
	b=YN/TsBNQ/2J62DsCrvYvRAorOKPMwh1Q20VXl86MCOBfxOhNTexeTOiLpCBR1hg4zMaK
	 bWz/j33ArJZ3o44cKUzdkLDJCbqLNHC8nlF2OORGxjzRHVxGXFWqKFeFYU8qxOtpxG+Gy
	 QyTuFWbWbqa2Y9hSrlrsWBb0T2dN8rLGohFOSEpD7Nex8mabWsDyn0Ohn6xoZSq3jqJmK
	 M4ctPUacxO/dDMXxzkE0Fa7zPI0nqHGU+1zR9eLkmGlnO89q96zSRgV11sN/Nze1S9KXH
	 qdsi5qs4SbZsZnHzIdAtjpYfrnkKteowQHH49b3JCJJM7APPX0C/wVx/uxbZJ9bo6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="N/sGeZmm";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66142606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 20:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66142606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N/sGeZmm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793477052; x=1825013052;
  h=date:from:to:cc:subject:message-id;
  bh=LLuXJ5tdi7aF+0IWkXQYIK+cy07M4fCI7O5Xt9oCEq0=;
  b=N/sGeZmmj3I+5hstnjo2seVRXkuf2uVqbP0+LK0/bXFSQxfbfJZwn+Gg
   /gf2GZ8UCbcLW/ryL2PtP0p4xfXHFc1QFQrJpogiS31awKwlq1iVay6JT
   9o0t++iJREZRt05SdjC3WmK+lngSsDrNLiWTL3d+qGEF/NFHN1uKjvTmd
   fVWxy6vNuMfaLbDbfQkF5s6kUeoLPGV6NyVthPx3ybzf1+xK/la/UH8lF
   QTlQyISHzZDahtav9XjOjjMTT21pyApViDXUXD/Ei5hBXGsmMLsl6GZHh
   FuQ+jsdfgMK/IpFPdvcu1bNrPJg17L2isf+5zByrVx11bjeGrlONSV0Pp
   Q==;
X-CSE-ConnectionGUID: lurrMba5TZWlSbh/YvG4AA==
X-CSE-MsgGUID: oxORdq7wSmeOriirMGgvBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2111273"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2111273"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 13:04:11 -0700
X-CSE-ConnectionGUID: kHJ8FYEOQvaapsg1o2bVpg==
X-CSE-MsgGUID: JjSQbu4rSbC0LdFr015GZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5610751"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2026 13:04:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNFJ9-00000000d8U-2iWU;
	Sat, 31 Oct 2026 20:04:07 +0000
Date: Sun, 01 Nov 2026 04:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 963ed0d562cf29c7ff1f430d163392dc44e338be
Message-ID: <202611010402.RILxGH05-lkp@intel.com>
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
branch HEAD: 963ed0d562cf29c7ff1f430d163392dc44e338be  gpio: rcar: Convert to gpiochip_generic_{request,free}()

elapsed time: 2520m

configs tested: 185
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261031    gcc-9.5.0
arc                   randconfig-1001-20261031    gcc-9.5.0
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    clang-17
arm                   randconfig-1000-20261031    gcc-9.5.0
arm                   randconfig-1001-20261031    gcc-9.5.0
arm                   randconfig-1002-20261031    gcc-9.5.0
arm                   randconfig-1003-20261031    gcc-9.5.0
arm                              rpc_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261031    clang-24
arm64                 randconfig-1001-20261031    clang-24
arm64                 randconfig-1002-20261031    clang-24
arm64                 randconfig-1003-20261031    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261031    clang-24
csky                  randconfig-1001-20261031    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261031    gcc-11.5.0
hexagon               randconfig-1001-20261031    gcc-11.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261031    clang-22
i386        buildonly-randconfig-1001-20261031    clang-22
i386        buildonly-randconfig-1002-20261031    clang-22
i386        buildonly-randconfig-1003-20261031    clang-22
i386        buildonly-randconfig-1004-20261031    clang-22
i386        buildonly-randconfig-1005-20261031    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261031    clang-22
i386                  randconfig-1001-20261031    clang-22
i386                  randconfig-1002-20261031    clang-22
i386                  randconfig-1003-20261031    clang-22
i386                  randconfig-1004-20261031    clang-22
i386                  randconfig-1005-20261031    clang-22
i386                  randconfig-1006-20261031    clang-22
i386                  randconfig-1007-20261031    gcc-14
i386                  randconfig-1008-20261031    gcc-14
i386                  randconfig-1009-20261031    gcc-14
i386                  randconfig-1010-20261031    gcc-14
i386                  randconfig-1011-20261031    gcc-14
i386                  randconfig-1012-20261031    gcc-14
i386                  randconfig-1013-20261031    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261031    gcc-11.5.0
loongarch             randconfig-1001-20261031    gcc-11.5.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                         m5307c3_defconfig    clang-17
m68k                       m54418evb_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261031    gcc-11.5.0
nios2                 randconfig-1001-20261031    gcc-11.5.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261031    gcc-13.5.0
parisc                randconfig-1001-20261031    gcc-13.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                        holly_defconfig    clang-17
powerpc                       pcm030_defconfig    clang-17
powerpc               randconfig-1000-20261031    gcc-13.5.0
powerpc               randconfig-1001-20261031    gcc-13.5.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261031    gcc-13.5.0
powerpc64             randconfig-1001-20261031    gcc-13.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261031    gcc-8.5.0
riscv                 randconfig-1001-20261031    gcc-8.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261031    gcc-8.5.0
s390                  randconfig-1001-20261031    gcc-8.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                          ecovec24_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261031    gcc-8.5.0
sh                    randconfig-1001-20261031    gcc-8.5.0
sh                           urquell_defconfig    clang-17
sh                           urquell_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261031    gcc-11.5.0
sparc                 randconfig-1001-20261031    gcc-11.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261031    gcc-11.5.0
sparc64               randconfig-1001-20261031    gcc-11.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261031    gcc-11.5.0
um                    randconfig-1001-20261031    gcc-11.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261031    clang-22
x86_64      buildonly-randconfig-1001-20261031    clang-22
x86_64      buildonly-randconfig-1002-20261031    clang-22
x86_64      buildonly-randconfig-1003-20261031    clang-22
x86_64      buildonly-randconfig-1004-20261031    clang-22
x86_64      buildonly-randconfig-1005-20261031    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261031    gcc-14
x86_64                randconfig-1001-20261031    gcc-14
x86_64                randconfig-1002-20261031    gcc-14
x86_64                randconfig-1003-20261031    gcc-14
x86_64                randconfig-1004-20261031    gcc-14
x86_64                randconfig-1005-20261031    gcc-14
x86_64                randconfig-1006-20261031    clang-22
x86_64                randconfig-1007-20261031    clang-22
x86_64                randconfig-1008-20261031    clang-22
x86_64                randconfig-1009-20261031    clang-22
x86_64                randconfig-1010-20261031    clang-22
x86_64                randconfig-1011-20261031    clang-22
x86_64                randconfig-1012-20261031    gcc-14
x86_64                randconfig-1013-20261031    gcc-14
x86_64                randconfig-1014-20261031    gcc-14
x86_64                randconfig-1015-20261031    gcc-14
x86_64                randconfig-1016-20261031    gcc-14
x86_64                randconfig-1017-20261031    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261031    gcc-11.5.0
xtensa                randconfig-1001-20261031    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
