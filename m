Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378375;
	b=HWKbxaCDU+K02qYP4tgxjzYMC/Ty5QU4BjFeZaact5wmS5SgiBxThbQnsdinIYwy5zlj
	 qfXGvkJsOMjLWNTYcs2zqHNXo4LUm2k7MpX89SugISEBuv77b0nnC2lcLGnTTQphX0/nL
	 fegL5tU3kPMGJh1sFLrcWwlS74it+b7F/LZq8Csm3ZKO8XwTJPD9hLkOZx+Mi2srEXUmY
	 tQ1HNeSuX38Lr3fh38Ra2sErVvnjodAuH5XPLLd9lz5hw0m6sjW1c561UdZcVpxf9qdkp
	 jD8TE04TePOvIghqg2rCzNjqGs8T95qLk6vGi3lAuuXdivLQgCfyJRz63ie0AlFxjjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378375;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BNzrUqj+fNM38Og2/as9juq1X19dD3Tu2iduEx8pBuY=;
	b=YuZPf0IIQbRv741dFuMtm9AqEg9ftrcPiBq/A+Et3CFLDRGDZikXPatk3rF/Mdgh0FmM
	 JVu/KTpemft1OuSh9l14ScV7klPs0JOGJYXcWGCTkIXap66xL27YzmM4oilx21xYBLFg+
	 ESQA2S6HFs1x1dRiBvf/7m2abwZEbB4Yj8sLaaEhBMKyVKYuD24RkkzyRzGGqZpoYtnOc
	 zaU7wm2+EPMn5CrDgLVAtXcs/nKKynSc8HD6rktZXcsxWJgh+KU/RcTWrc5ZaDTrCk7wq
	 v2M3t0wq+5oFkdEygTE9EDJqasW5JlvPtpgoZwpFDEsGDFJCOhVqygvnLfV7tx5Wpvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fwr1QoTM;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B875606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 06:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B875606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fwr1QoTM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794378375; x=1825914375;
  h=date:from:to:cc:subject:message-id;
  bh=qL5D+NMTXHSZpjpifc0bAKfpqX6IFKlqPe1vRLn6/EM=;
  b=fwr1QoTMWkWgP6pMWRzxUuj/nDhOgd2D/ouEzjxQPPJsNBOWpM2UFz0j
   wnSGWw436JRU93y6gXsWTdNTz/kOYf19+RsPBJBNVM86ORu8UD4Eqrlty
   rFFL2EGFy0KSGZ+DSIJ6YDwE9+yBEezVxXuiAwLsZ5lv6UlMtR0ut36Fn
   A2Klqg2i8LH538t2arPPfojDKaqhP8XEnrd7r+9vno4IpeFY7lsYrIJRU
   MvlLFaHdVAbdsaX0RKfoBrCRWFyivg/oyK+fwVwD1A4tpCXsPYWi4puWS
   teJc58XwkIAx6Zfov6enszRiAHfPnSa5FmktvoXLqOBoDoCOwy1ufKwvo
   w==;
X-CSE-ConnectionGUID: diPyCN0vQsSdU5eA/PaAEQ==
X-CSE-MsgGUID: OR9gTNkWSCKEGe/ibGO9hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3230174"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3230174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 22:26:12 -0800
X-CSE-ConnectionGUID: wSNWkxN9StqA3EElzwsV9A==
X-CSE-MsgGUID: k/0LEivTT0+LykKG/PW1qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8509499"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Nov 2026 22:26:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR1mZ-00000000yGl-2Y2M;
	Wed, 11 Nov 2026 06:26:07 +0000
Date: Wed, 11 Nov 2026 14:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq:for-current] BUILD SUCCESS
 073f01043e79fd76f4fa648e58061c80329a6eef
Message-ID: <20261111142546.Tn8exTn5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: 073f01043e79fd76f4fa648e58061c80329a6eef  power: sequencing: fix serdev controller reference leak

elapsed time: 1041m

configs tested: 240
configs skipped: 21

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
arc                          haps_hs_defconfig    clang-17
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261111    gcc-15.3.0
arc                   randconfig-1001-20261111    gcc-15.3.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261111    gcc-15.3.0
arm                   randconfig-1001-20261111    gcc-15.3.0
arm                   randconfig-1002-20261111    gcc-15.3.0
arm                   randconfig-1003-20261111    gcc-15.3.0
arm                            sunxi_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261111    gcc-13.5.0
arm64                 randconfig-1001-20261111    gcc-13.5.0
arm64                 randconfig-1002-20261111    gcc-13.5.0
arm64                 randconfig-1003-20261111    gcc-13.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261111    gcc-13.5.0
csky                  randconfig-1001-20261111    gcc-13.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261111    clang-17
hexagon               randconfig-1001-20261111    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1000-20261111    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1001-20261111    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1002-20261111    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1003-20261111    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1004-20261111    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386        buildonly-randconfig-1005-20261111    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1000-20261111    gcc-13
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1001-20261111    gcc-13
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1002-20261111    gcc-13
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1003-20261111    gcc-13
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1004-20261111    gcc-13
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1005-20261111    gcc-13
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1006-20261111    gcc-13
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1007-20261111    clang-22
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1008-20261111    clang-22
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1009-20261111    clang-22
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1010-20261111    clang-22
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1011-20261111    clang-22
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1012-20261111    clang-22
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-1013-20261111    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261111    clang-17
loongarch             randconfig-1001-20261111    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    gcc-16.2.0
m68k                           atari_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261111    clang-17
nios2                 randconfig-1001-20261111    clang-17
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            alldefconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1000-20261111    gcc-15.3.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-1001-20261111    gcc-15.3.0
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                    microwatt_defconfig    gcc-16.2.0
powerpc                       pcm030_defconfig    clang-17
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1000-20261111    gcc-15.3.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261111    gcc-15.3.0
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1000-20261111    gcc-15.3.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261111    gcc-15.3.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261111    clang-17
riscv                 randconfig-1001-20261111    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261111    clang-17
s390                  randconfig-1001-20261111    clang-17
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                         edosk7760_defconfig    clang-17
sh                  kfr2r09-romimage_defconfig    gcc-16.2.0
sh                           r7785rp_defconfig    clang-17
sh                    randconfig-1000-20261111    clang-17
sh                    randconfig-1001-20261111    clang-17
sh                            se7722_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    clang-17
sh                           urquell_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1000-20261111    gcc-16.2.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261111    gcc-16.2.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1000-20261111    gcc-16.2.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261111    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1000-20261111    gcc-16.2.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-1001-20261111    gcc-16.2.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1000-20261111    gcc-14
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261111    gcc-14
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261111    gcc-14
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261111    gcc-14
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261111    gcc-14
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261111    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261111    clang-22
x86_64                randconfig-1001-20261111    clang-22
x86_64                randconfig-1002-20261111    clang-22
x86_64                randconfig-1003-20261111    clang-22
x86_64                randconfig-1004-20261111    clang-22
x86_64                randconfig-1005-20261111    clang-22
x86_64                randconfig-1006-20261111    clang-22
x86_64                randconfig-1007-20261111    clang-22
x86_64                randconfig-1008-20261111    clang-22
x86_64                randconfig-1009-20261111    clang-22
x86_64                randconfig-1010-20261111    clang-22
x86_64                randconfig-1011-20261111    clang-22
x86_64                randconfig-1012-20261111    gcc-14
x86_64                randconfig-1013-20261111    gcc-14
x86_64                randconfig-1014-20261111    gcc-14
x86_64                randconfig-1015-20261111    gcc-14
x86_64                randconfig-1016-20261111    gcc-14
x86_64                randconfig-1017-20261111    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1000-20261111    gcc-16.2.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261111    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
