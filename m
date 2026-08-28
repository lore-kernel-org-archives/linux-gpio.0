Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B393449B21
	for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920362; cv=none; b=jMtgblmNdnDkinA/bqohsAlKJnwevesB2Awqx44bhvzqisL00YDQl/1rbBQ+skmVrwOaWMg9OJemszKqKfkPjjtvPZcy1BSmzMqVHzZaaUTx6dl4tbKH+RnagPLa414972jcDSzr0nAU3lOOwbn0ZRD8NswGbhFG1uugVRB/U+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920362; c=relaxed/simple;
	bh=PDeh4J7ZfznZ31hfbItKCU2bRrAQBFq+CqdHlfrQlhw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AKY6tkDBHB8cdin/CAF3u65zhxC4EpJICFG0IqHG1QyBJtrnQ6A3D/Lo4DMc1FzA7Ky3uxqtrdKbR113HeyGxu4l+dGkXwIeWBhdKVkoyzPEAZkzrkGmFN3hEV+KnJi7BiZHJYP1p5XsDgl0ZBQqWEnHORpyNKfPOX1M0M6/S7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrbIKZKG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrbIKZKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787920350; x=1819456350;
  h=date:from:to:cc:subject:message-id;
  bh=PDeh4J7ZfznZ31hfbItKCU2bRrAQBFq+CqdHlfrQlhw=;
  b=mrbIKZKG4IVQrx1OtAcg4sFHGK9QJyxP/A3tt4qw5ZwuDBLF01xK17MI
   ZE6eFhaLjJmZuCHdEkc4x1ouMEWVPyK0tsQzw+EIMUbzV2VE1bAOZmaji
   DWbTkNXDfYZZTx19Vt5Gxnp6hbR4b9A7FFHajaTYJSa8n4SViKqvjX7Wp
   8U6OE55JZ9puaEqDQEkiceqmXqW/g+5t2i9zyywunepV6H1MeTAAVlwbf
   3JKmx898hLyKu6i1U5jUeR6QaMBOM6RRNzMqmknluL/U/8g0ggsWm+oip
   2xmRRcaP+9QFJBfDNQLT9hZHdE1pZITB7nbm0ENx3sLkdGQwwa8zInhLq
   w==;
X-CSE-ConnectionGUID: doLofy4sTdG9Ztu0OB3Y/w==
X-CSE-MsgGUID: cXWy5OoARsa4vjq0uJE+gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105951122"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105951122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:32:25 -0700
X-CSE-ConnectionGUID: pExHp2p0TieA0AEnTHPCiw==
X-CSE-MsgGUID: KxHRq8jwTfGUvIriWraRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="270095656"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2026 05:32:24 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzvkr-00000000B6v-3xEE;
	Fri, 28 Aug 2026 12:32:21 +0000
Date: Fri, 28 Aug 2026 20:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee
Message-ID: <202608282046.RbmFxmNh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee  power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()

elapsed time: 2955m

configs tested: 283
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-14
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-14
arc                              allyesconfig    clang-24
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                        nsim_700_defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260827    gcc-15.2.0
arc                   randconfig-001-20260827    gcc-16.1.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260827    gcc-15.2.0
arc                   randconfig-002-20260827    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-14
arm                       aspeed_g5_defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            mmp2_defconfig    gcc-16.1.0
arm                        neponset_defconfig    gcc-16.1.0
arm                             pxa_defconfig    clang-19
arm                            qcom_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260827    gcc-15.2.0
arm                   randconfig-001-20260827    gcc-16.1.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260827    gcc-15.2.0
arm                   randconfig-002-20260827    gcc-16.1.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260827    gcc-15.2.0
arm                   randconfig-003-20260827    gcc-16.1.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260827    gcc-15.2.0
arm                   randconfig-004-20260827    gcc-16.1.0
arm                         socfpga_defconfig    gcc-16.1.0
arm                           stm32_defconfig    gcc-16.1.0
arm64                            alldefconfig    clang-19
arm64                            allmodconfig    clang-14
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260827    clang-21
arm64                 randconfig-001-20260827    gcc-8.5.0
arm64                 randconfig-002-20260827    clang-21
arm64                 randconfig-002-20260827    gcc-8.5.0
arm64                 randconfig-003-20260827    clang-21
arm64                 randconfig-004-20260827    clang-21
arm64                 randconfig-004-20260827    gcc-8.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260827    clang-21
csky                  randconfig-001-20260827    gcc-8.5.0
csky                  randconfig-002-20260827    clang-21
csky                  randconfig-002-20260827    gcc-8.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260827    gcc-16.1.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260827    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260827    clang-22
i386        buildonly-randconfig-002-20260827    clang-22
i386        buildonly-randconfig-003-20260827    clang-22
i386        buildonly-randconfig-004-20260827    clang-22
i386        buildonly-randconfig-005-20260827    clang-22
i386        buildonly-randconfig-006-20260827    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260827    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260827    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260827    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260827    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260827    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260827    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260827    gcc-14
i386                           randconfig-011    gcc-13
i386                  randconfig-011-20260827    clang-22
i386                  randconfig-011-20260827    gcc-13
i386                           randconfig-012    gcc-13
i386                  randconfig-012-20260827    gcc-13
i386                           randconfig-013    gcc-13
i386                  randconfig-013-20260827    gcc-13
i386                           randconfig-014    gcc-13
i386                  randconfig-014-20260827    gcc-13
i386                           randconfig-015    gcc-13
i386                  randconfig-015-20260827    gcc-13
i386                           randconfig-016    gcc-13
i386                  randconfig-016-20260827    gcc-13
i386                           randconfig-017    gcc-13
i386                  randconfig-017-20260827    gcc-13
loongarch                        alldefconfig    gcc-16.1.0
loongarch                        allmodconfig    clang-14
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-14
loongarch                           defconfig    clang-24
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260827    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260827    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-14
m68k                                defconfig    clang-14
m68k                                defconfig    clang-24
m68k                         nettel_defconfig    gcc-16.1.0
m68k                            q40_defconfig    clang-19
microblaze                       alldefconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-14
microblaze                          defconfig    clang-24
microblaze                      mmu_defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                       bmips_be_defconfig    gcc-16.1.0
mips                           gcw0_defconfig    clang-19
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-14
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-14
nios2                               defconfig    clang-24
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260827    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260827    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-14
openrisc                          allnoconfig    clang-24
openrisc         de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-14
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                generic-32bit_defconfig    clang-19
parisc                generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-001-20260827    gcc-14.3.0
parisc                randconfig-002-20260827    gcc-14.3.0
parisc64                            defconfig    clang-14
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-14
powerpc                           allnoconfig    clang-24
powerpc                    amigaone_defconfig    gcc-16.1.0
powerpc                      ep88xc_defconfig    gcc-16.1.0
powerpc                    gamecube_defconfig    clang-19
powerpc               mpc834x_itxgp_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260827    gcc-14.3.0
powerpc               randconfig-002-20260827    gcc-14.3.0
powerpc                     tqm5200_defconfig    clang-19
powerpc                     tqm8540_defconfig    gcc-16.1.0
powerpc                     tqm8541_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260827    gcc-14.3.0
powerpc64             randconfig-002-20260827    gcc-14.3.0
riscv                            allmodconfig    clang-14
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-14
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-14
riscv                               defconfig    gcc-16.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-14
riscv                 randconfig-001-20260827    clang-14
riscv                          randconfig-002    clang-14
riscv                 randconfig-002-20260827    clang-14
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-14
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-14
s390                  randconfig-001-20260827    clang-14
s390                           randconfig-002    clang-14
s390                  randconfig-002-20260827    clang-14
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-14
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                        apsh4ad0a_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    clang-14
sh                    randconfig-001-20260827    clang-14
sh                             randconfig-002    clang-14
sh                    randconfig-002-20260827    clang-14
sh                     sh7710voipgw_defconfig    gcc-16.1.0
sh                            shmin_defconfig    clang-19
sparc                             allnoconfig    clang-14
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260827    gcc-10.5.0
sparc                 randconfig-002-20260827    gcc-10.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260827    gcc-10.5.0
sparc64               randconfig-002-20260827    gcc-10.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-14
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260827    gcc-10.5.0
um                    randconfig-002-20260827    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-14
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260827    clang-22
x86_64      buildonly-randconfig-002-20260827    clang-22
x86_64      buildonly-randconfig-003-20260827    clang-22
x86_64      buildonly-randconfig-004-20260827    clang-22
x86_64      buildonly-randconfig-005-20260827    clang-22
x86_64      buildonly-randconfig-006-20260827    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260827    clang-22
x86_64                randconfig-001-20260828    gcc-14
x86_64                randconfig-002-20260827    clang-22
x86_64                randconfig-002-20260827    gcc-14
x86_64                randconfig-002-20260828    gcc-14
x86_64                randconfig-003-20260827    clang-22
x86_64                randconfig-003-20260827    gcc-14
x86_64                randconfig-003-20260828    gcc-14
x86_64                randconfig-004-20260827    clang-22
x86_64                randconfig-004-20260827    gcc-14
x86_64                randconfig-004-20260828    gcc-14
x86_64                randconfig-005-20260827    clang-22
x86_64                randconfig-005-20260828    gcc-14
x86_64                randconfig-006-20260827    clang-22
x86_64                randconfig-006-20260828    gcc-14
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260827    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260827    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260827    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260827    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260827    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260827    clang-22
x86_64                randconfig-071-20260827    gcc-14
x86_64                randconfig-072-20260827    gcc-14
x86_64                randconfig-073-20260827    gcc-14
x86_64                randconfig-074-20260827    gcc-14
x86_64                randconfig-075-20260827    gcc-14
x86_64                randconfig-076-20260827    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-14
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260827    gcc-10.5.0
xtensa                randconfig-002-20260827    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
