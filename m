Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7E3C108A
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024552; cv=none; b=XcXIkV/9FA1NlGStumS0bz40V9rbIaeu9V7dKqgX1GUohC7+kNEkwJzjWAigJWaSbBKCdA9ACnyDqV1Qr8jarsXX60yJN+dCmJRKcKCysui5bsNHMG9Xgh7v8ilvgsPT1tpjRFUA8M0e5uijDPoTbLTZnXu1JMWrRPuKr4mCsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024552; c=relaxed/simple;
	bh=5/9DzU3jj687mC3gvTdx700Nb5cebXPjWj6u37NO7k4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lHOjCRnuiSL4O7zW1+UPjTHZT/4Xe+U5r2FVj2DuLH/+gkKsDrwZYD7WM88E3/esgMY2YJLUM5/c8Du9QO42ryTy9CwD0GOzVTUTjJuLNARPtSQzGQ3kXjGjffJbFE9psWzBeioZjeEnaBPsQLSyjn7euZ1G6KUjHukX/hvLzrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bV/X8Zq3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bV/X8Zq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789024551; x=1820560551;
  h=date:from:to:cc:subject:message-id;
  bh=5/9DzU3jj687mC3gvTdx700Nb5cebXPjWj6u37NO7k4=;
  b=bV/X8Zq3/0KvZm7GBdfjCW05SB0PELGi+zbCm1poO0e126LMs/WgkYEK
   LnPioNf4ZIIRmqq6OCalkPFcXDEpN0HuBJHb7M90kWvO32FC8HhJBZx1d
   kfU5ZU5HavMYZ/DPz6gYJ2GvA+TUKba2tx5hdBGzy/idd84NhcdJiFIZn
   Vfb/gooV8TmSuBh9HFZ6NpyrHybUggUpARX+1o/XAr0xi6iOAH+J8+RQE
   Z+ynvncEray8Jd8Ukaq6ODMo5HYSmPTw8Y+cJeXXOazcHyIs/q/Uy7U3M
   7uZ17yQkjD6sSQIOF+X5FDSLDzyyxAvvJ64nErFmaWZMtfpYB9sacix9R
   g==;
X-CSE-ConnectionGUID: 5CIFG9ZKScmqcCIzVh0UPQ==
X-CSE-MsgGUID: zrCKoGKwRDy+4Zb7tnA+CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93156321"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="93156321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:15:51 -0700
X-CSE-ConnectionGUID: X9QO5LnQRsiGQlmyoOm8YA==
X-CSE-MsgGUID: bjwrQ8xVRJOGlB9Mbcw+tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="295046249"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 00:15:49 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Z0c-000000001WG-3LAC;
	Thu, 10 Sep 2026 07:15:46 +0000
Date: Thu, 10 Sep 2026 15:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 b53a6210af0fe559670e298349968beae2c7448b
Message-ID: <202609101505.1vxj6It9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: b53a6210af0fe559670e298349968beae2c7448b  pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

elapsed time: 1097m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
