Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BF2836E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648404; cv=none; b=BC6SqarjM8O3EaxFUoCDPUnJl0xx5w/4+orgx2cypDbTZ2f2MpVEz74vVZ8i5Er5pTxjDHvDkpJGx4cLtECWFc3Am8lpjDjeyyMLV4Fc+2XyG+siMj4b6+bZBjkZUzuplf5/YDBP5MkDfrOYTQsadzJu52QjATtyklaRXj6m5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648404; c=relaxed/simple;
	bh=MpGqZ33ggyj7/Ewac9TK8NbAF67lbKDZZZ2ncPL8ito=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H5F5ZV6l5jgnPrZorwMuflDXtOvIiNGY4+SkcGdoPSzckE4Oy4rhyh1GmUcfAOWGc+/zlO/PoU2w6sukaVBa4vmYNE43JsDOc2yTlgA/zlmswReI10o6ulG/eKXyZ/wj4+8DaumaUEauJYQkv+pmRoA0KrJ+k5R9ESahFPZfeOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz+Rz4hC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz+Rz4hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773648403; x=1805184403;
  h=date:from:to:cc:subject:message-id;
  bh=MpGqZ33ggyj7/Ewac9TK8NbAF67lbKDZZZ2ncPL8ito=;
  b=lz+Rz4hClbBDb7ykFIAONEaKCqR2ftd+aI4wjU8XU3ru+A8cesKcTvsQ
   H8yRc5TePS+8MQHu8A1ciFXhM02qcuAWI7ZfcUxgGXqFe1vYS37qNUmnB
   m7nSzRQa1kHzmBaXLitf95if+LJV3fWj/4RvPnwwkBx6y+mb+HmYYIrdR
   a0H7MoHXAYPqSliywtNh2EwrqrnRYKSzdyY0mYbTBQ5Ub50Kst4wYpcgQ
   m3Q+i5JMDNonrp0sCefJXdT4EidapIjZqbkxTNu6Xo4zwsufqyNzJHI48
   /QTQ6LJbwsf4Tnu6Ktb0JfYRermncC8k5cdqw+0g21APBJF+1+W9TMtlQ
   g==;
X-CSE-ConnectionGUID: iqnBUpR6SKqUYy6u9cQKEw==
X-CSE-MsgGUID: 88FsJ5nJRiqBE/s0wMe6Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85357999"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="85357999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 01:06:42 -0700
X-CSE-ConnectionGUID: Bngk71SiSyC1mI/wo+VOgQ==
X-CSE-MsgGUID: 7xktb9/STneRilMvj7WZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="220883266"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Mar 2026 01:06:41 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w22yE-000000000Kw-317c;
	Mon, 16 Mar 2026 08:06:38 +0000
Date: Mon, 16 Mar 2026 16:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bf017304fce10933f18fafe140bf749fb9672058
Message-ID: <202603161626.56k4Ze3a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bf017304fce10933f18fafe140bf749fb9672058  regulator: drop unneeded dependencies on OF_GPIO

elapsed time: 771m

configs tested: 94
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260316    gcc-10.5.0
arc         randconfig-002-20260316    gcc-9.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260316    clang-23
arm         randconfig-002-20260316    clang-23
arm         randconfig-003-20260316    clang-23
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
i386        randconfig-001-20260316    gcc-14
i386        randconfig-002-20260316    clang-20
i386        randconfig-003-20260316    gcc-14
i386        randconfig-004-20260316    gcc-14
i386        randconfig-005-20260316    clang-20
i386        randconfig-006-20260316    gcc-12
i386        randconfig-007-20260316    gcc-14
i386        randconfig-011-20260316    clang-20
i386        randconfig-012-20260316    gcc-14
i386        randconfig-013-20260316    clang-20
i386        randconfig-014-20260316    gcc-13
i386        randconfig-015-20260316    clang-20
i386        randconfig-016-20260316    gcc-14
i386        randconfig-017-20260316    clang-20
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260316    gcc-8.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-002-20260316    clang-23
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20260316    gcc-15.2.0
riscv       randconfig-002-20260316    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-001-20260316    clang-18
s390        randconfig-002-20260316    gcc-14.3.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sh               ecovec24_defconfig    gcc-15.2.0
sh          randconfig-001-20260316    gcc-15.2.0
sh          randconfig-002-20260316    gcc-12.5.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20260316    gcc-8.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64      randconfig-071-20260316    gcc-12
x86_64      randconfig-072-20260316    gcc-14
x86_64      randconfig-073-20260316    gcc-14
x86_64      randconfig-074-20260316    gcc-14
x86_64      randconfig-075-20260316    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
