Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CD39E164
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787018270; cv=none; b=tEqpnrKe8A8pIqB9M4TRzb6W7Zy6DCFJgJuGV+utvR5BPeVScV6lJpn8muh2Di+JHNdz3YPGwAQrpZsIMGUb+lmYZIOyVtUhYzDpm+10iagD63RuAiDM3IjXqrHf4aD+uwIBADAkRbyQgqoYHbNHmYLwmOzz+2Kuz7KmVxj92fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787018270; c=relaxed/simple;
	bh=E9lfIAFwht/ny97E1isbYVJ4eGj4TnjIhh2H9nPeskQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o2eu8P4UF/aw3Mjza490tSXQBnvKvvxCwZ2S4tnMtMPMd+G3BYF1OUoyIpyEBC1kHcarzkvZqgEKmW8xkNuOALvp3c0yg7PryMcAxFbKAjcmOxoVsiLuzwXFocYD+egYH8XxSqhD/Y6oKfJT0+cfO4wIG8XwsssKRXYvyqvC4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbpuZwie; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbpuZwie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787018267; x=1818554267;
  h=date:from:to:cc:subject:message-id;
  bh=E9lfIAFwht/ny97E1isbYVJ4eGj4TnjIhh2H9nPeskQ=;
  b=PbpuZwieoIKTiMg51JC8/WarUrxyKaYjCtPd67GkIXnB6W2P7YLOh7MU
   8tptek0BqZe2jR64ifcl/5zeGNgiU7rERNHfbsdRsNjRafOtDq1QbtO5n
   y3X/Kb4ATyywPcQ/o8J5LsY8kVpCoy0amhCO5gNKcqUFpARdQQHfTYkag
   jNkTa3Pk3k3MNTpnW/8DYrEIY8OrwdQSTMPj5eNAl0Dp5N0Jg51++XFQw
   ZHHpKcgprYKSJaDzeJTMusatVS5BOUzzVJiyGHHkR5BCbuwMSRodyIgUQ
   0dOeXTFPMXOSCibQJwCv7YF7mI7eHFB+S+VDzyWJIH4ySWIsumsmkopvE
   A==;
X-CSE-ConnectionGUID: XHRBYEo5SgOSLfM8mzEU2w==
X-CSE-MsgGUID: Lavnwrx5SCmdTJwjElWMwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110284964"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110284964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 18:57:41 -0700
X-CSE-ConnectionGUID: FTiytZCqTx+w+A2woVDJFA==
X-CSE-MsgGUID: Frkp7aKGQBOOJtajG+cUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268915311"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Aug 2026 18:57:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww958-00000000e1Y-0KSY;
	Tue, 18 Aug 2026 01:57:38 +0000
Date: Tue, 18 Aug 2026 09:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 d067f0f4c96cb5402a111cf649b7bf9c5771ec74
Message-ID: <202608180904.sP3hd2ld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: d067f0f4c96cb5402a111cf649b7bf9c5771ec74  Merge tag 'pinctrl-qcom-updates-for-v7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

elapsed time: 1926m

configs tested: 134
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-8.5.0
arc                  randconfig-001-20260817    gcc-8.5.0
arc                  randconfig-002-20260817    gcc-8.5.0
arc                          tb10x_defconfig    gcc-16.1.0
arm                     jornada720_defconfig    clang-24
arm                  randconfig-001-20260817    gcc-8.5.0
arm                  randconfig-002-20260817    gcc-8.5.0
arm                  randconfig-003-20260817    gcc-8.5.0
arm                  randconfig-004-20260817    gcc-8.5.0
arm64                randconfig-001-20260817    gcc-11.5.0
arm64                randconfig-001-20260818    gcc-12.5.0
arm64                randconfig-002-20260817    gcc-11.5.0
arm64                randconfig-002-20260818    gcc-12.5.0
arm64                randconfig-003-20260817    gcc-11.5.0
arm64                randconfig-003-20260818    gcc-12.5.0
arm64                randconfig-004-20260817    gcc-11.5.0
arm64                randconfig-004-20260818    gcc-12.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260817    gcc-11.5.0
csky                 randconfig-001-20260818    gcc-12.5.0
csky                 randconfig-002-20260817    gcc-11.5.0
csky                 randconfig-002-20260818    gcc-12.5.0
hexagon              randconfig-001-20260817    gcc-8.5.0
hexagon              randconfig-002-20260817    gcc-8.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-12
i386       buildonly-randconfig-001-20260817    gcc-12
i386       buildonly-randconfig-002-20260817    gcc-12
i386       buildonly-randconfig-003-20260817    gcc-12
i386       buildonly-randconfig-004-20260817    gcc-12
i386       buildonly-randconfig-005-20260817    gcc-12
i386       buildonly-randconfig-006-20260817    gcc-12
i386                 randconfig-001-20260817    gcc-14
i386                 randconfig-002-20260817    gcc-14
i386                 randconfig-003-20260817    gcc-14
i386                 randconfig-004-20260817    gcc-14
i386                 randconfig-005-20260817    gcc-14
i386                 randconfig-006-20260817    gcc-14
i386                 randconfig-007-20260817    gcc-14
i386                 randconfig-011-20260817    clang-22
i386                 randconfig-012-20260817    clang-22
i386                 randconfig-013-20260817    clang-22
i386                 randconfig-014-20260817    clang-22
i386                 randconfig-015-20260817    clang-22
i386                 randconfig-016-20260817    clang-22
i386                 randconfig-017-20260817    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260817    gcc-8.5.0
loongarch            randconfig-002-20260817    gcc-8.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260817    gcc-8.5.0
nios2                randconfig-002-20260817    gcc-8.5.0
openrisc                  de0_nano_defconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-13.4.0
parisc               randconfig-001-20260817    gcc-13.4.0
parisc               randconfig-001-20260818    clang-24
parisc               randconfig-002-20260817    gcc-13.4.0
parisc               randconfig-002-20260818    clang-24
powerpc                     arches_defconfig    gcc-16.1.0
powerpc                  microwatt_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260817    gcc-13.4.0
powerpc              randconfig-001-20260818    clang-24
powerpc              randconfig-002-20260817    gcc-13.4.0
powerpc              randconfig-002-20260818    clang-24
powerpc64            randconfig-001-20260817    gcc-13.4.0
powerpc64            randconfig-001-20260818    clang-24
powerpc64            randconfig-002-20260817    gcc-13.4.0
powerpc64            randconfig-002-20260818    clang-24
riscv                         randconfig-001    clang-18
riscv                         randconfig-001    gcc-10.5.0
riscv                randconfig-001-20260817    gcc-10.5.0
riscv                randconfig-001-20260818    clang-18
riscv                randconfig-002-20260817    gcc-10.5.0
riscv                randconfig-002-20260818    clang-18
s390                 randconfig-001-20260817    gcc-10.5.0
s390                 randconfig-001-20260818    clang-18
s390                 randconfig-002-20260817    gcc-10.5.0
s390                 randconfig-002-20260818    clang-18
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260817    gcc-10.5.0
sh                   randconfig-001-20260818    clang-18
sh                   randconfig-002-20260817    gcc-10.5.0
sh                   randconfig-002-20260818    clang-18
sh                          se7619_defconfig    gcc-16.1.0
sparc                randconfig-001-20260818    gcc-11.5.0
sparc                randconfig-002-20260818    gcc-11.5.0
sparc64              randconfig-001-20260818    gcc-11.5.0
sparc64              randconfig-002-20260818    gcc-11.5.0
um                   randconfig-001-20260818    gcc-11.5.0
um                   randconfig-002-20260818    gcc-11.5.0
um                          x86_64_defconfig    clang-24
x86_64     buildonly-randconfig-001-20260817    gcc-14
x86_64     buildonly-randconfig-001-20260818    clang-22
x86_64     buildonly-randconfig-002-20260817    gcc-14
x86_64     buildonly-randconfig-002-20260818    clang-22
x86_64     buildonly-randconfig-003-20260817    gcc-14
x86_64     buildonly-randconfig-003-20260818    clang-22
x86_64     buildonly-randconfig-004-20260817    gcc-14
x86_64     buildonly-randconfig-004-20260818    clang-22
x86_64     buildonly-randconfig-005-20260817    gcc-14
x86_64     buildonly-randconfig-005-20260818    clang-22
x86_64     buildonly-randconfig-006-20260817    gcc-14
x86_64     buildonly-randconfig-006-20260818    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260817    clang-22
x86_64               randconfig-002-20260817    clang-22
x86_64               randconfig-003-20260817    clang-22
x86_64               randconfig-004-20260817    clang-22
x86_64               randconfig-005-20260817    clang-22
x86_64               randconfig-006-20260817    clang-22
x86_64               randconfig-011-20260817    clang-22
x86_64               randconfig-012-20260817    clang-22
x86_64               randconfig-013-20260817    clang-22
x86_64               randconfig-014-20260817    clang-22
x86_64               randconfig-015-20260817    clang-22
x86_64               randconfig-016-20260817    clang-22
x86_64               randconfig-071-20260817    clang-22
x86_64               randconfig-072-20260817    clang-22
x86_64               randconfig-073-20260817    clang-22
x86_64               randconfig-074-20260817    clang-22
x86_64               randconfig-075-20260817    clang-22
x86_64               randconfig-076-20260817    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260818    gcc-11.5.0
xtensa               randconfig-002-20260818    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
