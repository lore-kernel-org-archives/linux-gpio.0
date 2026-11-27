Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775312;
	b=cJhlpTTRvN/4J4ZviftfjdfOZDQ6OCR+6QlrLXJkcHVYy9lsTzXBQWrp6ElWOi9xKoPR
	 thAqOr4QA9885QmS9t8dFw9MCx2DmyG9VFnETjvAxiSbGJLKdVGUvyvsIZ+th2ld+E3vZ
	 pH/lZ7/wwjpnHkH0PBeZMtoGCnovoU8O8F9gHbRWbm4Mg7G9DMlSfKPM5WfrXZt2jMtTK
	 6ZFsFfw/ecfuY7aSDnEmpcHXBkbvrOCXS40hSsZHjFXPIcR+VCBzLkdtaRBgRR4C+k9ee
	 CXwGQ+OF9dVL3Oe5yexBM46l+J/HpxQHfoDJpqAFyF7zPCRGHxoPhXqgIJ1rXZAKv3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775312;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gLfqbgcwMuCmKg433/I3iyRBYjtxdsdovL4ssekVvN8=;
	b=ddTNml+FFgOo8ENKq56MlnrAo692O5FvaVGK0KfUrNiKHrxvSVRwn1ijotokMGeV7A8i
	 R31rbGBk+vKSJ7u9QUZOwbOlZBWl8iElOsrxC/KyMJWZBLWeK0UsyDH3Q+HOu5UjeyKbu
	 zY6a9zds3RC55+UuDp8qRIxTySh6Mw4iFY3EqiSgG+P8K4Vda7gBOAd83x3rn8IEUbT8m
	 ornBl+llfQXESLQX0s0sTx7A5yXd1uB07SVJStk4DqtyeawBtlz41hXXtLFLnqPH8EmQP
	 IEe8rVPTF6sGWEnD4URaq+9cyYrQXK6uCga597UtKjOa3Knfzd/7Vp2vzmpEevn8dWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crjpwM1h;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384FD606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 10:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crjpwM1h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795775312; x=1827311312;
  h=date:from:to:cc:subject:message-id;
  bh=ngAipq5q9pndNVzmw3mmqczWp1UX72TMicJMn0/Jg3c=;
  b=crjpwM1hsjeUTY5yckZRXk91Kjlt6x9HDvtmvA5kljxUhwo83LsHpBps
   KKhH9MHuOEkpe//c8bKi6AjlXJFYlFsQPyIIPn6p3ehEFQh8uxwljuGbx
   0IlwxQ7FmA6+OrZvRli57/4Hxy72ztnCS+8kc6ukYE7tE4YWIQkiDXVkw
   lXT0GYTeTmRbPxXWKzpQoinMkCDCBvMsJCTg2XnnCclIYr5kS2EUSpR9a
   VbIzESBY5JQdTGjXE+7puvqZccvBJPhPyAJpNF1ruHzvOWAPtOHT6qNjv
   nUqfoSRBcK3hwpteJsEIgV9Suj+lPAFFKdLIjWrNnrmpXuVk5iBvCDfUW
   Q==;
X-CSE-ConnectionGUID: ZYrYUn1PQUuUfqvHhkwmow==
X-CSE-MsgGUID: jH8xPEcAS5W8jzaScZ+rzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702830"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4702830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 02:28:31 -0800
X-CSE-ConnectionGUID: PNl5lOe0RYaIPvJYkvDoqA==
X-CSE-MsgGUID: YLjyJuuFRRi+u9V4g1ETnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12255920"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2026 02:28:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWtBr-00000001VrC-355q;
	Fri, 27 Nov 2026 10:28:27 +0000
Date: Fri, 27 Nov 2026 18:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 d1e44b75cd10eead6750f929e3cf68febab8586a
Message-ID: <20261127182732.7th6UrT3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: d1e44b75cd10eead6750f929e3cf68febab8586a  pinctrl: qcom: Correct indentation

elapsed time: 799m

configs tested: 408
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261126    gcc-13.5.0
alpha                 randconfig-2001-20261126    gcc-13.5.0
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                randconfig-r2105-20261126    gcc-14.4.0 cocci
alpha                randconfig-r2111-20261126    gcc-14.4.0 cocci
alpha                randconfig-r2306-20261126    gcc-16.2.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261127    gcc-8.5.0
arc                   randconfig-1001-20261127    gcc-8.5.0
arc                   randconfig-2000-20261126    gcc-9.5.0
arc                   randconfig-2001-20261126    gcc-9.5.0
arc                   randconfig-2002-20261126    gcc-9.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261126    gcc-9.5.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                  randconfig-r2101-20261126    gcc-14.4.0 cocci
arc                  randconfig-r2106-20261126    gcc-14.4.0 cocci
arc                  randconfig-r2107-20261126    gcc-11.5.0 cocci
arc                  randconfig-r2302-20261126    gcc-10.5.0 sparse
arc                  randconfig-r2309-20261126    gcc-16.2.0 sparse
arc                  randconfig-r2310-20261126    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261127    gcc-8.5.0
arm                   randconfig-1001-20261127    gcc-8.5.0
arm                   randconfig-1002-20261127    gcc-8.5.0
arm                   randconfig-1003-20261127    gcc-8.5.0
arm                   randconfig-2000-20261126    gcc-11.5.0
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2002-20261126    gcc-11.5.0
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                  randconfig-r2103-20261126    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261126    clang-24   cocci
arm                         realview_defconfig    gcc-16.2.0
arm                          s5pv210_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261127    gcc-8.5.0
arm64                 randconfig-1001-20261127    gcc-8.5.0
arm64                 randconfig-1002-20261127    gcc-8.5.0
arm64                 randconfig-1003-20261127    gcc-8.5.0
arm64                 randconfig-2000-20261126    gcc-11.5.0
arm64                 randconfig-2001-20261126    gcc-11.5.0
arm64                 randconfig-2002-20261126    gcc-11.5.0
arm64                 randconfig-2200-20261126    clang-24   smatch
arm64                randconfig-r2104-20261126    gcc-8.5.0  cocci
arm64                randconfig-r2107-20261126    gcc-10.5.0 cocci
arm64                randconfig-r2109-20261126    gcc-14.4.0 cocci
arm64                randconfig-r2300-20261126    gcc-16.2.0 sparse
arm64                randconfig-r2307-20261126    gcc-9.5.0  sparse
arm64                randconfig-r2308-20261126    clang-24   sparse
arm64                randconfig-r2309-20261126    clang-22   sparse
arm64                randconfig-r2311-20261126    gcc-16.2.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261127    gcc-8.5.0
csky                  randconfig-1001-20261127    gcc-8.5.0
csky                  randconfig-2000-20261126    gcc-13.5.0
csky                  randconfig-2001-20261126    gcc-13.5.0
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
csky                 randconfig-r2100-20261126    gcc-14.4.0 cocci
csky                 randconfig-r2100-20261126    gcc-9.5.0  cocci
csky                 randconfig-r2107-20261126    gcc-10.5.0 cocci
csky                 randconfig-r2110-20261126    gcc-10.5.0 cocci
csky                 randconfig-r2111-20261126    gcc-10.5.0 cocci
csky                 randconfig-r2306-20261126    clang-22   sparse
csky                 randconfig-r2310-20261126    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261127    gcc-9.5.0
hexagon               randconfig-1001-20261127    gcc-9.5.0
hexagon               randconfig-2000-20261126    gcc-13.5.0
hexagon               randconfig-2001-20261126    gcc-13.5.0
hexagon               randconfig-2200-20261126    clang-17   smatch
hexagon              randconfig-r2104-20261126    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261126    gcc-10.5.0 cocci
hexagon              randconfig-r2108-20261126    gcc-10.5.0 cocci
hexagon              randconfig-r2305-20261126    gcc-16.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261127    clang-22
i386        buildonly-randconfig-1001-20261127    clang-22
i386        buildonly-randconfig-1002-20261127    clang-22
i386        buildonly-randconfig-1003-20261127    clang-22
i386        buildonly-randconfig-1004-20261127    clang-22
i386        buildonly-randconfig-1005-20261127    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261127    clang-22
i386                  randconfig-1001-20261127    clang-22
i386                  randconfig-1002-20261127    clang-22
i386                  randconfig-1003-20261127    clang-22
i386                  randconfig-1004-20261127    clang-22
i386                  randconfig-1005-20261127    clang-22
i386                  randconfig-1006-20261127    clang-22
i386                  randconfig-2000-20261126    clang-22
i386                  randconfig-2001-20261126    clang-22
i386                  randconfig-2002-20261126    clang-22
i386                  randconfig-2003-20261126    clang-22
i386                  randconfig-2004-20261126    clang-22
i386                  randconfig-2005-20261126    clang-22
i386                  randconfig-2100-20261126    clang-22   cocci
i386                  randconfig-2101-20261126    clang-22   cocci
i386                  randconfig-2102-20261126    clang-22   cocci
i386                  randconfig-2103-20261126    clang-22   cocci
i386                  randconfig-2104-20261126    clang-22   cocci
i386                  randconfig-2105-20261126    clang-22   cocci
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2300-20261126    gcc-14     sparse
i386                  randconfig-2301-20261126    gcc-14     sparse
i386                  randconfig-2302-20261126    gcc-14     sparse
i386                 randconfig-r2302-20261126    gcc-16.2.0 sparse
i386                 randconfig-r2308-20261126    clang-22   sparse
i386                 randconfig-r2308-20261126    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261127    gcc-9.5.0
loongarch             randconfig-1001-20261127    gcc-9.5.0
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2001-20261126    gcc-12.5.0
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2108-20261126    gcc-10.5.0 cocci
loongarch            randconfig-r2109-20261126    clang-24   cocci
loongarch            randconfig-r2110-20261126    clang-24   cocci
loongarch            randconfig-r2301-20261126    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261126    gcc-13.5.0
m68k                  randconfig-2001-20261126    gcc-13.5.0
m68k                  randconfig-2200-20261126    gcc-8.5.0  smatch
m68k                  randconfig-2200-20261127    gcc-9.5.0  smatch
m68k                 randconfig-r2105-20261126    gcc-8.5.0  cocci
m68k                 randconfig-r2110-20261126    gcc-14.4.0 cocci
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261126    gcc-13.5.0
microblaze            randconfig-2001-20261126    gcc-13.5.0
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze           randconfig-r2103-20261126    gcc-9.5.0  cocci
microblaze           randconfig-r2105-20261126    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261126    clang-24   cocci
microblaze           randconfig-r2111-20261126    clang-24   cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                  decstation_r4k_defconfig    gcc-16.2.0
mips                            ip30_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-16.2.0
mips                  randconfig-2001-20261126    gcc-16.2.0
mips                  randconfig-2002-20261126    gcc-16.2.0
mips                  randconfig-2200-20261126    gcc-15.3.0 smatch
mips                 randconfig-r2101-20261126    gcc-8.5.0  cocci
mips                 randconfig-r2101-20261126    gcc-9.5.0  cocci
mips                 randconfig-r2106-20261126    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261126    clang-24   cocci
mips                 randconfig-r2306-20261126    gcc-16.2.0 sparse
mips                 randconfig-r2309-20261126    gcc-9.5.0  sparse
mips                 randconfig-r2310-20261126    clang-22   sparse
nios2                             alldefconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261127    gcc-9.5.0
nios2                 randconfig-1001-20261127    gcc-9.5.0
nios2                 randconfig-2000-20261126    gcc-12.5.0
nios2                 randconfig-2001-20261126    gcc-12.5.0
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                randconfig-r2100-20261126    gcc-8.5.0  cocci
nios2                randconfig-r2102-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2104-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2105-20261126    gcc-9.5.0  cocci
nios2                randconfig-r2108-20261126    clang-24   cocci
nios2                randconfig-r2108-20261126    gcc-14.4.0 cocci
nios2                randconfig-r2109-20261126    gcc-11.5.0 cocci
nios2                randconfig-r2303-20261126    gcc-10.5.0 sparse
nios2                randconfig-r2304-20261126    gcc-10.5.0 sparse
nios2                randconfig-r2306-20261126    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc             randconfig-r2109-20261126    gcc-10.5.0 cocci
openrisc             randconfig-r2110-20261126    gcc-11.5.0 cocci
openrisc             randconfig-r2303-20261126    gcc-16.2.0 sparse
openrisc             randconfig-r2310-20261126    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                randconfig-1000-20261127    gcc-12.5.0
parisc                randconfig-1001-20261127    gcc-12.5.0
parisc                randconfig-2000-20261126    gcc-12.5.0
parisc                randconfig-2001-20261126    gcc-12.5.0
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2101-20261126    gcc-8.5.0  cocci
parisc               randconfig-r2111-20261126    clang-24   cocci
parisc               randconfig-r2111-20261126    gcc-10.5.0 cocci
parisc               randconfig-r2311-20261126    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                          ps3_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261127    gcc-12.5.0
powerpc               randconfig-1001-20261127    gcc-12.5.0
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2001-20261126    clang-24
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc              randconfig-r2101-20261126    gcc-14.4.0 cocci
powerpc              randconfig-r2102-20261126    gcc-8.5.0  cocci
powerpc              randconfig-r2104-20261126    gcc-14.4.0 cocci
powerpc              randconfig-r2105-20261126    gcc-8.5.0  cocci
powerpc              randconfig-r2109-20261126    gcc-10.5.0 cocci
powerpc              randconfig-r2300-20261126    gcc-10.5.0 sparse
powerpc              randconfig-r2304-20261126    gcc-16.2.0 sparse
powerpc              randconfig-r2305-20261126    gcc-10.5.0 sparse
powerpc              randconfig-r2307-20261126    clang-22   sparse
powerpc              randconfig-r2311-20261126    gcc-9.5.0  sparse
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261127    gcc-12.5.0
powerpc64             randconfig-1001-20261127    gcc-12.5.0
powerpc64             randconfig-2000-20261126    clang-24
powerpc64             randconfig-2001-20261126    clang-24
powerpc64             randconfig-2002-20261126    clang-24
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2102-20261126    gcc-14.4.0 cocci
powerpc64            randconfig-r2104-20261126    gcc-9.5.0  cocci
powerpc64            randconfig-r2108-20261126    clang-24   cocci
powerpc64            randconfig-r2307-20261126    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2001-20261126    gcc-10.5.0
riscv                 randconfig-2002-20261126    gcc-10.5.0
riscv                 randconfig-2003-20261126    gcc-10.5.0
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2005-20261126    gcc-10.5.0
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                randconfig-r2100-20261126    gcc-8.5.0  cocci
riscv                randconfig-r2101-20261126    gcc-8.5.0  cocci
riscv                randconfig-r2105-20261126    clang-22   cocci
riscv                randconfig-r2105-20261126    gcc-14.4.0 cocci
riscv                randconfig-r2106-20261126    clang-24   cocci
riscv                randconfig-r2309-20261126    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-2000-20261126    clang-24
s390                  randconfig-2001-20261126    clang-24
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2003-20261126    clang-24
s390                  randconfig-2004-20261126    clang-24
s390                  randconfig-2005-20261126    clang-24
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                  randconfig-2200-20261127    clang-18   smatch
s390                 randconfig-r2102-20261126    gcc-8.5.0  cocci
s390                 randconfig-r2107-20261126    clang-24   cocci
s390                 randconfig-r2107-20261126    gcc-14.4.0 cocci
s390                 randconfig-r2308-20261126    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                    randconfig-2000-20261126    gcc-9.5.0
sh                    randconfig-2001-20261126    gcc-9.5.0
sh                    randconfig-2002-20261126    gcc-9.5.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2004-20261126    gcc-9.5.0
sh                    randconfig-2005-20261126    gcc-9.5.0
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                   randconfig-r2103-20261126    gcc-8.5.0  cocci
sh                   randconfig-r2104-20261126    clang-22   cocci
sh                   randconfig-r2308-20261126    gcc-16.2.0 sparse
sh                   randconfig-r2310-20261126    gcc-16.2.0 sparse
sh                   randconfig-r2311-20261126    gcc-16.2.0 sparse
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261127    gcc-14
sparc                 randconfig-1001-20261127    gcc-14
sparc                 randconfig-2000-20261126    gcc-8.5.0
sparc                 randconfig-2001-20261126    gcc-8.5.0
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                randconfig-r2103-20261126    clang-22   cocci
sparc                randconfig-r2108-20261126    gcc-11.5.0 cocci
sparc                randconfig-r2110-20261126    gcc-10.5.0 cocci
sparc                randconfig-r2309-20261126    gcc-16.2.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261127    gcc-14
sparc64               randconfig-1001-20261127    gcc-14
sparc64               randconfig-2000-20261126    gcc-8.5.0
sparc64               randconfig-2001-20261126    gcc-8.5.0
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64              randconfig-r2103-20261126    gcc-14.4.0 cocci
sparc64              randconfig-r2103-20261126    gcc-8.5.0  cocci
sparc64              randconfig-r2109-20261126    clang-24   cocci
sparc64              randconfig-r2306-20261126    clang-24   sparse
sparc64              randconfig-r2311-20261126    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261127    gcc-14
um                    randconfig-1001-20261127    gcc-14
um                    randconfig-2000-20261126    gcc-8.5.0
um                    randconfig-2001-20261126    gcc-8.5.0
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2100-20261126    clang-22   cocci
um                   randconfig-r2102-20261126    gcc-9.5.0  cocci
um                   randconfig-r2103-20261126    gcc-14.4.0 cocci
um                   randconfig-r2111-20261126    gcc-11.5.0 cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261127    gcc-14
x86_64      buildonly-randconfig-1001-20261127    gcc-14
x86_64      buildonly-randconfig-1002-20261127    gcc-14
x86_64      buildonly-randconfig-1003-20261127    gcc-14
x86_64      buildonly-randconfig-1004-20261127    gcc-14
x86_64      buildonly-randconfig-1005-20261127    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261127    gcc-14
x86_64                randconfig-1001-20261127    gcc-14
x86_64                randconfig-1002-20261127    gcc-14
x86_64                randconfig-1003-20261127    gcc-14
x86_64                randconfig-1004-20261127    gcc-14
x86_64                randconfig-1005-20261127    gcc-14
x86_64                randconfig-2000-20261126    clang-22
x86_64                randconfig-2001-20261126    clang-22
x86_64                randconfig-2002-20261126    clang-22
x86_64                randconfig-2003-20261126    clang-22
x86_64                randconfig-2004-20261126    clang-22
x86_64                randconfig-2005-20261126    clang-22
x86_64                randconfig-2100-20261126    gcc-14     cocci
x86_64                randconfig-2101-20261126    gcc-14     cocci
x86_64                randconfig-2102-20261126    gcc-14     cocci
x86_64                randconfig-2103-20261126    gcc-14     cocci
x86_64                randconfig-2104-20261126    gcc-14     cocci
x86_64                randconfig-2105-20261126    gcc-14     cocci
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2300-20261126    gcc-14     sparse
x86_64                randconfig-2301-20261126    gcc-14     sparse
x86_64                randconfig-2302-20261126    gcc-14     sparse
x86_64               randconfig-r2100-20261126    gcc-8.5.0  cocci
x86_64               randconfig-r2101-20261126    clang-22   cocci
x86_64               randconfig-r2301-20261126    gcc-10.5.0 sparse
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
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261127    gcc-14
xtensa                randconfig-1001-20261127    gcc-14
xtensa                randconfig-2000-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261126    gcc-13.5.0
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261126    gcc-14.4.0 cocci
xtensa               randconfig-r2102-20261126    clang-22   cocci
xtensa               randconfig-r2106-20261126    gcc-10.5.0 cocci
xtensa               randconfig-r2307-20261126    gcc-16.2.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
