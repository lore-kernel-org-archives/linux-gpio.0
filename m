Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22023485505
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061190; cv=none; b=aPhLjLicV43YC2QR76yPlRDAZyzQKTmdF3oW9+YguFJ28iVrjWX+cGje/+LSIh6I5J+j/k9c3cB1QIDTG9eDmS0/2HHe9RhY2bj64M/GqXkK2zrwXgmQN2Bv4y2SGxhiMhygIRUs+l1jpjTN3fdODVZQMaypuam2Aq7gn8s7O38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061190; c=relaxed/simple;
	bh=WVFfcjBmV2SqapIMXcHAMhySMf2wWej22vlRUB276Mo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dWnA/lN+I2FdSgcseo73zEXLE/D6mNWuamNPupyieI/fnpuVwmD0X928uk/10FxG7Pf2D3PxfDuwQOqzO1vV8KcoaZUbl6AsVbSmbN1YWx+o74yqSlPVceh+Ppe1bJesGgyup8CmN4ILuVXHe+k7vSpF9fn6B9Aiu34GNJFqSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3TWHGMy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3TWHGMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792061188; x=1823597188;
  h=date:from:to:cc:subject:message-id;
  bh=WVFfcjBmV2SqapIMXcHAMhySMf2wWej22vlRUB276Mo=;
  b=R3TWHGMyDLr3vdLz7EIcdKrfF1w96sWgRg00tBj10YO2dXzF+ar0T2k+
   uZMy2BwllQbaRSF5xQOkSvJOP1ejFksLIUwS8VyCNDnydG5fGhyfFBMjN
   UtdD7LsODOk98bmoAktW8L0K5775EBqLyR2xnxXe2DiL/ifTI31mxha4n
   k4BMWYKfcHYsQ8l/fz3JfW/P9DlRB9GKF09y6hrh5vFaLR1nVkvEPXub4
   oSLtbV2N3otdcrjqDy3H/87WjMVKRaQMyZESrSohI+44NqwJ2JBdedsrz
   2HYzieZx1Away4mFyy3i2s61JE/8T0NAb17M44RuQXs/J4y3Qpkg6wghW
   w==;
X-CSE-ConnectionGUID: HVVDF5OvQqekVz0KlBp4lQ==
X-CSE-MsgGUID: Vz00yPWgR2qK+Yl7sYNd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="828175"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="828175"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:46:27 -0700
X-CSE-ConnectionGUID: GZJqCqE3T1Crybie9Lmr0w==
X-CSE-MsgGUID: iDA+WI9UStOlj0hcq5VUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1748381"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Oct 2026 03:46:26 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHIyd-00000000GIA-2Iqg;
	Thu, 15 Oct 2026 10:46:23 +0000
Date: Thu, 15 Oct 2026 18:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
Message-ID: <202610151829.KzrZa8FQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db  dt-bindings: pinctrl: brcm,nsp-gpio: Convert to DT schema

elapsed time: 2508m

configs tested: 787
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    clang-20
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2104-20261013    clang-22   cocci
alpha                randconfig-r2105-20261013    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261013    clang-22   cocci
alpha                randconfig-r2110-20261012    gcc-10.5.0 cocci
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
alpha                randconfig-r2309-20261012    gcc-12.5.0 sparse
alpha                randconfig-r2309-20261013    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    clang-20
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                             hsdk_defconfig    clang-24
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261014    clang-17
arc                   randconfig-1000-20261015    clang-24
arc                   randconfig-1001-20261014    clang-17
arc                   randconfig-1001-20261015    clang-24
arc                   randconfig-2000-20261012    gcc-16.1.0
arc                   randconfig-2000-20261013    gcc-8.5.0
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261012    gcc-16.1.0
arc                   randconfig-2001-20261013    gcc-8.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2102-20261013    clang-24   cocci
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261013    clang-22   cocci
arc                  randconfig-r2109-20261013    clang-24   cocci
arc                  randconfig-r2110-20261013    gcc-8.5.0  cocci
arc                  randconfig-r2200-20261012    gcc-16.1.0 smatch
arc                  randconfig-r2200-20261013    gcc-13.4.0 smatch
arc                  randconfig-r2300-20261013    gcc-8.5.0  sparse
arc                  randconfig-r2301-20261012    gcc-11.5.0 sparse
arc                  randconfig-r2301-20261013    gcc-12.5.0 sparse
arc                  randconfig-r2310-20261012    gcc-12.5.0 sparse
arm                                allnoconfig    clang-20
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.1.0
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                           gemini_defconfig    clang-17
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261014    clang-17
arm                   randconfig-1000-20261015    clang-24
arm                   randconfig-1001-20261014    clang-17
arm                   randconfig-1001-20261015    clang-24
arm                   randconfig-1002-20261014    clang-17
arm                   randconfig-1002-20261015    clang-24
arm                   randconfig-1003-20261014    clang-17
arm                   randconfig-1003-20261015    clang-24
arm                   randconfig-2000-20261012    gcc-16.1.0
arm                   randconfig-2000-20261013    gcc-8.5.0
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261012    gcc-16.1.0
arm                   randconfig-2001-20261013    gcc-8.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                  randconfig-r2101-20261013    clang-24   cocci
arm                  randconfig-r2104-20261013    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261012    gcc-11.5.0 cocci
arm                  randconfig-r2107-20261012    gcc-9.5.0  cocci
arm                  randconfig-r2109-20261013    clang-24   cocci
arm                  randconfig-r2111-20261013    gcc-14.3.0 cocci
arm                  randconfig-r2202-20261013    gcc-8.5.0  smatch
arm                  randconfig-r2306-20261012    gcc-12.5.0 sparse
arm                  randconfig-r2307-20261013    clang-19   sparse
arm                  randconfig-r2308-20261013    clang-24   sparse
arm                  randconfig-r2311-20261012    gcc-12.5.0 sparse
arm                  randconfig-r2311-20261013    gcc-13.4.0 sparse
arm                          socfpga_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             alldefconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    clang-20
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261014    gcc-16.1.0
arm64                 randconfig-1000-20261015    gcc-8.5.0
arm64                 randconfig-1001-20261014    gcc-16.1.0
arm64                 randconfig-1001-20261015    gcc-8.5.0
arm64                 randconfig-1002-20261014    gcc-16.1.0
arm64                 randconfig-1002-20261015    gcc-8.5.0
arm64                 randconfig-1003-20261014    gcc-16.1.0
arm64                 randconfig-1003-20261015    gcc-8.5.0
arm64                 randconfig-2000-20261012    gcc-16.1.0
arm64                 randconfig-2000-20261013    gcc-9.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261012    gcc-16.1.0
arm64                 randconfig-2001-20261013    gcc-9.5.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2101-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2103-20261013    clang-24   cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2108-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2111-20261012    gcc-11.5.0 cocci
arm64                randconfig-r2200-20261013    gcc-8.5.0  smatch
arm64                randconfig-r2201-20261012    gcc-10.5.0 smatch
arm64                randconfig-r2201-20261013    gcc-11.5.0 smatch
arm64                randconfig-r2303-20261012    clang-24   sparse
arm64                randconfig-r2305-20261012    clang-24   sparse
arm64                randconfig-r2305-20261013    gcc-12.5.0 sparse
arm64                randconfig-r2305-20261014    clang-24   sparse
arm64                randconfig-r2306-20261013    gcc-10.5.0 sparse
arm64                randconfig-r2307-20261012    gcc-16.1.0 sparse
arm64                randconfig-r2309-20261013    clang-19   sparse
arm64                randconfig-r2311-20261012    gcc-12.5.0 sparse
arm64                randconfig-r2311-20261013    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    clang-20
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261014    gcc-16.1.0
csky                  randconfig-1000-20261015    gcc-8.5.0
csky                  randconfig-1001-20261014    gcc-16.1.0
csky                  randconfig-1001-20261015    gcc-8.5.0
csky                  randconfig-2000-20261012    gcc-16.1.0
csky                  randconfig-2000-20261013    gcc-9.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261012    gcc-16.1.0
csky                  randconfig-2001-20261013    gcc-9.5.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2101-20261013    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261012    gcc-14     cocci
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2111-20261012    gcc-10.5.0 cocci
csky                 randconfig-r2111-20261013    gcc-10.5.0 cocci
csky                 randconfig-r2200-20261012    gcc-10.5.0 smatch
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2300-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2302-20261012    clang-24   sparse
csky                 randconfig-r2302-20261014    clang-24   sparse
csky                 randconfig-r2303-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2306-20261012    gcc-12.5.0 sparse
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    clang-20
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261014    clang-18
hexagon               randconfig-1000-20261015    clang-24
hexagon               randconfig-1001-20261014    clang-18
hexagon               randconfig-1001-20261015    clang-24
hexagon               randconfig-2000-20261012    gcc-16.1.0
hexagon               randconfig-2000-20261013    gcc-9.5.0
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261012    gcc-16.1.0
hexagon               randconfig-2001-20261013    gcc-9.5.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2101-20261013    clang-24   cocci
hexagon              randconfig-r2102-20261012    clang-24   cocci
hexagon              randconfig-r2102-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261013    clang-21   cocci
hexagon              randconfig-r2103-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2107-20261013    clang-24   cocci
hexagon              randconfig-r2109-20261012    clang-24   cocci
hexagon              randconfig-r2110-20261012    gcc-14     cocci
hexagon              randconfig-r2301-20261013    gcc-8.5.0  sparse
hexagon              randconfig-r2304-20261014    clang-24   sparse
hexagon              randconfig-r2305-20261012    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    clang-20
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261014    gcc-14
i386        buildonly-randconfig-1000-20261015    gcc-14
i386        buildonly-randconfig-1001-20261014    gcc-14
i386        buildonly-randconfig-1001-20261015    gcc-14
i386        buildonly-randconfig-1002-20261014    gcc-14
i386        buildonly-randconfig-1002-20261015    gcc-14
i386        buildonly-randconfig-1003-20261014    gcc-14
i386        buildonly-randconfig-1003-20261015    gcc-14
i386        buildonly-randconfig-1004-20261014    gcc-14
i386        buildonly-randconfig-1004-20261015    gcc-14
i386        buildonly-randconfig-1005-20261014    gcc-14
i386        buildonly-randconfig-1005-20261015    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261014    clang-22
i386                  randconfig-1000-20261015    gcc-14
i386                  randconfig-1001-20261014    clang-22
i386                  randconfig-1001-20261015    gcc-14
i386                  randconfig-1002-20261014    clang-22
i386                  randconfig-1002-20261015    gcc-14
i386                  randconfig-1003-20261014    clang-22
i386                  randconfig-1003-20261015    gcc-14
i386                  randconfig-1004-20261014    clang-22
i386                  randconfig-1004-20261015    gcc-14
i386                  randconfig-1005-20261014    clang-22
i386                  randconfig-1005-20261015    gcc-14
i386                  randconfig-1006-20261014    clang-22
i386                  randconfig-1006-20261015    gcc-14
i386                  randconfig-1007-20261014    gcc-14
i386                  randconfig-1007-20261015    clang-22
i386                  randconfig-1008-20261014    gcc-14
i386                  randconfig-1008-20261015    clang-22
i386                  randconfig-1009-20261014    gcc-14
i386                  randconfig-1009-20261015    clang-22
i386                  randconfig-1010-20261014    gcc-14
i386                  randconfig-1010-20261015    clang-22
i386                  randconfig-1011-20261014    gcc-14
i386                  randconfig-1011-20261015    clang-22
i386                  randconfig-1012-20261014    gcc-14
i386                  randconfig-1012-20261015    clang-22
i386                  randconfig-1013-20261014    gcc-14
i386                  randconfig-1013-20261015    clang-22
i386                  randconfig-2000-20261012    gcc-16.1.0
i386                  randconfig-2000-20261013    gcc-8.5.0
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261012    gcc-16.1.0
i386                  randconfig-2001-20261013    gcc-8.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261012    clang-22   cocci
i386                  randconfig-2100-20261013    gcc-14     cocci
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261012    clang-22   cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261012    clang-22   cocci
i386                  randconfig-2102-20261013    gcc-14     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261012    clang-22   cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261012    clang-22   cocci
i386                  randconfig-2104-20261013    gcc-14     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261012    clang-22   cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261012    clang-22   smatch
i386                  randconfig-2200-20261013    gcc-14     smatch
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261012    gcc-14     sparse
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261012    gcc-14     sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261012    gcc-14     sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2100-20261012    clang-24   cocci
i386                 randconfig-r2100-20261013    clang-24   cocci
i386                 randconfig-r2102-20261013    clang-24   cocci
i386                 randconfig-r2104-20261013    gcc-10.5.0 cocci
i386                 randconfig-r2110-20261013    clang-24   cocci
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261013    clang-22   cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261014    clang-24   sparse
i386                 randconfig-r2300-20261014    gcc-13.4.0 sparse
i386                 randconfig-r2305-20261013    clang-22   sparse
i386                 randconfig-r2307-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2308-20261012    gcc-16.1.0 sparse
i386                 randconfig-r2308-20261013    gcc-9.5.0  sparse
i386                 randconfig-r2310-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2311-20261012    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261014    clang-18
loongarch             randconfig-1000-20261015    clang-24
loongarch             randconfig-1001-20261014    clang-18
loongarch             randconfig-1001-20261015    clang-24
loongarch             randconfig-2000-20261012    gcc-11.5.0
loongarch             randconfig-2000-20261013    gcc-11.5.0
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261012    gcc-11.5.0
loongarch             randconfig-2001-20261013    gcc-11.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2100-20261013    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261012    clang-24   cocci
loongarch            randconfig-r2101-20261013    clang-24   cocci
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261012    gcc-10.5.0 cocci
loongarch            randconfig-r2106-20261013    gcc-8.5.0  cocci
loongarch            randconfig-r2110-20261012    gcc-11.5.0 cocci
loongarch            randconfig-r2110-20261013    gcc-14.3.0 cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
loongarch            randconfig-r2201-20261012    clang-20   smatch
loongarch            randconfig-r2201-20261013    clang-24   smatch
loongarch            randconfig-r2300-20261013    gcc-12.5.0 sparse
loongarch            randconfig-r2302-20261012    clang-24   sparse
loongarch            randconfig-r2303-20261014    gcc-13.4.0 sparse
loongarch            randconfig-r2305-20261014    clang-24   sparse
loongarch            randconfig-r2306-20261013    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    clang-20
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261013    clang-24   cocci
m68k                 randconfig-r2101-20261012    clang-24   cocci
m68k                 randconfig-r2103-20261013    gcc-12.5.0 cocci
m68k                 randconfig-r2107-20261013    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261013    clang-24   cocci
m68k                 randconfig-r2109-20261013    gcc-12.5.0 cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
m68k                 randconfig-r2201-20261012    gcc-13.4.0 smatch
m68k                 randconfig-r2201-20261013    gcc-16.1.0 smatch
m68k                 randconfig-r2302-20261012    clang-24   sparse
m68k                 randconfig-r2305-20261012    clang-24   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2108-20261012    clang-24   cocci
microblaze           randconfig-r2108-20261012    gcc-13.4.0 cocci
microblaze           randconfig-r2109-20261012    gcc-15.2.0 cocci
microblaze           randconfig-r2200-20261012    gcc-15.2.0 smatch
microblaze           randconfig-r2300-20261012    clang-24   sparse
microblaze           randconfig-r2301-20261013    gcc-16.1.0 sparse
microblaze           randconfig-r2302-20261012    gcc-11.5.0 sparse
microblaze           randconfig-r2307-20261013    clang-24   sparse
microblaze           randconfig-r2308-20261012    gcc-12.5.0 sparse
microblaze           randconfig-r2309-20261012    gcc-16.1.0 sparse
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    clang-17
mips                            ip28_defconfig    gcc-16.1.0
mips                       loongson1_defconfig    clang-24
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261012    clang-24   cocci
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2105-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2106-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2110-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2111-20261013    clang-24   cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2202-20261013    clang-24   smatch
mips                 randconfig-r2300-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2301-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261012    clang-24   sparse
mips                 randconfig-r2304-20261014    gcc-13.4.0 sparse
mips                 randconfig-r2307-20261014    gcc-14     sparse
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
mips                 randconfig-r2310-20261013    gcc-10.5.0 sparse
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261014    clang-18
nios2                 randconfig-1000-20261015    clang-24
nios2                 randconfig-1001-20261014    clang-18
nios2                 randconfig-1001-20261015    clang-24
nios2                 randconfig-2000-20261012    gcc-11.5.0
nios2                 randconfig-2000-20261013    gcc-11.5.0
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261012    gcc-11.5.0
nios2                 randconfig-2001-20261013    gcc-11.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2103-20261012    clang-24   cocci
nios2                randconfig-r2105-20261012    gcc-11.5.0 cocci
nios2                randconfig-r2106-20261013    gcc-14.3.0 cocci
nios2                randconfig-r2107-20261012    gcc-10.5.0 cocci
nios2                randconfig-r2108-20261012    clang-24   cocci
nios2                randconfig-r2111-20261013    gcc-8.5.0  cocci
nios2                randconfig-r2201-20261013    gcc-8.5.0  smatch
nios2                randconfig-r2202-20261013    gcc-11.5.0 smatch
nios2                randconfig-r2300-20261012    clang-24   sparse
nios2                randconfig-r2302-20261013    clang-22   sparse
nios2                randconfig-r2302-20261014    gcc-13.4.0 sparse
nios2                randconfig-r2305-20261013    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261013    gcc-13.4.0 sparse
nios2                randconfig-r2311-20261012    gcc-16.1.0 sparse
nios2                randconfig-r2311-20261013    clang-19   sparse
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261013    clang-24   cocci
openrisc             randconfig-r2104-20261012    gcc-14     cocci
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
openrisc             randconfig-r2201-20261013    gcc-15.2.0 smatch
openrisc             randconfig-r2310-20261012    gcc-16.1.0 sparse
openrisc             randconfig-r2310-20261013    gcc-13.4.0 sparse
openrisc                        virt_defconfig    clang-24
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261014    clang-22
parisc                randconfig-1000-20261015    gcc-8.5.0
parisc                randconfig-1001-20261014    clang-22
parisc                randconfig-1001-20261015    gcc-8.5.0
parisc                randconfig-2000-20261012    gcc-11.5.0
parisc                randconfig-2000-20261013    gcc-11.5.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261012    gcc-11.5.0
parisc                randconfig-2001-20261013    gcc-11.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2105-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2106-20261013    gcc-8.5.0  cocci
parisc               randconfig-r2108-20261013    clang-24   cocci
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2110-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2111-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2201-20261012    gcc-16.1.0 smatch
parisc               randconfig-r2202-20261012    gcc-10.5.0 smatch
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc               randconfig-r2305-20261013    gcc-16.1.0 sparse
parisc               randconfig-r2311-20261013    gcc-10.5.0 sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                    currituck_defconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    clang-17
powerpc                  linkstation_defconfig    clang-17
powerpc                      mpc512x_defconfig    clang-17
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                       pasemi_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261014    clang-22
powerpc               randconfig-1000-20261015    gcc-8.5.0
powerpc               randconfig-1001-20261014    clang-22
powerpc               randconfig-1001-20261015    gcc-8.5.0
powerpc               randconfig-2000-20261012    gcc-14
powerpc               randconfig-2000-20261013    gcc-14
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261012    gcc-14
powerpc               randconfig-2001-20261013    gcc-14
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2103-20261012    clang-24   cocci
powerpc              randconfig-r2106-20261012    gcc-9.5.0  cocci
powerpc              randconfig-r2107-20261013    gcc-10.5.0 cocci
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2110-20261013    clang-22   cocci
powerpc              randconfig-r2110-20261013    gcc-8.5.0  cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2302-20261013    gcc-16.1.0 sparse
powerpc              randconfig-r2303-20261012    clang-24   sparse
powerpc              randconfig-r2305-20261012    gcc-11.5.0 sparse
powerpc              randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261012    clang-22   sparse
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261014    clang-22
powerpc64             randconfig-1000-20261015    gcc-8.5.0
powerpc64             randconfig-1001-20261014    clang-22
powerpc64             randconfig-1001-20261015    gcc-8.5.0
powerpc64             randconfig-2000-20261012    gcc-14
powerpc64             randconfig-2000-20261013    gcc-14
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261012    gcc-14
powerpc64             randconfig-2001-20261013    gcc-14
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2106-20261013    clang-24   cocci
powerpc64            randconfig-r2109-20261012    gcc-13.4.0 cocci
powerpc64            randconfig-r2109-20261013    clang-21   cocci
powerpc64            randconfig-r2109-20261013    clang-24   cocci
powerpc64            randconfig-r2300-20261012    gcc-11.5.0 sparse
powerpc64            randconfig-r2300-20261013    clang-22   sparse
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2304-20261012    gcc-11.5.0 sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
powerpc64            randconfig-r2307-20261013    clang-24   sparse
powerpc64            randconfig-r2309-20261013    clang-24   sparse
powerpc64            randconfig-r2310-20261013    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261014    clang-18
riscv                 randconfig-1000-20261015    gcc-11.5.0
riscv                 randconfig-1001-20261014    clang-18
riscv                 randconfig-1001-20261015    gcc-11.5.0
riscv                 randconfig-2000-20261012    gcc-14.3.0
riscv                 randconfig-2000-20261013    gcc-15.2.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261012    gcc-14.3.0
riscv                 randconfig-2001-20261013    gcc-15.2.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                randconfig-r2102-20261012    clang-24   cocci
riscv                randconfig-r2102-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2111-20261013    gcc-8.5.0  cocci
riscv                randconfig-r2202-20261012    clang-24   smatch
riscv                randconfig-r2307-20261013    gcc-13.4.0 sparse
riscv                randconfig-r2308-20261013    gcc-10.5.0 sparse
riscv                randconfig-r2310-20261013    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261014    clang-18
s390                  randconfig-1000-20261015    gcc-11.5.0
s390                  randconfig-1001-20261014    clang-18
s390                  randconfig-1001-20261015    gcc-11.5.0
s390                  randconfig-2000-20261012    gcc-14.3.0
s390                  randconfig-2000-20261013    gcc-15.2.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261012    gcc-14.3.0
s390                  randconfig-2001-20261013    gcc-15.2.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2100-20261012    gcc-13.4.0 cocci
s390                 randconfig-r2100-20261013    clang-21   cocci
s390                 randconfig-r2104-20261012    gcc-11.5.0 cocci
s390                 randconfig-r2105-20261012    gcc-14     cocci
s390                 randconfig-r2105-20261013    gcc-14.3.0 cocci
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261013    gcc-12.5.0 cocci
s390                 randconfig-r2109-20261013    clang-24   cocci
s390                 randconfig-r2111-20261012    gcc-14     cocci
s390                 randconfig-r2200-20261013    clang-24   smatch
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2202-20261012    gcc-14.3.0 smatch
s390                 randconfig-r2302-20261013    gcc-12.5.0 sparse
s390                 randconfig-r2304-20261012    clang-24   sparse
s390                 randconfig-r2304-20261013    gcc-8.5.0  sparse
s390                 randconfig-r2306-20261012    clang-22   sparse
s390                 randconfig-r2307-20261013    gcc-10.5.0 sparse
s390                 randconfig-r2309-20261012    gcc-12.5.0 sparse
s390                 randconfig-r2310-20261012    clang-22   sparse
s390                 randconfig-r2311-20261013    clang-24   sparse
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    gcc-16.1.0
sh                         apsh4ad0a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.1.0
sh                              espt_defconfig    clang-17
sh                    randconfig-1000-20261014    clang-18
sh                    randconfig-1000-20261015    gcc-11.5.0
sh                    randconfig-1001-20261014    clang-18
sh                    randconfig-1001-20261015    gcc-11.5.0
sh                    randconfig-2000-20261012    gcc-14.3.0
sh                    randconfig-2000-20261013    gcc-15.2.0
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261012    gcc-14.3.0
sh                    randconfig-2001-20261013    gcc-15.2.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                   randconfig-r2101-20261013    clang-24   cocci
sh                   randconfig-r2104-20261013    gcc-8.5.0  cocci
sh                   randconfig-r2105-20261013    gcc-8.5.0  cocci
sh                   randconfig-r2109-20261012    clang-24   cocci
sh                   randconfig-r2300-20261012    clang-24   sparse
sh                   randconfig-r2301-20261012    clang-24   sparse
sh                   randconfig-r2306-20261013    gcc-9.5.0  sparse
sh                   randconfig-r2309-20261013    gcc-9.5.0  sparse
sh                   randconfig-r2311-20261014    gcc-14     sparse
sh                           rsk7203_defconfig    clang-17
sh                            se7619_defconfig    gcc-16.1.0
sh                            se7722_defconfig    clang-24
sh                         sh7763rdp_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261014    clang-24
sparc                 randconfig-1000-20261015    gcc-8.5.0
sparc                 randconfig-1001-20261014    clang-24
sparc                 randconfig-1001-20261015    gcc-8.5.0
sparc                 randconfig-2000-20261012    gcc-8.5.0
sparc                 randconfig-2000-20261013    gcc-16.1.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261012    gcc-8.5.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2100-20261012    gcc-15.2.0 cocci
sparc                randconfig-r2103-20261013    clang-24   cocci
sparc                randconfig-r2107-20261013    gcc-8.5.0  cocci
sparc                randconfig-r2108-20261013    clang-24   cocci
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2301-20261014    gcc-13.4.0 sparse
sparc                randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc                randconfig-r2304-20261013    clang-22   sparse
sparc                randconfig-r2304-20261014    clang-24   sparse
sparc                randconfig-r2306-20261012    gcc-16.1.0 sparse
sparc                randconfig-r2306-20261013    clang-19   sparse
sparc                randconfig-r2306-20261013    gcc-13.4.0 sparse
sparc                randconfig-r2309-20261014    gcc-14     sparse
sparc                        sparc32_defconfig    gcc-16.1.0
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261014    clang-24
sparc64               randconfig-1000-20261015    gcc-8.5.0
sparc64               randconfig-1001-20261014    clang-24
sparc64               randconfig-1001-20261015    gcc-8.5.0
sparc64               randconfig-2000-20261012    gcc-8.5.0
sparc64               randconfig-2000-20261013    gcc-16.1.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261012    gcc-8.5.0
sparc64               randconfig-2001-20261013    gcc-16.1.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64              randconfig-r2100-20261013    clang-24   cocci
sparc64              randconfig-r2105-20261013    clang-24   cocci
sparc64              randconfig-r2200-20261012    clang-20   smatch
sparc64              randconfig-r2200-20261013    clang-24   smatch
sparc64              randconfig-r2301-20261012    clang-24   sparse
sparc64              randconfig-r2303-20261012    gcc-11.5.0 sparse
sparc64              randconfig-r2303-20261013    clang-22   sparse
sparc64              randconfig-r2304-20261013    gcc-12.5.0 sparse
sparc64              randconfig-r2305-20261014    gcc-13.4.0 sparse
sparc64              randconfig-r2310-20261014    gcc-14     sparse
sparc64              randconfig-r2311-20261013    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261014    clang-24
um                    randconfig-1000-20261015    gcc-8.5.0
um                    randconfig-1001-20261014    clang-24
um                    randconfig-1001-20261015    gcc-8.5.0
um                    randconfig-2000-20261012    gcc-8.5.0
um                    randconfig-2000-20261013    gcc-16.1.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261012    gcc-8.5.0
um                    randconfig-2001-20261013    gcc-16.1.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2101-20261013    clang-21   cocci
um                   randconfig-r2102-20261013    clang-24   cocci
um                   randconfig-r2102-20261013    gcc-12.5.0 cocci
um                   randconfig-r2103-20261012    gcc-13.4.0 cocci
um                   randconfig-r2104-20261013    clang-24   cocci
um                   randconfig-r2106-20261012    gcc-11.5.0 cocci
um                   randconfig-r2108-20261013    clang-21   cocci
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2200-20261013    clang-17   smatch
um                   randconfig-r2202-20261012    clang-17   smatch
um                   randconfig-r2302-20261014    clang-24   sparse
um                   randconfig-r2303-20261013    gcc-12.5.0 sparse
um                   randconfig-r2307-20261012    clang-22   sparse
um                   randconfig-r2308-20261013    clang-19   sparse
um                   randconfig-r2308-20261014    gcc-14     sparse
um                   randconfig-r2310-20261013    clang-19   sparse
um                   randconfig-r2310-20261013    gcc-9.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261014    clang-22
x86_64      buildonly-randconfig-1000-20261015    gcc-14
x86_64      buildonly-randconfig-1001-20261014    clang-22
x86_64      buildonly-randconfig-1001-20261015    gcc-14
x86_64      buildonly-randconfig-1002-20261014    clang-22
x86_64      buildonly-randconfig-1002-20261015    gcc-14
x86_64      buildonly-randconfig-1003-20261014    clang-22
x86_64      buildonly-randconfig-1003-20261015    gcc-14
x86_64      buildonly-randconfig-1004-20261014    clang-22
x86_64      buildonly-randconfig-1004-20261015    gcc-14
x86_64      buildonly-randconfig-1005-20261014    clang-22
x86_64      buildonly-randconfig-1005-20261015    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261014    gcc-14
x86_64                randconfig-1000-20261015    gcc-14
x86_64                randconfig-1001-20261014    gcc-14
x86_64                randconfig-1001-20261015    gcc-14
x86_64                randconfig-1002-20261014    gcc-14
x86_64                randconfig-1002-20261015    gcc-14
x86_64                randconfig-1003-20261014    gcc-14
x86_64                randconfig-1003-20261015    gcc-14
x86_64                randconfig-1004-20261014    gcc-14
x86_64                randconfig-1004-20261015    gcc-14
x86_64                randconfig-1005-20261014    gcc-14
x86_64                randconfig-1005-20261015    gcc-14
x86_64                randconfig-1006-20261014    gcc-14
x86_64                randconfig-1006-20261015    gcc-14
x86_64                randconfig-1007-20261014    gcc-14
x86_64                randconfig-1007-20261015    gcc-14
x86_64                randconfig-1008-20261014    gcc-14
x86_64                randconfig-1008-20261015    gcc-14
x86_64                randconfig-1009-20261014    gcc-14
x86_64                randconfig-1009-20261015    gcc-14
x86_64                randconfig-1010-20261014    gcc-14
x86_64                randconfig-1010-20261015    gcc-14
x86_64                randconfig-1011-20261014    gcc-14
x86_64                randconfig-1011-20261015    gcc-14
x86_64                randconfig-1012-20261014    gcc-14
x86_64                randconfig-1012-20261015    gcc-13
x86_64                randconfig-1013-20261014    gcc-14
x86_64                randconfig-1013-20261015    gcc-13
x86_64                randconfig-1014-20261014    gcc-14
x86_64                randconfig-1014-20261015    gcc-13
x86_64                randconfig-1015-20261014    gcc-14
x86_64                randconfig-1015-20261015    gcc-13
x86_64                randconfig-1016-20261014    gcc-14
x86_64                randconfig-1016-20261015    gcc-13
x86_64                randconfig-1017-20261014    gcc-14
x86_64                randconfig-1017-20261015    gcc-13
x86_64                randconfig-2000-20261012    gcc-14
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261012    gcc-14
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261012    clang-22   cocci
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261012    clang-22   cocci
x86_64                randconfig-2101-20261013    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261012    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261012    clang-22   cocci
x86_64                randconfig-2103-20261013    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261012    clang-22   cocci
x86_64                randconfig-2104-20261013    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261012    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261012    gcc-14     smatch
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261012    gcc-14     sparse
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261012    gcc-14     sparse
x86_64                randconfig-2301-20261013    gcc-14     sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261012    gcc-14     sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2102-20261013    clang-21   cocci
x86_64               randconfig-r2104-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2105-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2107-20261012    gcc-14     cocci
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2202-20261013    gcc-14     smatch
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64               randconfig-r2301-20261013    clang-22   sparse
x86_64               randconfig-r2302-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2303-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2304-20261012    clang-24   sparse
x86_64               randconfig-r2304-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2306-20261013    clang-24   sparse
x86_64               randconfig-r2306-20261014    gcc-14     sparse
x86_64               randconfig-r2308-20261012    clang-22   sparse
x86_64               randconfig-r2308-20261013    clang-24   sparse
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
xtensa                randconfig-1000-20261014    clang-24
xtensa                randconfig-1000-20261015    gcc-8.5.0
xtensa                randconfig-1001-20261014    clang-24
xtensa                randconfig-1001-20261015    gcc-8.5.0
xtensa                randconfig-2000-20261012    gcc-8.5.0
xtensa                randconfig-2000-20261013    gcc-16.1.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261012    gcc-8.5.0
xtensa                randconfig-2001-20261013    gcc-16.1.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci
xtensa               randconfig-r2101-20261012    gcc-13.4.0 cocci
xtensa               randconfig-r2102-20261012    gcc-13.4.0 cocci
xtensa               randconfig-r2104-20261012    gcc-9.5.0  cocci
xtensa               randconfig-r2104-20261013    gcc-14.3.0 cocci
xtensa               randconfig-r2105-20261013    clang-22   cocci
xtensa               randconfig-r2107-20261013    gcc-14.3.0 cocci
xtensa               randconfig-r2301-20261012    clang-24   sparse
xtensa               randconfig-r2303-20261012    clang-24   sparse
xtensa               randconfig-r2303-20261014    clang-24   sparse
xtensa               randconfig-r2307-20261013    gcc-9.5.0  sparse
xtensa               randconfig-r2309-20261013    gcc-10.5.0 sparse
xtensa               randconfig-r2309-20261013    gcc-13.4.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
