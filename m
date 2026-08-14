Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA543B3E4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703193; cv=none; b=O5Vrg8n2grpIxDrw9fJNCf0mDxqqgn0WA8mDKt6en4YQUqEf0rd0mxIG8O2jcMoDTudaWg/XkP9eG59hXDGwkv0QIsjzk5Cs5torCHjUnICac+uTbSnidhbXm4qp7RP/EG9fi8g38yWOsaPjOsCvKeZ5s5H//3Cm3ZRDt6LQ0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703193; c=relaxed/simple;
	bh=ui3OdQI1vmTvCAf8cKrIp2j5Krry5FlQZ94jNKBucgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nf+36T+C9YxTqmESkCvlYCiCmZq8WtSqPpPD6YQnVXhDl0zgChTACMq3UZExfWcNy2F/zw2seVBlxMnQ19joODWopngCZehgxlZf7q845vrYR3eUh0v1XmPK/0N9rjLWhIg9M5geP8YvfekVUjQn9WTyaP7ayDy0OXegCAmxdPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHyMD1Ec; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHyMD1Ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786703188; x=1818239188;
  h=date:from:to:cc:subject:message-id;
  bh=ui3OdQI1vmTvCAf8cKrIp2j5Krry5FlQZ94jNKBucgs=;
  b=lHyMD1EcRF/zUZfFAn4KoUo3Ema88NJmKR/opddQ16DvN8YLF+t2HYmK
   m/98Xix4I2ypKdiokx4aKK3qtOGG2n8Fp+NHMbVY6mHYjhjgdXNvmc0Uw
   1BjS93tFAiyRNW0WgShoJe7st0OsVBmgBBqxDhTxRGyRciyp0OfzWnd69
   jL8mjUstqA/N5araAu92LMPWStUD/rXeyXLApBJEXGgfNBP3f3BiaCcLw
   Q0DrR2/Rdj0vK2G62O2J9+ou3qTyV302HJREfRzE0YK4DpKXnixWdKTeL
   OmfP5v565qxAR42KnxAjG9qoepFnFZCILB4UH7zKv5K4Lhxib0G7kIjNK
   Q==;
X-CSE-ConnectionGUID: iWdYI1k7TjyZtOgcrRFboA==
X-CSE-MsgGUID: yEBz6GD1ShSdv6RH/SXwxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104665338"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="104665338"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 03:26:15 -0700
X-CSE-ConnectionGUID: W781K/GXSqaCGlfcreyWTQ==
X-CSE-MsgGUID: ztgEcbqmTeey7PblDTt6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264801795"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Aug 2026 03:26:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wup76-00000000YYt-1rH4;
	Fri, 14 Aug 2026 10:26:12 +0000
Date: Fri, 14 Aug 2026 18:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 17e4db67df63f0eedf9f1143d4e2569eab63ff65
Message-ID: <202608141817.gfoaeDI6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 17e4db67df63f0eedf9f1143d4e2569eab63ff65  Merge branch 'devel' into for-next

elapsed time: 2823m

configs tested: 123
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                         exynos_defconfig    clang-17
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                randconfig-001-20260813    gcc-16.1.0
arm64                randconfig-002-20260813    gcc-16.1.0
arm64                randconfig-003-20260813    gcc-16.1.0
arm64                randconfig-004-20260813    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260813    gcc-16.1.0
csky                 randconfig-002-20260813    gcc-16.1.0
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260813    gcc-14
i386       buildonly-randconfig-001-20260814    clang-22
i386       buildonly-randconfig-002-20260813    gcc-14
i386       buildonly-randconfig-002-20260814    clang-22
i386       buildonly-randconfig-003-20260813    gcc-14
i386       buildonly-randconfig-003-20260814    clang-22
i386       buildonly-randconfig-004-20260813    gcc-14
i386       buildonly-randconfig-004-20260814    clang-22
i386       buildonly-randconfig-005-20260813    gcc-14
i386       buildonly-randconfig-005-20260814    clang-22
i386       buildonly-randconfig-006-20260813    gcc-14
i386       buildonly-randconfig-006-20260814    clang-22
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260813    clang-22
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260813    clang-22
i386                 randconfig-012-20260813    clang-22
i386                 randconfig-013-20260813    clang-22
i386                 randconfig-014-20260813    clang-22
i386                 randconfig-015-20260813    clang-22
i386                 randconfig-016-20260813    clang-22
i386                 randconfig-017-20260813    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-11.5.0
mips                          ip28_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                randconfig-001-20260813    clang-20
sparc                randconfig-002-20260813    clang-20
sparc64              randconfig-001-20260813    clang-20
sparc64              randconfig-002-20260813    clang-20
um                   randconfig-001-20260813    clang-20
um                   randconfig-002-20260813    clang-20
um                          x86_64_defconfig    clang-24
x86_64     buildonly-randconfig-001-20260813    gcc-14
x86_64     buildonly-randconfig-001-20260814    clang-22
x86_64     buildonly-randconfig-002-20260813    gcc-14
x86_64     buildonly-randconfig-002-20260814    clang-22
x86_64     buildonly-randconfig-003-20260813    gcc-14
x86_64     buildonly-randconfig-003-20260814    clang-22
x86_64     buildonly-randconfig-004-20260813    gcc-14
x86_64     buildonly-randconfig-004-20260814    clang-22
x86_64     buildonly-randconfig-005-20260813    gcc-14
x86_64     buildonly-randconfig-005-20260814    clang-22
x86_64     buildonly-randconfig-006-20260813    gcc-14
x86_64     buildonly-randconfig-006-20260814    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260813    gcc-13
x86_64               randconfig-002-20260813    gcc-13
x86_64               randconfig-003-20260813    gcc-13
x86_64               randconfig-004-20260813    gcc-13
x86_64               randconfig-005-20260813    gcc-13
x86_64               randconfig-006-20260813    gcc-13
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-011-20260813    gcc-14
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-012-20260813    gcc-14
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-013-20260813    gcc-14
x86_64               randconfig-014-20260812    gcc-14
x86_64               randconfig-014-20260813    gcc-14
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-015-20260813    gcc-14
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-016-20260813    gcc-14
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260813    gcc-14
x86_64               randconfig-072-20260813    gcc-14
x86_64               randconfig-073-20260813    gcc-14
x86_64               randconfig-074-20260813    gcc-14
x86_64               randconfig-075-20260813    gcc-14
x86_64               randconfig-076-20260813    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260813    clang-20
xtensa               randconfig-002-20260813    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
