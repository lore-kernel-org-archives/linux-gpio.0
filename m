Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E941D200
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703187; cv=none; b=iHR0Q52yMqgovF4yCqyz//odZCroVrn+rwXIvsQqSQV6Z5Jhsuujkq7mjYqfZ16w+Y1HOmGyOic+ZRtrOcqbXZzJRcDm1LdWq9/IkhlpxJl8O8ItExS4OBrdwA7b8y7/uuK85ynpLcX4Pc5jCjyNEhsdowew5BqECAlv6eCJRqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703187; c=relaxed/simple;
	bh=6NlBIGRm+nqnEGxre6UsbRj+nhtP4fgehzayRYbYDHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dd0wrPZnRdpTefWgV3NQjOm6bPKcK2KzM0bQHSEYyzDl4hWB8aP4R337zCpmXqmqkD9GCJ5P2QsoV4PKLYaTd/HYIu5ecTqqYvgxoWdrz41zImnyfyQUwS5mGWjZv2+4wx849w4oW5zZisaTPc5xbGygNWKBEebKuprnr1DdV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZrBgEMc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZrBgEMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786703181; x=1818239181;
  h=date:from:to:cc:subject:message-id;
  bh=6NlBIGRm+nqnEGxre6UsbRj+nhtP4fgehzayRYbYDHg=;
  b=gZrBgEMc0zPD2CJXQdDNh3eh3nuVPFQtLV/JDNIWHd9qBV47SPW4fV2z
   BaR9/DBtP6ll+g5DZFlSGIP6Ye1nzfgVghqE45f2wwg2Hc/4EWaXXw5LZ
   Nv9DBm/he2gn1BoNS/cbQsipd6wa5fUYeBWdbAQVV1Aa8T3py4j2rB9b7
   4H02KeAJ+0Rkv6RvyIrQ49E2m3qFvKfA3CF1doBJmm6PC2cMpCH9n1bTi
   iER/cwvJaiGBwGaDpwpYfx3i6Kp8vm+PA+NXFv73UTqEUsIPLd1xZOTwP
   X9VjV63FRi9H5lSSbm/g1FGwHcJNvxRScDxqLIzVOKC+kt7YKBU7215Rt
   A==;
X-CSE-ConnectionGUID: aa3WbyhsQYqfVmALbH2oeA==
X-CSE-MsgGUID: gJ+2D5V9RGq0l65FScLtvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104665336"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="104665336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 03:26:15 -0700
X-CSE-ConnectionGUID: OJcuzXSSRAunfbNgfZKoXQ==
X-CSE-MsgGUID: rZbjqkbaRGmxUrcesbut6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264801794"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Aug 2026 03:26:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wup76-00000000YYq-1kWI;
	Fri, 14 Aug 2026 10:26:12 +0000
Date: Fri, 14 Aug 2026 18:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 408866669ce01b8f2111afdea2c13d15a8960bff
Message-ID: <202608141801.gkwCGlsv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 408866669ce01b8f2111afdea2c13d15a8960bff  gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper

elapsed time: 2824m

configs tested: 150
configs skipped: 0

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
arm                         ep93xx_defconfig    clang-24
arm                         exynos_defconfig    clang-17
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                randconfig-001-20260813    clang-24
arm64                randconfig-001-20260813    gcc-16.1.0
arm64                randconfig-002-20260813    gcc-16.1.0
arm64                randconfig-002-20260813    gcc-8.5.0
arm64                randconfig-003-20260813    gcc-16.1.0
arm64                randconfig-003-20260813    gcc-9.5.0
arm64                randconfig-004-20260813    gcc-15.2.0
arm64                randconfig-004-20260813    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260813    gcc-16.1.0
csky                 randconfig-002-20260813    gcc-16.1.0
hexagon              randconfig-001-20260813    clang-24
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260813    clang-17
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260813    gcc-14
i386       buildonly-randconfig-001-20260814    clang-22
i386       buildonly-randconfig-002-20260813    clang-22
i386       buildonly-randconfig-002-20260813    gcc-14
i386       buildonly-randconfig-002-20260814    clang-22
i386       buildonly-randconfig-003-20260813    gcc-14
i386       buildonly-randconfig-003-20260814    clang-22
i386       buildonly-randconfig-004-20260813    gcc-14
i386       buildonly-randconfig-004-20260814    clang-22
i386       buildonly-randconfig-005-20260813    clang-22
i386       buildonly-randconfig-005-20260813    gcc-14
i386       buildonly-randconfig-005-20260814    clang-22
i386       buildonly-randconfig-006-20260813    gcc-12
i386       buildonly-randconfig-006-20260813    gcc-14
i386       buildonly-randconfig-006-20260814    clang-22
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-001-20260813    gcc-14
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-005-20260813    gcc-14
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260813    clang-22
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260812    gcc-14
i386                 randconfig-011-20260813    clang-22
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-012-20260813    clang-22
i386                 randconfig-013-20260812    clang-22
i386                 randconfig-013-20260813    clang-22
i386                 randconfig-014-20260812    clang-22
i386                 randconfig-014-20260813    clang-22
i386                 randconfig-015-20260812    clang-22
i386                 randconfig-015-20260813    clang-22
i386                 randconfig-016-20260812    clang-22
i386                 randconfig-016-20260813    clang-22
i386                 randconfig-017-20260812    clang-22
i386                 randconfig-017-20260813    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-001-20260813    gcc-16.1.0
loongarch            randconfig-002-20260813    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-001-20260813    gcc-12.5.0
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-001-20260813    gcc-8.5.0
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc              randconfig-002-20260813    gcc-13.4.0
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260813    gcc-11.5.0
riscv                randconfig-001-20260813    clang-24
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260813    gcc-10.5.0
riscv                randconfig-002-20260813    gcc-15.2.0
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-001-20260813    gcc-8.5.0
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-001-20260813    gcc-11.5.0
sh                   randconfig-002-20260813    gcc-10.5.0
sh                   randconfig-002-20260813    gcc-9.5.0
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
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260813    clang-22
x86_64               randconfig-011-20260813    gcc-14
x86_64               randconfig-012-20260813    gcc-14
x86_64               randconfig-013-20260813    clang-22
x86_64               randconfig-013-20260813    gcc-14
x86_64               randconfig-014-20260813    clang-22
x86_64               randconfig-014-20260813    gcc-14
x86_64               randconfig-015-20260813    gcc-14
x86_64               randconfig-016-20260813    clang-22
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
