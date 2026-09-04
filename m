Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980D3385AC
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562689; cv=none; b=kLZ6peV/HmZr8ozjqV6cxB4GtgPvr6XkmsY7JkL2rSTge1ipQh79xKt/392+ypS8pkYylFw35q6p2dOEN8h1GopluAPjJrHoRbkFeARW/sYxkY6p3iqUZWGbY/se91uma5ybBWyzZeXeZS1866cA8ZsX3rvBh2E93TCv/YzYlu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562689; c=relaxed/simple;
	bh=IWPLb8VTQn/QL6xzKSoqEejSdlqmNqQDIEczZYcPops=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RdK1rEGxs35DqUvDz+7L8I7GD+JF16RkZ+ERDeUJrF3y3mjPC3tGyawuS7/EjO7GnP4rkzd2QCrh4Oxf2UD83xddS4mAAOlPF8lvAje+2aspZBbL4TvtmT4gCUA6hUSvtDU823RLeBeBr4Gw43nDgIQ/vLmBgciy/Yfb6SWI+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXbNiSiS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXbNiSiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562689; x=1820098689;
  h=date:from:to:cc:subject:message-id;
  bh=IWPLb8VTQn/QL6xzKSoqEejSdlqmNqQDIEczZYcPops=;
  b=gXbNiSiSuTUSO88neZfy/fVrOKr3JFWldwRybNXwlhNXQlcyov5CEwXT
   zUjRcBSoDPamlm2t0/s9jb00oVHUiVCd6u0dfwPcO6w2+t3Uqa+6QWPxR
   EvHTmBsHg4NVIB6WgrF6OAOz9rvHQ6THrQ/nKmvVaJ2D8mOetdxfsgw+J
   fUoNLOIzjzkRg1c3ZWXskU3kzMhYvmkt4+nWQDrDtBtQCEAC7W2Jy7A1b
   7Ltqqyd94bqzWy8Co3rOc5gcvPpiZQ4HOWzVpp39B645VzLAQ/TtLPq2s
   IhXzdVg09UMhpFWiHK4LH7gJgQ3ou4g+bhWhwZyDL0iNvUrhDzRIlHTp/
   g==;
X-CSE-ConnectionGUID: aMYWbfrqQriBZbICIazp0w==
X-CSE-MsgGUID: u5lF2kqxS/K+IJyMaQpVgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89089320"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89089320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:58:08 -0700
X-CSE-ConnectionGUID: q/kgRjxwRWmIAvMMAQ7MWA==
X-CSE-MsgGUID: +SgcTqSQQnmYlzcpTJdnmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="265806655"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2026 15:58:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2crE-00000000AEg-1mpj;
	Fri, 04 Sep 2026 22:58:04 +0000
Date: Sat, 05 Sep 2026 06:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 a2cfc48fee416f0ea78e7dc38acbf2ce072574cc
Message-ID: <202609050635.ffRUxDlA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a2cfc48fee416f0ea78e7dc38acbf2ce072574cc  gpio: altera: Fix build failure caused by undeclared 'irq'

elapsed time: 2263m

configs tested: 53
configs skipped: 2

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
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
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
