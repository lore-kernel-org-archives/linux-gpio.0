Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E40A373C00
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 01:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502276; cv=none; b=UFUBvzE+mL1jTPj7N5vf3VssGSadLoqLxx7DkzrGxwqCZrlTGZxom0AqgWyG1BAVI448yV9kiNiNT6ROZrpyHkMDfSY/6PB9004IqqIhXtb5VAa5bJO3MuQgiMScW+2W8Ds40F5y41sPRdiKkv7+LYcu/RS17eSm4Iu6FIDsGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502276; c=relaxed/simple;
	bh=QxGT+0cZ8RP/Rs4TbFpy9dBN00k/2N5ZVQSCbj+tdpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VVCGLQjEHnpVnX6MU1yJmlAMLsM+w0vkEqtiE6iG1JgL243jvc9DAL9kxzUIoms67ny/GOI2H0BY6vpw3BDBGLMBCCOnxwY8fpgfPva9GTMfdMeyhYEhF8exymRy/dEMCIY9amdVx5F3f+R8NbO5UalQLyUqNbLOlSh5GMJHXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNGDRZuQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNGDRZuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772502275; x=1804038275;
  h=date:from:to:cc:subject:message-id;
  bh=QxGT+0cZ8RP/Rs4TbFpy9dBN00k/2N5ZVQSCbj+tdpU=;
  b=TNGDRZuQGO3mJO3hNTzMMcuaXMkRgQlKc4EbM1MVb7Yq0eanMi1HfD5Q
   QxefTxzyAtKavJp/BY86WtKLgVq4v8kDPYWVo6IaESMADkPK8XLW+BK0W
   L8Y2B9CEyzn5gicPZ96oS8VElkRL/Etiv+tHUYLhfiOtiZoq3wUey848x
   3/RQRJXtUIf8zB1Xp9j9B8BU7mMGA6slHBXmoyBn5/MqhErZZ9Fi4V8qE
   qGIbgSsfx8zjfjzhOIw7GvgmsSheJZFG+0x1bbl8Be0yjbFYgRIZt2LNa
   OioZ+gYRZI0E0p0B99RvYWCnDFay2YChdYZJoEIIqY9BuddoB3D1PSY92
   A==;
X-CSE-ConnectionGUID: Q1UDCXyzTYqj81ci/tcjcg==
X-CSE-MsgGUID: CbcJ3pJVTE2BYsgEU2SvxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73567728"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73567728"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:44:35 -0800
X-CSE-ConnectionGUID: xq0+isNESa+2SsSyjGPlRQ==
X-CSE-MsgGUID: N9pdk344Toayt9WMVYJ+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222822711"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2026 17:44:34 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxEoJ-000000001cN-11Ce;
	Tue, 03 Mar 2026 01:44:31 +0000
Date: Tue, 03 Mar 2026 09:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 75978ac131da3cc6d2c7b5359f6a37212c1b46ad
Message-ID: <202603030941.9cU8ZIH9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 75978ac131da3cc6d2c7b5359f6a37212c1b46ad  Merge branch 'devel' into for-next

elapsed time: 917m

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
