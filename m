Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9F357D07
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407207; cv=none; b=fE43afysEijLQh9oyFcN++S44pPdisTLnCDXGW8HaI0MegvBLotk29iPIJgjNhaJVXpXy5ylCCZ7FvlemPvMUQpC38b2BMOAUZa1Ny+1YWMBYsvbZ0fNi74tnUmPD/x4V5Ysu8k5hTRTgr7lUZEDXPoW5Vuu5pX73zobaGkWcGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407207; c=relaxed/simple;
	bh=np+D1rPGPFKMWdkh+wXl12P8pHhZuAyNwk5nbBQv+Rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKjIvU9TQUkHUdoLvtk6CowJyJG7vcpHtqbRa83KYxz0Pa3MtDfQ3WzTUH8PyZhh5w+jIu5+XwgJT/3f574anJX7FXf7kwLpjKoc9Bzbz9UFUt1cb9HXOhShQa1xN+KMSe7drXE8bpqq2f92r95dq7w45neAyEfpf8dNP6gmdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKVteilA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKVteilA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788407205; x=1819943205;
  h=date:from:to:cc:subject:message-id;
  bh=np+D1rPGPFKMWdkh+wXl12P8pHhZuAyNwk5nbBQv+Rk=;
  b=gKVteilAFcnDQUNrH+GnOqOtORFyyGowuNmfKkPcTvPyXN1es1tH1E7h
   C2g3dhW6ac+jDsgoZBUOpFYhYvyqCtL/NErjA5zaNOQW4OIlaVsa+qPm1
   xao7mBo+Z4VgKK/fyQSpCeQaReM1OVjwHp/SMUIyk5/xXyc3ZsNEylXDn
   M/Kr9KKNuaHOgGQAFdknITMb/SR6B1vyep3a32wP9TFT8jX8QYOsEvEgZ
   uQoQ1hP+rMCCZsVMYizBV+wWIldMNTiu+99WOfEc6AWiIkXn/O2cw7PJT
   RfeN7RkR6WZsAplgAWX0hTVC5KcbF2LxI9B9KroCaMIJ5SJMafqCBa3fW
   w==;
X-CSE-ConnectionGUID: ob044X9VQGyhOS2gIGIAFQ==
X-CSE-MsgGUID: KAp3cilXQki8zg4qfYW5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88018833"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88018833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:46:45 -0700
X-CSE-ConnectionGUID: Nl3V2LhoRC+hoE6lo9lJNw==
X-CSE-MsgGUID: bYXEiuazRK2qee7T7NpHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266994143"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 20:46:43 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1yPR-000000003wA-208H;
	Thu, 03 Sep 2026 03:46:41 +0000
Date: Thu, 03 Sep 2026 11:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 1f1d0812f6a8ab8e6f709c599f137c99646512cc
Message-ID: <202609031139.6w3Bs6Ft-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 1f1d0812f6a8ab8e6f709c599f137c99646512cc  gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found

elapsed time: 2114m

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
