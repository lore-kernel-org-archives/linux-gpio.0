Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3130E851
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002849; cv=none; b=ASXRBt3ktIU/vqBIiuShwJtbp+C4xP+vDtQ8FbMV2fKx1nQ7HbIxn6LpuzfqEKjUjM57NulF4MfBiSmEhJ7DpffY8UIbdpUVb9MRJsNXUIkO+8j8gfyySxa0WWPEsOJmkj+SCTOgO9hieu5vb95UWefPVEUQ4/bcxPpSBBzVyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002849; c=relaxed/simple;
	bh=EZcsyNcSO+26Yre8qUP9+IiAfMV6+dt6jOsmDV2uVR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uvXmh0GFVRjkrgPY5xxhTAYetv0rELfSOL6B6O2p4+voz6gfba4nJGV2+x7XqLLHtsfTuDV9LFSMNgOVGm0wGQKJLQRZzjNO7ZA78siBTZWuGJQ2hMTvCeWlnqvKif0k0vXftFQAqEJTxKjAHTG+B6iv+1MJ7R/cCeMLRzEZm6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbDwN8pD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbDwN8pD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780002847; x=1811538847;
  h=date:from:to:cc:subject:message-id;
  bh=EZcsyNcSO+26Yre8qUP9+IiAfMV6+dt6jOsmDV2uVR4=;
  b=BbDwN8pDMCkdppdz4F98g2U6ynysHbh2OJ13TTnZcCH1KZcJ4FGE0djm
   KcVIVlWGlv+CKN7g8qGePWOajeawYtF6WckvJBR6Fzqh7G9O8VrfZp7Mi
   tlKlwvFMQNixlcG+S1H9XjB1iFB07a7ol7m4yfyH0kEKsXgLHEtULqmF7
   7Gw75k6T6PEGHWJ3rYmpF4XEYpo3vBvW6s/8S6g15sps57y3V83oFV6K9
   HB8voMB5SHjOGKUi9XotlyTPE48gxflHaBgYyWJcXaY0eJC32F+UJE6b8
   UOlmyM5GctAIQo9sTR4uoZIHmQgfuruRjTY5n3y/ez0IIEpHJPyymm/AU
   A==;
X-CSE-ConnectionGUID: tx1/S5j8RxCUjZHqoSZR1w==
X-CSE-MsgGUID: f0Txl4zjT46k/HigtlpNJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80847756"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80847756"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 14:14:06 -0700
X-CSE-ConnectionGUID: Pm6eDTayTfmc1/Tc77sCWQ==
X-CSE-MsgGUID: 9LOL+IboTkiuoczFWZ9AcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238265057"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2026 14:14:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSi3H-000000006SA-1eWN;
	Thu, 28 May 2026 21:14:03 +0000
Date: Fri, 29 May 2026 05:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6343f643eadfe4c47f132db1b99419230350c26f
Message-ID: <202605290548.WcLBiswd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6343f643eadfe4c47f132db1b99419230350c26f  Merge branch 'devel' into for-next

elapsed time: 1628m

configs tested: 97
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                     allnoconfig    gcc-15.2.0
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260529    clang-23
arm64       randconfig-002-20260529    clang-23
arm64       randconfig-003-20260529    clang-23
arm64       randconfig-004-20260529    clang-23
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260529    clang-23
csky        randconfig-002-20260529    clang-23
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon                 allnoconfig    gcc-15.2.0
hexagon     randconfig-001-20260529    gcc-8.5.0
hexagon     randconfig-002-20260529    gcc-8.5.0
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.2.0
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch               allnoconfig    gcc-15.2.0
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20260529    gcc-8.5.0
loongarch   randconfig-002-20260529    gcc-8.5.0
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    clang-19
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    clang-19
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    clang-23
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    clang-23
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    clang-19
nios2       randconfig-001-20260529    gcc-8.5.0
nios2       randconfig-002-20260529    gcc-8.5.0
openrisc               allmodconfig    clang-23
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    clang-23
openrisc                allnoconfig    gcc-15.2.0
openrisc        or1klitex_defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    clang-23
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    clang-19
parisc64                  defconfig    clang-19
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    clang-23
powerpc                 allnoconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20260529    gcc-15.2.0
riscv       randconfig-002-20260529    gcc-15.2.0
s390                   allmodconfig    clang-19
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390        randconfig-001-20260529    gcc-15.2.0
s390        randconfig-002-20260529    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    clang-23
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    clang-19
sh          randconfig-001-20260529    gcc-15.2.0
sh          randconfig-002-20260529    gcc-15.2.0
sparc                   allnoconfig    clang-23
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-23
x86_64                 allyesconfig    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    clang-23
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
