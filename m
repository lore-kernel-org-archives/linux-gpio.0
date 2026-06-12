Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49B347BA9
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239713; cv=none; b=VJ6IvOfrjVZ4+xSoX/mgmiSUEo+EkKJwioej10XqrYa/bf/uC8K8MRQh0iIp6n0vbb66Pdv+yMtV7aYCR3hhcDat3IvJ1OZfgg1SEJlZ770pW7wDNjBnJYOjkj59my5d9Cdq1AdNXKIZCQhZM/aQ2p/FhyrNaju3+Yld8YAI4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239713; c=relaxed/simple;
	bh=4vHkPUVXqSOlUOMWxz223C+eEtcwZWz8IxEF9cRJcFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OVHLvu18BU3Lb02Qnl/gqqlk2/zxTJLn1MTOixf1GgvXy8iWlnSDLhAwuZhd8BykJ0bMepIvdWIMyZbATGz5I8nFQ3Gg+H3eE8FXzs3+SWrWYEbN72fjC9Yto1Kk0R08JEovLU5yTtT66mrIdCNsmlpVMf6nqXo5utRMRxW4tXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWDuvO6p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWDuvO6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781239712; x=1812775712;
  h=date:from:to:cc:subject:message-id;
  bh=4vHkPUVXqSOlUOMWxz223C+eEtcwZWz8IxEF9cRJcFI=;
  b=hWDuvO6p5ZO2KYUEmI+75LQ+JfYqv/gxSs/x744A7Wvbabr3b/mH5vvT
   dN/ZR8epoKVC7URNEX4dbXt0wgtQxILXh7DhNpJ2bfv7mkQ26A1g3oF8l
   pwxSbeLs4So8V1Wa+FlYdgmQ7BUsIgF/Qf1rAg9TRLdZJ5TdLNrf4BWy8
   SIx/OwqgoGCcWgkZU5iLozApaT6SdSWLAD91oIVL8xqzWcKAahTFLusy+
   CNuMWg+pMsnmCWMiAYDmQEOYMOM929kOWHlZtvDMhQOqPvQ7qn8kdP//G
   LBvCLCKpDYXqZezlwNAh1ze4Se97D5rSCc5WV5hqRdAdxoGZxOlkxhM4L
   A==;
X-CSE-ConnectionGUID: 0z/na5c/S5i07/3o9HGiyw==
X-CSE-MsgGUID: P45kckXIQC+M3JTa/+y9IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99645295"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="99645295"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:48:31 -0700
X-CSE-ConnectionGUID: 8K0Y6Vc0TxKNS68041dApw==
X-CSE-MsgGUID: J2gMOTCQSYyHGMIjlGMr2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251804624"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 21:48:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtoh-00000000OKT-1DxL;
	Fri, 12 Jun 2026 04:48:27 +0000
Date: Fri, 12 Jun 2026 12:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
Message-ID: <202606121240.pD7ACwhx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2  Merge branch 'devel' into for-next

elapsed time: 915m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260612    gcc-13.4.0
arc                   randconfig-002-20260612    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                   randconfig-001-20260612    gcc-11.5.0
arm                   randconfig-002-20260612    gcc-10.5.0
arm                   randconfig-003-20260612    gcc-11.5.0
arm                   randconfig-004-20260612    gcc-13.4.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                 randconfig-001-20260612    gcc-13.4.0
arm64                 randconfig-002-20260612    clang-23
arm64                 randconfig-003-20260612    gcc-9.5.0
arm64                 randconfig-004-20260612    gcc-11.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                  randconfig-001-20260612    gcc-11.5.0
csky                  randconfig-002-20260612    gcc-13.4.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260612    clang-23
hexagon               randconfig-002-20260612    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-001-20260612    gcc-14
i386                  randconfig-003-20260612    gcc-14
i386                  randconfig-011-20260612    clang-22
i386                  randconfig-012-20260612    clang-22
i386                  randconfig-013-20260612    clang-22
i386                  randconfig-014-20260612    clang-22
i386                  randconfig-015-20260612    gcc-14
i386                  randconfig-016-20260612    gcc-14
i386                  randconfig-017-20260612    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260612    clang-23
loongarch             randconfig-002-20260612    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                          atari_defconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260612    gcc-11.5.0
nios2                 randconfig-002-20260612    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260612    gcc-12.5.0
parisc                randconfig-002-20260612    gcc-14.3.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc64             randconfig-001-20260612    gcc-8.5.0
powerpc64             randconfig-002-20260612    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                          randconfig-001    gcc-13.4.0
riscv                 randconfig-001-20260612    gcc-13.4.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260612    clang-23
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260612    clang-23
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260612    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-14.3.0
sh                    randconfig-001-20260612    gcc-11.5.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260612    gcc-13.4.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260612    clang-22
x86_64      buildonly-randconfig-002-20260612    gcc-14
x86_64      buildonly-randconfig-003-20260612    clang-22
x86_64      buildonly-randconfig-004-20260612    clang-22
x86_64      buildonly-randconfig-005-20260612    clang-22
x86_64      buildonly-randconfig-006-20260612    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260612    gcc-14
x86_64                randconfig-012-20260612    clang-22
x86_64                randconfig-013-20260612    clang-22
x86_64                randconfig-014-20260612    gcc-14
x86_64                randconfig-015-20260612    gcc-14
x86_64                randconfig-016-20260612    gcc-14
x86_64                randconfig-071-20260612    gcc-14
x86_64                randconfig-072-20260612    gcc-12
x86_64                randconfig-073-20260612    clang-22
x86_64                randconfig-074-20260612    clang-22
x86_64                randconfig-075-20260612    clang-22
x86_64                randconfig-076-20260612    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
