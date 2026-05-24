Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50FF1DDC38
	for <linux-gpio@vger.kernel.org>; Sun, 24 May 2026 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586930; cv=none; b=oMqNXoDpzTZmuU/8mu/ASXi6Nq2eQ3ooSlZqG36+by4RfEwBkITml2Q0LplXYLDASeEFR6KAvpbFeisqHiZMDiNMJ5pWmxAbbD8YbCoHhSXYYyu7k2U/2WAdJUCJlJpYt4NNzd2YgWyEE0SRgcX5LnWerdadKXizOMTfXp/em5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586930; c=relaxed/simple;
	bh=k6hmdiRc9xXm4ZSUFO0t0trcMhFkr2sprgD9AJiR9aI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hiC+G1oVE27POR1bB2tdojlWvrcL5WomLvm3YIV4T44zcYYrOF0+SLcc8BX0OaQYH6kQFfigolowxMz74fFzLV5C6rbZNC5osQJZFUtBSygeXe63Nn6zVcXYlBe+EumC2ufo7qOJXAdTsdR8TTkB2dED0YLz3D0Bx0cSkbgc0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlVigdWR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlVigdWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586929; x=1811122929;
  h=date:from:to:cc:subject:message-id;
  bh=k6hmdiRc9xXm4ZSUFO0t0trcMhFkr2sprgD9AJiR9aI=;
  b=YlVigdWRRK5Q78ybuXHcMzwtt9iKs+wT3C9CkyfsvOyuy/5qSx6qJ5D2
   GqTzhWMLLunfaNRtcXR3vyExQVOhUeQaYTUHYmnn0Wd7aZprZmGmT7eWa
   0Px/miuvZfkgbFIGmeDOnFIpVelfZ/Nf5gtvinQHZ+VGs67ZpmsZiLUDi
   Qt0n12hz27WrArWUp95EDxLfd9Rotu4LAu0htSfuijbAn5/YpYE6pYNTq
   0FH4UFGmLs2fkgdeueNfNQQ5nmS35NzozfXvrJKy4w/0+zeuMbsUS34Vq
   T8SWOYVqk1JLZvlfe7BQyfP9MjSskTpJz/keZdYHMzfLCZgH0rKeFv4Uv
   g==;
X-CSE-ConnectionGUID: lDJJZ0GuTiK/TfvodZh5zw==
X-CSE-MsgGUID: AZUnBKZwQKWteNaMOE/i1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="103138234"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="103138234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:42:09 -0700
X-CSE-ConnectionGUID: vy5/iwOqQS+jPrsbFv8U6Q==
X-CSE-MsgGUID: hx1kJnt8Qo+d6ksgnWD7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="241330320"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2026 18:42:06 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxqu-000000000Yj-2VmB;
	Sun, 24 May 2026 01:42:04 +0000
Date: Sun, 24 May 2026 09:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b8f192cec7dcb2e4f04ee57ab78d51777b0a5729
Message-ID: <202605240947.RaADLYih-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b8f192cec7dcb2e4f04ee57ab78d51777b0a5729  Merge branch 'devel' into for-next

elapsed time: 741m

configs tested: 151
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260524    clang-23
arc                   randconfig-002-20260524    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260524    clang-23
arm                   randconfig-002-20260524    clang-23
arm                   randconfig-003-20260524    clang-23
arm                   randconfig-004-20260524    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260523    gcc-15.2.0
arm64                 randconfig-002-20260523    gcc-8.5.0
arm64                 randconfig-003-20260523    gcc-9.5.0
arm64                 randconfig-004-20260523    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260523    gcc-9.5.0
csky                  randconfig-002-20260523    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260524    gcc-8.5.0
hexagon               randconfig-002-20260524    gcc-8.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260524    gcc-14
i386        buildonly-randconfig-002-20260524    gcc-14
i386        buildonly-randconfig-003-20260524    gcc-14
i386        buildonly-randconfig-004-20260524    gcc-14
i386        buildonly-randconfig-005-20260524    gcc-14
i386        buildonly-randconfig-006-20260524    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260524    clang-20
i386                  randconfig-002-20260524    clang-20
i386                  randconfig-003-20260524    gcc-14
i386                  randconfig-004-20260524    gcc-14
i386                  randconfig-005-20260524    gcc-14
i386                  randconfig-006-20260524    clang-20
i386                  randconfig-007-20260524    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260524    gcc-8.5.0
loongarch             randconfig-002-20260524    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260524    gcc-8.5.0
nios2                 randconfig-002-20260524    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260524    gcc-15.2.0
parisc                randconfig-002-20260524    gcc-12.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260524    gcc-8.5.0
powerpc               randconfig-002-20260524    clang-23
powerpc64             randconfig-001-20260524    clang-23
powerpc64             randconfig-002-20260524    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                    nommu_virt_defconfig    clang-23
riscv                 randconfig-002-20260524    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260524    clang-20
s390                  randconfig-002-20260524    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260524    gcc-15.2.0
sh                    randconfig-002-20260524    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260524    clang-20
x86_64                randconfig-002-20260524    clang-20
x86_64                randconfig-003-20260524    clang-20
x86_64                randconfig-004-20260524    clang-20
x86_64                randconfig-005-20260524    clang-20
x86_64                randconfig-005-20260524    gcc-14
x86_64                randconfig-006-20260524    clang-20
x86_64                randconfig-006-20260524    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
