Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722D3932E4
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669901; cv=none; b=S8X067b1+SCScOoBth90ts9+DnPhnldVWibBHtuHU1vZ5GKVjyL6MsogUiI0xrWykrOAOEyctpiLaM0BFP7hw8kd4JMutBtGy/QhyoLSp6FqcPI/Ac0RugUU3q8cfMZDhKt9F/JEuKG7Jqpf74ZP4rbIzOoWVU0PIMwzVzD4PGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669901; c=relaxed/simple;
	bh=GvMNK1MwvuQPgs1a05vBowdzlhTLXjE04/5f7EzAz70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D3WDlvDA6p/NcP5fbUo8Dg1jiCt3Rp0gLjQMN+oQTxg/Xf7gpt7+GM3dNFk9ejo0jqS0A3BPwG44dAuCyXie0l/Ib71DHAFoWn/weUEZMr7JHoE4jZtFszT+/mLCi65oXG62/QDtzwzA0lZPIZMbUv+whAJvCx4qLGDKhab8l9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ky6Goflz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ky6Goflz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773669899; x=1805205899;
  h=date:from:to:cc:subject:message-id;
  bh=GvMNK1MwvuQPgs1a05vBowdzlhTLXjE04/5f7EzAz70=;
  b=ky6GoflzofdtyZhxci+3aBfpzihJKNJY2opLGuKthA7f1k8ov+Rhuvyb
   emQdptCfwQEVQCJX+a263EyZh4sWWvw189h2/uKzbMPWySspg/fZCyqZ5
   SMULUAvj9yhlDRBNbFzSwk+gJQ815VQ6lhikGN6TV1zl9ai7nV89eei3G
   WAzTjy9VqjBr1CVXR3PBK0HPfpt2yc9/JEQigbjcT9JJjbjhIMtyjw7nq
   XsaUbLWW7/x3tVeev28biVJzt8hghoXRigr6iY6igEWu+AiiWuunOBdSc
   W8lOItnsuO9wcXtCFgYjdOymssYIkqcFQb/Auf2tkHGy6XcxHJccnYkGx
   w==;
X-CSE-ConnectionGUID: 7enLQpf5Qhyq+P9SVO2ifg==
X-CSE-MsgGUID: ePG7IrMHTtyeMDbIaRZpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77293713"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77293713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:04:06 -0700
X-CSE-ConnectionGUID: AFHYz2J9QKiXdInREFd9Dg==
X-CSE-MsgGUID: fiTlvGm3QP+oafCLlndMHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217751300"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2026 07:04:05 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w28Y6-000000000l4-2oAL;
	Mon, 16 Mar 2026 14:04:02 +0000
Date: Mon, 16 Mar 2026 22:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/gpio-mmio-more] BUILD SUCCESS
 a280afee1ecd94c15597d13dc6a411dd31689d05
Message-ID: <202603162233.kRtGdFqP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/gpio-mmio-more
branch HEAD: a280afee1ecd94c15597d13dc6a411dd31689d05  gpio: altera: Use generic MMIO GPIO

elapsed time: 1129m

configs tested: 60
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260316    gcc-14
x86_64      buildonly-randconfig-002-20260316    clang-20
x86_64      buildonly-randconfig-003-20260316    clang-20
x86_64      buildonly-randconfig-004-20260316    gcc-14
x86_64      buildonly-randconfig-005-20260316    gcc-14
x86_64      buildonly-randconfig-006-20260316    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
