Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE473F5BFD
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235544; cv=none; b=BF0FLwIWBuLT3zMA2VjMbliac+NuSuAHWEBYoj5Er0r8JiJ/l4+iN0l/KWBzLl4qhE8qE6RWrcr3SBvmxI9RhG3uDAQFyaTXpuP2fkehx9CGAxSk6lMinCeAuZ55LqBGz9+2o54XRdM+j+aRbwwMonIQekWSXEBLKlL2+42Y8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235544; c=relaxed/simple;
	bh=9KzSfQkG3qWjO/sADVj/0oFxOqyPFtnyX9p9Cc1e+Bc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=twOm6Ap7K3u+9BHGE88V6tjunHaWXREUzn/qXKZrg5HnhjOx8TX0I0rUlHTWbjjWWe+Fyu/q+IyArEaXIqiWn1vOYs/HfhEn6MxsXB1fhUhdB4zhea2TXU77AR59jjtiEZ2xUEdsjqz/QGfBQ+G90G8DxOy1uoRhDvHY9DnVVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTfxtXwT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTfxtXwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785235544; x=1816771544;
  h=date:from:to:cc:subject:message-id;
  bh=9KzSfQkG3qWjO/sADVj/0oFxOqyPFtnyX9p9Cc1e+Bc=;
  b=eTfxtXwTWKPB4vE6LYDd4Yyvz/BLRfZb1rRl9LmdBg+7l/m/a7KTSrvm
   Op9cg5wNRa/pwu2DUhBMBu5neR4eteQQwfvbS6vCoNkF2mCq8J7uKuFe+
   pbtXRPUfgrPFXk25aNfZkFH22GfT56R6juZtH8P0MfO5iEAMEU/IT4WFu
   vyyw0tidwq2J1+A1IFbzjOu+t4KaiAl1LNNrTnnBm+WCH4J5Y5t7lte+T
   FUSS/RRtc8g7letqCczDt5OeeYGQmOprKxDqAExZm6tpyf/YF0XboLBBS
   kOnX8yPzW/a5dE2SH66f1f0KWvRDvJFZBNzpWUMyVOGtjr9hoeQcIXYHI
   g==;
X-CSE-ConnectionGUID: AUgChRD0SLmY/069eDjl7A==
X-CSE-MsgGUID: XkpeGmw3Q320IpXyTPhkPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96970336"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96970336"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 03:45:43 -0700
X-CSE-ConnectionGUID: xUjr2eLCSZms/jiPTnmJDA==
X-CSE-MsgGUID: SdYu3/AgRRahmBwqNTwX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289629003"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 03:45:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wofJb-00000000eFz-3mRh;
	Tue, 28 Jul 2026 10:45:39 +0000
Date: Tue, 28 Jul 2026 18:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8bdba6f6cfc1eb68df883e6541ca443bdf300dd0
Message-ID: <202607281834.ydIpBESt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8bdba6f6cfc1eb68df883e6541ca443bdf300dd0  Merge tag 'config-gpio-legacy-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground into gpio/for-next

elapsed time: 895m

configs tested: 102
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260728    gcc-8.5.0
arc                  randconfig-002-20260728    gcc-8.5.0
arm                      imx_v6_v7_defconfig    clang-24
arm                  randconfig-001-20260728    gcc-8.5.0
arm                  randconfig-002-20260728    gcc-8.5.0
arm                  randconfig-003-20260728    gcc-8.5.0
arm                  randconfig-004-20260728    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260728    gcc-14.3.0
arm64                randconfig-002-20260728    gcc-14.3.0
arm64                randconfig-003-20260728    gcc-14.3.0
arm64                randconfig-004-20260728    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260728    gcc-14.3.0
csky                 randconfig-002-20260728    gcc-14.3.0
hexagon              randconfig-001-20260728    gcc-11.5.0
hexagon              randconfig-002-20260728    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260728    gcc-14
i386       buildonly-randconfig-002-20260728    gcc-14
i386       buildonly-randconfig-003-20260728    gcc-14
i386       buildonly-randconfig-004-20260728    gcc-14
i386       buildonly-randconfig-005-20260728    gcc-14
i386       buildonly-randconfig-006-20260728    gcc-14
i386                 randconfig-001-20260728    gcc-14
i386                 randconfig-002-20260728    gcc-14
i386                 randconfig-003-20260728    gcc-14
i386                 randconfig-004-20260728    gcc-14
i386                 randconfig-005-20260728    gcc-14
i386                 randconfig-006-20260728    gcc-14
i386                 randconfig-007-20260728    gcc-14
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260728    gcc-14
i386                 randconfig-012-20260728    gcc-14
i386                 randconfig-013-20260728    gcc-14
i386                 randconfig-014-20260728    gcc-14
i386                 randconfig-015-20260728    gcc-14
i386                 randconfig-016-20260728    gcc-14
i386                 randconfig-017-20260728    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260728    gcc-11.5.0
loongarch            randconfig-002-20260728    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260728    gcc-11.5.0
nios2                randconfig-002-20260728    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260728    gcc-10.5.0
parisc               randconfig-002-20260728    gcc-10.5.0
powerpc              randconfig-001-20260728    gcc-10.5.0
powerpc              randconfig-002-20260728    gcc-10.5.0
powerpc64            randconfig-001-20260728    gcc-10.5.0
powerpc64            randconfig-002-20260728    gcc-10.5.0
riscv                randconfig-001-20260728    gcc-14.3.0
riscv                randconfig-002-20260728    gcc-14.3.0
s390                 randconfig-001-20260728    gcc-14.3.0
s390                 randconfig-002-20260728    gcc-14.3.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260728    gcc-14.3.0
sh                   randconfig-002-20260728    gcc-14.3.0
sparc                         randconfig-001    gcc-11.5.0
sparc                randconfig-001-20260728    gcc-11.5.0
sparc                randconfig-002-20260728    gcc-11.5.0
sparc64              randconfig-001-20260728    gcc-11.5.0
sparc64              randconfig-002-20260728    gcc-11.5.0
um                   randconfig-001-20260728    gcc-11.5.0
um                   randconfig-002-20260728    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260728    clang-22
x86_64     buildonly-randconfig-002-20260728    clang-22
x86_64     buildonly-randconfig-003-20260728    clang-22
x86_64     buildonly-randconfig-004-20260728    clang-22
x86_64     buildonly-randconfig-005-20260728    clang-22
x86_64     buildonly-randconfig-006-20260728    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260728    gcc-12
x86_64               randconfig-002-20260728    gcc-12
x86_64               randconfig-003-20260728    gcc-12
x86_64               randconfig-004-20260728    gcc-12
x86_64               randconfig-005-20260728    gcc-12
x86_64               randconfig-006-20260728    gcc-12
x86_64               randconfig-011-20260728    clang-22
x86_64               randconfig-012-20260728    clang-22
x86_64               randconfig-013-20260728    clang-22
x86_64               randconfig-014-20260728    clang-22
x86_64               randconfig-015-20260728    clang-22
x86_64               randconfig-016-20260728    clang-22
x86_64               randconfig-071-20260728    clang-22
x86_64               randconfig-072-20260728    clang-22
x86_64               randconfig-073-20260728    clang-22
x86_64               randconfig-074-20260728    clang-22
x86_64               randconfig-075-20260728    clang-22
x86_64               randconfig-076-20260728    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260728    gcc-11.5.0
xtensa               randconfig-002-20260728    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
