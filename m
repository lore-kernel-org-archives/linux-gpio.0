Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554879;
	b=knyBsU6ITheSH5AkfjKQvPvd9RT3r9fm8Oh3B0VPkJxYtwtL7RwN4dI/EqySAWXskAIU
	 6e3AR0lBoOPIrgx77fwMnqFVMZf4+77KO2+D5bNquPgVGpYEgNMSp2Z3nf+fuQ5HEZkCZ
	 S+YcK1A53zKu+xatoyLNczPDS9KYXdPbq12L3VWko/O+TP3DPBMzX/KRdvXZXeYOqyoA/
	 Age1h9Z79fet6ZWVffbGyFBetLEIOEoc9ggTr/z+HwlWysvsOtVu/BzSOgirFlmlPWFv0
	 UNtcZJMK63qk8OMm66fjQ5/PWAC00MxCiUmCxx06Kxacv9G7nZa7nU4oLCn8f78Modw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554879;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ROj8ARuV1QZwnOOBipy2cuNrlCIgbEEylTwPIee0tOI=;
	b=xii61J0i391Bps5Q6UlV1fQdECFkseu+5K6Cr9r5hJIw1T6qL6lCU0Q2IpfxckYsKCY4
	 i9rW0UgYiyIlx+oCEgic4C9karMA7cFJE6NUt8EN8K80QyB/i/X5y8XzWCnVbaTrUOEZQ
	 Ykzd4nke1K9+bdMB0mkd7xthlBd5sDg5Zz256caKB66+0X9S+DvXuaSs/+A4xW3hi30zQ
	 yTR+EiGi6YcRvt0g38QmTbhrytFzlDgNPS2L0ms9NN77efXyUF+zVQtyVxl2Pucu4NPn9
	 ZUvMArqT12bXVS4DzKLeYuyRlFlFk/ERfyaVxOE12etoaw0Rpczw60HRKiom7f0wgxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afbWKxpz;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66A606A324
	for <linux-gpio@vger.kernel.org>; Sun,  1 Nov 2026 17:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D66A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afbWKxpz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793554879; x=1825090879;
  h=date:from:to:cc:subject:message-id;
  bh=qod+N/cgLRPZ/IHlKKiQApsHXEjAYNzvDhHThhinWNE=;
  b=afbWKxpzC9ZlBPWrsWuWlzWXneYT+dFZOUEtmBn2KoeCegoiXC6nunZ3
   nUqZ2EgZs6tE+BGcqd99bwQs3MqbW21rRea5gMeYY3jT/moEncogqaTPD
   KSoRla3BwUwHIzKdxsIFtBgyO5bFn0tx5W8fScV6jASbCHwh0WtGYf8cC
   nUHT2X7Mk5hucPMnF5bCl5F59L2ypuO23cyWd6YtVZkMxXX9/FDKqUwys
   Usc+hfBXvhZgYnRS9hd9wNfevw+pq+X/1fc4Y5niFJv33MnEyPRv7u347
   WnKUeMrj+a7BYLW+S1pGLIqNvvVdhCH/sdoRLTHGjJA160di3GEbD/3qN
   A==;
X-CSE-ConnectionGUID: oqq9c0QaTQKqHj/1K4E97A==
X-CSE-MsgGUID: siiSXiaNR3WS30c7TDIaJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2263589"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2263589"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 09:41:18 -0800
X-CSE-ConnectionGUID: cLwtwvHuTl+3FfCOlb0I9A==
X-CSE-MsgGUID: XdRceX+cTeyP28NSxHzZww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5924667"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Nov 2026 09:41:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNZYQ-00000000eeo-1aPx;
	Sun, 01 Nov 2026 17:41:14 +0000
Date: Mon, 02 Nov 2026 01:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 30d9a180c86e3cbd53efb7152e05cb059112f6eb
Message-ID: <20261102014103.EGsQrnIL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 30d9a180c86e3cbd53efb7152e05cb059112f6eb  pinctrl: qcom: Restore the pin configuration after hibernation

elapsed time: 5299m

configs tested: 437
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs101_defconfig    clang-20
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    clang-20
arc                   randconfig-1000-20261030    gcc-12.5.0
arc                   randconfig-1000-20261031    gcc-9.5.0
arc                   randconfig-1000-20261101    clang-22
arc                   randconfig-1001-20261030    gcc-12.5.0
arc                   randconfig-1001-20261031    gcc-9.5.0
arc                   randconfig-1001-20261101    clang-22
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    clang-20
arm                           collie_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    clang-17
arm                           pxa168_defconfig    gcc-16.2.0
arm                              pxa_defconfig    clang-20
arm                   randconfig-1000-20261030    gcc-12.5.0
arm                   randconfig-1000-20261031    gcc-9.5.0
arm                   randconfig-1000-20261101    clang-22
arm                   randconfig-1001-20261030    gcc-12.5.0
arm                   randconfig-1001-20261031    gcc-9.5.0
arm                   randconfig-1001-20261101    clang-22
arm                   randconfig-1002-20261030    gcc-12.5.0
arm                   randconfig-1002-20261031    gcc-9.5.0
arm                   randconfig-1002-20261101    clang-22
arm                   randconfig-1003-20261030    gcc-12.5.0
arm                   randconfig-1003-20261031    gcc-9.5.0
arm                   randconfig-1003-20261101    clang-22
arm                         realview_defconfig    gcc-16.2.0
arm                              rpc_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm                            tegra_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261029    gcc-8.5.0
arm64                 randconfig-1000-20261030    gcc-13.5.0
arm64                 randconfig-1000-20261031    clang-24
arm64                 randconfig-1000-20261101    clang-22
arm64                 randconfig-1001-20261029    gcc-8.5.0
arm64                 randconfig-1001-20261030    gcc-13.5.0
arm64                 randconfig-1001-20261031    clang-24
arm64                 randconfig-1001-20261101    clang-22
arm64                 randconfig-1002-20261029    gcc-8.5.0
arm64                 randconfig-1002-20261030    gcc-13.5.0
arm64                 randconfig-1002-20261031    clang-24
arm64                 randconfig-1002-20261101    clang-22
arm64                 randconfig-1003-20261029    gcc-8.5.0
arm64                 randconfig-1003-20261030    gcc-13.5.0
arm64                 randconfig-1003-20261031    clang-24
arm64                 randconfig-1003-20261101    clang-22
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261029    gcc-8.5.0
csky                  randconfig-1000-20261030    gcc-13.5.0
csky                  randconfig-1000-20261031    clang-24
csky                  randconfig-1000-20261101    clang-22
csky                  randconfig-1001-20261029    gcc-8.5.0
csky                  randconfig-1001-20261030    gcc-13.5.0
csky                  randconfig-1001-20261031    clang-24
csky                  randconfig-1001-20261101    clang-22
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261030    gcc-11.5.0
hexagon               randconfig-1000-20261031    gcc-11.5.0
hexagon               randconfig-1000-20261101    gcc-16.2.0
hexagon               randconfig-1001-20261030    gcc-11.5.0
hexagon               randconfig-1001-20261031    gcc-11.5.0
hexagon               randconfig-1001-20261101    gcc-16.2.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261030    clang-22
i386        buildonly-randconfig-1000-20261031    clang-22
i386        buildonly-randconfig-1000-20261101    gcc-14
i386        buildonly-randconfig-1001-20261030    clang-22
i386        buildonly-randconfig-1001-20261031    clang-22
i386        buildonly-randconfig-1001-20261101    gcc-14
i386        buildonly-randconfig-1002-20261030    clang-22
i386        buildonly-randconfig-1002-20261031    clang-22
i386        buildonly-randconfig-1002-20261101    gcc-14
i386        buildonly-randconfig-1003-20261030    clang-22
i386        buildonly-randconfig-1003-20261031    clang-22
i386        buildonly-randconfig-1003-20261101    gcc-14
i386        buildonly-randconfig-1004-20261030    clang-22
i386        buildonly-randconfig-1004-20261031    clang-22
i386        buildonly-randconfig-1004-20261101    gcc-14
i386        buildonly-randconfig-1005-20261030    clang-22
i386        buildonly-randconfig-1005-20261031    clang-22
i386        buildonly-randconfig-1005-20261101    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261030    clang-22
i386                  randconfig-1000-20261031    clang-22
i386                  randconfig-1000-20261101    gcc-14
i386                  randconfig-1001-20261030    clang-22
i386                  randconfig-1001-20261031    clang-22
i386                  randconfig-1001-20261101    gcc-14
i386                  randconfig-1002-20261030    clang-22
i386                  randconfig-1002-20261031    clang-22
i386                  randconfig-1002-20261101    gcc-14
i386                  randconfig-1003-20261030    clang-22
i386                  randconfig-1003-20261031    clang-22
i386                  randconfig-1003-20261101    gcc-14
i386                  randconfig-1004-20261030    clang-22
i386                  randconfig-1004-20261031    clang-22
i386                  randconfig-1004-20261101    gcc-14
i386                  randconfig-1005-20261030    clang-22
i386                  randconfig-1005-20261031    clang-22
i386                  randconfig-1005-20261101    gcc-14
i386                  randconfig-1006-20261030    clang-22
i386                  randconfig-1006-20261031    clang-22
i386                  randconfig-1006-20261101    gcc-14
i386                  randconfig-1007-20261029    clang-22
i386                  randconfig-1007-20261030    clang-22
i386                  randconfig-1007-20261031    gcc-14
i386                  randconfig-1007-20261101    clang-22
i386                  randconfig-1008-20261029    clang-22
i386                  randconfig-1008-20261030    clang-22
i386                  randconfig-1008-20261031    gcc-14
i386                  randconfig-1008-20261101    clang-22
i386                  randconfig-1009-20261029    clang-22
i386                  randconfig-1009-20261030    clang-22
i386                  randconfig-1009-20261031    gcc-14
i386                  randconfig-1009-20261101    clang-22
i386                  randconfig-1010-20261029    clang-22
i386                  randconfig-1010-20261030    clang-22
i386                  randconfig-1010-20261031    gcc-14
i386                  randconfig-1010-20261101    clang-22
i386                  randconfig-1011-20261029    clang-22
i386                  randconfig-1011-20261030    clang-22
i386                  randconfig-1011-20261031    gcc-14
i386                  randconfig-1011-20261101    clang-22
i386                  randconfig-1012-20261029    clang-22
i386                  randconfig-1012-20261030    clang-22
i386                  randconfig-1012-20261031    gcc-14
i386                  randconfig-1012-20261101    clang-22
i386                  randconfig-1013-20261029    clang-22
i386                  randconfig-1013-20261030    clang-22
i386                  randconfig-1013-20261031    gcc-14
i386                  randconfig-1013-20261101    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261030    gcc-11.5.0
loongarch             randconfig-1000-20261031    gcc-11.5.0
loongarch             randconfig-1000-20261101    gcc-16.2.0
loongarch             randconfig-1001-20261030    gcc-11.5.0
loongarch             randconfig-1001-20261031    gcc-11.5.0
loongarch             randconfig-1001-20261101    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    gcc-16.2.0
m68k                           amiga_defconfig    gcc-16.2.0
m68k                           atari_defconfig    clang-20
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                         m5307c3_defconfig    clang-17
m68k                       m54418evb_defconfig    clang-17
m68k                          nettel_defconfig    clang-17
m68k                            virt_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                  decstation_r4k_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    clang-20
mips                       maltaaprp_defconfig    clang-17
mips                         maltaup_defconfig    gcc-16.2.0
mips                         vocore2_defconfig    clang-20
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261030    gcc-11.5.0
nios2                 randconfig-1000-20261031    gcc-11.5.0
nios2                 randconfig-1000-20261101    gcc-16.2.0
nios2                 randconfig-1001-20261030    gcc-11.5.0
nios2                 randconfig-1001-20261031    gcc-11.5.0
nios2                 randconfig-1001-20261101    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-17
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261029    clang-17
parisc                randconfig-1000-20261030    gcc-16.2.0
parisc                randconfig-1000-20261031    gcc-13.5.0
parisc                randconfig-1000-20261101    gcc-8.5.0
parisc                randconfig-1001-20261029    clang-17
parisc                randconfig-1001-20261030    gcc-16.2.0
parisc                randconfig-1001-20261031    gcc-13.5.0
parisc                randconfig-1001-20261101    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                  canyonlands_defconfig    clang-17
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                        holly_defconfig    clang-17
powerpc                  mpc836x_rdk_defconfig    clang-20
powerpc                   mpc885_ads_defconfig    clang-17
powerpc                       pcm030_defconfig    clang-17
powerpc               randconfig-1000-20261029    clang-17
powerpc               randconfig-1000-20261030    gcc-16.2.0
powerpc               randconfig-1000-20261031    gcc-13.5.0
powerpc               randconfig-1000-20261101    gcc-8.5.0
powerpc               randconfig-1001-20261029    clang-17
powerpc               randconfig-1001-20261030    gcc-16.2.0
powerpc               randconfig-1001-20261031    gcc-13.5.0
powerpc               randconfig-1001-20261101    gcc-8.5.0
powerpc                         warp_defconfig    gcc-16.2.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261029    clang-17
powerpc64             randconfig-1000-20261030    gcc-16.2.0
powerpc64             randconfig-1000-20261031    gcc-13.5.0
powerpc64             randconfig-1000-20261101    gcc-8.5.0
powerpc64             randconfig-1001-20261029    clang-17
powerpc64             randconfig-1001-20261030    gcc-16.2.0
powerpc64             randconfig-1001-20261031    gcc-13.5.0
powerpc64             randconfig-1001-20261101    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261029    gcc-10.5.0
riscv                 randconfig-1000-20261030    gcc-11.5.0
riscv                 randconfig-1000-20261031    gcc-8.5.0
riscv                 randconfig-1000-20261101    gcc-8.5.0
riscv                 randconfig-1001-20261029    gcc-10.5.0
riscv                 randconfig-1001-20261030    gcc-11.5.0
riscv                 randconfig-1001-20261031    gcc-8.5.0
riscv                 randconfig-1001-20261101    gcc-8.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                           debug_defconfig    clang-17
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261029    gcc-10.5.0
s390                  randconfig-1000-20261030    gcc-11.5.0
s390                  randconfig-1000-20261031    gcc-8.5.0
s390                  randconfig-1000-20261101    gcc-8.5.0
s390                  randconfig-1001-20261029    gcc-10.5.0
s390                  randconfig-1001-20261030    gcc-11.5.0
s390                  randconfig-1001-20261031    gcc-8.5.0
s390                  randconfig-1001-20261101    gcc-8.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                          ecovec24_defconfig    gcc-16.2.0
sh                      magicpanelr2_defconfig    clang-17
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261029    gcc-10.5.0
sh                    randconfig-1000-20261030    gcc-11.5.0
sh                    randconfig-1000-20261031    gcc-8.5.0
sh                    randconfig-1000-20261101    gcc-8.5.0
sh                    randconfig-1001-20261029    gcc-10.5.0
sh                    randconfig-1001-20261030    gcc-11.5.0
sh                    randconfig-1001-20261031    gcc-8.5.0
sh                    randconfig-1001-20261101    gcc-8.5.0
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7203_defconfig    gcc-16.2.0
sh                           urquell_defconfig    clang-17
sh                           urquell_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261029    clang-24
sparc                 randconfig-1000-20261030    gcc-10.5.0
sparc                 randconfig-1000-20261031    gcc-11.5.0
sparc                 randconfig-1000-20261101    gcc-8.5.0
sparc                 randconfig-1001-20261029    clang-24
sparc                 randconfig-1001-20261030    gcc-10.5.0
sparc                 randconfig-1001-20261031    gcc-11.5.0
sparc                 randconfig-1001-20261101    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261029    clang-24
sparc64               randconfig-1000-20261030    gcc-10.5.0
sparc64               randconfig-1000-20261031    gcc-11.5.0
sparc64               randconfig-1000-20261101    gcc-8.5.0
sparc64               randconfig-1001-20261029    clang-24
sparc64               randconfig-1001-20261030    gcc-10.5.0
sparc64               randconfig-1001-20261031    gcc-11.5.0
sparc64               randconfig-1001-20261101    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261029    clang-24
um                    randconfig-1000-20261030    gcc-10.5.0
um                    randconfig-1000-20261031    gcc-11.5.0
um                    randconfig-1000-20261101    gcc-8.5.0
um                    randconfig-1001-20261029    clang-24
um                    randconfig-1001-20261030    gcc-10.5.0
um                    randconfig-1001-20261031    gcc-11.5.0
um                    randconfig-1001-20261101    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261030    gcc-14
x86_64      buildonly-randconfig-1000-20261031    clang-22
x86_64      buildonly-randconfig-1000-20261101    clang-22
x86_64      buildonly-randconfig-1001-20261030    gcc-14
x86_64      buildonly-randconfig-1001-20261031    clang-22
x86_64      buildonly-randconfig-1001-20261101    clang-22
x86_64      buildonly-randconfig-1002-20261030    gcc-14
x86_64      buildonly-randconfig-1002-20261031    clang-22
x86_64      buildonly-randconfig-1002-20261101    clang-22
x86_64      buildonly-randconfig-1003-20261030    gcc-14
x86_64      buildonly-randconfig-1003-20261031    clang-22
x86_64      buildonly-randconfig-1003-20261101    clang-22
x86_64      buildonly-randconfig-1004-20261030    gcc-14
x86_64      buildonly-randconfig-1004-20261031    clang-22
x86_64      buildonly-randconfig-1004-20261101    clang-22
x86_64      buildonly-randconfig-1005-20261030    gcc-14
x86_64      buildonly-randconfig-1005-20261031    clang-22
x86_64      buildonly-randconfig-1005-20261101    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261029    clang-22
x86_64                randconfig-1000-20261030    clang-22
x86_64                randconfig-1000-20261031    gcc-14
x86_64                randconfig-1000-20261101    gcc-14
x86_64                randconfig-1001-20261029    clang-22
x86_64                randconfig-1001-20261030    clang-22
x86_64                randconfig-1001-20261031    gcc-14
x86_64                randconfig-1001-20261101    gcc-14
x86_64                randconfig-1002-20261029    clang-22
x86_64                randconfig-1002-20261030    clang-22
x86_64                randconfig-1002-20261031    gcc-14
x86_64                randconfig-1002-20261101    gcc-14
x86_64                randconfig-1003-20261029    clang-22
x86_64                randconfig-1003-20261030    clang-22
x86_64                randconfig-1003-20261031    gcc-14
x86_64                randconfig-1003-20261101    gcc-14
x86_64                randconfig-1004-20261029    clang-22
x86_64                randconfig-1004-20261030    clang-22
x86_64                randconfig-1004-20261031    gcc-14
x86_64                randconfig-1004-20261101    gcc-14
x86_64                randconfig-1005-20261029    clang-22
x86_64                randconfig-1005-20261030    clang-22
x86_64                randconfig-1005-20261031    gcc-14
x86_64                randconfig-1005-20261101    gcc-14
x86_64                randconfig-1006-20261029    gcc-14
x86_64                randconfig-1006-20261030    gcc-14
x86_64                randconfig-1006-20261031    clang-22
x86_64                randconfig-1006-20261101    clang-22
x86_64                randconfig-1007-20261029    gcc-14
x86_64                randconfig-1007-20261030    gcc-14
x86_64                randconfig-1007-20261031    clang-22
x86_64                randconfig-1007-20261101    clang-22
x86_64                randconfig-1008-20261029    gcc-14
x86_64                randconfig-1008-20261030    gcc-14
x86_64                randconfig-1008-20261031    clang-22
x86_64                randconfig-1008-20261101    clang-22
x86_64                randconfig-1009-20261029    gcc-14
x86_64                randconfig-1009-20261030    gcc-14
x86_64                randconfig-1009-20261031    clang-22
x86_64                randconfig-1009-20261101    clang-22
x86_64                randconfig-1010-20261029    gcc-14
x86_64                randconfig-1010-20261030    gcc-14
x86_64                randconfig-1010-20261031    clang-22
x86_64                randconfig-1010-20261101    clang-22
x86_64                randconfig-1011-20261029    gcc-14
x86_64                randconfig-1011-20261030    gcc-14
x86_64                randconfig-1011-20261031    clang-22
x86_64                randconfig-1011-20261101    clang-22
x86_64                randconfig-1012-20261030    clang-22
x86_64                randconfig-1012-20261031    gcc-14
x86_64                randconfig-1012-20261101    gcc-14
x86_64                randconfig-1013-20261030    clang-22
x86_64                randconfig-1013-20261031    gcc-14
x86_64                randconfig-1013-20261101    gcc-14
x86_64                randconfig-1014-20261030    clang-22
x86_64                randconfig-1014-20261031    gcc-14
x86_64                randconfig-1014-20261101    gcc-14
x86_64                randconfig-1015-20261030    clang-22
x86_64                randconfig-1015-20261031    gcc-14
x86_64                randconfig-1015-20261101    gcc-14
x86_64                randconfig-1016-20261030    clang-22
x86_64                randconfig-1016-20261031    gcc-14
x86_64                randconfig-1016-20261101    gcc-14
x86_64                randconfig-1017-20261030    clang-22
x86_64                randconfig-1017-20261031    gcc-14
x86_64                randconfig-1017-20261101    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261029    clang-24
xtensa                randconfig-1000-20261030    gcc-10.5.0
xtensa                randconfig-1000-20261031    gcc-11.5.0
xtensa                randconfig-1000-20261101    gcc-8.5.0
xtensa                randconfig-1001-20261029    clang-24
xtensa                randconfig-1001-20261030    gcc-10.5.0
xtensa                randconfig-1001-20261031    gcc-11.5.0
xtensa                randconfig-1001-20261101    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
