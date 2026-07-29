Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5832B131
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 02:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785291047; cv=none; b=Mii6i/qLK8j2ssRbZQ9fTkMSSiUo67RGuZVVuRtoSoLCqT0NAVGtkrn5uWPZcj40/fX7tRIZo0jCF6DyHv6q1KbT/+m4gsqQVU4KD2TzlYYKe1tjFmCVDBvUM9jtufnC2HJRddSJgZnN6c4mffdxB18r15BHHbE8dpuW9HgAR0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785291047; c=relaxed/simple;
	bh=p+44xTFQr6c1hnkd4/yzJgdy1pfYgH5LL2rmlpZqdls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PbzJXEhuywiHN5z4an0DQKaiJAKcmflFrV2lfM3IrWFetobJaxNCL77Y+OYn4ArJnR+5SrwJCPPBExYHaJsEIXQHkEQG2F4Ro65GFNVl6v4otDS4emQmRgJfKCLgyh0w7u42xV1e1PA4zj4+26U7NP8daT14N/8LWXXY9PGYrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+PwreiW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+PwreiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785291043; x=1816827043;
  h=date:from:to:cc:subject:message-id;
  bh=p+44xTFQr6c1hnkd4/yzJgdy1pfYgH5LL2rmlpZqdls=;
  b=L+PwreiW8sNUqpAO+7KBsG4a0v4Ht3bJ0/TSpIW9qVblbmJbg+H8J6Ou
   u31eaNGbWyQshzDwHaQ3fqTXYm/hckOu3EpBThL+lq6J2uW9Fg+P+DnuG
   74VhaDP6QPanErIrNGL1ZMVqtbKJ6uNyQBkBIKlkrtBnBnHACoflzf6+Z
   lIgJnTF5PIA6NSWF7LrIGYHZehVhCRwdy5o2YUtR96A4jZcTIx7Z/NWip
   b0ced5olDNI0TyeC5LYS7owTSUV85a8cVp3g8OtAsQrdPRUIheTwQXYiG
   gbrxzdSjNzJayOmaQY16tTJTWgECYPrDIA6MYvJuH4165/Not3UF0Uz9s
   g==;
X-CSE-ConnectionGUID: FI9faiUTSxyciJaZGtRFug==
X-CSE-MsgGUID: h231RJb7Sh2o60pTmP1/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96552319"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="96552319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 19:10:42 -0700
X-CSE-ConnectionGUID: SCmZK/qXRhmH+UsbEQrUWA==
X-CSE-MsgGUID: mN6EzggJQqq4Iv/nhKDzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="283209242"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 19:10:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wotkk-00000000exX-3ZMR;
	Wed, 29 Jul 2026 02:10:38 +0000
Date: Wed, 29 Jul 2026 10:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom/for-next] BUILD SUCCESS
 1860fb0be224dec0e4d170f46d1cbbc77e25e09e
Message-ID: <202607291039.1hX1GoE7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 1860fb0be224dec0e4d170f46d1cbbc77e25e09e  pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip

elapsed time: 1801m

configs tested: 93
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260729    gcc-8.5.0
arc                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-001-20260729    gcc-8.5.0
arm                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-003-20260729    gcc-8.5.0
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
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260729    gcc-9.5.0
nios2                randconfig-002-20260729    gcc-9.5.0
parisc                          alldefconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260729    clang-24
parisc               randconfig-002-20260729    clang-24
powerpc              randconfig-001-20260729    clang-24
powerpc              randconfig-002-20260729    clang-24
powerpc64            randconfig-001-20260729    clang-24
powerpc64            randconfig-002-20260729    clang-24
riscv                randconfig-001-20260729    gcc-15.2.0
riscv                randconfig-002-20260729    gcc-15.2.0
s390                 randconfig-001-20260729    gcc-15.2.0
s390                 randconfig-002-20260729    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260729    gcc-15.2.0
sh                   randconfig-002-20260729    gcc-15.2.0
sparc                randconfig-001-20260729    gcc-10.5.0
sparc                randconfig-002-20260729    gcc-10.5.0
sparc64              randconfig-001-20260729    gcc-10.5.0
sparc64              randconfig-002-20260729    gcc-10.5.0
um                   randconfig-001-20260729    gcc-10.5.0
um                   randconfig-002-20260729    gcc-10.5.0
x86_64     buildonly-randconfig-001-20260729    clang-22
x86_64     buildonly-randconfig-002-20260729    clang-22
x86_64     buildonly-randconfig-003-20260729    clang-22
x86_64     buildonly-randconfig-004-20260729    clang-22
x86_64     buildonly-randconfig-005-20260729    clang-22
x86_64     buildonly-randconfig-006-20260729    clang-22
x86_64                                 kexec    clang-22
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
xtensa               randconfig-001-20260729    gcc-10.5.0
xtensa               randconfig-002-20260729    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
