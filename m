Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357181E22E9
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507194; cv=none; b=OfaKKbrKlLBcI74LtWbLII0VrNV42iH9q2bASYZhue1P21gOLUPIAfTJnEoWcSMJobhAyCeBdrNHMXZtFJ0XkuMznQGRpLyQt1o5OvlkZ+GI38QubnPvTZMiiheX8mXrpadV13frBmr1SerotJw7m1aNH4EQHaUlAuD9OG3+jcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507194; c=relaxed/simple;
	bh=mHDK+tdHwDwA5LiXbUo4W/AfIdzUbLnrs7EOlgl7Zs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RUsSR3FABdlW3GUUGDDuyMrlVZuuytzAZTdIC5svrUwvYqhcmgJ78t0IcR0rZsfOJPdgY7WsDUUgYr74foP92aVVkSE8ttSM8m0MOylEsDW7dh743HOlY78/abuHk/1WeS9I/Eh8DMQoZTOORZVDeb9o9RTILxb4gJp5p8fpENk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTF1bp4X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTF1bp4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785507192; x=1817043192;
  h=date:from:to:cc:subject:message-id;
  bh=mHDK+tdHwDwA5LiXbUo4W/AfIdzUbLnrs7EOlgl7Zs8=;
  b=NTF1bp4X5AJVrxEahaxTGpv08UIlyzxmJ/Texz7hlBQoO+0Ia/PBjsq4
   HSOvRHHP12vkjUu7DJ5O5tJaEmuSUMOZBH49hTBOzt1Z6qmkmtSHy/YYc
   gz+vUCxHNneXq+w9dH6KccnEplfAgkhan8oY6+81hvXZkibFabPdKp225
   NMun2B0EPGoxQNiht4t7BBLVAUcRuToKr5Rtp/W2zKiKYUh7FlffS+yZh
   B5L38soK4zlIsK2F1foXJ5Kl8ulcjy7wylEWpgkJ1kbmnUW3QDtsf2HHD
   Uo9lX89+FkjO3OqLhHT7P0lhlUcH6SgAlq+xSaIthh21MSUeIYNdPMQwJ
   g==;
X-CSE-ConnectionGUID: vgX4SdrcRSSTGNfud7lLQQ==
X-CSE-MsgGUID: Hr+GohKQSWqsWApABw8Hig==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97506679"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97506679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:13:11 -0700
X-CSE-ConnectionGUID: l4csH+IyQr2mmorGM+Ocdw==
X-CSE-MsgGUID: 4SSROFkOQxmt+I1rrYfHgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="261200738"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2026 07:13:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpnz2-0000000019t-0pne;
	Fri, 31 Jul 2026 14:13:08 +0000
Date: Fri, 31 Jul 2026 22:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 6435d21cbd42fea6c66dfd4cfef7d58b9612497e
Message-ID: <202607312239.MBLkfxma-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 6435d21cbd42fea6c66dfd4cfef7d58b9612497e  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

elapsed time: 797m

configs tested: 123
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260731    clang-17
arc                  randconfig-001-20260731    gcc-8.5.0
arc                  randconfig-002-20260731    clang-17
arc                  randconfig-002-20260731    gcc-16.1.0
arm                           mmp2_defconfig    gcc-16.1.0
arm                  randconfig-001-20260731    clang-17
arm                  randconfig-002-20260731    clang-17
arm                  randconfig-002-20260731    clang-19
arm                  randconfig-003-20260731    clang-17
arm                  randconfig-003-20260731    clang-24
arm                  randconfig-004-20260731    clang-17
arm                  randconfig-004-20260731    clang-24
arm64                randconfig-001-20260731    gcc-8.5.0
arm64                randconfig-002-20260731    gcc-8.5.0
arm64                randconfig-003-20260731    gcc-8.5.0
arm64                randconfig-004-20260731    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260731    gcc-8.5.0
csky                 randconfig-002-20260731    gcc-8.5.0
hexagon                       randconfig-001    clang-24
hexagon              randconfig-001-20260731    clang-24
hexagon              randconfig-002-20260731    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260731    clang-22
i386       buildonly-randconfig-001-20260731    gcc-14
i386       buildonly-randconfig-002-20260731    clang-22
i386       buildonly-randconfig-003-20260731    clang-22
i386       buildonly-randconfig-004-20260731    clang-22
i386       buildonly-randconfig-004-20260731    gcc-13
i386       buildonly-randconfig-005-20260731    clang-22
i386       buildonly-randconfig-006-20260731    clang-22
i386       buildonly-randconfig-006-20260731    gcc-14
i386                 randconfig-001-20260731    gcc-14
i386                 randconfig-002-20260731    gcc-14
i386                 randconfig-003-20260731    gcc-14
i386                 randconfig-004-20260731    gcc-14
i386                 randconfig-005-20260731    gcc-14
i386                 randconfig-006-20260731    gcc-14
i386                 randconfig-007-20260731    gcc-14
i386                 randconfig-011-20260731    clang-22
i386                 randconfig-012-20260731    clang-22
i386                 randconfig-013-20260731    clang-22
i386                 randconfig-013-20260731    gcc-14
i386                 randconfig-014-20260731    clang-22
i386                 randconfig-014-20260731    gcc-14
i386                 randconfig-015-20260731    clang-22
i386                 randconfig-015-20260731    gcc-14
i386                 randconfig-016-20260731    clang-22
i386                 randconfig-016-20260731    gcc-14
i386                 randconfig-017-20260731    clang-22
i386                 randconfig-017-20260731    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260731    clang-24
loongarch            randconfig-002-20260731    clang-24
mips                decstation_r4k_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260731    clang-24
nios2                randconfig-002-20260731    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260731    gcc-8.5.0
parisc               randconfig-002-20260731    gcc-13.4.0
parisc               randconfig-002-20260731    gcc-8.5.0
powerpc                mpc834x_itx_defconfig    clang-24
powerpc              randconfig-001-20260731    clang-17
powerpc              randconfig-001-20260731    gcc-8.5.0
powerpc              randconfig-002-20260731    clang-24
powerpc              randconfig-002-20260731    gcc-8.5.0
powerpc64            randconfig-001-20260731    gcc-8.5.0
powerpc64            randconfig-002-20260731    gcc-8.5.0
riscv                   nommu_k210_defconfig    clang-24
riscv                         randconfig-001    clang-19
riscv                randconfig-001-20260731    clang-19
riscv                randconfig-002-20260731    clang-19
s390                 randconfig-001-20260731    clang-19
s390                 randconfig-002-20260731    clang-19
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260731    clang-19
sh                   randconfig-002-20260731    clang-19
sparc                         randconfig-001    gcc-14
sparc                randconfig-001-20260731    gcc-14
sparc                randconfig-002-20260731    gcc-14
sparc64              randconfig-001-20260731    gcc-14
sparc64              randconfig-002-20260731    gcc-14
um                   randconfig-001-20260731    gcc-14
um                   randconfig-002-20260731    gcc-14
x86_64     buildonly-randconfig-001-20260731    gcc-14
x86_64     buildonly-randconfig-002-20260731    gcc-14
x86_64     buildonly-randconfig-003-20260731    gcc-14
x86_64     buildonly-randconfig-004-20260731    gcc-14
x86_64     buildonly-randconfig-005-20260731    gcc-14
x86_64     buildonly-randconfig-006-20260731    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260731    gcc-14
x86_64               randconfig-002-20260731    gcc-14
x86_64               randconfig-003-20260731    gcc-14
x86_64               randconfig-004-20260731    gcc-14
x86_64               randconfig-005-20260731    gcc-14
x86_64               randconfig-006-20260731    gcc-14
x86_64               randconfig-011-20260731    gcc-14
x86_64               randconfig-012-20260731    gcc-14
x86_64               randconfig-013-20260731    gcc-14
x86_64               randconfig-014-20260731    gcc-14
x86_64               randconfig-015-20260731    gcc-14
x86_64               randconfig-016-20260731    gcc-14
x86_64               randconfig-071-20260731    clang-22
x86_64               randconfig-072-20260731    clang-22
x86_64               randconfig-073-20260731    clang-22
x86_64               randconfig-074-20260731    clang-22
x86_64               randconfig-075-20260731    clang-22
x86_64               randconfig-076-20260731    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260731    gcc-14
xtensa               randconfig-002-20260731    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
