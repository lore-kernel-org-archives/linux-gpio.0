Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5E32B9A8
	for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2026 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048572; cv=none; b=g6ZdPudwmfc+Pg1PLjvR7Zb5O+L4L17pWeAbDY5WARUg/SLWobF7gtn9zNXMk6qrCD/62wsayOVceHc1u1kU3kAIwGjAWBMwxb+LPU65wHFArP5cv3lAN4EJ9jISBn+uUOSru5Hp37aILN7IuAOnYt1s8KgAqeYEsvWTyfAKv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048572; c=relaxed/simple;
	bh=BBVJIfeJfXx/YggLS6Qg7YYvarRLACcr3XvJfBwefnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k7hEsw99OCu8N5nyGTh40Ry/N3nNmCc4c3iOzQ4NK1erekpaD7VkNF/YXmAqLPa5ZmkOYITVguEF0r9ApU1EHs5oYjEDpzIbYCOo8nC4Uo7314FLxoHuiNk9euewpfjGtPzdHXEhAFg6sT4zKOfeS4mohFXMm3vVHflu0suD6hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq3TQdnZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq3TQdnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785048570; x=1816584570;
  h=date:from:to:cc:subject:message-id;
  bh=BBVJIfeJfXx/YggLS6Qg7YYvarRLACcr3XvJfBwefnU=;
  b=Rq3TQdnZlqzQASE947f7pH9b/ANGaoeMIexuTOVHf2lWTMGFiDGN7MKb
   zM+E9LRyR422/7+f5xS0ZTFt4dcBgZHQA2oyFMYxv7Ithl5+13+Vm2XWG
   UZm3BN5YPHHczp1R0Mlf2aHGvyWwXDPY2l50HZMuiHVKrKwzl+gEN04RA
   Pjo9NXsZ0C5qoCMZGqpxrZTgPHf72PXqBg06DbMb9QRaSCQd6jrosXtcS
   vHqfaiNPl3yZMGI3VrRltDELQYN7yr/qk2D2hArNKFpevXFqBsBi3zJ7+
   p8W/i19C6YVNoAl4liHMG+APwNo3nvVB15dZv2kXMp0HRdXOfRS5AKfW6
   w==;
X-CSE-ConnectionGUID: y2wtbTByT6mDapehgSltug==
X-CSE-MsgGUID: a6OYdLMZTgayVuhY+w7aRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96006572"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="96006572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 23:49:29 -0700
X-CSE-ConnectionGUID: 4oJaO5bfT+6fcSYds3IO9A==
X-CSE-MsgGUID: +Ur69sk4RIWxJbLn+BUcqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="282428310"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jul 2026 23:49:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnsff-00000000cM3-2bRh;
	Sun, 26 Jul 2026 06:49:24 +0000
Date: Sun, 26 Jul 2026 14:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 dad6e107b3cd9d20514e7799b7ad8674f81e3f30
Message-ID: <202607261451.yLQLcZp2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: dad6e107b3cd9d20514e7799b7ad8674f81e3f30  pinctrl: bm1880: add missing select GENERIC_PINCONF

elapsed time: 827m

configs tested: 43
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
arm        randconfig-003-20260726    clang-24
arm        randconfig-004-20260726    clang-24
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
loongarch  randconfig-002-20260726    gcc-14.3.0
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
riscv      randconfig-002-20260726    clang-24
s390       randconfig-002-20260726    clang-24
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260726    gcc-16.1.0
sh         randconfig-002-20260726    gcc-16.1.0
sh               urquell_defconfig    gcc-16.1.0
sparc      randconfig-001-20260726    gcc-8.5.0
sparc      randconfig-002-20260726    gcc-8.5.0
sparc64    randconfig-001-20260726    gcc-8.5.0
sparc64    randconfig-002-20260726    clang-24
x86_64     randconfig-001-20260726    gcc-14
x86_64     randconfig-002-20260726    gcc-12
x86_64     randconfig-003-20260726    gcc-14
x86_64     randconfig-005-20260726    gcc-14
x86_64     randconfig-006-20260726    gcc-14
xtensa     randconfig-001-20260726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
