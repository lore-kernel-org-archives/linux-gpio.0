Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451845D183
	for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2026 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931337; cv=none; b=l/7IKIyJsN6zC/Gomcoi94x3RNrUOxDI/n9OcIZmwPA92Ve2a1oeR6AgZoZssnpDqvmBmATP7ZuOZO9fCBeQ9WBfKJ/UhIiCAGR4WCBvXei13fs01A+MqG3PK7NwAilOUVN3W1ekNWwfLBGaw2ZbGxWVeaCpXW7imT/g82YPEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931337; c=relaxed/simple;
	bh=5vDKBywu5NXWhvNr2Oh4QQmVjvHKs7vkui0Oc8XizEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=raTjkhgZM5tsMlxtWsgM7fYB8A5ZmzgWa1bdK/CGm1bFktRDx/Qi3EJI7GlMdmcjnxvI5hvbrmzJNaFLZ5HoEVB287mR53BYqhp0N3rmBKqAryDBfyzatJrKy9xWdqbxj6QVdLufYFmIJXSserumQcFe0Yz7fBvYc9Atu2Lck4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sb/5WY3u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sb/5WY3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785931329; x=1817467329;
  h=date:from:to:cc:subject:message-id;
  bh=5vDKBywu5NXWhvNr2Oh4QQmVjvHKs7vkui0Oc8XizEo=;
  b=Sb/5WY3u9pY3rN83FP+Lj7raFIEA8vQi1UYpc94LWCtSkOy+AsMlj2aH
   L6dJzrjNad4j3rEo4blMehlo/pKJjxHLK7nXSeVe+TKTJ6Bl5rIzA/PMC
   EStyyyifvATAMk5GeXhYZsCCUitRfQQjZ512iQ5odZKo2lmZgT7CO7iX+
   n8tr0JNYLeRGnJig32hAMwMgBOyf/tznh1si2f6Ak2dOPl+TWt1vCCOgt
   j1f/NNUAqWct8wPVfRn5/jyqrPjMVvGsDZcJMgYLb1Zo3qOLZ6S/ABIOW
   0YigTqBDyrLItLjNXCr+TiW2KXpAMMlcRRSLfk8M+xkN6QRkmogGifsrF
   A==;
X-CSE-ConnectionGUID: o5pl3rslRk6Q2Vnyd30E4Q==
X-CSE-MsgGUID: TNHrPzpeR/m7jIIYRXn7EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86441643"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86441643"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:02:05 -0700
X-CSE-ConnectionGUID: zRa6c2YRT+m2uFGPNM1k5g==
X-CSE-MsgGUID: ftGvCsiBRnyHEkSv/Hjlsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="300013476"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2026 05:02:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wraJt-00000000CM5-26Qw;
	Wed, 05 Aug 2026 12:02:01 +0000
Date: Wed, 05 Aug 2026 20:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 41c59b22370d2e1785e0e80f8ad7bd9946a1ca82
Message-ID: <202608052021.NgvouUDu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 41c59b22370d2e1785e0e80f8ad7bd9946a1ca82  pinctrl: spacemit: validate pins in pinconf callbacks

elapsed time: 1531m

configs tested: 196
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260804    gcc-8.5.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-002-20260804    gcc-8.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-001-20260804    gcc-8.5.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-002-20260804    gcc-8.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-003-20260804    gcc-8.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-004-20260804    gcc-8.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm64                         randconfig-001    gcc-10.5.0
arm64                         randconfig-001    gcc-11.5.0
arm64                randconfig-001-20260804    gcc-11.5.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-002-20260804    gcc-11.5.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-003-20260804    gcc-11.5.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-004-20260804    gcc-11.5.0
arm64                randconfig-004-20260805    gcc-10.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260804    gcc-11.5.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-002-20260804    gcc-11.5.0
csky                 randconfig-002-20260805    gcc-10.5.0
hexagon                       randconfig-001    clang-18
hexagon              randconfig-001-20260804    gcc-16.1.0
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-002-20260804    gcc-16.1.0
hexagon              randconfig-002-20260805    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260804    gcc-14
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-002-20260804    gcc-14
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-003-20260804    gcc-14
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-004-20260804    gcc-14
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-005-20260804    gcc-14
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-006-20260804    gcc-14
i386       buildonly-randconfig-006-20260805    clang-22
i386                 randconfig-001-20260804    clang-22
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260804    clang-22
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260804    clang-22
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260804    clang-22
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260804    clang-22
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260804    clang-22
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260804    clang-22
i386                 randconfig-007-20260805    gcc-13
i386                          randconfig-011    gcc-13
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260804    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-012-20260804    gcc-13
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-013-20260804    gcc-13
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-014-20260804    gcc-13
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-015-20260804    gcc-13
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-016-20260804    gcc-13
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-017-20260804    gcc-13
i386                 randconfig-017-20260805    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260804    gcc-16.1.0
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-002-20260804    gcc-16.1.0
loongarch            randconfig-002-20260805    clang-18
mips                         ath79_defconfig    gcc-16.1.0
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260804    gcc-16.1.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-002-20260804    gcc-16.1.0
nios2                randconfig-002-20260805    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260804    gcc-8.5.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-002-20260804    gcc-8.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
powerpc                    ppa8548_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260804    gcc-8.5.0
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-002-20260804    gcc-8.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260804    gcc-8.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260804    gcc-8.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
riscv                         randconfig-001    gcc-8.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-002-20260804    clang-21
riscv                randconfig-002-20260805    gcc-8.5.0
s390                 randconfig-001-20260804    clang-21
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-002-20260804    clang-21
s390                 randconfig-002-20260805    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260804    clang-21
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-002-20260804    clang-21
sh                   randconfig-002-20260805    gcc-8.5.0
sh                          se7705_defconfig    gcc-16.1.0
sh                            shx3_defconfig    gcc-16.1.0
sparc                randconfig-001-20260804    gcc-16.1.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-002-20260804    gcc-16.1.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-001-20260804    gcc-16.1.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-002-20260804    gcc-16.1.0
sparc64              randconfig-002-20260805    gcc-11.5.0
um                   randconfig-001-20260804    gcc-16.1.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-002-20260804    gcc-16.1.0
um                   randconfig-002-20260805    gcc-11.5.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260804    gcc-14
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260804    gcc-14
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260804    gcc-14
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260804    gcc-14
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260804    gcc-14
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260804    gcc-14
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260804    gcc-14
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-002-20260804    gcc-14
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-003-20260804    gcc-14
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-004-20260804    gcc-14
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-005-20260804    gcc-14
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-006-20260804    gcc-14
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-011-20260804    clang-22
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260804    clang-22
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260804    clang-22
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260804    clang-22
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260804    clang-22
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260804    clang-22
x86_64               randconfig-016-20260805    gcc-14
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260804    clang-22
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-072-20260804    clang-22
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-073-20260804    clang-22
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-074-20260804    clang-22
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-075-20260804    clang-22
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-076-20260804    clang-22
x86_64               randconfig-076-20260805    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260804    gcc-16.1.0
xtensa               randconfig-001-20260805    gcc-11.5.0
xtensa               randconfig-002-20260804    gcc-16.1.0
xtensa               randconfig-002-20260805    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
