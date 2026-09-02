Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB1381EBB
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370785; cv=none; b=tHEkxZmJPlxwfQlRZc1Z4xka3x10JwOBCgXHYUfph/U1mCKIvaDfqZEyi0eEl/UoXJLK+cd+RqUVTQNQFA2Jns2IYXLjfab/00+rlcqj5E+a3dFEYThh3TX4x8v5SMrClsZr0O0QJtcMYzMO6iObnIHHxMkA0Mwg1AUMOKsCic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370785; c=relaxed/simple;
	bh=SpnFEtQibI/sTF3/7YcBpAQVtzWim0zLQOjwAHqStyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZUHfT2yeoco5vpWvN05DMMHgEP9bRwhzUvfP3DzLOB+JACnM24/2mNQXXIaYb651gFejnCc/JyKRArP0KWXZlsyMLj883pCtreDDo8URnRZcd/DAjhGV7IdTMoPEfvXnLc6FhptB2hlFbwW0UeDrDuSdo5BR0wuAia7qfvgk4EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS1I1wO+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS1I1wO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788370783; x=1819906783;
  h=date:from:to:cc:subject:message-id;
  bh=SpnFEtQibI/sTF3/7YcBpAQVtzWim0zLQOjwAHqStyQ=;
  b=SS1I1wO+bUDrnzh465JWrLZmTl3EJm4O4XDbtUvggNHjVouB3Ik4TLIl
   K0QAMRBLQDNu9Xu4DwlqIkYcEGIPt5Xs2Kvg8qDVG8iE7LUlHKKWDiQOv
   Xwvw9KTVHtPx5EyZSdSq5Bl5XdHu4oZEo44MwaloixblZeget/zdXq1EP
   Waqlj9iIrCvzmdD3Qo+nKkq74QJgVMmM+MjsewzhMO0LWKrb07GLqb5Vl
   GPCL5/upRepQQeCr7R9eKVZjk8ZXugWNZ/VUhoIIhSmJ9yzYkTUIItls4
   09kDBXWLlSs8RtDLIf46GP9Am2ObLv7OpU7/2WaXw671ZkCVrXmbx2ff3
   w==;
X-CSE-ConnectionGUID: v0ZCxpeWRjOVKZAKCGQR/A==
X-CSE-MsgGUID: xGtQ5lpvTQeMzgGgi48aNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88889790"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88889790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:39:42 -0700
X-CSE-ConnectionGUID: 0N9zhUw4RNKBudhj8ovemA==
X-CSE-MsgGUID: no2VBh1bQIuZjVIwvzVzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268154153"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2026 10:39:41 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1ovz-0000000034s-1sK0;
	Wed, 02 Sep 2026 17:39:39 +0000
Date: Thu, 03 Sep 2026 01:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 1900b5a41493e7050c68c1e62780d6fb9a209457
Message-ID: <202609030117.VXQDetP5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 1900b5a41493e7050c68c1e62780d6fb9a209457  gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA

elapsed time: 1508m

configs tested: 58
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
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
