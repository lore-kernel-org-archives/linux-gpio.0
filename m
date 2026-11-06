Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963478;
	b=eTPDVryzoE+DJYG0eEJtWjd4woZOpBjzy38/fUZzI+EPJ1wp1oXDCuTa66xMpsbhsi7C
	 72ogWEseYB/Y+MOx8mYG42cJoPEqIjottni6moLwMnQZaTIwzaXxwHlIvZPPzRcPkBToz
	 xk02H3GdAVcyVJ8/3UvrAGpqTov9bNhlmYYimh/9H2IahuDFrUqEQszX68NEA0d7zQ3Yh
	 5f3tsvoRbqlmEXZzv/ixq+b528GNEINAXlSXoWLIPTAPzVFVJ8SRpme302jr/C3Gatnmi
	 qp+XY4XVm5FKSWP4b+gmk78Lwpa2Gcv/V/mptj5b+ph1PLUJWzZFbiD4wz00ThPC3zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963478;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eRlhdq2xVxT4BdoZUqOImr8XLfYbIqmrbtxtHS5b5KQ=;
	b=Xf9kRM651RTShssLcDU5UDtK5Q06pTQRA+8AGw9YZ5GA/74G+tudEASI40sXL4Qxpvnk
	 6VYOea7mDwUpkx/a4BjaFk+LklBOVoDvI1e7gbYsRSDRZy5HfB3gqivWmJaoSS/S+CGXr
	 3EqHa4GqwlftzBQNsu4gYo8NxRxz083u+d35geUPoKA7QpBtVHiLaD/aznHZcbXy36aQR
	 NU6yQSdSFJ/tXqxzYctDGhLQ/5cxVcvzTDdB4nmCbSvnnbiafbNX0S6heyDcGkVn817qh
	 m1yRG9Ib4N0or98YDmpVPOW51I3BOc1T36/OOk1BX6nk2XoxjTccuuU4cQeZ6H7EerQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajjzpWIC;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A78606A329
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 11:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A78606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajjzpWIC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793963478; x=1825499478;
  h=date:from:to:cc:subject:message-id;
  bh=Blo5Zvt7t1ayNNuLTBXruyuNTEUsbKbKbvHXxj4SP8s=;
  b=ajjzpWICD8q+DgJCH6Kj6QWlpr5YpJjAHrR6SsnZfeOQF3wVWb0CkFfE
   N88rOlevQUVQCsXkO0hnLcRhlnmkxQcaXQGh0XUMEz3gdtvbHeAg6gT+M
   bNpD9lKCpKSv/0vBbeg8uiEgF6QTUeIdHHJBWNBZVQ04jvxHnybqeLFvL
   FEOZZiL5mHTBm3hADQGW/dNiYdVIJLkls4A/cIY1DL4CSHTAP68FspXC0
   4Q7lXmAVwXCkDhfAi50FNh69hGlHXjYUNlm+Ln3CNdoM+F4vkcOO3+EwD
   Z6PTdb/eKLEAdll4iHFbsgOvmdBWmsfErqTrZ7Eaas60slnSJkbLqV0eA
   A==;
X-CSE-ConnectionGUID: H0Te5F2+SXOHraaSzKyBbg==
X-CSE-MsgGUID: exCYtSRSSIWzFxi6Srzgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2778535"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2778535"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:11:17 -0800
X-CSE-ConnectionGUID: GMHfL/p8RmuiAdfBnWjQ4Q==
X-CSE-MsgGUID: mBkb+H2RTDqCbytCaiSO5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7815567"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2026 03:11:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPHqi-00000000p6o-3pHV;
	Fri, 06 Nov 2026 11:11:12 +0000
Date: Fri, 06 Nov 2026 19:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 0fa38ba784896f2fc32c9dacd33822f844b21906
Message-ID: <20261106191026.azC2BvzB-lkp@intel.com>
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
branch HEAD: 0fa38ba784896f2fc32c9dacd33822f844b21906  gpio: Unify style of various *_device_id arrays

elapsed time: 1334m

configs tested: 438
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261105    gcc-15.3.0
alpha                 randconfig-2001-20261105    gcc-15.3.0
alpha                 randconfig-2200-20261105    gcc-9.5.0  smatch
alpha                randconfig-r2101-20261105    gcc-8.5.0  cocci
alpha                randconfig-r2103-20261105    clang-22   cocci
alpha                randconfig-r2104-20261105    gcc-8.5.0  cocci
alpha                randconfig-r2108-20261105    gcc-15.3.0 cocci
alpha                randconfig-r2111-20261105    gcc-12     cocci
alpha                randconfig-r2308-20261105    gcc-10.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-19
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs103_defconfig    clang-19
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261106    gcc-8.5.0
arc                   randconfig-1001-20261106    gcc-8.5.0
arc                   randconfig-2000-20261105    gcc-8.5.0
arc                   randconfig-2001-20261105    gcc-8.5.0
arc                   randconfig-2002-20261105    gcc-8.5.0
arc                   randconfig-2003-20261105    gcc-8.5.0
arc                   randconfig-2004-20261105    gcc-8.5.0
arc                   randconfig-2005-20261105    gcc-8.5.0
arc                   randconfig-2200-20261105    gcc-8.5.0  smatch
arc                  randconfig-r2107-20261105    gcc-11.5.0 cocci
arc                  randconfig-r2109-20261105    gcc-8.5.0  cocci
arc                         vdk_hs38_defconfig    clang-17
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                          lpc32xx_defconfig    clang-17
arm                   randconfig-1000-20261106    gcc-8.5.0
arm                   randconfig-1001-20261106    gcc-8.5.0
arm                   randconfig-1002-20261106    gcc-8.5.0
arm                   randconfig-1003-20261106    gcc-8.5.0
arm                   randconfig-2000-20261105    clang-24
arm                   randconfig-2001-20261105    clang-24
arm                   randconfig-2002-20261105    clang-24
arm                   randconfig-2200-20261105    gcc-15.3.0 smatch
arm                  randconfig-r2105-20261105    gcc-8.5.0  cocci
arm                  randconfig-r2307-20261105    gcc-10.5.0 sparse
arm                  randconfig-r2309-20261105    gcc-10.5.0 sparse
arm                          s3c6400_defconfig    gcc-16.2.0
arm                        spear13xx_defconfig    gcc-16.2.0
arm                            sunxi_defconfig    clang-17
arm                            sunxi_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261106    clang-17
arm64                 randconfig-1001-20261106    clang-17
arm64                 randconfig-1002-20261106    clang-17
arm64                 randconfig-1003-20261106    clang-17
arm64                 randconfig-2000-20261105    clang-24
arm64                 randconfig-2001-20261105    clang-24
arm64                 randconfig-2002-20261105    clang-24
arm64                 randconfig-2200-20261105    clang-20   smatch
arm64                randconfig-r2101-20261105    clang-22   cocci
arm64                randconfig-r2101-20261105    gcc-8.5.0  cocci
arm64                randconfig-r2306-20261105    gcc-10.5.0 sparse
arm64                randconfig-r2308-20261105    gcc-10.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261106    clang-17
csky                  randconfig-1001-20261106    clang-17
csky                  randconfig-2000-20261105    clang-24
csky                  randconfig-2001-20261105    clang-24
csky                  randconfig-2200-20261105    gcc-9.5.0  smatch
csky                 randconfig-r2104-20261105    clang-22   cocci
csky                 randconfig-r2108-20261105    gcc-11.5.0 cocci
csky                 randconfig-r2308-20261105    clang-24   sparse
csky                 randconfig-r2311-20261105    gcc-10.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261106    gcc-14.4.0
hexagon               randconfig-1001-20261106    gcc-14.4.0
hexagon               randconfig-2000-20261105    clang-24
hexagon               randconfig-2001-20261105    clang-24
hexagon               randconfig-2200-20261105    clang-17   smatch
hexagon              randconfig-r2100-20261105    clang-22   cocci
hexagon              randconfig-r2101-20261105    clang-24   cocci
hexagon              randconfig-r2105-20261105    clang-24   cocci
hexagon              randconfig-r2107-20261105    gcc-15.3.0 cocci
hexagon              randconfig-r2109-20261105    gcc-11.5.0 cocci
hexagon              randconfig-r2300-20261105    clang-24   sparse
hexagon              randconfig-r2304-20261105    clang-24   sparse
hexagon              randconfig-r2305-20261105    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261106    clang-22
i386        buildonly-randconfig-1001-20261106    clang-22
i386        buildonly-randconfig-1002-20261106    clang-22
i386        buildonly-randconfig-1003-20261106    clang-22
i386        buildonly-randconfig-1004-20261106    clang-22
i386        buildonly-randconfig-1005-20261106    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261106    gcc-14
i386                  randconfig-1001-20261106    gcc-14
i386                  randconfig-1002-20261106    gcc-14
i386                  randconfig-1003-20261106    gcc-14
i386                  randconfig-1004-20261106    gcc-14
i386                  randconfig-1005-20261106    gcc-14
i386                  randconfig-1006-20261106    gcc-14
i386                  randconfig-1007-20261106    gcc-14
i386                  randconfig-1008-20261106    gcc-14
i386                  randconfig-1009-20261106    gcc-14
i386                  randconfig-1010-20261106    gcc-14
i386                  randconfig-1011-20261106    gcc-14
i386                  randconfig-1012-20261106    gcc-14
i386                  randconfig-1013-20261106    gcc-14
i386                  randconfig-2000-20261105    clang-22
i386                  randconfig-2001-20261105    clang-22
i386                  randconfig-2002-20261105    clang-22
i386                  randconfig-2003-20261105    clang-22
i386                  randconfig-2004-20261105    clang-22
i386                  randconfig-2005-20261105    clang-22
i386                  randconfig-2100-20261105    gcc-14     cocci
i386                  randconfig-2101-20261105    gcc-14     cocci
i386                  randconfig-2102-20261105    gcc-14     cocci
i386                  randconfig-2103-20261105    gcc-14     cocci
i386                  randconfig-2104-20261105    gcc-14     cocci
i386                  randconfig-2105-20261105    gcc-14     cocci
i386                  randconfig-2200-20261105    clang-22   smatch
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261106    gcc-14.4.0
loongarch             randconfig-1001-20261106    gcc-14.4.0
loongarch             randconfig-2000-20261105    gcc-16.2.0
loongarch             randconfig-2001-20261105    gcc-16.2.0
loongarch             randconfig-2200-20261105    gcc-16.2.0 smatch
loongarch            randconfig-r2109-20261105    gcc-11.5.0 cocci
loongarch            randconfig-r2306-20261105    clang-24   sparse
loongarch            randconfig-r2307-20261105    gcc-10.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    clang-17
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    clang-19
m68k                          nettel_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261105    gcc-15.3.0
m68k                  randconfig-2001-20261105    gcc-15.3.0
m68k                  randconfig-2200-20261105    gcc-8.5.0  smatch
m68k                 randconfig-r2106-20261105    gcc-15.3.0 cocci
m68k                 randconfig-r2108-20261105    gcc-8.5.0  cocci
m68k                 randconfig-r2110-20261105    gcc-11.5.0 cocci
m68k                 randconfig-r2309-20261105    gcc-10.5.0 sparse
m68k                 randconfig-r2310-20261105    gcc-10.5.0 sparse
m68k                 randconfig-r2311-20261105    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261105    gcc-15.3.0
microblaze            randconfig-2001-20261105    gcc-15.3.0
microblaze            randconfig-2200-20261105    gcc-9.5.0  smatch
microblaze           randconfig-r2106-20261105    gcc-12     cocci
microblaze           randconfig-r2109-20261105    gcc-12     cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    clang-17
mips                           eyeq5_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                 malta_qemu_32r6_defconfig    clang-17
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                     maltaup_xpa_defconfig    clang-19
mips                  randconfig-2000-20261105    gcc-9.5.0
mips                  randconfig-2001-20261105    gcc-9.5.0
mips                  randconfig-2002-20261105    gcc-9.5.0
mips                  randconfig-2200-20261105    gcc-11.5.0 smatch
mips                 randconfig-r2100-20261105    gcc-8.5.0  cocci
mips                 randconfig-r2106-20261105    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261105    gcc-11.5.0 cocci
mips                 randconfig-r2111-20261105    gcc-11.5.0 cocci
mips                 randconfig-r2111-20261105    gcc-8.5.0  cocci
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261106    gcc-14.4.0
nios2                 randconfig-1001-20261106    gcc-14.4.0
nios2                 randconfig-2000-20261105    gcc-16.2.0
nios2                 randconfig-2001-20261105    gcc-16.2.0
nios2                 randconfig-2200-20261105    gcc-9.5.0  smatch
nios2                randconfig-r2100-20261105    clang-24   cocci
nios2                randconfig-r2102-20261105    gcc-8.5.0  cocci
nios2                randconfig-r2107-20261105    gcc-8.5.0  cocci
nios2                randconfig-r2108-20261105    gcc-11.5.0 cocci
nios2                randconfig-r2110-20261105    gcc-11.5.0 cocci
nios2                randconfig-r2111-20261105    gcc-15.3.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    clang-19
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261105    gcc-9.5.0
openrisc              randconfig-2001-20261105    gcc-9.5.0
openrisc              randconfig-2002-20261105    gcc-9.5.0
openrisc              randconfig-2200-20261105    gcc-16.2.0 smatch
openrisc             randconfig-r2104-20261105    gcc-8.5.0  cocci
openrisc             randconfig-r2107-20261105    gcc-12     cocci
openrisc             randconfig-r2301-20261105    clang-24   sparse
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261106    clang-19
parisc                randconfig-1001-20261106    clang-19
parisc                randconfig-2000-20261105    gcc-16.2.0
parisc                randconfig-2001-20261105    gcc-16.2.0
parisc                randconfig-2200-20261105    gcc-15.3.0 smatch
parisc               randconfig-r2105-20261105    gcc-8.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      ep8248e_defconfig    clang-17
powerpc                       ep88xc_defconfig    clang-17
powerpc                     gamecube_defconfig    clang-19
powerpc                       mgcoge_defconfig    clang-17
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                   mpc885_ads_defconfig    clang-19
powerpc                       pcm030_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261106    clang-19
powerpc               randconfig-1001-20261106    clang-19
powerpc               randconfig-2000-20261105    clang-18
powerpc               randconfig-2001-20261105    clang-18
powerpc               randconfig-2002-20261105    clang-18
powerpc               randconfig-2200-20261105    clang-17   smatch
powerpc              randconfig-r2102-20261105    clang-22   cocci
powerpc              randconfig-r2107-20261105    gcc-11.5.0 cocci
powerpc              randconfig-r2108-20261105    gcc-12     cocci
powerpc              randconfig-r2311-20261105    gcc-10.5.0 sparse
powerpc                      tqm8555_defconfig    clang-19
powerpc                  xes_mpc85xx_defconfig    clang-17
powerpc64             randconfig-1000-20261106    clang-19
powerpc64             randconfig-1001-20261106    clang-19
powerpc64             randconfig-2000-20261105    clang-18
powerpc64             randconfig-2001-20261105    clang-18
powerpc64             randconfig-2002-20261105    clang-18
powerpc64             randconfig-2200-20261105    clang-24   smatch
powerpc64            randconfig-r2104-20261105    clang-24   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261105    clang-24
riscv                 randconfig-1000-20261106    gcc-14.4.0
riscv                 randconfig-1001-20261105    clang-24
riscv                 randconfig-1001-20261106    gcc-14.4.0
riscv                 randconfig-2000-20261105    clang-24
riscv                 randconfig-2001-20261105    clang-24
riscv                 randconfig-2002-20261105    clang-24
riscv                 randconfig-2003-20261105    clang-24
riscv                 randconfig-2004-20261105    clang-24
riscv                 randconfig-2005-20261105    clang-24
riscv                 randconfig-2200-20261105    clang-24   smatch
riscv                randconfig-r2101-20261105    clang-24   cocci
riscv                randconfig-r2103-20261105    gcc-8.5.0  cocci
riscv                randconfig-r2105-20261105    clang-24   cocci
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261105    clang-24
s390                  randconfig-1000-20261106    gcc-14.4.0
s390                  randconfig-1001-20261105    clang-24
s390                  randconfig-1001-20261106    gcc-14.4.0
s390                  randconfig-2000-20261105    clang-24
s390                  randconfig-2001-20261105    clang-24
s390                  randconfig-2002-20261105    clang-24
s390                  randconfig-2003-20261105    clang-24
s390                  randconfig-2004-20261105    clang-24
s390                  randconfig-2005-20261105    clang-24
s390                  randconfig-2200-20261105    clang-24   smatch
s390                 randconfig-r2102-20261105    clang-24   cocci
s390                 randconfig-r2103-20261105    clang-24   cocci
s390                 randconfig-r2103-20261105    gcc-8.5.0  cocci
s390                 randconfig-r2110-20261105    gcc-11.5.0 cocci
s390                 randconfig-r2306-20261105    gcc-10.5.0 sparse
s390                 randconfig-r2307-20261105    clang-24   sparse
s390                 randconfig-r2309-20261105    clang-24   sparse
s390                 randconfig-r2310-20261105    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                  kfr2r09-romimage_defconfig    clang-17
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261105    clang-24
sh                    randconfig-1000-20261106    gcc-14.4.0
sh                    randconfig-1001-20261105    clang-24
sh                    randconfig-1001-20261106    gcc-14.4.0
sh                    randconfig-2000-20261105    gcc-16.2.0
sh                    randconfig-2001-20261105    gcc-16.2.0
sh                    randconfig-2002-20261105    gcc-16.2.0
sh                    randconfig-2003-20261105    gcc-16.2.0
sh                    randconfig-2004-20261105    gcc-16.2.0
sh                    randconfig-2005-20261105    gcc-16.2.0
sh                    randconfig-2200-20261105    gcc-13.5.0 smatch
sh                   randconfig-r2104-20261105    clang-24   cocci
sh                   randconfig-r2111-20261105    gcc-11.5.0 cocci
sh                           rsk7201_defconfig    clang-17
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    clang-17
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261106    gcc-15.3.0
sparc                 randconfig-1001-20261106    gcc-15.3.0
sparc                 randconfig-2000-20261105    clang-24
sparc                 randconfig-2001-20261105    clang-24
sparc                 randconfig-2200-20261105    gcc-16.2.0 smatch
sparc                randconfig-r2100-20261105    clang-24   cocci
sparc                randconfig-r2102-20261105    gcc-8.5.0  cocci
sparc                randconfig-r2106-20261105    gcc-11.5.0 cocci
sparc                randconfig-r2109-20261105    gcc-15.3.0 cocci
sparc                randconfig-r2110-20261105    gcc-8.5.0  cocci
sparc                randconfig-r2310-20261105    gcc-10.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261106    gcc-15.3.0
sparc64               randconfig-1001-20261106    gcc-15.3.0
sparc64               randconfig-2000-20261105    clang-24
sparc64               randconfig-2001-20261105    clang-24
sparc64               randconfig-2200-20261105    gcc-8.5.0  smatch
sparc64              randconfig-r2100-20261105    gcc-8.5.0  cocci
um                                alldefconfig    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261106    gcc-15.3.0
um                    randconfig-1001-20261106    gcc-15.3.0
um                    randconfig-2000-20261105    clang-24
um                    randconfig-2001-20261105    clang-24
um                    randconfig-2200-20261105    clang-19   smatch
um                   randconfig-r2110-20261105    gcc-12     cocci
um                   randconfig-r2302-20261105    clang-24   sparse
um                   randconfig-r2303-20261105    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-19
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261105    gcc-14
x86_64      buildonly-randconfig-1000-20261106    gcc-13
x86_64      buildonly-randconfig-1001-20261105    gcc-14
x86_64      buildonly-randconfig-1001-20261106    gcc-13
x86_64      buildonly-randconfig-1002-20261105    gcc-14
x86_64      buildonly-randconfig-1002-20261106    gcc-13
x86_64      buildonly-randconfig-1003-20261105    gcc-14
x86_64      buildonly-randconfig-1003-20261106    gcc-13
x86_64      buildonly-randconfig-1004-20261105    gcc-14
x86_64      buildonly-randconfig-1004-20261106    gcc-13
x86_64      buildonly-randconfig-1005-20261105    gcc-14
x86_64      buildonly-randconfig-1005-20261106    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261106    clang-22
x86_64                randconfig-1001-20261106    clang-22
x86_64                randconfig-1002-20261106    clang-22
x86_64                randconfig-1003-20261106    clang-22
x86_64                randconfig-1004-20261106    clang-22
x86_64                randconfig-1005-20261106    clang-22
x86_64                randconfig-1006-20261105    clang-22
x86_64                randconfig-1006-20261106    clang-22
x86_64                randconfig-1007-20261105    clang-22
x86_64                randconfig-1007-20261106    clang-22
x86_64                randconfig-1008-20261105    clang-22
x86_64                randconfig-1008-20261106    clang-22
x86_64                randconfig-1009-20261105    clang-22
x86_64                randconfig-1009-20261106    clang-22
x86_64                randconfig-1010-20261105    clang-22
x86_64                randconfig-1010-20261106    clang-22
x86_64                randconfig-1011-20261105    clang-22
x86_64                randconfig-1011-20261106    clang-22
x86_64                randconfig-1012-20261106    gcc-14
x86_64                randconfig-1013-20261106    gcc-14
x86_64                randconfig-1014-20261106    gcc-14
x86_64                randconfig-1015-20261106    gcc-14
x86_64                randconfig-1016-20261106    gcc-14
x86_64                randconfig-1017-20261106    gcc-14
x86_64                randconfig-2000-20261105    gcc-14
x86_64                randconfig-2001-20261105    gcc-14
x86_64                randconfig-2002-20261105    gcc-14
x86_64                randconfig-2003-20261105    gcc-14
x86_64                randconfig-2004-20261105    gcc-14
x86_64                randconfig-2005-20261105    gcc-14
x86_64                randconfig-2100-20261105    gcc-14     cocci
x86_64                randconfig-2101-20261105    gcc-14     cocci
x86_64                randconfig-2102-20261105    gcc-14     cocci
x86_64                randconfig-2103-20261105    gcc-14     cocci
x86_64                randconfig-2104-20261105    gcc-14     cocci
x86_64                randconfig-2105-20261105    gcc-14     cocci
x86_64                randconfig-2200-20261105    clang-22   smatch
x86_64               randconfig-r2105-20261105    clang-22   cocci
x86_64               randconfig-r2110-20261105    gcc-15.3.0 cocci
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
xtensa                   nommu_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261106    gcc-15.3.0
xtensa                randconfig-1001-20261106    gcc-15.3.0
xtensa                randconfig-2000-20261105    clang-24
xtensa                randconfig-2001-20261105    clang-24
xtensa                randconfig-2200-20261105    gcc-8.5.0  smatch
xtensa               randconfig-r2103-20261105    clang-24   cocci
xtensa                     xip_kc705_defconfig    clang-17
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
