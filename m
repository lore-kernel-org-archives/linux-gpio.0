Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347130;
	b=xcstzpF4nSW+jey4c4FDGwn6pqrf9JD9Zv6B3I8rEsRMdwKy0hJjRcyoD6i1tdeQSMH9
	 YLaJZ874x0RpliIk699O64hz1maN2M5z8BIoyAwbN5CJvMG0hi2cQQdNvsT2xHtbuayR/
	 E90VM8CY9u4F/nGf5I64GBH1tobWzh4P3iK7GbSDubuKaeakkkW3JyAYPcT09k/npEVuq
	 VbmZDd9x/BRXLrPwTGm5o7lHzY25q7AMRE+87YwOJ/wWRlQwpjWyf1RKAyp7TnQjkTVcj
	 Cphvt9Z+LX6Nf8Oxc4sbE6P2ZmKNxSykEv/99LYVq3xCuvnbPQp9xpe+gsd6+YRJIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347130;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qXHtkUs1nC/GXTQ370IYgkH/ufTKQ4pS9juXsTkCsU0=;
	b=V1n4xNi4wlikGAC5KAlI+Buq84ePNvlrTzV3C3lWpiSy97ui2MScD9dKmLoU2WixX2cy
	 Puilxt+qCLOt95FOlU1a0hTj4uRtnUjVP9K9c0PzwEPF4VK8OGMMYdgRcbqxdBAL2DtXG
	 K5ULXV8Hu5Zh2z0B0GZMEbdYt2JbrjwmGax6a0cLt+4lFjA9aj77txa47nx+ZBEKYMr7q
	 e0VQMrqLrbjO3KCLm8FTGSau86fRFJZpsTct5w7UBc257T1G9D875hvkyiAEK72upR1QX
	 tZITPe4iGY5ZxgpXB/ZoWIf+1sPFnmPfPtYXOt5yXcPc8LcxT6cV/LFXPp7JbHUOx2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBkfFi4e;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455D606A320
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 11:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2455D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBkfFi4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795347130; x=1826883130;
  h=date:from:to:cc:subject:message-id;
  bh=BLcMARoo6QLCRzh3MpHj7lShTcX3wHgexOrm0bisfEQ=;
  b=oBkfFi4eYQANpZ3Azowo2Qw7Fdz95kH1YoiLujEQDyBHpT8qDkTfc4tp
   EXm+7gvLdaE2P9YUtex1TNfwsFox9juel1evIAdMGUN1tteyweUo/EH3Z
   xXTvcBRJfEwNtTwza6yPIuOcvBvIONbN0sZ7O/WIyDJrQBCe4CyUUsBZY
   5Q9sroL/ywaej7MMsaEVrG0K0/fah2duPUKLqqJbYeBTde1rPj6Jrlwpj
   76f5milllMmeYBHdzKNDofuZ5qPb+JDu9z/sf87O9ovbBSwqOjNqgf2IV
   n9IAaRu4uuun7ztrA5m1k2Sa4Vi20nHjTlS7d2CqjotWH6Meoa94XwjuY
   Q==;
X-CSE-ConnectionGUID: koGyBaa1SY6dbmKZRUTjRQ==
X-CSE-MsgGUID: mXBJjlzxRwW0U46/d1Wg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4047647"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4047647"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:32:08 -0800
X-CSE-ConnectionGUID: L0DqzL0BRm238dTX7LHl+Q==
X-CSE-MsgGUID: +okQR7rQTVKqHRrRcTLYlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12888642"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 22 Nov 2026 03:30:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV5m1-00000001LPU-0ZpY;
	Sun, 22 Nov 2026 11:30:21 +0000
Date: Sun, 22 Nov 2026 19:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-current] BUILD SUCCESS
 21d7ff7d6531b3420727539f04470ddae499592b
Message-ID: <20261122192942.aKXlTJsU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: 21d7ff7d6531b3420727539f04470ddae499592b  pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied

elapsed time: 874m

configs tested: 749
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261120    gcc-15.3.0
alpha                 randconfig-2000-20261121    gcc-14.4.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261120    gcc-15.3.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261120    gcc-15.3.0 smatch
alpha                 randconfig-2200-20261121    gcc-10.5.0 smatch
alpha                randconfig-r2101-20261120    clang-22   cocci
alpha                randconfig-r2103-20261121    gcc-9.5.0  cocci
alpha                randconfig-r2106-20261121    gcc-11.5.0 cocci
alpha                randconfig-r2109-20261120    gcc-11.5.0 cocci
alpha                randconfig-r2301-20261120    clang-24   sparse
alpha                randconfig-r2301-20261121    clang-17   sparse
alpha                randconfig-r2304-20261122    clang-24   sparse
alpha                randconfig-r2305-20261120    gcc-8.5.0  sparse
alpha                randconfig-r2305-20261121    clang-17   sparse
alpha                randconfig-r2308-20261122    gcc-13.5.0 sparse
alpha                randconfig-r2309-20261121    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261122    clang-17
arc                   randconfig-1001-20261122    clang-17
arc                   randconfig-2000-20261120    gcc-11.5.0
arc                   randconfig-2000-20261121    gcc-8.5.0
arc                   randconfig-2001-20261120    gcc-11.5.0
arc                   randconfig-2001-20261121    gcc-8.5.0
arc                   randconfig-2002-20261120    gcc-11.5.0
arc                   randconfig-2002-20261121    gcc-8.5.0
arc                   randconfig-2003-20261120    gcc-11.5.0
arc                   randconfig-2003-20261121    gcc-8.5.0
arc                   randconfig-2004-20261120    gcc-11.5.0
arc                   randconfig-2004-20261121    gcc-8.5.0
arc                   randconfig-2005-20261120    gcc-11.5.0
arc                   randconfig-2005-20261121    gcc-8.5.0
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                   randconfig-2200-20261121    gcc-14.4.0 smatch
arc                  randconfig-r2100-20261120    gcc-13.5.0 cocci
arc                  randconfig-r2101-20261120    clang-24   cocci
arc                  randconfig-r2104-20261120    clang-24   cocci
arc                  randconfig-r2105-20261120    clang-22   cocci
arc                  randconfig-r2106-20261120    gcc-11.5.0 cocci
arc                  randconfig-r2109-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2110-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2111-20261121    gcc-14.4.0 cocci
arc                  randconfig-r2300-20261121    clang-24   sparse
arc                  randconfig-r2303-20261121    clang-24   sparse
arc                  randconfig-r2304-20261120    clang-24   sparse
arc                  randconfig-r2307-20261120    gcc-12.5.0 sparse
arc                  randconfig-r2309-20261120    clang-24   sparse
arc                  randconfig-r2309-20261120    gcc-14     sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-17
arm                        multi_v4t_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261122    clang-17
arm                   randconfig-1001-20261122    clang-17
arm                   randconfig-1002-20261122    clang-17
arm                   randconfig-1003-20261122    clang-17
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2000-20261121    clang-24
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2001-20261121    clang-24
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2002-20261121    clang-24
arm                   randconfig-2200-20261120    clang-17   smatch
arm                   randconfig-2200-20261121    clang-19   smatch
arm                  randconfig-r2102-20261120    clang-22   cocci
arm                  randconfig-r2105-20261120    clang-17   cocci
arm                  randconfig-r2105-20261120    gcc-14     cocci
arm                  randconfig-r2106-20261120    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261120    gcc-8.5.0  cocci
arm                  randconfig-r2108-20261120    clang-18   cocci
arm                  randconfig-r2109-20261120    clang-18   cocci
arm                  randconfig-r2111-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2304-20261121    gcc-8.5.0  sparse
arm                  randconfig-r2309-20261120    gcc-8.5.0  sparse
arm                  randconfig-r2310-20261121    gcc-15.3.0 sparse
arm                         shmobile_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261122    gcc-8.5.0
arm64                 randconfig-1001-20261122    gcc-8.5.0
arm64                 randconfig-1002-20261122    gcc-8.5.0
arm64                 randconfig-1003-20261122    gcc-8.5.0
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2000-20261121    clang-24
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261121    clang-24
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261121    clang-24
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                 randconfig-2200-20261121    clang-22   smatch
arm64                randconfig-r2101-20261120    gcc-14     cocci
arm64                randconfig-r2101-20261121    gcc-9.5.0  cocci
arm64                randconfig-r2102-20261120    clang-24   cocci
arm64                randconfig-r2111-20261120    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261120    clang-24   sparse
arm64                randconfig-r2301-20261120    gcc-8.5.0  sparse
arm64                randconfig-r2302-20261120    clang-24   sparse
arm64                randconfig-r2304-20261120    clang-24   sparse
arm64                randconfig-r2304-20261121    clang-17   sparse
arm64                randconfig-r2305-20261120    gcc-9.5.0  sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261122    gcc-8.5.0
csky                  randconfig-1001-20261122    gcc-8.5.0
csky                  randconfig-2000-20261120    gcc-16.2.0
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2001-20261120    gcc-16.2.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                  randconfig-2200-20261121    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261121    gcc-10.5.0 cocci
csky                 randconfig-r2100-20261121    gcc-14     cocci
csky                 randconfig-r2101-20261122    gcc-14     cocci
csky                 randconfig-r2103-20261120    gcc-13.5.0 cocci
csky                 randconfig-r2105-20261120    gcc-16.2.0 cocci
csky                 randconfig-r2105-20261122    gcc-14     cocci
csky                 randconfig-r2108-20261121    gcc-13.5.0 cocci
csky                 randconfig-r2109-20261121    gcc-11.5.0 cocci
csky                 randconfig-r2111-20261121    clang-24   cocci
csky                 randconfig-r2300-20261120    clang-24   sparse
csky                 randconfig-r2304-20261120    gcc-16.2.0 sparse
csky                 randconfig-r2306-20261120    gcc-14.4.0 sparse
csky                 randconfig-r2307-20261121    gcc-11.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-12.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-13.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-14.4.0 sparse
csky                 randconfig-r2309-20261121    gcc-10.5.0 sparse
csky                 randconfig-r2309-20261122    gcc-13.5.0 sparse
csky                 randconfig-r2310-20261120    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261122    gcc-8.5.0
hexagon               randconfig-1001-20261122    gcc-8.5.0
hexagon               randconfig-2000-20261120    gcc-16.2.0
hexagon               randconfig-2000-20261121    gcc-16.2.0
hexagon               randconfig-2001-20261120    gcc-16.2.0
hexagon               randconfig-2001-20261121    gcc-16.2.0
hexagon               randconfig-2200-20261120    clang-17   smatch
hexagon               randconfig-2200-20261121    clang-24   smatch
hexagon              randconfig-r2102-20261122    gcc-14     cocci
hexagon              randconfig-r2105-20261120    clang-24   cocci
hexagon              randconfig-r2106-20261120    clang-17   cocci
hexagon              randconfig-r2108-20261120    gcc-16.2.0 cocci
hexagon              randconfig-r2108-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2108-20261121    gcc-14.4.0 cocci
hexagon              randconfig-r2109-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2109-20261121    gcc-13.5.0 cocci
hexagon              randconfig-r2110-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2302-20261121    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261122    gcc-14
i386        buildonly-randconfig-1001-20261122    gcc-14
i386        buildonly-randconfig-1002-20261122    gcc-14
i386        buildonly-randconfig-1003-20261122    gcc-14
i386        buildonly-randconfig-1004-20261122    gcc-14
i386        buildonly-randconfig-1005-20261122    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261122    gcc-14
i386                  randconfig-1001-20261122    gcc-14
i386                  randconfig-1002-20261122    gcc-14
i386                  randconfig-1003-20261122    gcc-14
i386                  randconfig-1004-20261122    gcc-14
i386                  randconfig-1005-20261122    gcc-14
i386                  randconfig-1006-20261122    gcc-14
i386                  randconfig-1007-20261122    gcc-14
i386                  randconfig-1008-20261122    gcc-14
i386                  randconfig-1009-20261122    gcc-14
i386                  randconfig-1010-20261122    gcc-14
i386                  randconfig-1011-20261122    gcc-14
i386                  randconfig-1012-20261122    gcc-14
i386                  randconfig-1013-20261122    gcc-14
i386                  randconfig-2000-20261120    clang-22
i386                  randconfig-2000-20261120    gcc-14
i386                  randconfig-2000-20261121    gcc-14
i386                  randconfig-2001-20261120    clang-22
i386                  randconfig-2001-20261120    gcc-14
i386                  randconfig-2001-20261121    gcc-14
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2002-20261121    gcc-14
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2003-20261121    gcc-14
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2004-20261121    gcc-14
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2005-20261121    gcc-14
i386                  randconfig-2100-20261120    clang-22   cocci
i386                  randconfig-2100-20261120    gcc-14     cocci
i386                  randconfig-2100-20261121    clang-22   cocci
i386                  randconfig-2101-20261120    gcc-14     cocci
i386                  randconfig-2101-20261121    clang-22   cocci
i386                  randconfig-2102-20261120    gcc-14     cocci
i386                  randconfig-2102-20261121    clang-22   cocci
i386                  randconfig-2103-20261120    clang-22   cocci
i386                  randconfig-2103-20261120    gcc-14     cocci
i386                  randconfig-2103-20261121    clang-22   cocci
i386                  randconfig-2104-20261120    gcc-14     cocci
i386                  randconfig-2104-20261121    clang-22   cocci
i386                  randconfig-2105-20261120    gcc-12     cocci
i386                  randconfig-2105-20261120    gcc-14     cocci
i386                  randconfig-2105-20261121    clang-22   cocci
i386                  randconfig-2200-20261120    clang-22   smatch
i386                  randconfig-2200-20261121    clang-22   smatch
i386                  randconfig-2300-20261120    clang-22   sparse
i386                  randconfig-2300-20261120    gcc-14     sparse
i386                  randconfig-2300-20261121    gcc-14     sparse
i386                  randconfig-2301-20261120    clang-22   sparse
i386                  randconfig-2301-20261120    gcc-14     sparse
i386                  randconfig-2301-20261121    gcc-14     sparse
i386                  randconfig-2302-20261120    clang-22   sparse
i386                  randconfig-2302-20261121    gcc-14     sparse
i386                 randconfig-r2100-20261120    gcc-14     cocci
i386                 randconfig-r2103-20261121    gcc-10.5.0 cocci
i386                 randconfig-r2104-20261120    clang-22   cocci
i386                 randconfig-r2104-20261122    gcc-14     cocci
i386                 randconfig-r2110-20261120    clang-17   cocci
i386                 randconfig-r2110-20261121    gcc-13.5.0 cocci
i386                 randconfig-r2111-20261120    clang-17   cocci
i386                 randconfig-r2302-20261120    clang-24   sparse
i386                 randconfig-r2302-20261120    gcc-8.5.0  sparse
i386                 randconfig-r2303-20261120    clang-22   sparse
i386                 randconfig-r2306-20261122    gcc-13.5.0 sparse
i386                 randconfig-r2308-20261120    gcc-14     sparse
i386                 randconfig-r2308-20261121    gcc-10.5.0 sparse
i386                 randconfig-r2311-20261122    gcc-13.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261122    gcc-8.5.0
loongarch             randconfig-1001-20261122    gcc-8.5.0
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2000-20261121    clang-22
loongarch             randconfig-2001-20261120    clang-24
loongarch             randconfig-2001-20261121    clang-22
loongarch             randconfig-2200-20261120    clang-18   smatch
loongarch             randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch            randconfig-r2101-20261120    clang-24   cocci
loongarch            randconfig-r2101-20261120    gcc-13.5.0 cocci
loongarch            randconfig-r2103-20261120    clang-24   cocci
loongarch            randconfig-r2104-20261120    clang-24   cocci
loongarch            randconfig-r2106-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2109-20261120    clang-17   cocci
loongarch            randconfig-r2110-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261121    gcc-11.5.0 cocci
loongarch            randconfig-r2302-20261120    clang-24   sparse
loongarch            randconfig-r2305-20261120    clang-20   sparse
loongarch            randconfig-r2307-20261122    gcc-13.5.0 sparse
loongarch            randconfig-r2310-20261120    gcc-8.5.0  sparse
loongarch            randconfig-r2311-20261120    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261120    gcc-15.3.0
m68k                  randconfig-2000-20261121    gcc-14.4.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261120    gcc-15.3.0
m68k                  randconfig-2001-20261121    gcc-14.4.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
m68k                  randconfig-2200-20261121    gcc-8.5.0  smatch
m68k                 randconfig-r2101-20261120    clang-24   cocci
m68k                 randconfig-r2102-20261120    gcc-13.5.0 cocci
m68k                 randconfig-r2103-20261120    clang-22   cocci
m68k                 randconfig-r2104-20261120    clang-24   cocci
m68k                 randconfig-r2105-20261120    clang-24   cocci
m68k                 randconfig-r2110-20261120    gcc-16.2.0 cocci
m68k                 randconfig-r2300-20261120    clang-22   sparse
m68k                 randconfig-r2301-20261120    gcc-9.5.0  sparse
m68k                 randconfig-r2308-20261120    gcc-12.5.0 sparse
m68k                 randconfig-r2310-20261121    gcc-11.5.0 sparse
m68k                 randconfig-r2310-20261122    gcc-13.5.0 sparse
m68k                 randconfig-r2311-20261121    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261120    gcc-15.3.0
microblaze            randconfig-2000-20261121    gcc-14.4.0
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261120    gcc-15.3.0
microblaze            randconfig-2001-20261121    gcc-14.4.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze            randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze           randconfig-r2102-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2103-20261120    gcc-14     cocci
microblaze           randconfig-r2105-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2106-20261120    gcc-16.2.0 cocci
microblaze           randconfig-r2109-20261120    gcc-8.5.0  cocci
microblaze           randconfig-r2109-20261121    clang-24   cocci
microblaze           randconfig-r2300-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2301-20261120    clang-24   sparse
microblaze           randconfig-r2301-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20261121    gcc-10.5.0 sparse
microblaze           randconfig-r2307-20261120    gcc-14     sparse
microblaze           randconfig-r2308-20261121    gcc-15.3.0 sparse
microblaze           randconfig-r2311-20261121    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                            mtx1_defconfig    clang-17
mips                  randconfig-2000-20261120    gcc-9.5.0
mips                  randconfig-2000-20261121    gcc-16.2.0
mips                  randconfig-2001-20261120    gcc-9.5.0
mips                  randconfig-2001-20261121    gcc-16.2.0
mips                  randconfig-2002-20261120    gcc-9.5.0
mips                  randconfig-2002-20261121    gcc-16.2.0
mips                  randconfig-2200-20261120    clang-24   smatch
mips                  randconfig-2200-20261121    clang-21   smatch
mips                 randconfig-r2100-20261120    clang-22   cocci
mips                 randconfig-r2101-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2103-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2104-20261120    gcc-14     cocci
mips                 randconfig-r2105-20261120    clang-22   cocci
mips                 randconfig-r2107-20261120    clang-18   cocci
mips                 randconfig-r2107-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2108-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2110-20261121    gcc-14.4.0 cocci
mips                 randconfig-r2300-20261120    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261120    clang-24   sparse
mips                 randconfig-r2302-20261121    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261121    clang-24   sparse
mips                 randconfig-r2308-20261120    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261120    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261122    gcc-8.5.0
nios2                 randconfig-1001-20261122    gcc-8.5.0
nios2                 randconfig-2000-20261120    clang-24
nios2                 randconfig-2000-20261121    clang-22
nios2                 randconfig-2001-20261120    clang-24
nios2                 randconfig-2001-20261121    clang-22
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261121    gcc-10.5.0 smatch
nios2                randconfig-r2103-20261120    clang-24   cocci
nios2                randconfig-r2104-20261121    gcc-10.5.0 cocci
nios2                randconfig-r2105-20261121    gcc-9.5.0  cocci
nios2                randconfig-r2107-20261121    gcc-11.5.0 cocci
nios2                randconfig-r2111-20261121    gcc-13.5.0 cocci
nios2                randconfig-r2304-20261120    gcc-9.5.0  sparse
nios2                randconfig-r2305-20261121    gcc-8.5.0  sparse
nios2                randconfig-r2306-20261120    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2000-20261121    gcc-16.2.0
openrisc              randconfig-2001-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261121    gcc-16.2.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2002-20261121    gcc-16.2.0
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc              randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261120    clang-22   cocci
openrisc             randconfig-r2102-20261120    gcc-14     cocci
openrisc             randconfig-r2102-20261121    gcc-14     cocci
openrisc             randconfig-r2103-20261121    gcc-14     cocci
openrisc             randconfig-r2110-20261121    clang-24   cocci
openrisc             randconfig-r2300-20261121    gcc-8.5.0  sparse
openrisc             randconfig-r2302-20261122    clang-24   sparse
openrisc             randconfig-r2303-20261121    gcc-8.5.0  sparse
openrisc             randconfig-r2304-20261120    clang-22   sparse
openrisc             randconfig-r2304-20261120    clang-24   sparse
openrisc             randconfig-r2305-20261120    clang-24   sparse
openrisc             randconfig-r2305-20261120    gcc-8.5.0  sparse
openrisc             randconfig-r2308-20261120    gcc-13.5.0 sparse
openrisc             randconfig-r2311-20261120    gcc-14.4.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261122    clang-24
parisc                randconfig-1001-20261122    clang-24
parisc                randconfig-2000-20261120    clang-24
parisc                randconfig-2000-20261121    clang-22
parisc                randconfig-2001-20261120    clang-24
parisc                randconfig-2001-20261121    clang-22
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc                randconfig-2200-20261121    gcc-16.2.0 smatch
parisc               randconfig-r2101-20261121    gcc-10.5.0 cocci
parisc               randconfig-r2108-20261121    gcc-11.5.0 cocci
parisc               randconfig-r2109-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2300-20261120    clang-24   sparse
parisc               randconfig-r2303-20261121    clang-17   sparse
parisc               randconfig-r2306-20261121    gcc-11.5.0 sparse
parisc               randconfig-r2306-20261121    gcc-15.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc               randconfig-1000-20261122    clang-24
powerpc               randconfig-1001-20261122    clang-24
powerpc               randconfig-2000-20261120    clang-17
powerpc               randconfig-2000-20261120    clang-24
powerpc               randconfig-2000-20261121    clang-24
powerpc               randconfig-2001-20261120    clang-19
powerpc               randconfig-2001-20261120    clang-24
powerpc               randconfig-2001-20261121    clang-24
powerpc               randconfig-2002-20261120    clang-24
powerpc               randconfig-2002-20261121    clang-24
powerpc               randconfig-2200-20261120    clang-17   smatch
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc              randconfig-r2100-20261120    clang-24   cocci
powerpc              randconfig-r2102-20261120    clang-24   cocci
powerpc              randconfig-r2102-20261120    gcc-16.2.0 cocci
powerpc              randconfig-r2103-20261120    clang-17   cocci
powerpc              randconfig-r2104-20261121    gcc-9.5.0  cocci
powerpc              randconfig-r2110-20261120    clang-18   cocci
powerpc              randconfig-r2300-20261120    gcc-9.5.0  sparse
powerpc              randconfig-r2301-20261120    clang-20   sparse
powerpc              randconfig-r2301-20261121    clang-24   sparse
powerpc              randconfig-r2301-20261122    clang-24   sparse
powerpc              randconfig-r2303-20261122    clang-24   sparse
powerpc              randconfig-r2304-20261120    clang-20   sparse
powerpc              randconfig-r2305-20261120    clang-22   sparse
powerpc              randconfig-r2305-20261122    clang-24   sparse
powerpc              randconfig-r2308-20261120    clang-24   sparse
powerpc              randconfig-r2310-20261120    gcc-12.5.0 sparse
powerpc              randconfig-r2310-20261120    gcc-14.4.0 sparse
powerpc                      sequoia_defconfig    clang-17
powerpc64             randconfig-1000-20261122    clang-24
powerpc64             randconfig-1001-20261122    clang-24
powerpc64             randconfig-2000-20261120    clang-24
powerpc64             randconfig-2000-20261121    clang-24
powerpc64             randconfig-2001-20261120    clang-24
powerpc64             randconfig-2001-20261121    clang-24
powerpc64             randconfig-2002-20261120    clang-18
powerpc64             randconfig-2002-20261120    clang-24
powerpc64             randconfig-2002-20261121    clang-24
powerpc64             randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64            randconfig-r2100-20261120    clang-24   cocci
powerpc64            randconfig-r2104-20261121    gcc-14     cocci
powerpc64            randconfig-r2109-20261121    gcc-14.4.0 cocci
powerpc64            randconfig-r2111-20261120    clang-18   cocci
powerpc64            randconfig-r2301-20261120    clang-24   sparse
powerpc64            randconfig-r2302-20261120    clang-20   sparse
powerpc64            randconfig-r2303-20261120    gcc-8.5.0  sparse
powerpc64            randconfig-r2307-20261121    gcc-11.5.0 sparse
powerpc64            randconfig-r2311-20261120    gcc-13.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261122    gcc-9.5.0
riscv                 randconfig-1001-20261122    gcc-9.5.0
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2000-20261121    gcc-9.5.0
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2001-20261120    gcc-10.5.0
riscv                 randconfig-2001-20261121    gcc-9.5.0
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2002-20261120    gcc-8.5.0
riscv                 randconfig-2002-20261121    gcc-9.5.0
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2003-20261121    gcc-9.5.0
riscv                 randconfig-2004-20261120    clang-20
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2004-20261121    gcc-9.5.0
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2005-20261120    gcc-10.5.0
riscv                 randconfig-2005-20261121    gcc-9.5.0
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261121    clang-24   smatch
riscv                randconfig-r2102-20261120    clang-24   cocci
riscv                randconfig-r2104-20261120    gcc-13.5.0 cocci
riscv                randconfig-r2107-20261121    clang-24   cocci
riscv                randconfig-r2107-20261121    gcc-13.5.0 cocci
riscv                randconfig-r2108-20261120    clang-17   cocci
riscv                randconfig-r2300-20261120    clang-20   sparse
riscv                randconfig-r2302-20261120    clang-22   sparse
riscv                randconfig-r2307-20261120    clang-24   sparse
riscv                randconfig-r2307-20261120    gcc-14.4.0 sparse
riscv                randconfig-r2308-20261120    clang-24   sparse
riscv                randconfig-r2310-20261120    clang-24   sparse
riscv                randconfig-r2310-20261120    gcc-14     sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261122    gcc-9.5.0
s390                  randconfig-1001-20261122    gcc-9.5.0
s390                  randconfig-2000-20261120    clang-24
s390                  randconfig-2000-20261121    clang-22
s390                  randconfig-2001-20261120    clang-24
s390                  randconfig-2001-20261121    clang-22
s390                  randconfig-2002-20261120    clang-24
s390                  randconfig-2002-20261121    clang-22
s390                  randconfig-2003-20261120    clang-24
s390                  randconfig-2003-20261121    clang-22
s390                  randconfig-2004-20261120    clang-24
s390                  randconfig-2004-20261121    clang-22
s390                  randconfig-2005-20261120    clang-24
s390                  randconfig-2005-20261121    clang-22
s390                  randconfig-2200-20261120    clang-17   smatch
s390                  randconfig-2200-20261121    gcc-8.5.0  smatch
s390                 randconfig-r2100-20261121    gcc-9.5.0  cocci
s390                 randconfig-r2106-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2106-20261121    gcc-13.5.0 cocci
s390                 randconfig-r2106-20261121    gcc-14.4.0 cocci
s390                 randconfig-r2107-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261121    clang-24   cocci
s390                 randconfig-r2110-20261121    gcc-11.5.0 cocci
s390                 randconfig-r2111-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2302-20261120    gcc-14.4.0 sparse
s390                 randconfig-r2303-20261120    clang-24   sparse
s390                 randconfig-r2305-20261121    clang-24   sparse
s390                 randconfig-r2306-20261121    gcc-11.5.0 sparse
s390                 randconfig-r2307-20261120    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261122    gcc-9.5.0
sh                    randconfig-1001-20261122    gcc-9.5.0
sh                    randconfig-2000-20261120    gcc-11.5.0
sh                    randconfig-2000-20261121    gcc-16.2.0
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261120    gcc-11.5.0
sh                    randconfig-2001-20261121    gcc-16.2.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261120    gcc-11.5.0
sh                    randconfig-2002-20261121    gcc-16.2.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2003-20261121    gcc-16.2.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261120    gcc-11.5.0
sh                    randconfig-2004-20261121    gcc-16.2.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261120    gcc-11.5.0
sh                    randconfig-2005-20261121    gcc-16.2.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                    randconfig-2200-20261121    gcc-10.5.0 smatch
sh                   randconfig-r2102-20261120    gcc-13.5.0 cocci
sh                   randconfig-r2108-20261120    gcc-11.5.0 cocci
sh                   randconfig-r2303-20261120    clang-20   sparse
sh                   randconfig-r2307-20261121    gcc-10.5.0 sparse
sh                   randconfig-r2311-20261120    gcc-12.5.0 sparse
sh                   randconfig-r2311-20261120    gcc-8.5.0  sparse
sh                   randconfig-r2311-20261121    gcc-15.3.0 sparse
sh                           rsk7203_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261122    clang-24
sparc                 randconfig-1001-20261122    clang-24
sparc                 randconfig-2000-20261120    gcc-16.2.0
sparc                 randconfig-2000-20261120    gcc-8.5.0
sparc                 randconfig-2000-20261121    gcc-8.5.0
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc                 randconfig-2001-20261121    gcc-8.5.0
sparc                 randconfig-2200-20261120    gcc-11.5.0 smatch
sparc                 randconfig-2200-20261121    gcc-8.5.0  smatch
sparc                randconfig-r2100-20261120    clang-24   cocci
sparc                randconfig-r2101-20261120    gcc-11.5.0 cocci
sparc                randconfig-r2102-20261120    clang-22   cocci
sparc                randconfig-r2102-20261121    gcc-9.5.0  cocci
sparc                randconfig-r2106-20261120    clang-18   cocci
sparc                randconfig-r2107-20261121    gcc-14.4.0 cocci
sparc                randconfig-r2300-20261120    clang-24   sparse
sparc                randconfig-r2300-20261121    clang-17   sparse
sparc                randconfig-r2301-20261121    gcc-8.5.0  sparse
sparc                randconfig-r2302-20261120    gcc-9.5.0  sparse
sparc                randconfig-r2306-20261120    gcc-12.5.0 sparse
sparc                randconfig-r2307-20261120    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261120    clang-24   sparse
sparc                randconfig-r2310-20261121    gcc-10.5.0 sparse
sparc                randconfig-r2310-20261121    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261122    clang-24
sparc64               randconfig-1001-20261122    clang-24
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2000-20261121    gcc-8.5.0
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261121    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64               randconfig-2200-20261121    clang-20   smatch
sparc64              randconfig-r2101-20261120    clang-22   cocci
sparc64              randconfig-r2105-20261120    gcc-13.5.0 cocci
sparc64              randconfig-r2106-20261121    clang-24   cocci
sparc64              randconfig-r2107-20261120    clang-17   cocci
sparc64              randconfig-r2107-20261120    gcc-11.5.0 cocci
sparc64              randconfig-r2110-20261120    gcc-8.5.0  cocci
sparc64              randconfig-r2111-20261120    gcc-8.5.0  cocci
sparc64              randconfig-r2300-20261122    clang-24   sparse
sparc64              randconfig-r2301-20261120    clang-22   sparse
sparc64              randconfig-r2302-20261121    clang-24   sparse
sparc64              randconfig-r2305-20261120    clang-24   sparse
sparc64              randconfig-r2308-20261120    gcc-14.4.0 sparse
sparc64              randconfig-r2309-20261121    gcc-15.3.0 sparse
sparc64              randconfig-r2310-20261120    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261122    clang-24
um                    randconfig-1001-20261122    clang-24
um                    randconfig-2000-20261120    clang-24
um                    randconfig-2000-20261120    gcc-8.5.0
um                    randconfig-2000-20261121    gcc-8.5.0
um                    randconfig-2001-20261120    gcc-14
um                    randconfig-2001-20261120    gcc-8.5.0
um                    randconfig-2001-20261121    gcc-8.5.0
um                    randconfig-2200-20261120    clang-24   smatch
um                    randconfig-2200-20261121    gcc-14     smatch
um                   randconfig-r2103-20261120    clang-22   cocci
um                   randconfig-r2104-20261120    clang-22   cocci
um                   randconfig-r2104-20261120    gcc-16.2.0 cocci
um                   randconfig-r2105-20261120    clang-24   cocci
um                   randconfig-r2108-20261120    gcc-8.5.0  cocci
um                   randconfig-r2110-20261120    gcc-11.5.0 cocci
um                   randconfig-r2301-20261120    clang-24   sparse
um                   randconfig-r2303-20261120    clang-24   sparse
um                   randconfig-r2308-20261121    gcc-11.5.0 sparse
um                   randconfig-r2311-20261120    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261122    gcc-14
x86_64                randconfig-1001-20261122    gcc-14
x86_64                randconfig-1002-20261122    gcc-14
x86_64                randconfig-1003-20261122    gcc-14
x86_64                randconfig-1004-20261122    gcc-14
x86_64                randconfig-1005-20261122    gcc-14
x86_64                randconfig-1006-20261122    gcc-14
x86_64                randconfig-1007-20261122    gcc-14
x86_64                randconfig-1008-20261122    gcc-14
x86_64                randconfig-1009-20261122    gcc-14
x86_64                randconfig-1010-20261122    gcc-14
x86_64                randconfig-1011-20261122    gcc-14
x86_64                randconfig-1012-20261122    clang-22
x86_64                randconfig-1013-20261122    clang-22
x86_64                randconfig-1014-20261122    clang-22
x86_64                randconfig-1015-20261122    clang-22
x86_64                randconfig-1016-20261122    clang-22
x86_64                randconfig-1017-20261122    clang-22
x86_64                randconfig-2000-20261120    clang-22
x86_64                randconfig-2000-20261120    gcc-14
x86_64                randconfig-2000-20261121    gcc-14
x86_64                randconfig-2001-20261120    clang-22
x86_64                randconfig-2001-20261120    gcc-14
x86_64                randconfig-2001-20261121    gcc-14
x86_64                randconfig-2002-20261120    clang-22
x86_64                randconfig-2002-20261121    gcc-14
x86_64                randconfig-2003-20261120    clang-22
x86_64                randconfig-2003-20261121    gcc-14
x86_64                randconfig-2004-20261120    clang-22
x86_64                randconfig-2004-20261121    gcc-14
x86_64                randconfig-2005-20261120    clang-22
x86_64                randconfig-2005-20261120    gcc-14
x86_64                randconfig-2005-20261121    gcc-14
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2100-20261121    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261121    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261121    gcc-14     cocci
x86_64                randconfig-2103-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261121    gcc-14     cocci
x86_64                randconfig-2104-20261120    gcc-14     cocci
x86_64                randconfig-2104-20261121    gcc-14     cocci
x86_64                randconfig-2105-20261120    gcc-14     cocci
x86_64                randconfig-2105-20261121    gcc-14     cocci
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64                randconfig-2200-20261121    gcc-14     smatch
x86_64                randconfig-2300-20261120    clang-22   sparse
x86_64                randconfig-2300-20261120    gcc-14     sparse
x86_64                randconfig-2300-20261121    gcc-14     sparse
x86_64                randconfig-2301-20261120    clang-22   sparse
x86_64                randconfig-2301-20261121    gcc-14     sparse
x86_64                randconfig-2302-20261120    clang-22   sparse
x86_64                randconfig-2302-20261121    gcc-14     sparse
x86_64               randconfig-r2100-20261120    gcc-14     cocci
x86_64               randconfig-r2100-20261120    gcc-16.2.0 cocci
x86_64               randconfig-r2101-20261121    gcc-14     cocci
x86_64               randconfig-r2103-20261120    clang-24   cocci
x86_64               randconfig-r2103-20261122    gcc-14     cocci
x86_64               randconfig-r2106-20261120    gcc-8.5.0  cocci
x86_64               randconfig-r2107-20261120    gcc-8.5.0  cocci
x86_64               randconfig-r2303-20261120    gcc-9.5.0  sparse
x86_64               randconfig-r2307-20261120    gcc-13.5.0 sparse
x86_64               randconfig-r2311-20261121    gcc-10.5.0 sparse
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
xtensa                   nommu_kc705_defconfig    clang-17
xtensa                randconfig-1000-20261122    clang-24
xtensa                randconfig-1001-20261122    clang-24
xtensa                randconfig-2000-20261120    gcc-16.2.0
xtensa                randconfig-2000-20261121    gcc-16.2.0
xtensa                randconfig-2001-20261120    gcc-16.2.0
xtensa                randconfig-2001-20261121    gcc-16.2.0
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261122    gcc-14     cocci
xtensa               randconfig-r2104-20261120    gcc-14.4.0 cocci
xtensa               randconfig-r2105-20261121    gcc-14     cocci
xtensa               randconfig-r2107-20261120    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261120    gcc-8.5.0  cocci
xtensa               randconfig-r2111-20261120    gcc-8.5.0  cocci
xtensa               randconfig-r2303-20261120    clang-24   sparse
xtensa               randconfig-r2304-20261120    gcc-8.5.0  sparse
xtensa               randconfig-r2306-20261120    gcc-13.5.0 sparse
xtensa               randconfig-r2306-20261120    gcc-14     sparse
xtensa               randconfig-r2307-20261121    gcc-15.3.0 sparse
xtensa               randconfig-r2308-20261121    gcc-11.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
