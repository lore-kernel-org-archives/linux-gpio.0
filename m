Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7D231830
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 04:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784954578; cv=none; b=kHHwi/t0wU4Nw1EAiqKflfxzfC/FTTCMGCYqMQIaKdlM6tl0J2DMrRRljzlVW9JOJx7UFn38OTWETOItIBqtzxa/waa3aRbNxfqp2PAHRr7FSr0DtKKXfMw7W4lX5x98fxDwkDkqz3IM7c36ixlMq/AE1YmUhlPVoNorSE3oUqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784954578; c=relaxed/simple;
	bh=SG6d+LpzhL9TwVfor9J7J2Q5tzdJhlBcP86sP1J4S6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hufb8Gq6ueatF1/7x2eyYp86al/oOcdqao30FUmkwQz8vdowYirRa91KDmsdJUCf0Abv3mQ43qGzEWNxY4YBFRYoZFD/f+BGAQyo3zcW/DK5B5mYR4uN+KJsl/EQnLeuPt8IdOnFQw/SmjHGi75o/rEDdHXUhfUUK9FqJD1dTcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gF4vgwUr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gF4vgwUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784954576; x=1816490576;
  h=date:from:to:cc:subject:message-id;
  bh=SG6d+LpzhL9TwVfor9J7J2Q5tzdJhlBcP86sP1J4S6M=;
  b=gF4vgwUrYH1eCmGblY06THIDlgUcYQrROOEMvPKdzYNmrQP568oEA8GG
   j6nu7FAw3HzqRc/8nhaJlg0zQsVt7G384QRIenKRQNvgZ35D//fuDf2z1
   zKzRjJ0ULsoKZ+r2asBbRg+K6MkTwQx47vQ1FOQ+v+ghRnNwM68cH14Pt
   K5JzFeeUDFBgvZLJpNH0Cslzn69n7dX+OVAjVYxlpaxi2fzvAUN+Rzjq+
   bvUonKX5WOVlbnu8Mba5IQgih2NpYM76464sacjvyzAgrLvpBnZVjMZWg
   BK+aoOcc2iPXCp6PTAPq4ZQxwYoVYdEfRcBf0isYrQdKD/odtTNRZo4eq
   w==;
X-CSE-ConnectionGUID: 7IuGB5WnQzKgeDaT+Kr+iQ==
X-CSE-MsgGUID: UWuJlOf+RVCxIsRtCckV3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="96770309"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="96770309"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 21:42:56 -0700
X-CSE-ConnectionGUID: 9wtT4bSOQLep8l120sIWoA==
X-CSE-MsgGUID: Qg6f9SseSI6mDM7zrMFH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="254571528"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jul 2026 21:42:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnUDl-00000000bUQ-3q98;
	Sat, 25 Jul 2026 04:42:47 +0000
Date: Sat, 25 Jul 2026 12:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 a39ac4651e3b9d2ca78b6d3dc2a81a6bd25fa616
Message-ID: <202607251214.yKpzc7Bv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: a39ac4651e3b9d2ca78b6d3dc2a81a6bd25fa616  power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID

elapsed time: 873m

configs tested: 78
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260725    gcc-11.5.0
arc                  randconfig-002-20260725    gcc-8.5.0
arm                  randconfig-001-20260725    gcc-8.5.0
arm                  randconfig-002-20260725    clang-21
arm                  randconfig-003-20260725    gcc-10.5.0
arm                  randconfig-004-20260725    gcc-15.2.0
arm64                randconfig-001-20260725    clang-24
arm64                randconfig-002-20260725    gcc-13.4.0
arm64                randconfig-003-20260725    clang-24
arm64                randconfig-004-20260725    clang-24
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260725    gcc-9.5.0
csky                 randconfig-002-20260725    gcc-16.1.0
hexagon              randconfig-001-20260725    clang-17
hexagon              randconfig-002-20260725    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260725    clang-22
i386       buildonly-randconfig-002-20260725    gcc-14
i386       buildonly-randconfig-003-20260725    clang-22
i386       buildonly-randconfig-004-20260725    clang-22
i386       buildonly-randconfig-005-20260725    gcc-14
i386       buildonly-randconfig-006-20260725    gcc-14
i386                 randconfig-011-20260725    gcc-14
i386                 randconfig-012-20260725    gcc-14
i386                 randconfig-013-20260725    gcc-14
i386                 randconfig-014-20260725    clang-22
i386                 randconfig-015-20260725    clang-22
i386                 randconfig-016-20260725    clang-22
i386                 randconfig-017-20260725    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260725    gcc-16.1.0
loongarch            randconfig-002-20260725    gcc-13.4.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260725    gcc-11.5.0
nios2                randconfig-002-20260725    gcc-9.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260725    gcc-10.5.0
parisc               randconfig-002-20260725    gcc-12.5.0
powerpc              randconfig-001-20260725    gcc-9.5.0
powerpc              randconfig-002-20260725    gcc-15.2.0
powerpc64            randconfig-001-20260725    clang-17
powerpc64            randconfig-002-20260725    clang-24
riscv                   nommu_virt_defconfig    clang-24
riscv                randconfig-001-20260725    gcc-8.5.0
riscv                randconfig-002-20260725    gcc-8.5.0
s390                 randconfig-001-20260725    gcc-10.5.0
s390                 randconfig-002-20260725    gcc-16.1.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260725    gcc-16.1.0
sh                   randconfig-002-20260725    gcc-11.5.0
sparc                randconfig-002-20260725    gcc-8.5.0
sparc64              randconfig-002-20260725    gcc-10.5.0
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260725    gcc-14
x86_64               randconfig-002-20260725    clang-22
x86_64               randconfig-003-20260725    clang-22
x86_64               randconfig-004-20260725    clang-22
x86_64               randconfig-005-20260725    clang-22
x86_64               randconfig-006-20260725    clang-22
x86_64               randconfig-011-20260725    gcc-14
x86_64               randconfig-012-20260725    gcc-14
x86_64               randconfig-015-20260725    gcc-14
x86_64               randconfig-016-20260725    gcc-14
x86_64               randconfig-071-20260725    gcc-14
x86_64               randconfig-072-20260725    gcc-14
x86_64               randconfig-073-20260725    gcc-14
x86_64               randconfig-074-20260725    gcc-14
x86_64               randconfig-075-20260725    gcc-14
x86_64               randconfig-076-20260725    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
