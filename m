Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5B33123D
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 02:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290931; cv=none; b=LcwQD5xssCiuhaugdti4AsYZbr2DgDAkdmRsgz8T0LV7nFBCcL7tYzaCE2hF9NRYzpzRstsoa3z3/K7fBmzzBlSa/jMyOmCidyHjCV/xES72Tt4IcjGUlh+JtYp+A0oB+9EgA4dRFucF3OrMvuebdj/BkeNPYtcUn2JiV6TePdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290931; c=relaxed/simple;
	bh=GwcZdogm4Z3Qt8yTHQw+IVlv5qkMBR7aXS/ktvqo0ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rfdj4jbtiM4JWtUFbJ64YSsRHGPEimDDCNXGDuMmDpIjkrUvSLSQHdR9JqaxVhXZz3yCLt84RVq34ALEl+bJ0gu9UUQldEfPhlhy3Zp8ZdHkpkWRJZQVIHY3othTbneAJwxhcvXHr+uVhdIpOTudNTOB3MxLb9M/guRe6z2LR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNIcBpF0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNIcBpF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785290928; x=1816826928;
  h=date:from:to:cc:subject:message-id;
  bh=GwcZdogm4Z3Qt8yTHQw+IVlv5qkMBR7aXS/ktvqo0ro=;
  b=cNIcBpF0T+qWhs9QEvWCLpXssQ9FU9MvP8qa9h5/Gvbgi2E33CLhwSZj
   C5p0jc7HzfpBZOFnzCTUe6AIG1adtbzJrqesljByz6trlUpSMzwvEp5G8
   CuucNR0nUD6hIFQKhxDQXqEiKhztygX5Y95rk5vBAxEYHFtTkpFhAhPGV
   VvzTVSiQ7+riuX2ez/FyrNk/tkEPPa0A8ujKXaU+3sK+4nqnVIWQx9Qgn
   +F0XbUAhPaNN9csilqbRicbTNlnEUaF0ZRaXFqda/jSw9e+moSo7IkTIC
   9dymsAosAzZWDrJlOPBhwkJ9vkGu9gr/FL772sEKR3NQ+IVqKz9Son5bb
   A==;
X-CSE-ConnectionGUID: OTYCt6TcQ72TAy3uYobyow==
X-CSE-MsgGUID: KqRdfb8/SfWBmBVw4iY4Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85743914"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85743914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 19:08:48 -0700
X-CSE-ConnectionGUID: YvODWdXDT0i99+SUqhcqGQ==
X-CSE-MsgGUID: Wo/xlUa5RZ6fE0ttT30g8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="298096242"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 19:08:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wotio-00000000exT-2kRL;
	Wed, 29 Jul 2026 02:08:38 +0000
Date: Wed, 29 Jul 2026 10:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom/for-current] BUILD SUCCESS
 fd46760956509f580f7d3d25db4de10e7c6f949b
Message-ID: <202607291029.FOsMnnrT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: fd46760956509f580f7d3d25db4de10e7c6f949b  pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function

elapsed time: 962m

configs tested: 140
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
arc                  randconfig-001-20260728    gcc-10.5.0
arc                  randconfig-001-20260729    gcc-8.5.0
arc                  randconfig-002-20260728    gcc-16.1.0
arc                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-001-20260728    clang-24
arm                  randconfig-001-20260729    gcc-8.5.0
arm                  randconfig-002-20260728    gcc-8.5.0
arm                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-003-20260728    gcc-8.5.0
arm                  randconfig-003-20260729    gcc-8.5.0
arm                  randconfig-004-20260728    gcc-14.3.0
arm                  randconfig-004-20260729    gcc-8.5.0
arm64                randconfig-001-20260729    clang-17
arm64                randconfig-002-20260729    clang-17
arm64                randconfig-003-20260729    clang-17
arm64                randconfig-004-20260729    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260729    clang-17
csky                 randconfig-002-20260729    clang-17
hexagon              randconfig-001-20260729    gcc-9.5.0
hexagon              randconfig-002-20260729    gcc-9.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260729    gcc-14
i386       buildonly-randconfig-002-20260729    gcc-14
i386       buildonly-randconfig-003-20260729    gcc-14
i386       buildonly-randconfig-004-20260729    gcc-14
i386       buildonly-randconfig-005-20260729    gcc-14
i386       buildonly-randconfig-006-20260729    gcc-14
i386                 randconfig-001-20260729    clang-22
i386                 randconfig-002-20260729    clang-22
i386                 randconfig-003-20260729    clang-22
i386                 randconfig-004-20260729    clang-22
i386                 randconfig-005-20260729    clang-22
i386                 randconfig-006-20260729    clang-22
i386                 randconfig-007-20260729    clang-22
i386                 randconfig-011-20260729    gcc-14
i386                 randconfig-012-20260729    gcc-14
i386                 randconfig-013-20260729    gcc-14
i386                 randconfig-014-20260729    gcc-14
i386                 randconfig-015-20260729    gcc-14
i386                 randconfig-016-20260729    gcc-14
i386                 randconfig-017-20260729    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260729    gcc-9.5.0
loongarch            randconfig-002-20260729    gcc-9.5.0
mips                       bcm63xx_defconfig    clang-24
mips                     maltaaprp_defconfig    clang-17
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260729    gcc-9.5.0
nios2                randconfig-002-20260729    gcc-9.5.0
parisc                          alldefconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260728    gcc-8.5.0
parisc               randconfig-001-20260729    clang-24
parisc               randconfig-002-20260728    gcc-13.4.0
parisc               randconfig-002-20260729    clang-24
powerpc                    ksi8560_defconfig    gcc-16.1.0
powerpc                mpc8313_rdb_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260728    clang-24
powerpc              randconfig-001-20260729    clang-24
powerpc              randconfig-002-20260728    gcc-8.5.0
powerpc              randconfig-002-20260729    clang-24
powerpc64            randconfig-001-20260728    gcc-10.5.0
powerpc64            randconfig-001-20260729    clang-24
powerpc64            randconfig-002-20260728    clang-24
powerpc64            randconfig-002-20260729    clang-24
riscv            nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                randconfig-001-20260729    gcc-15.2.0
riscv                randconfig-002-20260729    gcc-15.2.0
s390                 randconfig-001-20260729    gcc-15.2.0
s390                 randconfig-002-20260729    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260729    gcc-15.2.0
sh                   randconfig-002-20260729    gcc-15.2.0
sparc                         randconfig-001    gcc-16.1.0
sparc                randconfig-001-20260728    gcc-13.4.0
sparc                randconfig-001-20260729    gcc-10.5.0
sparc                randconfig-002-20260728    gcc-8.5.0
sparc                randconfig-002-20260729    gcc-10.5.0
sparc64              randconfig-001-20260728    gcc-13.4.0
sparc64              randconfig-001-20260729    gcc-10.5.0
sparc64              randconfig-002-20260728    gcc-8.5.0
sparc64              randconfig-002-20260729    gcc-10.5.0
um                   randconfig-001-20260728    clang-24
um                   randconfig-001-20260729    gcc-10.5.0
um                   randconfig-002-20260728    clang-24
um                   randconfig-002-20260729    gcc-10.5.0
x86_64     buildonly-randconfig-001-20260728    gcc-13
x86_64     buildonly-randconfig-001-20260729    clang-22
x86_64     buildonly-randconfig-002-20260728    gcc-13
x86_64     buildonly-randconfig-002-20260729    clang-22
x86_64     buildonly-randconfig-003-20260728    gcc-13
x86_64     buildonly-randconfig-003-20260729    clang-22
x86_64     buildonly-randconfig-004-20260728    clang-22
x86_64     buildonly-randconfig-004-20260729    clang-22
x86_64     buildonly-randconfig-005-20260728    clang-22
x86_64     buildonly-randconfig-005-20260729    clang-22
x86_64     buildonly-randconfig-006-20260728    clang-22
x86_64     buildonly-randconfig-006-20260729    clang-22
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260728    gcc-12
x86_64               randconfig-001-20260729    clang-22
x86_64               randconfig-002-20260728    gcc-12
x86_64               randconfig-002-20260729    clang-22
x86_64               randconfig-003-20260728    gcc-12
x86_64               randconfig-003-20260729    clang-22
x86_64               randconfig-004-20260728    clang-22
x86_64               randconfig-004-20260729    clang-22
x86_64               randconfig-005-20260728    gcc-14
x86_64               randconfig-005-20260729    clang-22
x86_64               randconfig-006-20260728    gcc-12
x86_64               randconfig-006-20260729    clang-22
x86_64               randconfig-011-20260729    gcc-14
x86_64               randconfig-012-20260729    gcc-14
x86_64               randconfig-013-20260729    gcc-14
x86_64               randconfig-014-20260729    gcc-14
x86_64               randconfig-015-20260729    gcc-14
x86_64               randconfig-016-20260729    gcc-14
x86_64               randconfig-071-20260729    gcc-12
x86_64               randconfig-072-20260729    gcc-12
x86_64               randconfig-073-20260729    gcc-12
x86_64               randconfig-074-20260729    gcc-12
x86_64               randconfig-075-20260729    gcc-12
x86_64               randconfig-076-20260729    gcc-12
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260728    gcc-8.5.0
xtensa               randconfig-001-20260729    gcc-10.5.0
xtensa               randconfig-002-20260728    gcc-11.5.0
xtensa               randconfig-002-20260729    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
