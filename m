Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432D386450
	for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785624845; cv=none; b=B+xIVF0ZrA3bT9FqnW0cplgN2mtUhnqdkkgX/qkZyRIhjhG7zE0tmZ/JkzIAqGuKlaoB5c4cWFkXrJy1MlMtdSydkPOFe5vA81Oiq2Ye5byHrYsBSG9yLnUBAkR4v02zCM3uHOik7FGO6IMYybk1ocSzTWOqeMBpFdSzPLwM5pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785624845; c=relaxed/simple;
	bh=LZt+rpplwKuNcZ8LfghwfatYbteMtJG9bxUavqB+R0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jHtHzGtB9z1779F5U09O2oPJy7qhmuMWwOiIZxPtxDWZtOOI8ltFAo0bbHlW9WfXw4d8mcxyBjh2QJ6gzxhqo38aAzXB8OLiqFzdDCONy2AZObsNYxAigaaz9930FxDSgz7WpbrfSSfdyZAChGS1LqexKTOVhXwB58iOWJ9XGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vs3iBbvk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs3iBbvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785624844; x=1817160844;
  h=date:from:to:cc:subject:message-id;
  bh=LZt+rpplwKuNcZ8LfghwfatYbteMtJG9bxUavqB+R0s=;
  b=Vs3iBbvkTmb1XddLT+t1JtEjmiuO0N2HFoXhxNYVyuO18aLBy7kWPJTP
   T0CQyhlVHDwoSxWTWYiDlbnVSvq2T/2WlDcv3K84K3//9hpeitJc1El3R
   4ISqx3ODHsIrzara7WFQMl6bw7m8xIX8HusmV1hG+5TVSYqRr0CZKAY5Z
   Au4STk3DxwP0m3xGDLjUWxrNXKRiAZUxvGGtc1xFn1k4JvHvbhJUPE/Qg
   y1ZNerWW2QJrT2oXlo+v2rA6v/y9zP7LKAz14NC1r2IsGlxrdcrm3ufD/
   xNKiZhE81IK8z6+Z+DJAHYR7cJ6HTTWMRDA0sCGj/SabGX6QyRlVQ+hBe
   g==;
X-CSE-ConnectionGUID: Vl0lioGARc6+89df+ZW4YA==
X-CSE-MsgGUID: 3W5DFYRTQaiE3ISuwNAQ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86295620"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86295620"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 15:54:02 -0700
X-CSE-ConnectionGUID: pNBli3aqQD6pi/vumR7jYw==
X-CSE-MsgGUID: 9We3xrGFQhuKRdszdYAg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="264694624"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2026 15:54:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqIab-0000000040D-3RBC;
	Sat, 01 Aug 2026 22:53:57 +0000
Date: Sun, 02 Aug 2026 06:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 49b2ab5a10efa91e317d1295581d118cd61dff07
Message-ID: <202608020638.e5bnEYmv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 49b2ab5a10efa91e317d1295581d118cd61dff07  Merge branch 'devel' into for-next

elapsed time: 752m

configs tested: 195
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-8.5.0
arc                  randconfig-001-20260801    gcc-12.5.0
arc                  randconfig-001-20260801    gcc-14.3.0
arc                  randconfig-001-20260802    gcc-15.2.0
arc                  randconfig-002-20260801    gcc-12.5.0
arc                  randconfig-002-20260802    gcc-15.2.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260801    clang-24
arm                  randconfig-001-20260801    gcc-12.5.0
arm                  randconfig-001-20260802    gcc-15.2.0
arm                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-002-20260801    gcc-8.5.0
arm                  randconfig-002-20260802    gcc-15.2.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-003-20260802    gcc-15.2.0
arm                  randconfig-004-20260801    clang-18
arm                  randconfig-004-20260801    gcc-12.5.0
arm                  randconfig-004-20260802    gcc-15.2.0
arm64                         randconfig-001    gcc-10.5.0
arm64                randconfig-001-20260801    gcc-10.5.0
arm64                randconfig-001-20260802    gcc-9.5.0
arm64                randconfig-002-20260801    gcc-10.5.0
arm64                randconfig-002-20260802    gcc-9.5.0
arm64                randconfig-003-20260801    gcc-10.5.0
arm64                randconfig-003-20260802    gcc-9.5.0
arm64                randconfig-004-20260801    gcc-10.5.0
arm64                randconfig-004-20260802    gcc-9.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-10.5.0
csky                 randconfig-001-20260802    gcc-9.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
csky                 randconfig-002-20260802    gcc-9.5.0
hexagon              randconfig-001-20260801    clang-24
hexagon              randconfig-001-20260801    gcc-16.1.0
hexagon              randconfig-001-20260802    clang-24
hexagon              randconfig-002-20260801    clang-17
hexagon              randconfig-002-20260801    gcc-16.1.0
hexagon              randconfig-002-20260802    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260801    gcc-14
i386       buildonly-randconfig-001-20260802    gcc-14
i386       buildonly-randconfig-002-20260801    gcc-14
i386       buildonly-randconfig-002-20260802    gcc-14
i386       buildonly-randconfig-003-20260801    gcc-14
i386       buildonly-randconfig-003-20260802    gcc-14
i386       buildonly-randconfig-004-20260801    gcc-14
i386       buildonly-randconfig-004-20260802    gcc-14
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-005-20260802    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
i386       buildonly-randconfig-006-20260802    gcc-14
i386                 randconfig-001-20260801    clang-22
i386                 randconfig-002-20260801    clang-22
i386                 randconfig-003-20260801    clang-22
i386                 randconfig-004-20260801    clang-22
i386                 randconfig-005-20260801    clang-22
i386                 randconfig-006-20260801    clang-22
i386                 randconfig-007-20260801    clang-22
i386                 randconfig-011-20260801    gcc-14
i386                 randconfig-012-20260801    gcc-14
i386                 randconfig-013-20260801    gcc-14
i386                 randconfig-014-20260801    gcc-14
i386                 randconfig-015-20260801    gcc-14
i386                 randconfig-016-20260801    gcc-14
i386                 randconfig-017-20260801    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260801    clang-18
loongarch            randconfig-001-20260801    gcc-16.1.0
loongarch            randconfig-001-20260802    clang-24
loongarch            randconfig-002-20260801    gcc-16.1.0
loongarch            randconfig-002-20260802    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260801    gcc-16.1.0
nios2                randconfig-001-20260801    gcc-8.5.0
nios2                randconfig-001-20260802    clang-24
nios2                randconfig-002-20260801    gcc-11.5.0
nios2                randconfig-002-20260801    gcc-16.1.0
nios2                randconfig-002-20260802    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260801    gcc-11.5.0
parisc               randconfig-001-20260801    gcc-9.5.0
parisc               randconfig-001-20260802    gcc-14.3.0
parisc               randconfig-002-20260801    gcc-9.5.0
parisc               randconfig-002-20260802    gcc-14.3.0
powerpc                  bluestone_defconfig    clang-24
powerpc                  lite5200b_defconfig    clang-24
powerpc              randconfig-001-20260801    clang-20
powerpc              randconfig-001-20260801    gcc-9.5.0
powerpc              randconfig-001-20260802    gcc-14.3.0
powerpc              randconfig-002-20260801    gcc-10.5.0
powerpc              randconfig-002-20260801    gcc-9.5.0
powerpc              randconfig-002-20260802    gcc-14.3.0
powerpc64            randconfig-001-20260801    clang-24
powerpc64            randconfig-001-20260801    gcc-9.5.0
powerpc64            randconfig-001-20260802    gcc-14.3.0
powerpc64            randconfig-002-20260801    clang-24
powerpc64            randconfig-002-20260801    gcc-9.5.0
powerpc64            randconfig-002-20260802    gcc-14.3.0
riscv                         randconfig-001    gcc-14.3.0
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-001-20260802    gcc-13.4.0
riscv                randconfig-002-20260801    gcc-14.3.0
riscv                randconfig-002-20260802    gcc-13.4.0
s390                 randconfig-001-20260801    gcc-14.3.0
s390                 randconfig-001-20260802    gcc-13.4.0
s390                 randconfig-002-20260801    gcc-14.3.0
s390                 randconfig-002-20260802    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-14.3.0
sh                   randconfig-001-20260802    gcc-13.4.0
sh                   randconfig-002-20260801    gcc-14.3.0
sh                   randconfig-002-20260802    gcc-13.4.0
sh                       sh7757lcr_defconfig    gcc-16.1.0
sparc                randconfig-001-20260801    gcc-11.5.0
sparc                randconfig-001-20260802    gcc-12.5.0
sparc                randconfig-002-20260801    gcc-11.5.0
sparc                randconfig-002-20260802    gcc-12.5.0
sparc64              randconfig-001-20260801    gcc-11.5.0
sparc64              randconfig-001-20260802    gcc-12.5.0
sparc64              randconfig-002-20260801    gcc-11.5.0
sparc64              randconfig-002-20260802    gcc-12.5.0
um                   randconfig-001-20260801    gcc-11.5.0
um                   randconfig-001-20260802    gcc-12.5.0
um                   randconfig-002-20260801    gcc-11.5.0
um                   randconfig-002-20260802    gcc-12.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-001-20260802    gcc-12
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-002-20260802    gcc-12
x86_64     buildonly-randconfig-003-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    gcc-13
x86_64     buildonly-randconfig-003-20260802    gcc-12
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-004-20260802    gcc-12
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-005-20260802    gcc-12
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64     buildonly-randconfig-006-20260802    gcc-12
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260801    gcc-14
x86_64               randconfig-001-20260802    clang-22
x86_64               randconfig-002-20260801    gcc-14
x86_64               randconfig-002-20260802    clang-22
x86_64               randconfig-003-20260801    gcc-14
x86_64               randconfig-003-20260802    clang-22
x86_64               randconfig-004-20260801    gcc-14
x86_64               randconfig-004-20260802    clang-22
x86_64               randconfig-005-20260801    gcc-14
x86_64               randconfig-005-20260802    clang-22
x86_64               randconfig-006-20260801    gcc-14
x86_64               randconfig-006-20260802    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260801    clang-22
x86_64               randconfig-011-20260802    clang-22
x86_64               randconfig-012-20260801    clang-22
x86_64               randconfig-012-20260801    gcc-14
x86_64               randconfig-012-20260802    clang-22
x86_64               randconfig-013-20260801    clang-22
x86_64               randconfig-013-20260802    clang-22
x86_64               randconfig-014-20260801    clang-22
x86_64               randconfig-014-20260801    gcc-14
x86_64               randconfig-014-20260802    clang-22
x86_64               randconfig-015-20260801    clang-22
x86_64               randconfig-015-20260802    clang-22
x86_64               randconfig-016-20260801    clang-22
x86_64               randconfig-016-20260802    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260801    clang-22
x86_64               randconfig-071-20260802    gcc-12
x86_64               randconfig-072-20260801    clang-22
x86_64               randconfig-072-20260802    gcc-12
x86_64               randconfig-073-20260801    clang-22
x86_64               randconfig-073-20260802    gcc-12
x86_64               randconfig-074-20260801    clang-22
x86_64               randconfig-074-20260802    gcc-12
x86_64               randconfig-075-20260801    clang-22
x86_64               randconfig-075-20260802    gcc-12
x86_64               randconfig-076-20260801    clang-22
x86_64               randconfig-076-20260802    gcc-12
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260801    gcc-11.5.0
xtensa               randconfig-001-20260802    gcc-12.5.0
xtensa               randconfig-002-20260801    gcc-11.5.0
xtensa               randconfig-002-20260802    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
