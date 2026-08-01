Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714323392C
	for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2026 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785556269; cv=none; b=gkqOlkn2SBF2gpLFpwAlOHkK6iwkEE37IBSzyr4MXBYvH/Un8lr/U8tR+8BDZH+sebt1EzTeVM1QVDldGuHg73Jdx5c7NDSo6I3mNCTTdv9jC3xsk4uqI6nOgiMglMuSVXY40TuRgytRI8sr/KP7S3IqCV/Q1at0qwhseKbRprQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785556269; c=relaxed/simple;
	bh=3y5OEEaBPQiDXcXeR7o4th0l66kSWVXM7zzjS3k68Yc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vCF4N+Q0hZdlagQkajSDnVyaGKeBFOqsUBOy0zR3pTmCjcXxfZmzC4GkPkLzR8v3q7J1vBWMTbW4MVy5X21KkD+LqVPpx/VHWMo5AYHdl7DOnjeYAAtJDZIdN7wCktrpJ8u8N3iA8Uw/V+1wocOOdlEowdUNGKc0s1RyDRNJOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nw8uGhCa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nw8uGhCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785556267; x=1817092267;
  h=date:from:to:cc:subject:message-id;
  bh=3y5OEEaBPQiDXcXeR7o4th0l66kSWVXM7zzjS3k68Yc=;
  b=Nw8uGhCav5BsQj3sfPLTm4D+rxQwuiFy1T9T9nwZ/rLdh5EcOYszg1e1
   Va1RJeDpgS9ZwGMRzMIjeJvPAqgyPs/h1RNA4ZhJhzVGFalO/tdvB2Xr0
   XpwaD1n9da9MtcZFkYmg/Mj5wffbGS+v7v/nSLQjGH5txkUo++CPdgy74
   n9r4qBQFWkaa+OIVPXBB7a9554fSKqy5wGQwnPdxfcBX6bD49yxsHiwNV
   F2zJI1pd7fXQbVTd1kAgo7V4YAsqQEGgAXW/IEkVmf3+gZI18LYG4UkM5
   lsMnokop6emR3xP1AuZClKksheuSkQQ92npxCc8MaPD+zPyHHw022HQMF
   A==;
X-CSE-ConnectionGUID: lsjJcP6hR5uR69qDMapKZw==
X-CSE-MsgGUID: ZfHXzrbkTDqU3sRdfayvsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="111731099"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="111731099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 20:51:07 -0700
X-CSE-ConnectionGUID: UCQZmkKfTzy7z+HosZl8aw==
X-CSE-MsgGUID: Eo9QL9SlT4myQ/EwyiBiNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="254448014"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jul 2026 20:51:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq0kZ-000000002fp-1yjI;
	Sat, 01 Aug 2026 03:51:03 +0000
Date: Sat, 01 Aug 2026 11:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d761c7e38a000603a9d16270a1af770a0e8efb5e
Message-ID: <202608011145.XWekTpOq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d761c7e38a000603a9d16270a1af770a0e8efb5e  gpiolib: Check gc->get_direction() before calling gpiod_get_direction()

elapsed time: 787m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260801    gcc-12.5.0
arc                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-001-20260801    gcc-12.5.0
arm                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-004-20260801    gcc-12.5.0
arm64                randconfig-001-20260801    gcc-10.5.0
arm64                randconfig-002-20260801    gcc-10.5.0
arm64                randconfig-003-20260801    gcc-10.5.0
arm64                randconfig-004-20260801    gcc-10.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-10.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
hexagon              randconfig-001-20260801    gcc-16.1.0
hexagon              randconfig-002-20260801    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260801    gcc-14
i386       buildonly-randconfig-002-20260801    gcc-14
i386       buildonly-randconfig-003-20260801    gcc-14
i386       buildonly-randconfig-004-20260801    gcc-14
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
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
loongarch            randconfig-001-20260801    gcc-16.1.0
loongarch            randconfig-002-20260801    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260801    gcc-16.1.0
nios2                randconfig-002-20260801    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260801    gcc-9.5.0
parisc               randconfig-002-20260801    gcc-9.5.0
powerpc                     bamboo_defconfig    clang-21
powerpc                  lite5200b_defconfig    clang-24
powerpc              randconfig-001-20260801    gcc-9.5.0
powerpc              randconfig-002-20260801    gcc-9.5.0
powerpc64            randconfig-001-20260801    gcc-9.5.0
powerpc64            randconfig-002-20260801    gcc-9.5.0
riscv                randconfig-001-20260801    gcc-14.3.0
riscv                randconfig-002-20260801    gcc-14.3.0
s390                 randconfig-001-20260801    gcc-14.3.0
s390                 randconfig-002-20260801    gcc-14.3.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260801    gcc-14.3.0
sh                   randconfig-002-20260801    gcc-14.3.0
sparc                randconfig-001-20260801    gcc-11.5.0
sparc                randconfig-002-20260801    gcc-11.5.0
sparc64              randconfig-001-20260801    gcc-11.5.0
sparc64              randconfig-002-20260801    gcc-11.5.0
um                   randconfig-001-20260801    gcc-11.5.0
um                   randconfig-002-20260801    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    clang-22
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260801    gcc-14
x86_64               randconfig-002-20260801    gcc-14
x86_64               randconfig-003-20260801    gcc-14
x86_64               randconfig-004-20260801    gcc-14
x86_64               randconfig-005-20260801    gcc-14
x86_64               randconfig-006-20260801    gcc-14
x86_64               randconfig-011-20260801    clang-22
x86_64               randconfig-012-20260801    clang-22
x86_64               randconfig-013-20260801    clang-22
x86_64               randconfig-014-20260801    clang-22
x86_64               randconfig-015-20260801    clang-22
x86_64               randconfig-016-20260801    clang-22
x86_64               randconfig-071-20260801    clang-22
x86_64               randconfig-072-20260801    clang-22
x86_64               randconfig-073-20260801    clang-22
x86_64               randconfig-074-20260801    clang-22
x86_64               randconfig-075-20260801    clang-22
x86_64               randconfig-076-20260801    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260801    gcc-11.5.0
xtensa               randconfig-002-20260801    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
