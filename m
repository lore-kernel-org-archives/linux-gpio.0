Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647147255E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364667; cv=none; b=XKB9Up3ABex+5kVe44ZAHSBZUgtv4iQNd2NxJ3IHV8rHG0ydk4uuWhGnsCSRz5kBVIx8+Za2UKeS17R7Zpwo1UDmdvZe3liRjNhGFy9KZppXYKV0BXS8Z3ddeGyUgPXJcWuIrHLvhTxMih5hUOpZqp4LGv0Gx+Buwq7wFtLdb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364667; c=relaxed/simple;
	bh=UOD7hEiOOdik0CYPFCihW8fxEAhUq7Z1UcCUL7E0mPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=io3pC0ojN+X4fB7tZEqZ7Av3png3GvfzWlM8+NqjqP5jXmfhU1GrNHxVc17lSSmIa1UfcrM58RnUIDWG7q4I7n9mj0xotBDR8MUZDWfWOuUes4Cr8rfPkIO4XUR0Rxu9YB4JxLEwoz9U829meBifZeujec1TrnX000S+O3FwTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCrXwvxi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCrXwvxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791364624; x=1822900624;
  h=date:from:to:cc:subject:message-id;
  bh=UOD7hEiOOdik0CYPFCihW8fxEAhUq7Z1UcCUL7E0mPY=;
  b=lCrXwvxiWzZrNHPVmr0hiRWMM0i7pZ/EEVhDBhVgUq7nBvcJVYLC9S8M
   +mvnHPX9HuBHfgVlSOBlFtegtMnayJMUCuX8O3f/SD0k2JJzANKzdIaNr
   TQbhZFxaTKO089e/gK6Vuv6w0Qe1h0vZayzGv0OdNBvFeyum6QsTWxaiT
   xkK134349QSN9hFl2SRfDwZTaS8Xt93dHG/7noNC/H8ujx1gdGnkjWbvd
   0Xmk+1BClPRWBgls1FWeLiJgbDy0opPRlxl4S7z6D6VIEruEOAxcHSY0j
   aCjtkdOuBLH4AC2+sluft8hAw6CYeU89fhOFgfxSU0yBNV8mqoi2UqWc8
   w==;
X-CSE-ConnectionGUID: RiiSL5urRXWYbPSWcHqG7Q==
X-CSE-MsgGUID: vBrPkyMJRGa9b4TD87qxcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="116447"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="116447"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:17:03 -0700
X-CSE-ConnectionGUID: 82+kmjPLTLShaK2mbKtU/w==
X-CSE-MsgGUID: +mq978vmSEGkxGqHMT2OtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280633968"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Oct 2026 02:17:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xENlj-000000002k8-1Vey;
	Wed, 07 Oct 2026 09:16:59 +0000
Date: Wed, 07 Oct 2026 17:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-current] BUILD SUCCESS
 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a
Message-ID: <202610071753.MDSEvRGC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a  pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12

elapsed time: 1206m

configs tested: 432
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261006    gcc-9.5.0  cocci
alpha                randconfig-r2104-20261007    gcc-10.5.0 cocci
alpha                randconfig-r2107-20261006    clang-24   cocci
alpha                randconfig-r2200-20261006    gcc-14.3.0 smatch
alpha                randconfig-r2201-20261006    gcc-8.5.0  smatch
alpha                randconfig-r2303-20261006    gcc-8.5.0  sparse
alpha                randconfig-r2304-20261006    gcc-10.5.0 sparse
alpha                randconfig-r2307-20261006    clang-19   sparse
alpha                randconfig-r2308-20261006    clang-19   sparse
alpha                randconfig-r2309-20261006    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1001-20261007    clang-24
arc                  randconfig-r2102-20261007    gcc-10.5.0 cocci
arc                  randconfig-r2105-20261006    gcc-14.3.0 cocci
arc                  randconfig-r2106-20261006    clang-24   cocci
arc                  randconfig-r2200-20261006    gcc-13.4.0 smatch
arc                  randconfig-r2201-20261006    gcc-11.5.0 smatch
arm                               alldefconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      davinci_all_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            omap1_defconfig    gcc-16.1.0
arm                           pxa168_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1003-20261007    clang-24
arm                  randconfig-r2103-20261006    clang-24   cocci
arm                  randconfig-r2300-20261006    clang-18   sparse
arm                  randconfig-r2305-20261006    gcc-8.5.0  sparse
arm                  randconfig-r2307-20261006    clang-22   sparse
arm                  randconfig-r2308-20261006    clang-22   sparse
arm                          wpcm450_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                randconfig-r2100-20261007    gcc-10.5.0 cocci
arm64                randconfig-r2101-20261006    clang-24   cocci
arm64                randconfig-r2104-20261006    gcc-14.3.0 cocci
arm64                randconfig-r2105-20261006    clang-24   cocci
arm64                randconfig-r2106-20261006    clang-17   cocci
arm64                randconfig-r2300-20261006    gcc-8.5.0  sparse
arm64                randconfig-r2306-20261006    clang-22   sparse
arm64                randconfig-r2306-20261006    gcc-12.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                 randconfig-r2101-20261006    gcc-16.1.0 cocci
csky                 randconfig-r2103-20261006    gcc-16.1.0 cocci
csky                 randconfig-r2107-20261006    gcc-9.5.0  cocci
csky                 randconfig-r2200-20261006    gcc-15.2.0 smatch
csky                 randconfig-r2201-20261007    gcc-16.1.0 smatch
csky                 randconfig-r2202-20261006    gcc-16.1.0 smatch
csky                 randconfig-r2300-20261006    gcc-15.2.0 sparse
csky                 randconfig-r2303-20261006    gcc-10.5.0 sparse
csky                 randconfig-r2304-20261006    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon              randconfig-r2104-20261006    gcc-9.5.0  cocci
hexagon              randconfig-r2301-20261006    gcc-8.5.0  sparse
hexagon              randconfig-r2302-20261006    gcc-14.3.0 sparse
hexagon              randconfig-r2304-20261006    gcc-14     sparse
hexagon              randconfig-r2305-20261006    clang-18   sparse
hexagon              randconfig-r2305-20261006    gcc-14.3.0 sparse
hexagon              randconfig-r2307-20261006    gcc-10.5.0 sparse
hexagon              randconfig-r2308-20261006    clang-24   sparse
hexagon              randconfig-r2309-20261007    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1005-20261007    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-2100-20261006    clang-22   cocci
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2101-20261006    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2102-20261006    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2103-20261006    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2200-20261006    gcc-13     smatch
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2300-20261006    gcc-14     sparse
i386                  randconfig-2301-20261006    gcc-14     sparse
i386                  randconfig-2302-20261006    gcc-14     sparse
i386                 randconfig-r2100-20261006    clang-24   cocci
i386                 randconfig-r2101-20261006    clang-24   cocci
i386                 randconfig-r2105-20261006    clang-17   cocci
i386                 randconfig-r2105-20261006    gcc-16.1.0 cocci
i386                 randconfig-r2202-20261006    gcc-14     smatch
i386                 randconfig-r2300-20261006    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch            randconfig-r2102-20261006    gcc-13     cocci
loongarch            randconfig-r2106-20261006    gcc-16.1.0 cocci
loongarch            randconfig-r2106-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2200-20261006    clang-18   smatch
loongarch            randconfig-r2201-20261006    gcc-13.4.0 smatch
loongarch            randconfig-r2301-20261006    gcc-10.5.0 sparse
loongarch            randconfig-r2302-20261006    gcc-10.5.0 sparse
loongarch            randconfig-r2308-20261006    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261006    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme147_defconfig    gcc-16.1.0
m68k                 randconfig-r2101-20261006    gcc-10.5.0 cocci
m68k                 randconfig-r2103-20261006    gcc-9.5.0  cocci
m68k                 randconfig-r2105-20261006    gcc-9.5.0  cocci
m68k                 randconfig-r2106-20261007    gcc-10.5.0 cocci
m68k                 randconfig-r2300-20261006    gcc-8.5.0  sparse
m68k                 randconfig-r2301-20261006    gcc-14.3.0 sparse
m68k                 randconfig-r2302-20261006    gcc-14     sparse
m68k                 randconfig-r2304-20261006    clang-18   sparse
m68k                 randconfig-r2304-20261006    gcc-15.2.0 sparse
m68k                 randconfig-r2305-20261006    gcc-15.2.0 sparse
m68k                 randconfig-r2307-20261006    clang-19   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2104-20261006    gcc-11.5.0 cocci
microblaze           randconfig-r2107-20261006    clang-17   cocci
microblaze           randconfig-r2200-20261006    gcc-14.3.0 smatch
microblaze           randconfig-r2301-20261006    gcc-10.5.0 sparse
microblaze           randconfig-r2303-20261006    gcc-15.2.0 sparse
microblaze           randconfig-r2306-20261006    clang-24   sparse
microblaze           randconfig-r2307-20261006    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                            jazz_defconfig    gcc-16.1.0
mips                   maltasmvp_eva_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20261006    clang-24   cocci
mips                 randconfig-r2105-20261006    gcc-16.1.0 cocci
mips                 randconfig-r2202-20261006    gcc-13.4.0 smatch
mips                 randconfig-r2301-20261006    gcc-14     sparse
mips                 randconfig-r2303-20261006    gcc-8.5.0  sparse
mips                 randconfig-r2305-20261006    gcc-10.5.0 sparse
mips                 randconfig-r2306-20261007    clang-17   sparse
mips                 randconfig-r2309-20261006    clang-20   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                randconfig-r2100-20261006    gcc-10.5.0 cocci
nios2                randconfig-r2102-20261006    gcc-10.5.0 cocci
nios2                randconfig-r2105-20261007    gcc-10.5.0 cocci
nios2                randconfig-r2106-20261006    gcc-14.3.0 cocci
nios2                randconfig-r2107-20261006    gcc-11.5.0 cocci
nios2                randconfig-r2202-20261006    gcc-8.5.0  smatch
nios2                randconfig-r2300-20261006    gcc-10.5.0 sparse
nios2                randconfig-r2301-20261006    clang-18   sparse
nios2                randconfig-r2305-20261006    gcc-8.5.0  sparse
nios2                randconfig-r2306-20261006    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261007    gcc-10.5.0 cocci
openrisc             randconfig-r2103-20261006    gcc-10.5.0 cocci
openrisc             randconfig-r2104-20261006    gcc-8.5.0  cocci
openrisc             randconfig-r2200-20261006    gcc-13.4.0 smatch
openrisc             randconfig-r2305-20261006    gcc-14     sparse
openrisc             randconfig-r2309-20261006    gcc-10.5.0 sparse
openrisc             randconfig-r2309-20261006    gcc-12.5.0 sparse
openrisc                        virt_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc               randconfig-r2104-20261006    clang-17   cocci
parisc               randconfig-r2201-20261006    gcc-8.5.0  smatch
parisc               randconfig-r2301-20261006    gcc-8.5.0  sparse
parisc               randconfig-r2303-20261006    gcc-14     sparse
parisc               randconfig-r2303-20261006    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc              randconfig-r2102-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2104-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2107-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2300-20261006    gcc-14.3.0 sparse
powerpc              randconfig-r2302-20261006    gcc-15.2.0 sparse
powerpc              randconfig-r2303-20261006    gcc-14.3.0 sparse
powerpc              randconfig-r2306-20261006    gcc-8.5.0  sparse
powerpc              randconfig-r2308-20261006    gcc-12.5.0 sparse
powerpc                      stx_gp3_defconfig    gcc-16.1.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64            randconfig-r2102-20261006    clang-24   cocci
powerpc64            randconfig-r2102-20261006    gcc-9.5.0  cocci
powerpc64            randconfig-r2103-20261007    gcc-10.5.0 cocci
powerpc64            randconfig-r2104-20261006    clang-24   cocci
powerpc64            randconfig-r2301-20261006    gcc-15.2.0 sparse
powerpc64            randconfig-r2305-20261006    gcc-10.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
riscv                randconfig-r2100-20261006    gcc-13     cocci
riscv                randconfig-r2105-20261006    gcc-8.5.0  cocci
riscv                randconfig-r2302-20261006    gcc-14     sparse
riscv                randconfig-r2303-20261006    clang-18   sparse
riscv                randconfig-r2304-20261006    gcc-10.5.0 sparse
riscv                randconfig-r2305-20261006    gcc-12.5.0 sparse
riscv                randconfig-r2307-20261006    gcc-12.5.0 sparse
riscv                randconfig-r2308-20261007    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2001-20261006    gcc-16.1.0
s390                 randconfig-r2101-20261006    gcc-13     cocci
s390                 randconfig-r2306-20261006    clang-19   sparse
s390                 randconfig-r2308-20261006    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.1.0
sh                           lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                   randconfig-r2107-20261006    gcc-14.3.0 cocci
sh                   randconfig-r2201-20261006    gcc-16.1.0 smatch
sh                   randconfig-r2302-20261006    gcc-8.5.0  sparse
sh                   randconfig-r2304-20261006    gcc-8.5.0  sparse
sh                   randconfig-r2304-20261006    gcc-9.5.0  sparse
sh                   randconfig-r2306-20261006    clang-19   sparse
sh                   randconfig-r2308-20261006    clang-19   sparse
sh                   randconfig-r2308-20261006    clang-20   sparse
sh                           rsk7264_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261007    clang-17
sparc                 randconfig-1001-20261007    clang-17
sparc                 randconfig-2000-20261006    clang-24
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2001-20261006    clang-24
sparc                 randconfig-2001-20261007    clang-24
sparc                randconfig-r2100-20261006    clang-24   cocci
sparc                randconfig-r2201-20261006    gcc-16.1.0 smatch
sparc                randconfig-r2300-20261006    gcc-8.5.0  sparse
sparc                randconfig-r2301-20261006    gcc-14     sparse
sparc                randconfig-r2302-20261006    gcc-10.5.0 sparse
sparc                randconfig-r2302-20261006    gcc-16.1.0 sparse
sparc                randconfig-r2303-20261006    gcc-10.5.0 sparse
sparc                randconfig-r2304-20261006    gcc-14     sparse
sparc                randconfig-r2304-20261006    gcc-14.3.0 sparse
sparc                randconfig-r2306-20261006    clang-20   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261007    clang-17
sparc64               randconfig-1001-20261007    clang-17
sparc64               randconfig-2000-20261006    clang-24
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2001-20261006    clang-24
sparc64               randconfig-2001-20261007    clang-24
sparc64              randconfig-r2100-20261006    gcc-9.5.0  cocci
sparc64              randconfig-r2103-20261006    clang-24   cocci
sparc64              randconfig-r2106-20261006    gcc-11.5.0 cocci
sparc64              randconfig-r2106-20261006    gcc-9.5.0  cocci
sparc64              randconfig-r2302-20261006    clang-18   sparse
sparc64              randconfig-r2307-20261006    gcc-10.5.0 sparse
sparc64              randconfig-r2308-20261006    gcc-10.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261007    clang-17
um                    randconfig-1001-20261007    clang-17
um                    randconfig-2000-20261006    clang-24
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2001-20261006    clang-24
um                    randconfig-2001-20261007    clang-24
um                   randconfig-r2103-20261006    gcc-13     cocci
um                   randconfig-r2105-20261006    gcc-11.5.0 cocci
um                   randconfig-r2107-20261006    gcc-16.1.0 cocci
um                   randconfig-r2107-20261006    gcc-8.5.0  cocci
um                   randconfig-r2202-20261006    clang-24   smatch
um                   randconfig-r2202-20261007    clang-24   smatch
um                   randconfig-r2302-20261006    gcc-8.5.0  sparse
um                   randconfig-r2303-20261006    gcc-14     sparse
um                   randconfig-r2305-20261006    gcc-14     sparse
um                   randconfig-r2309-20261006    clang-19   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-2100-20261006    clang-22   cocci
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2102-20261006    gcc-14     cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2300-20261006    gcc-14     sparse
x86_64                randconfig-2301-20261006    gcc-14     sparse
x86_64                randconfig-2302-20261006    gcc-14     sparse
x86_64               randconfig-r2106-20261006    gcc-16.1.0 cocci
x86_64               randconfig-r2107-20261007    gcc-10.5.0 cocci
x86_64               randconfig-r2200-20261006    clang-22   smatch
x86_64               randconfig-r2201-20261006    gcc-12     smatch
x86_64               randconfig-r2202-20261006    gcc-14     smatch
x86_64               randconfig-r2301-20261006    gcc-8.5.0  sparse
x86_64               randconfig-r2307-20261006    clang-20   sparse
x86_64               randconfig-r2309-20261006    clang-22   sparse
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
xtensa                randconfig-1000-20261007    clang-17
xtensa                randconfig-1001-20261007    clang-17
xtensa                randconfig-2000-20261006    clang-24
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2001-20261006    clang-24
xtensa                randconfig-2001-20261007    clang-24
xtensa               randconfig-r2100-20261006    gcc-16.1.0 cocci
xtensa               randconfig-r2200-20261006    gcc-9.5.0  smatch
xtensa               randconfig-r2306-20261006    gcc-10.5.0 sparse
xtensa               randconfig-r2307-20261006    clang-24   sparse
xtensa               randconfig-r2307-20261007    clang-17   sparse
xtensa               randconfig-r2309-20261006    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
