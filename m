Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4336403D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500836; cv=none; b=gwYxNDD1WF1lQC/pTDbhLykZFgpABBj8Dr1kSjxlURXo+NPMw0kiMJCSmTVA7vgSQQq29ZEV4QJ1ib6jEJY2O1zCx+5v1KJz7dvV3c8+JAJQuuy1f00jklyiEIa69hfE0bvpR/cNun3KtiVIgZfe2Hy8+Gg8/Q40Sd2tWcUqVxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500836; c=relaxed/simple;
	bh=Jq3d60a8UqDLl5EzsWoZ+pzXFQDgA4vGCC2rzLbcjqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L7xtMLTbUQv+byklUIJgEtOvddUN85Xg0If9zd39VBvVhjdqjWcMSkQth+dPT8YtTymfbuCrnsu+0fSnO5OSkcMBHnCGn6j2gIL4zjlCQO3ZtRmdvPcUJLbu4AWnPIezUw77S6Oo9vD7TfIRN6kBJJd1IPEU9mns9UKoUUPf3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLWEv35N; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLWEv35N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772500834; x=1804036834;
  h=date:from:to:cc:subject:message-id;
  bh=Jq3d60a8UqDLl5EzsWoZ+pzXFQDgA4vGCC2rzLbcjqA=;
  b=HLWEv35N+7rfK7Zo1O6QYa78kQfgTyBoyRFL20mKcg2ftAgIUpycMtoR
   nbU1+8bVaOpBnQtou2Xhd124JWZCfXqHqkhnogiNBHJLyeh8psE26WZ6P
   Dxhg6DXdKKf4ttP8McVYsa72ffi0XJF4S2LTdIFExuy0gKjCUcUH3VeHE
   rbe5dRyQk20CLCRl3UElv3qzXT5yyoEZ/EkZIqN1K4c3anVqsFgWTjDSp
   r9IHCsn+HKI9tq5YH+04WoaqwABe+OiuGa2Fb98AqMvWTcHlXdJRhvogD
   TRrjruewYmADH3+Iv2wy3mdHviQEp3Rr0GkPUxwrUNWBazX8dNKqAlhw3
   Q==;
X-CSE-ConnectionGUID: CylOlJxMScapBPgPc0KsTQ==
X-CSE-MsgGUID: 1MnK66v6QSioP6oJ+roLwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91096157"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="91096157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:20:33 -0800
X-CSE-ConnectionGUID: m1P03UpbSiKiy/p1LClY9A==
X-CSE-MsgGUID: tYwlzCcjR0CzWUa3s5k3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="216252726"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2026 17:20:32 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxER3-000000001b3-2M0P;
	Tue, 03 Mar 2026 01:20:29 +0000
Date: Tue, 03 Mar 2026 09:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 fdfe3e72a228b74da21939c47ebd6f5ad4969d5f
Message-ID: <202603030902.W8OttXZe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: fdfe3e72a228b74da21939c47ebd6f5ad4969d5f  gpio: Fix lockdep warnings in gpiolib_{cdev,sysfs}_register()

elapsed time: 954m

configs tested: 63
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    clang-16
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    clang-16
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon      allmodconfig    gcc-15.2.0
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    clang-16
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    clang-19
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allmodconfig    clang-19
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    clang-19
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
um           allyesconfig    gcc-15.2.0
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
