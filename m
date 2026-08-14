Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915A0361958
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710159; cv=none; b=owSw6V5UyuPhubbz/V5pMC3NwrBWtDxOSBufjc18U2JQ/wtIAWd55IgwDj47dGLfQesFMWJHpwO2uYqHzxtgbpv5Qt7mUXT9jJDgJ8NCeQ8NYWi/rdQBELJ0i3+QWwgRPSud/TRfKsLg5WE4/h2NbXOHxZivU5Gg7dfLbrbwUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710159; c=relaxed/simple;
	bh=GUTap/3ZcgUk/2vtoeniXtU48bROZyjc02nCt5mTyr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jggjfgm65g5fsLZawSSCjr14PoCHQGZpF7JghQAYFCbMbAG/0mPL20qZTBovsReGoOHQJ+sILnvjdzx9/lRKJC47MYM+QK+04a/+ERuooE41JRqDFhh/tSMesMrLPcopEcBhrAsNp4yOJDHcT0NwuNinw1tOBag08txsiPNOqnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvXwMqEy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvXwMqEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786710158; x=1818246158;
  h=date:from:to:cc:subject:message-id;
  bh=GUTap/3ZcgUk/2vtoeniXtU48bROZyjc02nCt5mTyr8=;
  b=MvXwMqEyn/0Y4AvDUWfWBsToTx6LOAKa/5Brq9tIykwj/CCyeBKpwbOf
   ANvpvnM3I7JTeCDoEOwddnYmNSo3DkxM+mTwj72roLcg60hujHno/s8jh
   Lae2onTGVLgAx3NLTrsOwHNBpcpicIYS+0rZun5onmc0lOb4jiY9FX7LY
   Hpz5Hi+77sSIwKs4Bdf1ixKFSLAGMadx1hT2VWCtd+CvVeIjxhJFJhLAB
   qKNypkIxOQDUT9Jp8DAdVPuVrpGSklCuM/po3DQG70U/hXYaVjC17tnjf
   UTla2jdA6hhyO5d+PdWh6c6e8g018sHucxCCPc2PCk2to3rCdx/mQDkee
   A==;
X-CSE-ConnectionGUID: vzxcBO8yTGyavcHEF1KINw==
X-CSE-MsgGUID: 2Lj+IiFfSEWdNoRF7EfRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110075533"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="110075533"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:22:37 -0700
X-CSE-ConnectionGUID: G0UwJ5E0SB+/Ji6KSV9NTA==
X-CSE-MsgGUID: 2rn0zbuPReK92mkf2UMafQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2026 05:22:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuqvg-00000000Yn4-3yHM;
	Fri, 14 Aug 2026 12:22:32 +0000
Date: Fri, 14 Aug 2026 20:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 9e48545582738c158a40907a2a80298a023c20f3
Message-ID: <202608142018.uTz4MCj1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 9e48545582738c158a40907a2a80298a023c20f3  Merge tag 'intel-pinctrl-v7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

elapsed time: 2939m

configs tested: 94
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
arm                     integrator_defconfig    clang-24
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
i386       buildonly-randconfig-001-20260813    gcc-14
i386       buildonly-randconfig-002-20260813    gcc-14
i386       buildonly-randconfig-003-20260813    gcc-14
i386       buildonly-randconfig-004-20260813    gcc-14
i386       buildonly-randconfig-005-20260813    gcc-14
i386       buildonly-randconfig-006-20260813    gcc-14
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260813    clang-22
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
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260813    gcc-13
x86_64               randconfig-002-20260813    gcc-13
x86_64               randconfig-003-20260813    gcc-13
x86_64               randconfig-004-20260813    gcc-13
x86_64               randconfig-005-20260813    gcc-13
x86_64               randconfig-006-20260813    gcc-13
x86_64               randconfig-011-20260813    gcc-14
x86_64               randconfig-012-20260813    gcc-14
x86_64               randconfig-013-20260813    gcc-14
x86_64               randconfig-014-20260813    gcc-14
x86_64               randconfig-015-20260813    gcc-14
x86_64               randconfig-016-20260813    gcc-14
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
