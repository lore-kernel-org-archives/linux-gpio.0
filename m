Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0E5477E
	for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2026 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785050619; cv=none; b=sbiRYS4gZrdIcyNSU7mLEFTMSekfE1vsPG+C9i+p7xn82jaKf3oIaaF+DY+XRmg77J0CaktOEN2W8Wj7kFsn9Cwj1Ow0RE7p7SAQ5iFu2psZRxSUCmH65jFNLXK5EkOO7Skb2xhnFtmiynWqbdMEMZp/25Kv279YAkBLpMzBiNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785050619; c=relaxed/simple;
	bh=iClk7UB+LHumE3qBCLINl8YaYZxtBF8GkFNXlUop01o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TPkvGUC0XJRdm0V+4dcHkJprcGh5gIuRQHBF6l0Ik9V0pmMkgTiI3ewZq36zeSvYOPdpT0te6Ts7/TH0P0MfLoZgiM7IlVE3OBO3di2awXpCkDqyc1ShkfivLW4xOpEJD/hWIYhp8JFVcG224yjfvVPAI2qhJ6HvddbLL7zJrdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZy8Sp7/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZy8Sp7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785050617; x=1816586617;
  h=date:from:to:cc:subject:message-id;
  bh=iClk7UB+LHumE3qBCLINl8YaYZxtBF8GkFNXlUop01o=;
  b=YZy8Sp7/BpqBCanHHJf/IYPnguocGcM1du/BT6pFsuwvk8ieaquMXzX2
   Wtl0Hpo8f0JiydA4Fywnj3CAlhs9q8dPKHhkvT7cV2PqrR9qnkVfCdgzo
   cWAFB8gniLA7IqaxKiccHJ0VHoXMXLIzaoU9eLVHMwbCQgexQ+keijR7a
   KjjzbZ6m0CFBSFybD37GXOU+15zdQHDU+k20s8Z00W5ctnSzmheCUFH+6
   fUvRF2otFhC9Gji09MFutlUfNesR3nXpRLxLsa9E5QcGL9PnVSwhEBLbt
   Z5GsKv7j625qbGKgDXWo9S52aQMxZD3LkkJnAToEFzJWqfIIl5sGgtVT6
   A==;
X-CSE-ConnectionGUID: bkSAVpBTSBey3s5/yU+wXA==
X-CSE-MsgGUID: 1FgO8tSLTnCPoprRdzteKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85839580"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85839580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 00:23:37 -0700
X-CSE-ConnectionGUID: 7aanYwTIRWidR2ohhFbEJA==
X-CSE-MsgGUID: azR5K7C1Q7aB/rtWa8XnuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="255184497"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jul 2026 00:23:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wntCv-00000000cNL-06sr;
	Sun, 26 Jul 2026 07:23:33 +0000
Date: Sun, 26 Jul 2026 15:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 459890c415306f40886195c07f695d688c87c1dc
Message-ID: <202607261539.gppWEtzb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 459890c415306f40886195c07f695d688c87c1dc  pinctrl: mediatek: remove conditional return with no effect

elapsed time: 867m

configs tested: 77
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc        randconfig-001-20260726    gcc-8.5.0
arc        randconfig-002-20260726    gcc-10.5.0
arm        randconfig-001-20260726    gcc-10.5.0
arm        randconfig-002-20260726    clang-20
arm        randconfig-003-20260726    clang-24
arm        randconfig-004-20260726    clang-24
arm64      randconfig-001-20260726    clang-24
arm64      randconfig-002-20260726    clang-24
arm64      randconfig-003-20260726    gcc-8.5.0
arm64      randconfig-004-20260726    gcc-8.5.0
csky                  allmodconfig    gcc-16.1.0
csky       randconfig-001-20260726    gcc-16.1.0
csky       randconfig-002-20260726    gcc-16.1.0
hexagon    randconfig-001-20260726    clang-24
hexagon    randconfig-002-20260726    clang-24
i386                  allmodconfig    gcc-14
i386       randconfig-011-20260726    clang-22
i386       randconfig-012-20260726    clang-22
i386       randconfig-013-20260726    gcc-14
i386       randconfig-014-20260726    clang-22
i386       randconfig-015-20260726    clang-22
i386       randconfig-016-20260726    gcc-14
i386       randconfig-017-20260726    clang-22
loongarch                defconfig    clang-24
loongarch  randconfig-001-20260726    gcc-12.5.0
loongarch  randconfig-002-20260726    gcc-14.3.0
m68k            m5329evb_defconfig    gcc-16.1.0
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
nios2      randconfig-001-20260726    gcc-11.5.0
nios2      randconfig-002-20260726    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
parisc     randconfig-001-20260726    gcc-8.5.0
parisc     randconfig-002-20260726    gcc-15.2.0
powerpc    randconfig-001-20260726    gcc-10.5.0
powerpc    randconfig-002-20260726    gcc-16.1.0
powerpc64  randconfig-001-20260726    clang-17
powerpc64  randconfig-002-20260726    clang-24
riscv      randconfig-001-20260726    clang-24
riscv      randconfig-002-20260726    clang-24
s390       randconfig-001-20260726    clang-24
s390       randconfig-002-20260726    clang-24
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260726    gcc-16.1.0
sh         randconfig-002-20260726    gcc-16.1.0
sparc      randconfig-001-20260726    gcc-8.5.0
sparc      randconfig-002-20260726    gcc-8.5.0
sparc64    randconfig-001-20260726    gcc-8.5.0
sparc64    randconfig-002-20260726    clang-24
um         randconfig-001-20260726    clang-24
um         randconfig-002-20260726    gcc-14
x86_64     randconfig-001-20260726    gcc-14
x86_64     randconfig-002-20260726    gcc-12
x86_64     randconfig-003-20260726    gcc-14
x86_64     randconfig-005-20260726    gcc-14
x86_64     randconfig-006-20260726    gcc-14
x86_64     randconfig-011-20260726    gcc-13
x86_64     randconfig-012-20260726    clang-22
x86_64     randconfig-013-20260726    gcc-14
x86_64     randconfig-014-20260726    gcc-13
x86_64     randconfig-015-20260726    gcc-14
x86_64     randconfig-016-20260726    clang-22
x86_64     randconfig-071-20260726    clang-22
x86_64     randconfig-072-20260726    gcc-14
x86_64     randconfig-073-20260726    gcc-14
x86_64     randconfig-074-20260726    clang-22
x86_64     randconfig-075-20260726    clang-22
x86_64     randconfig-076-20260726    clang-22
xtensa     randconfig-001-20260726    gcc-8.5.0
xtensa     randconfig-002-20260726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
