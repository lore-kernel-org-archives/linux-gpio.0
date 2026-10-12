Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE464A4403
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820286; cv=none; b=oZoDKtq4Z8kj2fX0kT+QwYdEcCOdxh7kwWTF/m/hL413HmS6JQd24ez4iUtAHHwyvj2wF9kCP8WNzxWD48fsTH0eK0dazEbx5cVvQsMRWn3XmHe7+U7+6b++MiZxVb3LtKfwQZCYvuhy9MonNXx2X6bcl0jxBAhNcI5PCjtCFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820286; c=relaxed/simple;
	bh=80T3gW9sdgoYI+AVCQT2ngvUxo4xQBgkuyrb33sy2C8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q6DJaEv0W1ELoWZe43j+tYiqWHqdMg2KySZBTjJmxs3kTgnmjTC6Qwo8SyqZqMlRwcSG7ipZODzXKn6QiSWe0M2FZcwlPJJDua14Y/WZ3H0/xjZSyVCAc54hMjVWowU2zd75j64qSTeqTC7F5uag69NfnrLwnkwV+2EnlSY3/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Su9wp9Ye; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Su9wp9Ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820284; x=1823356284;
  h=date:from:to:cc:subject:message-id;
  bh=80T3gW9sdgoYI+AVCQT2ngvUxo4xQBgkuyrb33sy2C8=;
  b=Su9wp9YezSat9xDVcD77qPvbzQKgoIAxJWpY5TxiGREJ/uJir0KzgUt7
   cp7GP4dIbIb7Eqxq1tJ0dfqFv0aSHpjSTDhXivKlejgQkk0oKzAMVTmNT
   kC6Poh+7oieHM5cPuTb6cBw7bSC+P3LCyBh6gB3Cg5ayLjIDEl7hLxCYL
   vlgCITpB129WMi58aD4jhrr/1b2a2In6Ljqy31LVO/1OyHxV2ivMycp4m
   fsM18QUiTt9OH1eQ5IXHGIuN6DU9ggQdWcO5M3kdKqybX0OwG0ETKrCkO
   Pigb4cVBT10yAMbDNMJkOEKAaTHnk+Zy1yH42e7YfwjkktzTlYu4l5HKP
   w==;
X-CSE-ConnectionGUID: LX5q/FcJR4K4/2Esd1OBnQ==
X-CSE-MsgGUID: AAVRwT4RQKaJcG9PvD/VdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="404553"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="404553"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:51:03 -0700
X-CSE-ConnectionGUID: r1NckpHTS128griE7v0zRg==
X-CSE-MsgGUID: qM/oMnfwROaYOTZ3x24FOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1295788"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2026 08:51:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGIIk-00000000BjN-19ak;
	Mon, 12 Oct 2026 15:50:58 +0000
Date: Mon, 12 Oct 2026 23:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-current] BUILD SUCCESS
 1df7f369075d7e8f7794981995a5103f1963bab7
Message-ID: <202610122331.SXGsKqo4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: 1df7f369075d7e8f7794981995a5103f1963bab7  pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

elapsed time: 1156m

configs tested: 477
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261011    gcc-12.5.0 cocci
alpha                randconfig-r2111-20261010    clang-20   cocci
alpha                randconfig-r2202-20261010    gcc-8.5.0  smatch
alpha                randconfig-r2300-20261010    clang-17   sparse
alpha                randconfig-r2302-20261010    gcc-8.5.0  sparse
alpha                randconfig-r2303-20261010    gcc-13.4.0 sparse
alpha                randconfig-r2309-20261011    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261012    gcc-8.5.0
arc                   randconfig-1001-20261012    gcc-8.5.0
arc                   randconfig-2000-20261010    gcc-8.5.0
arc                   randconfig-2000-20261011    gcc-8.5.0
arc                   randconfig-2001-20261010    gcc-8.5.0
arc                   randconfig-2001-20261011    gcc-8.5.0
arc                  randconfig-r2103-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261011    gcc-12.5.0 cocci
arc                  randconfig-r2107-20261011    gcc-12.5.0 cocci
arc                  randconfig-r2108-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2109-20261011    gcc-16.1.0 cocci
arc                  randconfig-r2200-20261010    gcc-14.3.0 smatch
arc                  randconfig-r2303-20261010    clang-17   sparse
arc                  randconfig-r2306-20261010    gcc-14     sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261012    gcc-8.5.0
arm                   randconfig-1001-20261012    gcc-8.5.0
arm                   randconfig-1002-20261012    gcc-8.5.0
arm                   randconfig-1003-20261012    gcc-8.5.0
arm                   randconfig-2000-20261010    gcc-8.5.0
arm                   randconfig-2000-20261011    gcc-8.5.0
arm                   randconfig-2001-20261010    gcc-8.5.0
arm                   randconfig-2001-20261011    gcc-8.5.0
arm                  randconfig-r2106-20261011    gcc-16.1.0 cocci
arm                  randconfig-r2302-20261010    clang-17   sparse
arm                  randconfig-r2303-20261011    gcc-8.5.0  sparse
arm                  randconfig-r2305-20261010    gcc-15.2.0 sparse
arm                  randconfig-r2309-20261010    clang-24   sparse
arm                  randconfig-r2310-20261010    clang-24   sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261012    clang-24
arm64                 randconfig-1001-20261012    clang-24
arm64                 randconfig-1002-20261012    clang-24
arm64                 randconfig-1003-20261012    clang-24
arm64                 randconfig-2000-20261010    gcc-16.1.0
arm64                 randconfig-2000-20261011    gcc-16.1.0
arm64                 randconfig-2001-20261010    gcc-16.1.0
arm64                 randconfig-2001-20261011    gcc-16.1.0
arm64                randconfig-r2101-20261011    gcc-16.1.0 cocci
arm64                randconfig-r2105-20261010    clang-20   cocci
arm64                randconfig-r2109-20261010    gcc-8.5.0  cocci
arm64                randconfig-r2300-20261011    gcc-8.5.0  sparse
arm64                randconfig-r2301-20261010    gcc-15.2.0 sparse
arm64                randconfig-r2305-20261010    gcc-11.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261012    clang-24
csky                  randconfig-1001-20261012    clang-24
csky                  randconfig-2000-20261010    gcc-16.1.0
csky                  randconfig-2000-20261011    gcc-16.1.0
csky                  randconfig-2001-20261010    gcc-16.1.0
csky                  randconfig-2001-20261011    gcc-16.1.0
csky                 randconfig-r2107-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2109-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2110-20261011    gcc-16.1.0 cocci
csky                 randconfig-r2111-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2308-20261010    clang-24   sparse
csky                 randconfig-r2308-20261010    gcc-11.5.0 sparse
csky                 randconfig-r2308-20261010    gcc-14     sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261012    clang-17
hexagon               randconfig-1001-20261012    clang-17
hexagon               randconfig-2000-20261010    gcc-16.1.0
hexagon               randconfig-2000-20261011    gcc-16.1.0
hexagon               randconfig-2001-20261010    gcc-16.1.0
hexagon               randconfig-2001-20261011    gcc-16.1.0
hexagon              randconfig-r2103-20261010    gcc-16.1.0 cocci
hexagon              randconfig-r2110-20261010    clang-20   cocci
hexagon              randconfig-r2302-20261011    clang-22   sparse
hexagon              randconfig-r2305-20261010    clang-17   sparse
hexagon              randconfig-r2306-20261010    gcc-11.5.0 sparse
hexagon              randconfig-r2308-20261011    clang-24   sparse
hexagon              randconfig-r2310-20261011    clang-22   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261012    clang-22
i386        buildonly-randconfig-1001-20261012    clang-22
i386        buildonly-randconfig-1002-20261012    clang-22
i386        buildonly-randconfig-1003-20261012    clang-22
i386        buildonly-randconfig-1004-20261012    clang-22
i386        buildonly-randconfig-1005-20261012    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261012    gcc-14
i386                  randconfig-1001-20261012    gcc-14
i386                  randconfig-1002-20261012    gcc-14
i386                  randconfig-1003-20261012    gcc-14
i386                  randconfig-1004-20261012    gcc-14
i386                  randconfig-1005-20261012    gcc-14
i386                  randconfig-1006-20261012    gcc-14
i386                  randconfig-1007-20261012    clang-22
i386                  randconfig-1008-20261012    clang-22
i386                  randconfig-1009-20261012    clang-22
i386                  randconfig-1010-20261012    clang-22
i386                  randconfig-1011-20261012    clang-22
i386                  randconfig-1012-20261012    clang-22
i386                  randconfig-1013-20261012    clang-22
i386                  randconfig-2000-20261010    gcc-8.5.0
i386                  randconfig-2000-20261011    gcc-8.5.0
i386                  randconfig-2001-20261010    gcc-8.5.0
i386                  randconfig-2001-20261011    gcc-8.5.0
i386                  randconfig-2100-20261010    gcc-13     cocci
i386                  randconfig-2100-20261011    gcc-14     cocci
i386                  randconfig-2101-20261010    gcc-13     cocci
i386                  randconfig-2101-20261011    gcc-14     cocci
i386                  randconfig-2102-20261010    gcc-13     cocci
i386                  randconfig-2102-20261011    gcc-14     cocci
i386                  randconfig-2103-20261010    gcc-13     cocci
i386                  randconfig-2103-20261011    gcc-14     cocci
i386                  randconfig-2104-20261010    gcc-13     cocci
i386                  randconfig-2104-20261011    gcc-14     cocci
i386                  randconfig-2105-20261010    gcc-13     cocci
i386                  randconfig-2105-20261011    gcc-14     cocci
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2200-20261011    clang-22   smatch
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2102-20261010    gcc-16.1.0 cocci
i386                 randconfig-r2106-20261010    gcc-16.1.0 cocci
i386                 randconfig-r2300-20261011    clang-22   sparse
i386                 randconfig-r2301-20261011    gcc-8.5.0  sparse
i386                 randconfig-r2304-20261010    gcc-15.2.0 sparse
i386                 randconfig-r2307-20261010    clang-24   sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261012    clang-17
loongarch             randconfig-1001-20261012    clang-17
loongarch             randconfig-2000-20261010    gcc-8.5.0
loongarch             randconfig-2000-20261011    gcc-8.5.0
loongarch             randconfig-2001-20261010    gcc-8.5.0
loongarch             randconfig-2001-20261011    gcc-8.5.0
loongarch            randconfig-r2102-20261011    gcc-16.1.0 cocci
loongarch            randconfig-r2104-20261011    gcc-16.1.0 cocci
loongarch            randconfig-r2202-20261010    clang-24   smatch
loongarch            randconfig-r2305-20261011    clang-22   sparse
loongarch            randconfig-r2311-20261010    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    clang-24
m68k                        m5275evb_defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2202-20261011    gcc-16.1.0 smatch
m68k                 randconfig-r2302-20261011    clang-22   sparse
m68k                 randconfig-r2303-20261010    gcc-8.5.0  sparse
m68k                 randconfig-r2304-20261010    gcc-8.5.0  sparse
m68k                 randconfig-r2306-20261011    clang-22   sparse
m68k                 randconfig-r2311-20261011    clang-22   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2104-20261010    clang-20   cocci
microblaze           randconfig-r2104-20261010    gcc-16.1.0 cocci
microblaze           randconfig-r2105-20261011    gcc-12.5.0 cocci
microblaze           randconfig-r2107-20261011    gcc-16.1.0 cocci
microblaze           randconfig-r2303-20261010    gcc-16.1.0 sparse
microblaze           randconfig-r2303-20261011    clang-22   sparse
microblaze           randconfig-r2305-20261011    clang-22   sparse
microblaze           randconfig-r2306-20261011    clang-24   sparse
microblaze           randconfig-r2307-20261011    clang-22   sparse
microblaze           randconfig-r2309-20261010    gcc-14     sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip30_defconfig    clang-24
mips                 randconfig-r2100-20261011    gcc-16.1.0 cocci
mips                 randconfig-r2104-20261010    gcc-16.1.0 cocci
mips                 randconfig-r2106-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261010    clang-21   cocci
mips                 randconfig-r2202-20261011    gcc-15.2.0 smatch
mips                 randconfig-r2302-20261010    gcc-13.4.0 sparse
mips                 randconfig-r2303-20261011    clang-22   sparse
mips                 randconfig-r2310-20261011    clang-24   sparse
mips                           rb532_defconfig    clang-24
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261012    clang-17
nios2                 randconfig-1001-20261012    clang-17
nios2                 randconfig-2000-20261010    gcc-8.5.0
nios2                 randconfig-2000-20261011    gcc-8.5.0
nios2                 randconfig-2001-20261010    gcc-8.5.0
nios2                 randconfig-2001-20261011    gcc-8.5.0
nios2                randconfig-r2101-20261010    gcc-16.1.0 cocci
nios2                randconfig-r2102-20261011    gcc-16.1.0 cocci
nios2                randconfig-r2103-20261011    gcc-12.5.0 cocci
nios2                randconfig-r2108-20261011    gcc-16.1.0 cocci
nios2                randconfig-r2110-20261011    gcc-12.5.0 cocci
nios2                randconfig-r2200-20261011    gcc-8.5.0  smatch
nios2                randconfig-r2301-20261010    gcc-8.5.0  sparse
nios2                randconfig-r2307-20261010    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261011    clang-22   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2105-20261011    gcc-16.1.0 cocci
openrisc             randconfig-r2107-20261010    gcc-13.4.0 cocci
openrisc             randconfig-r2111-20261010    gcc-16.1.0 cocci
openrisc             randconfig-r2111-20261011    gcc-16.1.0 cocci
openrisc             randconfig-r2201-20261010    gcc-16.1.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261012    gcc-8.5.0
parisc                randconfig-1001-20261012    gcc-8.5.0
parisc                randconfig-2000-20261010    gcc-8.5.0
parisc                randconfig-2000-20261011    gcc-8.5.0
parisc                randconfig-2001-20261010    gcc-8.5.0
parisc                randconfig-2001-20261011    gcc-8.5.0
parisc               randconfig-r2101-20261010    gcc-8.5.0  cocci
parisc               randconfig-r2101-20261011    gcc-12.5.0 cocci
parisc               randconfig-r2105-20261010    gcc-11.5.0 cocci
parisc               randconfig-r2108-20261011    gcc-12.5.0 cocci
parisc               randconfig-r2111-20261011    gcc-16.1.0 cocci
parisc               randconfig-r2307-20261011    clang-24   sparse
parisc               randconfig-r2310-20261010    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                    bluestone_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261012    gcc-8.5.0
powerpc               randconfig-1001-20261012    gcc-8.5.0
powerpc               randconfig-2000-20261010    clang-17
powerpc               randconfig-2000-20261010    gcc-14
powerpc               randconfig-2000-20261011    clang-22
powerpc               randconfig-2001-20261010    clang-24
powerpc               randconfig-2001-20261010    gcc-14
powerpc               randconfig-2001-20261011    clang-22
powerpc              randconfig-r2100-20261010    gcc-8.5.0  cocci
powerpc              randconfig-r2100-20261011    gcc-12.5.0 cocci
powerpc              randconfig-r2100-20261011    gcc-16.1.0 cocci
powerpc              randconfig-r2107-20261010    clang-20   cocci
powerpc              randconfig-r2200-20261011    clang-21   smatch
powerpc              randconfig-r2300-20261010    gcc-8.5.0  sparse
powerpc              randconfig-r2301-20261011    clang-22   sparse
powerpc              randconfig-r2302-20261011    gcc-8.5.0  sparse
powerpc              randconfig-r2304-20261010    gcc-13.4.0 sparse
powerpc              randconfig-r2304-20261011    clang-22   sparse
powerpc              randconfig-r2305-20261010    gcc-13.4.0 sparse
powerpc              randconfig-r2311-20261011    clang-24   sparse
powerpc                       tqm8xx_defconfig    clang-24
powerpc64             randconfig-1000-20261012    gcc-8.5.0
powerpc64             randconfig-1001-20261012    gcc-8.5.0
powerpc64             randconfig-2000-20261010    clang-24
powerpc64             randconfig-2000-20261010    gcc-14
powerpc64             randconfig-2000-20261011    clang-22
powerpc64             randconfig-2001-20261010    gcc-13.4.0
powerpc64             randconfig-2001-20261010    gcc-14
powerpc64             randconfig-2001-20261011    clang-22
powerpc64            randconfig-r2102-20261010    gcc-8.5.0  cocci
powerpc64            randconfig-r2104-20261011    gcc-16.1.0 cocci
powerpc64            randconfig-r2105-20261010    gcc-16.1.0 cocci
powerpc64            randconfig-r2106-20261011    gcc-16.1.0 cocci
powerpc64            randconfig-r2110-20261010    clang-19   cocci
powerpc64            randconfig-r2111-20261010    gcc-12.5.0 cocci
powerpc64            randconfig-r2301-20261010    clang-17   sparse
powerpc64            randconfig-r2304-20261010    clang-17   sparse
powerpc64            randconfig-r2306-20261010    clang-24   sparse
powerpc64            randconfig-r2311-20261010    gcc-11.5.0 sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261012    clang-24
riscv                 randconfig-1001-20261012    clang-24
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2000-20261010    gcc-9.5.0
riscv                 randconfig-2000-20261011    gcc-13.4.0
riscv                 randconfig-2001-20261010    clang-24
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261011    gcc-13.4.0
riscv                randconfig-r2101-20261011    gcc-16.1.0 cocci
riscv                randconfig-r2201-20261010    clang-21   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261012    clang-24
s390                  randconfig-1001-20261012    clang-24
s390                  randconfig-2000-20261010    clang-17
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2000-20261011    gcc-13.4.0
s390                  randconfig-2001-20261010    gcc-15.2.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                  randconfig-2001-20261011    gcc-13.4.0
s390                 randconfig-r2104-20261010    clang-21   cocci
s390                 randconfig-r2106-20261010    clang-20   cocci
s390                 randconfig-r2106-20261010    gcc-16.1.0 cocci
s390                 randconfig-r2111-20261011    gcc-12.5.0 cocci
s390                 randconfig-r2201-20261011    gcc-15.2.0 smatch
s390                 randconfig-r2300-20261010    gcc-15.2.0 sparse
s390                 randconfig-r2301-20261010    gcc-13.4.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261012    clang-24
sh                    randconfig-1001-20261012    clang-24
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2000-20261011    gcc-13.4.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                    randconfig-2001-20261011    gcc-13.4.0
sh                   randconfig-r2103-20261011    gcc-16.1.0 cocci
sh                   randconfig-r2107-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2108-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2201-20261010    gcc-15.2.0 smatch
sh                           rsk7201_defconfig    gcc-16.1.0
sh                           rsk7203_defconfig    gcc-16.1.0
sh                           sdk7780_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261012    clang-20
sparc                 randconfig-1001-20261012    clang-20
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261010    gcc-8.5.0
sparc                 randconfig-2000-20261011    gcc-8.5.0
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261011    gcc-8.5.0
sparc                randconfig-r2105-20261010    gcc-16.1.0 cocci
sparc                randconfig-r2106-20261010    clang-21   cocci
sparc                randconfig-r2107-20261011    gcc-16.1.0 cocci
sparc                randconfig-r2108-20261011    gcc-16.1.0 cocci
sparc                randconfig-r2110-20261010    gcc-16.1.0 cocci
sparc                randconfig-r2110-20261011    gcc-16.1.0 cocci
sparc                randconfig-r2300-20261010    gcc-16.1.0 sparse
sparc                randconfig-r2304-20261011    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261010    gcc-11.5.0 sparse
sparc                randconfig-r2310-20261010    gcc-14     sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261012    clang-20
sparc64               randconfig-1001-20261012    clang-20
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261010    gcc-8.5.0
sparc64               randconfig-2000-20261011    gcc-8.5.0
sparc64               randconfig-2001-20261010    clang-21
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261011    gcc-8.5.0
sparc64              randconfig-r2100-20261010    gcc-16.1.0 cocci
sparc64              randconfig-r2103-20261011    gcc-16.1.0 cocci
sparc64              randconfig-r2104-20261010    gcc-16.1.0 cocci
sparc64              randconfig-r2106-20261011    gcc-12.5.0 cocci
sparc64              randconfig-r2110-20261010    gcc-16.1.0 cocci
sparc64              randconfig-r2304-20261011    clang-22   sparse
sparc64              randconfig-r2311-20261010    gcc-14     sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261012    clang-20
um                    randconfig-1001-20261012    clang-20
um                    randconfig-2000-20261010    clang-24
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2000-20261011    gcc-8.5.0
um                    randconfig-2001-20261010    clang-24
um                    randconfig-2001-20261010    gcc-16.1.0
um                    randconfig-2001-20261011    gcc-8.5.0
um                   randconfig-r2105-20261010    clang-21   cocci
um                   randconfig-r2105-20261011    gcc-16.1.0 cocci
um                   randconfig-r2109-20261011    gcc-12.5.0 cocci
um                   randconfig-r2109-20261011    gcc-16.1.0 cocci
um                   randconfig-r2202-20261010    clang-17   smatch
um                   randconfig-r2300-20261010    gcc-13.4.0 sparse
um                   randconfig-r2302-20261010    gcc-15.2.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261012    clang-22
x86_64      buildonly-randconfig-1001-20261012    clang-22
x86_64      buildonly-randconfig-1002-20261012    clang-22
x86_64      buildonly-randconfig-1003-20261012    clang-22
x86_64      buildonly-randconfig-1004-20261012    clang-22
x86_64      buildonly-randconfig-1005-20261012    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261012    clang-22
x86_64                randconfig-1001-20261012    clang-22
x86_64                randconfig-1002-20261012    clang-22
x86_64                randconfig-1003-20261012    clang-22
x86_64                randconfig-1004-20261012    clang-22
x86_64                randconfig-1005-20261012    clang-22
x86_64                randconfig-1006-20261012    clang-22
x86_64                randconfig-1007-20261012    clang-22
x86_64                randconfig-1008-20261012    clang-22
x86_64                randconfig-1009-20261012    clang-22
x86_64                randconfig-1010-20261012    clang-22
x86_64                randconfig-1011-20261012    clang-22
x86_64                randconfig-1012-20261012    gcc-14
x86_64                randconfig-1013-20261012    gcc-14
x86_64                randconfig-1014-20261012    gcc-14
x86_64                randconfig-1015-20261012    gcc-14
x86_64                randconfig-1016-20261012    gcc-14
x86_64                randconfig-1017-20261012    gcc-14
x86_64                randconfig-2000-20261010    clang-22
x86_64                randconfig-2000-20261010    gcc-14
x86_64                randconfig-2000-20261011    clang-22
x86_64                randconfig-2001-20261010    gcc-14
x86_64                randconfig-2001-20261011    clang-22
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2100-20261011    gcc-14     cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2101-20261011    gcc-14     cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2102-20261011    gcc-14     cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2103-20261011    gcc-14     cocci
x86_64                randconfig-2104-20261010    clang-22   cocci
x86_64                randconfig-2104-20261011    gcc-14     cocci
x86_64                randconfig-2105-20261010    clang-22   cocci
x86_64                randconfig-2105-20261011    gcc-14     cocci
x86_64                randconfig-2200-20261011    clang-22   smatch
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2202-20261011    clang-22   smatch
x86_64               randconfig-r2300-20261011    clang-22   sparse
x86_64               randconfig-r2301-20261011    clang-22   sparse
x86_64               randconfig-r2303-20261010    gcc-15.2.0 sparse
x86_64               randconfig-r2305-20261011    gcc-8.5.0  sparse
x86_64               randconfig-r2307-20261010    gcc-14     sparse
x86_64               randconfig-r2309-20261011    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261012    clang-20
xtensa                randconfig-1001-20261012    clang-20
xtensa                randconfig-2000-20261010    gcc-10.5.0
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2000-20261011    gcc-8.5.0
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261011    gcc-8.5.0
xtensa               randconfig-r2202-20261010    gcc-8.5.0  smatch
xtensa               randconfig-r2302-20261010    gcc-8.5.0  sparse
xtensa               randconfig-r2305-20261010    gcc-8.5.0  sparse
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
