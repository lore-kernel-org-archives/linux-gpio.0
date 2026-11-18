Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018956;
	b=r5VnMOceWYUSOvFigG+RBtGz1hvqTagO5uPBCZfVW6BeWd7JTey3OdNeX3JqaTxu4cQn
	 k+zjetX11p2BBhSzrrwGnwAaGZvR4p95rB0tNWDSnc7QD8iNB8rYbJtgaBgvJz8TfEGR2
	 fzQaDdItazRuuzKGmyqLLX6OAJaEZbScBVLV98JQjRc0gsKi6gPAb8WJ0miwIuocKbiai
	 0IYYvGDZYXDkp4aGp/DHauSEEHx6r0zF94SUbTJ52wlfKY/3heXh+SBtb9k/eglCUQk6m
	 fgdsRz8CZ9FDe3SthNAnwVJq56zAzcbcg4gBMXt+MY5GTyq+WHDAHRsqH3qZQsRLkOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HxcqbtCX0ArhJ/gyXWKV4CZAbNmxbKf/Pu/F73b5w2g=;
	b=X10AAK5XvRhqKB0p7JXr6LVhKAeCuygxWBcf2fsfdZo3GOBYy34bYMZkvGmbDpdeVGe5
	 yukygn9dr27mFQy60N+lUnive5pC4xgmAeG/zfMrxPvtEOf+U2l0gQD533xVDd6Mldi3r
	 ywjzKs8vI327qIlHbbYNmjBVIpCHKaQLCCA9eFpfx4RAC0buj1/H0kYcANcSTOTCxnj08
	 42KZ7f16ubsSUKybimF/FHgMG3UAQnOsHsmw52ILRTk0BeTVGvRYiBx85cYFHXcNCRv4r
	 uU7eKTf83GxsVZZtXzRRKWfa+7LOaPtWkATsB/caUdWyagUFspzucg8ZXBMiYA9wo4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YGO3uo4P;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE6606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 16:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YGO3uo4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795018956; x=1826554956;
  h=date:from:to:cc:subject:message-id;
  bh=R/hffMnS5XOJoJE5EsCh50O4Bh+KepHArJFbcDrxCJg=;
  b=YGO3uo4Pp34jVku+WxIQhrnwCtG7pdQ0gryUL1kLzcCoKrrH3Pq45omm
   GxBVNY/ZeruBk9y75hW5zHt2m4axVQBggBZCGgLsAk2PU6QRsKRBvCJqe
   cicC/KHK2viFFk+h9tJPpoa0hCddJyhmUih1nz3dTr/iXaEpIdYd1ozsW
   Ya16IFtyWWPEarzHTD8WIxs4DjJjLlYTGhSJN8RiUou8b8v2JdlWBoPHK
   V+hYiqNgaG+8rKaPVao6f9YxUhz/AJjrcb+BXdVOz3KOfwrNddzHVi8ej
   5AmWExRU/g27ZL0qzKa+dIYlUKhvD8W79YQNPi2za0AC1AF1zLPkMb6l3
   A==;
X-CSE-ConnectionGUID: M8hsnp+zRgigglRf6pge2g==
X-CSE-MsgGUID: kn+x4HKESiKa4q3AveWaVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3755106"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3755106"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:22:35 -0800
X-CSE-ConnectionGUID: VsFP0/bpQO6nIppWSOSWPw==
X-CSE-MsgGUID: QfrGy0gqRQmBvRC+MDamsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10579196"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 08:22:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiQZ-00000001Dq6-1qQB;
	Wed, 18 Nov 2026 16:22:31 +0000
Date: Thu, 19 Nov 2026 00:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 95ebc96dcb373d7d278625fc91e602c839f1f388
Message-ID: <20261119002141.fYZSIEqY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 95ebc96dcb373d7d278625fc91e602c839f1f388  pinctrl: pinconf-generic: widen the packed config argument to unsigned long

elapsed time: 1309m

configs tested: 189
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261118    gcc-10.5.0
arc                   randconfig-1001-20261118    gcc-10.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261118    gcc-10.5.0
arm                   randconfig-1001-20261118    gcc-10.5.0
arm                   randconfig-1002-20261118    gcc-10.5.0
arm                   randconfig-1003-20261118    gcc-10.5.0
arm                         realview_defconfig    clang-17
arm                         spear3xx_defconfig    clang-24
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261118    gcc-16.2.0
arm64                 randconfig-1001-20261118    gcc-16.2.0
arm64                 randconfig-1002-20261118    gcc-16.2.0
arm64                 randconfig-1003-20261118    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261118    gcc-16.2.0
csky                  randconfig-1001-20261118    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261118    clang-22
hexagon               randconfig-1001-20261118    clang-22
i386                              alldefconfig    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261118    gcc-12
i386        buildonly-randconfig-1001-20261118    gcc-12
i386        buildonly-randconfig-1002-20261118    gcc-12
i386        buildonly-randconfig-1003-20261118    gcc-12
i386        buildonly-randconfig-1004-20261118    gcc-12
i386        buildonly-randconfig-1005-20261118    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261118    clang-22
i386                  randconfig-1001-20261118    clang-22
i386                  randconfig-1002-20261118    clang-22
i386                  randconfig-1003-20261118    clang-22
i386                  randconfig-1004-20261118    clang-22
i386                  randconfig-1005-20261118    clang-22
i386                  randconfig-1006-20261118    clang-22
i386                  randconfig-1007-20261118    clang-22
i386                  randconfig-1008-20261118    clang-22
i386                  randconfig-1009-20261118    clang-22
i386                  randconfig-1010-20261118    clang-22
i386                  randconfig-1011-20261118    clang-22
i386                  randconfig-1012-20261118    clang-22
i386                  randconfig-1013-20261118    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261118    clang-22
loongarch             randconfig-1001-20261118    clang-22
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         stmark2_defconfig    clang-24
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                            jazz_defconfig    gcc-16.2.0
mips                 malta_qemu_32r6_defconfig    clang-24
mips                          rt305x_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261118    clang-22
nios2                 randconfig-1001-20261118    clang-22
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261118    gcc-8.5.0
parisc                randconfig-1001-20261118    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-17
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                         fsp2_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    clang-24
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                       pasemi_defconfig    clang-24
powerpc               randconfig-1000-20261118    gcc-8.5.0
powerpc               randconfig-1001-20261118    gcc-8.5.0
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261118    gcc-8.5.0
powerpc64             randconfig-1001-20261118    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261118    gcc-11.5.0
riscv                 randconfig-1001-20261118    gcc-11.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261118    gcc-11.5.0
s390                  randconfig-1001-20261118    gcc-11.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    gcc-16.2.0
sh                              espt_defconfig    clang-17
sh                           polaris_defconfig    clang-17
sh                    randconfig-1000-20261118    gcc-11.5.0
sh                    randconfig-1001-20261118    gcc-11.5.0
sh                    rts7751r2dplus_defconfig    clang-17
sh                            se7206_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-24
sh                   sh7785lcr_32bit_defconfig    clang-17
sh                             titan_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261118    gcc-14
x86_64      buildonly-randconfig-1001-20261118    gcc-14
x86_64      buildonly-randconfig-1002-20261118    gcc-14
x86_64      buildonly-randconfig-1003-20261118    gcc-14
x86_64      buildonly-randconfig-1004-20261118    gcc-14
x86_64      buildonly-randconfig-1005-20261118    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261118    gcc-14
x86_64                randconfig-1001-20261118    gcc-14
x86_64                randconfig-1002-20261118    gcc-14
x86_64                randconfig-1003-20261118    gcc-14
x86_64                randconfig-1004-20261118    gcc-14
x86_64                randconfig-1005-20261118    gcc-14
x86_64                randconfig-1006-20261118    gcc-14
x86_64                randconfig-1007-20261118    gcc-14
x86_64                randconfig-1008-20261118    gcc-14
x86_64                randconfig-1009-20261118    gcc-14
x86_64                randconfig-1010-20261118    gcc-14
x86_64                randconfig-1011-20261118    gcc-14
x86_64                randconfig-1012-20261118    gcc-14
x86_64                randconfig-1013-20261118    gcc-14
x86_64                randconfig-1014-20261118    gcc-14
x86_64                randconfig-1015-20261118    gcc-14
x86_64                randconfig-1016-20261118    gcc-14
x86_64                randconfig-1017-20261118    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
