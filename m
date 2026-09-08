Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2D4A1DF9
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869080; cv=none; b=Kcst71+xnbzyoDG18n6Zsyasc9ee0xLqjEfou/55qRoB2IJBWQRPT/D9T33RxDAnkses/omlx5G6YYi9Nb/svhKv/ShGJa2rsrux7DeSfOASja8SKrW4sbplUoB5NIBsqzTHIjB7q/MEGJb+9mXkEZz+44lia/o3CeL+z4Nve7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869080; c=relaxed/simple;
	bh=3vhfq+NjDSoVkW+gInfDhPF+qVhDqCmVwdJCrNY9VT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ptyY2Uq8Zz92cYhFVXNQ4l3pYLLYTZStyrin71QJesWbx1nIr726PnH/A3tAccB+qvPasN3G8bkap0Ve68/QKx8S/xVNYSaMd1CRyAbxMFuikXPb3XguFfZRdgESbaGI+VmctkKmqQwDWWyjR1i6joEBC0NYPXjI7KMKuFiV6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpYr10xl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpYr10xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869076; x=1820405076;
  h=date:from:to:cc:subject:message-id;
  bh=3vhfq+NjDSoVkW+gInfDhPF+qVhDqCmVwdJCrNY9VT4=;
  b=kpYr10xlNtx+d681ytcywYBJ2ssPiOzT3aB9oBQhG060w+RHARAZtNoP
   eBZrb8z/31n46mQ+5UQPOI1N50r6w3osQxHWJ4Jb+a2bjO1/JSWwCg3pM
   GgAcyiK0uZPabO2A9lyVjaczfK8GbVbQNvvnr5rLsIoGhLzNWbEvG8eva
   pdll+ppMNMxaOAjjkleAo8DGMuYHc5i6apCDPjrd3iRMWXfW6fVVcDiOY
   BeUERtMkAdXJwx656Jac/mUo1ZfUxVzxzzViOLgKFn1uf3V0lY/5PDJ4M
   rjCGW+mYZbtfs+heCeSfEqyMK1tKI/HuMvwPmRjpfsqedFgPIbtGohkz9
   Q==;
X-CSE-ConnectionGUID: vTH4SEpUTa+p/jtHX8BUYQ==
X-CSE-MsgGUID: M/+NGsJjTCuuPn8gwKqr5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89310808"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89310808"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:04:34 -0700
X-CSE-ConnectionGUID: 7XtCd6n1SyekRNa/8CgI3Q==
X-CSE-MsgGUID: pZgH/7ssT7OMyCcH37z0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267303980"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2026 05:04:32 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3uYv-0000000004h-3kNJ;
	Tue, 08 Sep 2026 12:04:29 +0000
Date: Tue, 08 Sep 2026 20:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 d4f74023be11eb9aea9a8c0b0582f20aa2c2640b
Message-ID: <202609082033.A3wRwcSs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: d4f74023be11eb9aea9a8c0b0582f20aa2c2640b  dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names

elapsed time: 1618m

configs tested: 81
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-19
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
