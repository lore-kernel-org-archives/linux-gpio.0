Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43C440637
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 23:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787180542; cv=none; b=V4JeUWZHeagL+1QMJ2X/Pm34rbQZUIadGlRI8SoxTFlSk8xMpD9baysYfXb+1Yd8OQiUQBuAQLYXsAIFI/kBcHXVKTZQUBd2T4PeY+lVuKRKbltwiKUXvBINffTbRSfOY8ZqbHejQGOZvJozg1pEZ1xrPxigbGrZrxTbnZ8Sghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787180542; c=relaxed/simple;
	bh=7PBqj65H5cqm5os+MRAq2vSpOftKj/kQhBNpRGqD7BU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LlrGCUECdC7toUZLYQsahzrF6G1IUp+NJDrnFOcT2y8xaOkA0m0lebu2qPWPwY3YaL0Wpo5ZsAg2Fpzlb3La7x3x8BTSkqso6HfgCWR/7FZsupXt019BxTWqy6bTkzHj1B5ls+bubbf9ljWG3WmZku9isYfUtI38WkVaGejZWNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6Usju6V; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6Usju6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787180541; x=1818716541;
  h=date:from:to:cc:subject:message-id;
  bh=7PBqj65H5cqm5os+MRAq2vSpOftKj/kQhBNpRGqD7BU=;
  b=i6Usju6VDitmU1kLVAn+8titJiQ9PszBEu3corFwoRpMh1vG/yAPssAr
   l+4Y5r3SZeRItoLUCO/uFNe+Mc+1ke/uNmjEdZXJG2MOg+twiXNXVzSbZ
   xm2xRlmMgqfHy28tLi4v8tkROArY6fdY0RvJAXHQr0FOibscKImY5S+VL
   kWchXhjUvb3Jr+B5m9135YKSe7ES2BUp/uznjIpKtAtcGWgNNS6PBpCvL
   CTI3va5CCpK3G9dUz4pACNliBa2EJ0hQuHRdEwTtxPovPhHB3EcZBDBtb
   /oB0s1QLfNAQ9n/iCc6iFUBqcKTdOIAjUestwm1sVZOJ5S51EK0755N2/
   A==;
X-CSE-ConnectionGUID: afEXDpcFTdapgUWr7uC5jw==
X-CSE-MsgGUID: IUpUIlLhQiK/+91dIiKeRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98869623"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="98869623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 16:02:21 -0700
X-CSE-ConnectionGUID: E8nxrk28STGI+3HgEMHeJg==
X-CSE-MsgGUID: tIDMxxGvSOmUJSwlUfbhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="266334843"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2026 16:02:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwpIX-00000000goT-00wj;
	Wed, 19 Aug 2026 23:02:17 +0000
Date: Thu, 20 Aug 2026 07:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 146cc263e457ff6055fe7829e4f4f4b0b5d5dd86
Message-ID: <202608200750.PdddWjpO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 146cc263e457ff6055fe7829e4f4f4b0b5d5dd86  Merge tag 'v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next

elapsed time: 1471m

configs tested: 217
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-11.5.0
arc                  randconfig-001-20260819    gcc-11.5.0
arc                  randconfig-001-20260820    clang-24
arc                  randconfig-002-20260819    gcc-11.5.0
arc                  randconfig-002-20260820    clang-24
arm                  randconfig-001-20260819    gcc-11.5.0
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-002-20260819    gcc-11.5.0
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-003-20260819    gcc-11.5.0
arm                  randconfig-003-20260820    clang-24
arm                  randconfig-004-20260819    gcc-11.5.0
arm                  randconfig-004-20260820    clang-24
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-11.5.0
arm64                randconfig-001-20260819    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-9.5.0
arm64                randconfig-001-20260820    clang-24
arm64                randconfig-002-20260819    clang-17
arm64                randconfig-002-20260819    gcc-14.3.0
arm64                randconfig-002-20260819    gcc-9.5.0
arm64                randconfig-002-20260820    clang-24
arm64                randconfig-003-20260819    clang-17
arm64                randconfig-003-20260819    gcc-14.3.0
arm64                randconfig-003-20260819    gcc-9.5.0
arm64                randconfig-003-20260820    clang-24
arm64                randconfig-004-20260819    gcc-14.3.0
arm64                randconfig-004-20260819    gcc-8.5.0
arm64                randconfig-004-20260819    gcc-9.5.0
arm64                randconfig-004-20260820    clang-24
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260819    gcc-14.3.0
csky                 randconfig-001-20260819    gcc-9.5.0
csky                 randconfig-001-20260820    clang-24
csky                 randconfig-002-20260819    gcc-11.5.0
csky                 randconfig-002-20260819    gcc-14.3.0
csky                 randconfig-002-20260819    gcc-9.5.0
csky                 randconfig-002-20260820    clang-24
hexagon                       randconfig-001    gcc-11.5.0
hexagon              randconfig-001-20260819    gcc-11.5.0
hexagon              randconfig-001-20260820    gcc-14.3.0
hexagon              randconfig-002-20260819    gcc-11.5.0
hexagon              randconfig-002-20260820    gcc-14.3.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260819    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-002-20260819    gcc-14
i386       buildonly-randconfig-002-20260820    gcc-14
i386       buildonly-randconfig-003-20260819    gcc-14
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-004-20260819    gcc-14
i386       buildonly-randconfig-004-20260820    gcc-14
i386       buildonly-randconfig-005-20260819    gcc-14
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-006-20260819    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-14
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260819    gcc-14
i386                 randconfig-001-20260820    clang-22
i386                 randconfig-002-20260819    gcc-14
i386                 randconfig-002-20260820    clang-22
i386                 randconfig-003-20260819    gcc-14
i386                 randconfig-003-20260820    clang-22
i386                 randconfig-004-20260819    gcc-14
i386                 randconfig-004-20260820    clang-22
i386                 randconfig-005-20260819    gcc-14
i386                 randconfig-005-20260820    clang-22
i386                 randconfig-006-20260819    gcc-14
i386                 randconfig-006-20260820    clang-22
i386                 randconfig-007-20260819    gcc-14
i386                 randconfig-007-20260820    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260819    gcc-13
i386                 randconfig-011-20260819    gcc-14
i386                 randconfig-011-20260820    gcc-14
i386                 randconfig-012-20260819    gcc-14
i386                 randconfig-012-20260820    gcc-14
i386                 randconfig-013-20260819    gcc-14
i386                 randconfig-013-20260820    gcc-14
i386                 randconfig-014-20260819    clang-22
i386                 randconfig-014-20260819    gcc-14
i386                 randconfig-014-20260820    gcc-14
i386                 randconfig-015-20260819    clang-22
i386                 randconfig-015-20260819    gcc-14
i386                 randconfig-015-20260820    gcc-14
i386                 randconfig-016-20260819    clang-22
i386                 randconfig-016-20260819    gcc-14
i386                 randconfig-016-20260820    gcc-14
i386                 randconfig-017-20260819    clang-22
i386                 randconfig-017-20260819    gcc-14
i386                 randconfig-017-20260820    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260819    gcc-11.5.0
loongarch            randconfig-001-20260820    gcc-14.3.0
loongarch            randconfig-002-20260819    gcc-11.5.0
loongarch            randconfig-002-20260820    gcc-14.3.0
m68k                         atari_defconfig    gcc-16.1.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260819    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-14.3.0
nios2                randconfig-002-20260819    gcc-11.5.0
nios2                randconfig-002-20260820    gcc-14.3.0
openrisc        de0_nano_multicore_defconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    clang-24
parisc               randconfig-001-20260819    clang-24
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-002-20260819    clang-24
parisc               randconfig-002-20260820    gcc-8.5.0
powerpc                        ps3_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260819    clang-24
powerpc              randconfig-001-20260820    gcc-8.5.0
powerpc              randconfig-002-20260819    clang-24
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc                   sam440ep_defconfig    gcc-16.1.0
powerpc                    sequoia_defconfig    clang-24
powerpc64            randconfig-001-20260819    clang-24
powerpc64            randconfig-001-20260820    gcc-8.5.0
powerpc64            randconfig-002-20260819    clang-24
powerpc64            randconfig-002-20260820    gcc-8.5.0
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260819    clang-24
riscv                randconfig-001-20260820    clang-24
riscv                randconfig-002-20260819    clang-24
riscv                randconfig-002-20260820    clang-24
s390                 randconfig-001-20260819    clang-24
s390                 randconfig-001-20260820    clang-24
s390                 randconfig-002-20260819    clang-24
s390                 randconfig-002-20260820    clang-24
sh                                 defconfig    gcc-16.1.0
sh                kfr2r09-romimage_defconfig    gcc-16.1.0
sh                   randconfig-001-20260819    clang-24
sh                   randconfig-001-20260820    clang-24
sh                   randconfig-002-20260819    clang-24
sh                   randconfig-002-20260820    clang-24
sh                     rts7751r2d1_defconfig    gcc-16.1.0
sparc                randconfig-001-20260819    gcc-10.5.0
sparc                randconfig-001-20260820    gcc-13.4.0
sparc                randconfig-002-20260819    gcc-10.5.0
sparc                randconfig-002-20260820    gcc-13.4.0
sparc                      sparc32_defconfig    gcc-16.1.0
sparc64              randconfig-001-20260819    gcc-10.5.0
sparc64              randconfig-001-20260820    gcc-13.4.0
sparc64              randconfig-002-20260819    gcc-10.5.0
sparc64              randconfig-002-20260820    gcc-13.4.0
um                   randconfig-001-20260819    gcc-10.5.0
um                   randconfig-001-20260820    gcc-13.4.0
um                   randconfig-002-20260819    gcc-10.5.0
um                   randconfig-002-20260820    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260819    gcc-14
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260819    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260819    gcc-14
x86_64     buildonly-randconfig-003-20260820    gcc-14
x86_64     buildonly-randconfig-004-20260819    gcc-14
x86_64     buildonly-randconfig-004-20260820    gcc-14
x86_64     buildonly-randconfig-005-20260819    gcc-14
x86_64     buildonly-randconfig-005-20260820    gcc-14
x86_64     buildonly-randconfig-006-20260819    gcc-14
x86_64     buildonly-randconfig-006-20260820    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260819    gcc-14
x86_64               randconfig-001-20260820    clang-22
x86_64               randconfig-002-20260819    gcc-14
x86_64               randconfig-002-20260820    clang-22
x86_64               randconfig-003-20260819    gcc-14
x86_64               randconfig-003-20260820    clang-22
x86_64               randconfig-004-20260819    gcc-14
x86_64               randconfig-004-20260820    clang-22
x86_64               randconfig-005-20260819    gcc-14
x86_64               randconfig-005-20260820    clang-22
x86_64               randconfig-006-20260819    gcc-14
x86_64               randconfig-006-20260820    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260819    clang-22
x86_64               randconfig-011-20260820    clang-22
x86_64               randconfig-012-20260819    clang-22
x86_64               randconfig-012-20260820    clang-22
x86_64               randconfig-013-20260819    clang-22
x86_64               randconfig-013-20260820    clang-22
x86_64               randconfig-014-20260819    clang-22
x86_64               randconfig-014-20260820    clang-22
x86_64               randconfig-015-20260819    clang-22
x86_64               randconfig-015-20260820    clang-22
x86_64               randconfig-016-20260819    clang-22
x86_64               randconfig-016-20260820    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260819    clang-22
x86_64               randconfig-071-20260820    clang-22
x86_64               randconfig-072-20260819    clang-22
x86_64               randconfig-072-20260820    clang-22
x86_64               randconfig-073-20260819    clang-22
x86_64               randconfig-073-20260820    clang-22
x86_64               randconfig-074-20260819    clang-22
x86_64               randconfig-074-20260820    clang-22
x86_64               randconfig-075-20260819    clang-22
x86_64               randconfig-075-20260820    clang-22
x86_64               randconfig-076-20260819    clang-22
x86_64               randconfig-076-20260820    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260819    gcc-10.5.0
xtensa               randconfig-001-20260820    gcc-13.4.0
xtensa               randconfig-002-20260819    gcc-10.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
