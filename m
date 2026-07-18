Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1E282F21
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 06:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784356788; cv=none; b=imM8hdr9ZmsyBdTGxBztFVQvHs2wcYPNiCKjNSSgqylCpQsNrWwuQa9XrMsRv743YsRYvlUoBG/FW3RiZHtrrMzN2aQqcAI+/aIzFH1TT3ONIttgk5nXuKJ5ZFJbv2wwyDqXaDp8ZN2drBeUI1mFHaRpLF/ZCZyNPZmm0ZBZkVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784356788; c=relaxed/simple;
	bh=+qwCkUZm3G1YseTuhfS5+hrCwo+7zwTRMJsyu4GI17c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HM0KqgtXikZsApgiVI3yxuwnamUKXMzC7qD+q4sDKvFSmjpyPNfYdXRe9pUm0UXg95CU4eg/ygeaOq44BVrOhPxeVWS6SDNDUng2FADW0Ue578Er9PwkTYFYHoGBf3MrxWgO7vvu+cteH8gSfPL9tzY38hAVUlfDsPTHmg9wSlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbTMGQL4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbTMGQL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784356786; x=1815892786;
  h=date:from:to:cc:subject:message-id;
  bh=+qwCkUZm3G1YseTuhfS5+hrCwo+7zwTRMJsyu4GI17c=;
  b=SbTMGQL48MasGaGp/+/LP0KivvyNkSNlqRFPyFwn1M+l9NI8AMfMsk76
   vzm7JP9OPBKCyAfOrqfWdTElZFDzZYQ1KHJHsl531nesn+ja9ZS8ZkFBa
   qoYDz1D9tQDLF6prQBq2WGVEFXqm59AyHdgXE0AqR3k8+LUV2VIj1ZVh5
   tzFY8rJiYYq1aQ0m04rPNdZjukyiAPf9fEmHC9Q8EEOVuShFcQ/dxzA8X
   7GgrsWW6A3rLu9qcEYdO8laabhnR3BTCZ7xjvHhNVjW8qBK3mS/+lUAZ6
   QHP0LsAtNT8U14HA0Yk6bXy5Jy7lxfW3uP4m6i9jLuhl2sDvNHczPuKg/
   Q==;
X-CSE-ConnectionGUID: nIgu4MoPSg66Q2YxCAhR9Q==
X-CSE-MsgGUID: FNxOZRnATeyWNgJmIqPJow==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88838022"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88838022"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:39:46 -0700
X-CSE-ConnectionGUID: HzMzs5OtTFuT53OqFtbYlw==
X-CSE-MsgGUID: UFhMGsc0Q2W5eTLFtpMAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="280250945"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2026 23:39:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyi6-00000000TWl-1pqv;
	Sat, 18 Jul 2026 06:39:42 +0000
Date: Sat, 18 Jul 2026 14:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 fbd35c8cc6c6e817385f2bfa07fa4227370a3010
Message-ID: <202607181434.pnrr8NNP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: fbd35c8cc6c6e817385f2bfa07fa4227370a3010  gpio: pcf857x: Use le16_to_cpu() and cpu_to_le16() in IO accessors

elapsed time: 748m

configs tested: 97
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
arc                  randconfig-001-20260718    gcc-8.5.0
arc                  randconfig-002-20260718    gcc-8.5.0
arm                  randconfig-001-20260718    gcc-8.5.0
arm                  randconfig-002-20260718    gcc-8.5.0
arm                  randconfig-003-20260718    gcc-8.5.0
arm                  randconfig-004-20260718    gcc-8.5.0
arm                          u8500_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260718    gcc-14.3.0
arm64                randconfig-002-20260718    gcc-14.3.0
arm64                randconfig-003-20260718    gcc-14.3.0
arm64                randconfig-004-20260718    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260718    gcc-14.3.0
csky                 randconfig-002-20260718    gcc-14.3.0
hexagon              randconfig-001-20260718    clang-18
hexagon              randconfig-002-20260718    clang-18
i386                            allmodconfig    gcc-14
i386                 randconfig-001-20260718    gcc-14
i386                 randconfig-002-20260718    gcc-14
i386                 randconfig-003-20260718    gcc-14
i386                 randconfig-004-20260718    gcc-14
i386                 randconfig-005-20260718    gcc-14
i386                 randconfig-006-20260718    gcc-14
i386                 randconfig-007-20260718    gcc-14
i386                 randconfig-011-20260718    clang-22
i386                 randconfig-012-20260718    clang-22
i386                 randconfig-013-20260718    clang-22
i386                 randconfig-014-20260718    clang-22
i386                 randconfig-015-20260718    clang-22
i386                 randconfig-016-20260718    clang-22
i386                 randconfig-017-20260718    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260718    clang-18
loongarch            randconfig-002-20260718    clang-18
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260718    clang-18
nios2                randconfig-002-20260718    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-16.1.0
parisc               randconfig-001-20260718    gcc-16.1.0
parisc               randconfig-002-20260718    gcc-16.1.0
powerpc              randconfig-001-20260718    gcc-16.1.0
powerpc              randconfig-002-20260718    gcc-16.1.0
powerpc64            randconfig-001-20260718    gcc-16.1.0
powerpc64            randconfig-002-20260718    gcc-16.1.0
riscv                randconfig-001-20260718    clang-24
riscv                randconfig-002-20260718    clang-24
s390                 randconfig-001-20260718    clang-24
s390                 randconfig-002-20260718    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260718    clang-24
sh                   randconfig-002-20260718    clang-24
sparc                randconfig-001-20260718    gcc-11.5.0
sparc                randconfig-002-20260718    gcc-11.5.0
sparc64              randconfig-001-20260718    gcc-11.5.0
sparc64              randconfig-002-20260718    gcc-11.5.0
um                   randconfig-001-20260718    gcc-11.5.0
um                   randconfig-002-20260718    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260718    clang-22
x86_64     buildonly-randconfig-002-20260718    clang-22
x86_64     buildonly-randconfig-003-20260718    clang-22
x86_64     buildonly-randconfig-004-20260718    clang-22
x86_64     buildonly-randconfig-005-20260718    clang-22
x86_64     buildonly-randconfig-006-20260718    clang-22
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260718    gcc-14
x86_64               randconfig-002-20260718    gcc-14
x86_64               randconfig-003-20260718    gcc-14
x86_64               randconfig-004-20260718    gcc-14
x86_64               randconfig-005-20260718    gcc-14
x86_64               randconfig-006-20260718    gcc-14
x86_64               randconfig-011-20260718    gcc-14
x86_64               randconfig-012-20260718    gcc-14
x86_64               randconfig-013-20260718    gcc-14
x86_64               randconfig-014-20260718    gcc-14
x86_64               randconfig-015-20260718    gcc-14
x86_64               randconfig-016-20260718    gcc-14
x86_64               randconfig-071-20260718    clang-22
x86_64               randconfig-072-20260718    clang-22
x86_64               randconfig-073-20260718    clang-22
x86_64               randconfig-074-20260718    clang-22
x86_64               randconfig-075-20260718    clang-22
x86_64               randconfig-076-20260718    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260718    gcc-11.5.0
xtensa               randconfig-002-20260718    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
