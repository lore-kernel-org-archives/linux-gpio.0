Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018957;
	b=kaLxrf0+sRdlEk3/ybKZ4q/O63m4dOI1go8yszKz+E2AZ+xFW1doV4lDfS23WF8ZTaEH
	 kPiirS63Mr+dHWO5RuEyiFkUpgxXKT+nHWdjJUKdie9AtXJQkIZ/yLZXRw5FrpHs/CAMc
	 GOD/4J82PCVy3eKhVhHO9X0KNJgjJgeyTWYiLdIvw8yRgQL/AQtpHDuaLCNOvgQW3UTMR
	 RMYV9lsGTuS6vFkdrt3xhlb1trNDOaUzVIaSGfC6a5mUbxAeqSPsoQqA+CZfqQfAt3dBo
	 zbfLWawmGxpKvnwRYBwc401ObugYCAOqgDl9NphuzPha4sjRtOKigFMF7muuolVTM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xJgpbL3K9pYLaAxjD79wdqfr8k7yB3Io5XaAm6TfDmg=;
	b=R2PNifSggqUd5LinZ6WuNYiWjrFptRiuZV06MpuVO7Ofc+lhDISp2fz6Kh2EIi4ddskW
	 wnpIPoVyEJg4PiWJWnmFetdvlaXdBUHLagAjhTG9R2t52cA4NN67Qzzm6ef7xn8wtuSmZ
	 cKqpq7jKiRqOY/7ycaQr41h+10FL0jb4G4z/VbckKsJx//X3CkQph3htnuLtQ8rgXDp7H
	 cAYPNKkSAUWfseauA3cS7eEinpWADzAqE0sRwZ1GAisMMdPZGhkjLREOKndg3JwUiRyfJ
	 JV5SaYQQCUaeHyJgGaeHnaxTH1MPxUWw2I/fnKPCM/iZI1ConwazZDqdtUUgDKNvJow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=akQYvk7J;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4C606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 16:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B4C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=akQYvk7J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795018956; x=1826554956;
  h=date:from:to:cc:subject:message-id;
  bh=gAKmTRj9mFxqTl5O0y65baSuUzOcAt88tIY4allWTVM=;
  b=akQYvk7JbnEGERT2FfUz4PGfmDQj94XGW0KRUKPU8NhdfTMAZMDoMZjc
   5PFsSskUHQpWdf/3E5P0e0T+KDbQ2ijX8L5y54naTNfkiy8UofQieZs3j
   45dgXH0IBLbETfllmRFoUBpGPMjebIlAIfK2NtIL1KbbhG5TBgZA+tARP
   hD5q1YX+cd1/RpqkryPfLW9VwuTkJY5cx85mT9i8VXq+Uy7CCfNB62CJW
   YoD34E44vW8btcDrKl/6Df7F8+KsM0txkl/MYGu3f0XKQeVQqFpowGdzQ
   VhegDrF+rqwHDMBwFmSZmsoA5QIkmzjBP2Sb4rtNSAi3TmxhAWwgptYKg
   w==;
X-CSE-ConnectionGUID: /LUqnl+cQsiFifUUZ3BzLw==
X-CSE-MsgGUID: 1uF3p6rBT+a583ivaovpdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3755108"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3755108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:22:35 -0800
X-CSE-ConnectionGUID: wXkvRGd9SZmy/BRixJ9Vlg==
X-CSE-MsgGUID: Jqv3S+59SvGvHH1wq9vmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10579199"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 08:22:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiQZ-00000001Dq8-1wBb;
	Wed, 18 Nov 2026 16:22:31 +0000
Date: Thu, 19 Nov 2026 00:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 5cf0969621bc014b5305e6ff8b7e28f20060c3e8
Message-ID: <20261119002156.LKSNN2Z5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 5cf0969621bc014b5305e6ff8b7e28f20060c3e8  pinctrl: ocelot: do not use the chained irqchip behind a sleeping bus

elapsed time: 1309m

configs tested: 743
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261117    gcc-15.3.0
alpha                 randconfig-2000-20261118    gcc-16.2.0
alpha                 randconfig-2001-20261117    gcc-15.3.0
alpha                 randconfig-2001-20261118    gcc-16.2.0
alpha                 randconfig-2200-20261117    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261118    gcc-13.5.0 smatch
alpha                randconfig-r2100-20261118    gcc-13.5.0 cocci
alpha                randconfig-r2101-20261118    clang-22   cocci
alpha                randconfig-r2101-20261118    gcc-13.5.0 cocci
alpha                randconfig-r2103-20261117    gcc-8.5.0  cocci
alpha                randconfig-r2103-20261118    gcc-13.5.0 cocci
alpha                randconfig-r2104-20261118    clang-24   cocci
alpha                randconfig-r2104-20261118    gcc-13.5.0 cocci
alpha                randconfig-r2105-20261118    gcc-14.4.0 cocci
alpha                randconfig-r2108-20261118    gcc-11.5.0 cocci
alpha                randconfig-r2301-20261117    gcc-14.4.0 sparse
alpha                randconfig-r2301-20261117    gcc-8.5.0  sparse
alpha                randconfig-r2303-20261118    gcc-16.2.0 sparse
alpha                randconfig-r2304-20261118    gcc-8.5.0  sparse
alpha                randconfig-r2305-20261117    clang-22   sparse
alpha                randconfig-r2307-20261118    gcc-11.5.0 sparse
alpha                randconfig-r2309-20261118    clang-24   sparse
alpha                randconfig-r2311-20261118    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261118    gcc-10.5.0
arc                   randconfig-1001-20261118    gcc-10.5.0
arc                   randconfig-2000-20261117    gcc-12.5.0
arc                   randconfig-2000-20261118    gcc-11.5.0
arc                   randconfig-2001-20261117    gcc-12.5.0
arc                   randconfig-2001-20261118    gcc-11.5.0
arc                   randconfig-2002-20261117    gcc-12.5.0
arc                   randconfig-2002-20261118    gcc-11.5.0
arc                   randconfig-2003-20261117    gcc-12.5.0
arc                   randconfig-2003-20261118    gcc-11.5.0
arc                   randconfig-2004-20261117    gcc-12.5.0
arc                   randconfig-2004-20261118    gcc-11.5.0
arc                   randconfig-2005-20261117    gcc-12.5.0
arc                   randconfig-2005-20261118    gcc-11.5.0
arc                   randconfig-2200-20261117    gcc-8.5.0  smatch
arc                   randconfig-2200-20261118    gcc-9.5.0  smatch
arc                  randconfig-r2101-20261117    gcc-12     cocci
arc                  randconfig-r2101-20261117    gcc-8.5.0  cocci
arc                  randconfig-r2101-20261118    clang-24   cocci
arc                  randconfig-r2104-20261118    gcc-14.4.0 cocci
arc                  randconfig-r2106-20261118    clang-22   cocci
arc                  randconfig-r2107-20261117    gcc-8.5.0  cocci
arc                  randconfig-r2302-20261117    gcc-16.2.0 sparse
arc                  randconfig-r2302-20261118    gcc-8.5.0  sparse
arc                  randconfig-r2303-20261117    gcc-16.2.0 sparse
arc                  randconfig-r2303-20261118    gcc-12.5.0 sparse
arc                  randconfig-r2303-20261118    gcc-9.5.0  sparse
arc                  randconfig-r2304-20261118    gcc-12.5.0 sparse
arc                  randconfig-r2305-20261118    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261118    clang-24   sparse
arc                  randconfig-r2308-20261118    clang-24   sparse
arc                  randconfig-r2309-20261117    gcc-11.5.0 sparse
arc                  randconfig-r2311-20261117    gcc-16.2.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261118    gcc-10.5.0
arm                   randconfig-1001-20261118    gcc-10.5.0
arm                   randconfig-1002-20261118    gcc-10.5.0
arm                   randconfig-1003-20261118    gcc-10.5.0
arm                   randconfig-2000-20261117    gcc-10.5.0
arm                   randconfig-2000-20261118    gcc-13.5.0
arm                   randconfig-2001-20261117    gcc-10.5.0
arm                   randconfig-2001-20261118    gcc-13.5.0
arm                   randconfig-2002-20261117    gcc-10.5.0
arm                   randconfig-2002-20261118    gcc-13.5.0
arm                   randconfig-2200-20261118    gcc-8.5.0  smatch
arm                  randconfig-r2105-20261117    gcc-12     cocci
arm                  randconfig-r2105-20261118    clang-24   cocci
arm                  randconfig-r2107-20261118    clang-22   cocci
arm                  randconfig-r2107-20261118    gcc-14     cocci
arm                  randconfig-r2111-20261117    gcc-16.2.0 cocci
arm                  randconfig-r2301-20261117    clang-22   sparse
arm                  randconfig-r2302-20261117    gcc-8.5.0  sparse
arm                  randconfig-r2310-20261118    clang-24   sparse
arm                  randconfig-r2310-20261118    gcc-16.2.0 sparse
arm                  randconfig-r2311-20261117    clang-18   sparse
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
arm64                 randconfig-2000-20261117    gcc-10.5.0
arm64                 randconfig-2000-20261118    gcc-13.5.0
arm64                 randconfig-2001-20261117    gcc-10.5.0
arm64                 randconfig-2001-20261118    gcc-13.5.0
arm64                 randconfig-2002-20261117    gcc-10.5.0
arm64                 randconfig-2002-20261118    gcc-13.5.0
arm64                 randconfig-2200-20261117    clang-17   smatch
arm64                 randconfig-2200-20261118    clang-24   smatch
arm64                randconfig-r2109-20261117    gcc-8.5.0  cocci
arm64                randconfig-r2109-20261118    clang-24   cocci
arm64                randconfig-r2111-20261117    gcc-14     cocci
arm64                randconfig-r2300-20261118    gcc-12.5.0 sparse
arm64                randconfig-r2303-20261118    gcc-8.5.0  sparse
arm64                randconfig-r2306-20261117    clang-18   sparse
arm64                randconfig-r2306-20261118    clang-24   sparse
arm64                randconfig-r2307-20261117    gcc-11.5.0 sparse
arm64                randconfig-r2308-20261118    gcc-8.5.0  sparse
arm64                randconfig-r2309-20261117    clang-18   sparse
arm64                randconfig-r2310-20261117    clang-18   sparse
arm64                randconfig-r2310-20261117    gcc-10.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261118    gcc-16.2.0
csky                  randconfig-1001-20261118    gcc-16.2.0
csky                  randconfig-2000-20261117    gcc-16.2.0
csky                  randconfig-2000-20261118    gcc-16.2.0
csky                  randconfig-2001-20261117    gcc-16.2.0
csky                  randconfig-2001-20261118    gcc-16.2.0
csky                  randconfig-2200-20261117    gcc-14.4.0 smatch
csky                  randconfig-2200-20261118    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261117    gcc-13.5.0 cocci
csky                 randconfig-r2101-20261118    clang-24   cocci
csky                 randconfig-r2101-20261118    gcc-14.4.0 cocci
csky                 randconfig-r2104-20261117    gcc-8.5.0  cocci
csky                 randconfig-r2104-20261118    clang-24   cocci
csky                 randconfig-r2109-20261117    gcc-16.2.0 cocci
csky                 randconfig-r2300-20261118    gcc-16.2.0 sparse
csky                 randconfig-r2302-20261118    gcc-12.5.0 sparse
csky                 randconfig-r2305-20261118    clang-24   sparse
csky                 randconfig-r2306-20261117    gcc-10.5.0 sparse
csky                 randconfig-r2308-20261118    gcc-16.2.0 sparse
csky                 randconfig-r2311-20261117    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261118    clang-22
hexagon               randconfig-1001-20261118    clang-22
hexagon               randconfig-2000-20261117    gcc-16.2.0
hexagon               randconfig-2000-20261118    gcc-16.2.0
hexagon               randconfig-2001-20261117    gcc-16.2.0
hexagon               randconfig-2001-20261118    gcc-16.2.0
hexagon               randconfig-2200-20261117    clang-17   smatch
hexagon               randconfig-2200-20261118    clang-20   smatch
hexagon              randconfig-r2105-20261117    gcc-14     cocci
hexagon              randconfig-r2105-20261118    clang-22   cocci
hexagon              randconfig-r2106-20261118    gcc-14     cocci
hexagon              randconfig-r2111-20261118    clang-24   cocci
hexagon              randconfig-r2300-20261118    gcc-12.5.0 sparse
hexagon              randconfig-r2303-20261117    gcc-14.4.0 sparse
hexagon              randconfig-r2307-20261118    clang-24   sparse
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
i386                  randconfig-2000-20261117    clang-22
i386                  randconfig-2000-20261118    gcc-14
i386                  randconfig-2001-20261117    clang-22
i386                  randconfig-2001-20261118    gcc-14
i386                  randconfig-2002-20261117    clang-22
i386                  randconfig-2002-20261118    gcc-14
i386                  randconfig-2003-20261117    clang-22
i386                  randconfig-2003-20261118    gcc-14
i386                  randconfig-2004-20261117    clang-22
i386                  randconfig-2004-20261118    gcc-14
i386                  randconfig-2005-20261117    clang-22
i386                  randconfig-2005-20261118    gcc-14
i386                  randconfig-2100-20261117    clang-22   cocci
i386                  randconfig-2100-20261118    gcc-14     cocci
i386                  randconfig-2101-20261117    clang-22   cocci
i386                  randconfig-2101-20261118    gcc-14     cocci
i386                  randconfig-2102-20261117    clang-22   cocci
i386                  randconfig-2102-20261118    gcc-14     cocci
i386                  randconfig-2103-20261117    clang-22   cocci
i386                  randconfig-2103-20261118    gcc-14     cocci
i386                  randconfig-2104-20261117    clang-22   cocci
i386                  randconfig-2104-20261118    gcc-14     cocci
i386                  randconfig-2105-20261117    clang-22   cocci
i386                  randconfig-2105-20261118    gcc-14     cocci
i386                  randconfig-2200-20261117    gcc-14     smatch
i386                  randconfig-2200-20261118    gcc-13     smatch
i386                  randconfig-2300-20261117    clang-22   sparse
i386                  randconfig-2300-20261118    gcc-14     sparse
i386                  randconfig-2301-20261117    clang-22   sparse
i386                  randconfig-2301-20261118    gcc-14     sparse
i386                  randconfig-2302-20261117    clang-22   sparse
i386                  randconfig-2302-20261118    gcc-14     sparse
i386                 randconfig-r2100-20261117    gcc-14     cocci
i386                 randconfig-r2102-20261118    gcc-14     cocci
i386                 randconfig-r2103-20261117    gcc-12     cocci
i386                 randconfig-r2103-20261118    clang-22   cocci
i386                 randconfig-r2104-20261117    gcc-13.5.0 cocci
i386                 randconfig-r2105-20261118    clang-22   cocci
i386                 randconfig-r2107-20261118    gcc-10.5.0 cocci
i386                 randconfig-r2109-20261118    clang-22   cocci
i386                 randconfig-r2110-20261117    clang-24   cocci
i386                 randconfig-r2110-20261117    gcc-13.5.0 cocci
i386                 randconfig-r2110-20261117    gcc-8.5.0  cocci
i386                 randconfig-r2110-20261118    clang-24   cocci
i386                 randconfig-r2110-20261118    gcc-14     cocci
i386                 randconfig-r2300-20261117    gcc-16.2.0 sparse
i386                 randconfig-r2300-20261118    gcc-8.5.0  sparse
i386                 randconfig-r2301-20261118    gcc-9.5.0  sparse
i386                 randconfig-r2302-20261117    clang-22   sparse
i386                 randconfig-r2306-20261117    gcc-9.5.0  sparse
i386                 randconfig-r2308-20261117    gcc-10.5.0 sparse
i386                 randconfig-r2309-20261117    clang-18   sparse
i386                 randconfig-r2309-20261118    gcc-8.5.0  sparse
i386                 randconfig-r2310-20261118    gcc-11.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261118    clang-22
loongarch             randconfig-1001-20261118    clang-22
loongarch             randconfig-2000-20261117    gcc-8.5.0
loongarch             randconfig-2000-20261118    gcc-11.5.0
loongarch             randconfig-2001-20261117    gcc-8.5.0
loongarch             randconfig-2001-20261118    gcc-11.5.0
loongarch             randconfig-2200-20261117    gcc-13.5.0 smatch
loongarch             randconfig-2200-20261118    gcc-16.2.0 smatch
loongarch            randconfig-r2100-20261118    clang-24   cocci
loongarch            randconfig-r2104-20261118    clang-24   cocci
loongarch            randconfig-r2107-20261117    clang-24   cocci
loongarch            randconfig-r2111-20261118    clang-22   cocci
loongarch            randconfig-r2300-20261117    gcc-8.5.0  sparse
loongarch            randconfig-r2304-20261117    gcc-16.2.0 sparse
loongarch            randconfig-r2305-20261117    gcc-16.2.0 sparse
loongarch            randconfig-r2306-20261117    gcc-11.5.0 sparse
loongarch            randconfig-r2307-20261117    clang-18   sparse
loongarch            randconfig-r2311-20261118    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261117    gcc-15.3.0
m68k                  randconfig-2000-20261118    gcc-16.2.0
m68k                  randconfig-2001-20261117    gcc-15.3.0
m68k                  randconfig-2001-20261118    gcc-16.2.0
m68k                  randconfig-2200-20261117    gcc-11.5.0 smatch
m68k                  randconfig-2200-20261118    gcc-12.5.0 smatch
m68k                 randconfig-r2105-20261117    gcc-13.5.0 cocci
m68k                 randconfig-r2105-20261118    gcc-13.5.0 cocci
m68k                 randconfig-r2108-20261117    gcc-16.2.0 cocci
m68k                 randconfig-r2300-20261117    gcc-14.4.0 sparse
m68k                 randconfig-r2301-20261117    gcc-16.2.0 sparse
m68k                 randconfig-r2301-20261118    gcc-8.5.0  sparse
m68k                 randconfig-r2303-20261118    gcc-8.5.0  sparse
m68k                 randconfig-r2306-20261118    gcc-8.5.0  sparse
m68k                 randconfig-r2307-20261117    gcc-10.5.0 sparse
m68k                 randconfig-r2308-20261118    clang-24   sparse
m68k                 randconfig-r2309-20261118    clang-24   sparse
m68k                         stmark2_defconfig    clang-24
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261117    gcc-15.3.0
microblaze            randconfig-2000-20261118    gcc-16.2.0
microblaze            randconfig-2001-20261117    gcc-15.3.0
microblaze            randconfig-2001-20261118    gcc-16.2.0
microblaze            randconfig-2200-20261117    gcc-14.4.0 smatch
microblaze            randconfig-2200-20261118    gcc-13.5.0 smatch
microblaze           randconfig-r2101-20261117    gcc-13.5.0 cocci
microblaze           randconfig-r2101-20261118    gcc-14     cocci
microblaze           randconfig-r2106-20261118    clang-24   cocci
microblaze           randconfig-r2107-20261117    gcc-8.5.0  cocci
microblaze           randconfig-r2109-20261118    clang-24   cocci
microblaze           randconfig-r2110-20261118    clang-22   cocci
microblaze           randconfig-r2302-20261117    gcc-14.4.0 sparse
microblaze           randconfig-r2302-20261118    gcc-9.5.0  sparse
microblaze           randconfig-r2305-20261118    gcc-12.5.0 sparse
microblaze           randconfig-r2305-20261118    gcc-8.5.0  sparse
microblaze           randconfig-r2311-20261118    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                            jazz_defconfig    gcc-16.2.0
mips                 malta_qemu_32r6_defconfig    clang-24
mips                  randconfig-2000-20261117    gcc-16.2.0
mips                  randconfig-2000-20261118    gcc-15.3.0
mips                  randconfig-2001-20261117    gcc-16.2.0
mips                  randconfig-2001-20261118    gcc-15.3.0
mips                  randconfig-2002-20261117    gcc-16.2.0
mips                  randconfig-2002-20261118    gcc-15.3.0
mips                  randconfig-2200-20261117    clang-24   smatch
mips                  randconfig-2200-20261118    clang-24   smatch
mips                 randconfig-r2100-20261118    clang-24   cocci
mips                 randconfig-r2100-20261118    gcc-14.4.0 cocci
mips                 randconfig-r2101-20261117    gcc-14     cocci
mips                 randconfig-r2102-20261118    clang-22   cocci
mips                 randconfig-r2102-20261118    clang-24   cocci
mips                 randconfig-r2104-20261117    gcc-12     cocci
mips                 randconfig-r2106-20261118    clang-24   cocci
mips                 randconfig-r2107-20261117    gcc-13.5.0 cocci
mips                 randconfig-r2107-20261118    gcc-11.5.0 cocci
mips                 randconfig-r2108-20261118    clang-24   cocci
mips                 randconfig-r2109-20261117    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261117    clang-24   cocci
mips                 randconfig-r2111-20261117    gcc-16.2.0 cocci
mips                 randconfig-r2111-20261117    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261118    gcc-11.5.0 cocci
mips                 randconfig-r2307-20261118    clang-24   sparse
mips                 randconfig-r2310-20261117    gcc-8.5.0  sparse
mips                 randconfig-r2310-20261117    gcc-9.5.0  sparse
mips                 randconfig-r2310-20261118    clang-24   sparse
mips                          rt305x_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261118    clang-22
nios2                 randconfig-1001-20261118    clang-22
nios2                 randconfig-2000-20261117    gcc-8.5.0
nios2                 randconfig-2000-20261118    gcc-11.5.0
nios2                 randconfig-2001-20261117    gcc-8.5.0
nios2                 randconfig-2001-20261118    gcc-11.5.0
nios2                 randconfig-2200-20261117    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261118    gcc-8.5.0  smatch
nios2                randconfig-r2102-20261117    gcc-8.5.0  cocci
nios2                randconfig-r2104-20261117    gcc-14     cocci
nios2                randconfig-r2107-20261118    clang-24   cocci
nios2                randconfig-r2108-20261117    gcc-8.5.0  cocci
nios2                randconfig-r2110-20261118    gcc-13.5.0 cocci
nios2                randconfig-r2300-20261118    gcc-8.5.0  sparse
nios2                randconfig-r2304-20261118    gcc-16.2.0 sparse
nios2                randconfig-r2307-20261117    clang-18   sparse
nios2                randconfig-r2307-20261117    gcc-9.5.0  sparse
nios2                randconfig-r2308-20261118    clang-24   sparse
nios2                randconfig-r2311-20261117    gcc-10.5.0 sparse
nios2                randconfig-r2311-20261117    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261117    gcc-16.2.0
openrisc              randconfig-2000-20261118    gcc-15.3.0
openrisc              randconfig-2001-20261117    gcc-16.2.0
openrisc              randconfig-2001-20261118    gcc-15.3.0
openrisc              randconfig-2002-20261117    gcc-16.2.0
openrisc              randconfig-2002-20261118    gcc-15.3.0
openrisc              randconfig-2200-20261117    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261118    clang-22   cocci
openrisc             randconfig-r2100-20261118    gcc-14     cocci
openrisc             randconfig-r2101-20261118    gcc-11.5.0 cocci
openrisc             randconfig-r2102-20261117    gcc-14     cocci
openrisc             randconfig-r2102-20261118    clang-24   cocci
openrisc             randconfig-r2103-20261117    gcc-13.5.0 cocci
openrisc             randconfig-r2103-20261117    gcc-14     cocci
openrisc             randconfig-r2103-20261118    gcc-11.5.0 cocci
openrisc             randconfig-r2104-20261118    clang-22   cocci
openrisc             randconfig-r2108-20261118    clang-22   cocci
openrisc             randconfig-r2109-20261117    clang-24   cocci
openrisc             randconfig-r2109-20261118    gcc-10.5.0 cocci
openrisc             randconfig-r2111-20261118    gcc-14     cocci
openrisc             randconfig-r2301-20261117    gcc-16.2.0 sparse
openrisc             randconfig-r2301-20261118    gcc-12.5.0 sparse
openrisc             randconfig-r2302-20261118    gcc-8.5.0  sparse
openrisc             randconfig-r2303-20261117    clang-22   sparse
openrisc             randconfig-r2304-20261117    gcc-14.4.0 sparse
openrisc             randconfig-r2305-20261118    gcc-9.5.0  sparse
openrisc             randconfig-r2306-20261118    gcc-16.2.0 sparse
openrisc             randconfig-r2307-20261118    gcc-16.2.0 sparse
openrisc             randconfig-r2310-20261117    clang-18   sparse
openrisc             randconfig-r2311-20261118    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261118    gcc-8.5.0
parisc                randconfig-1001-20261118    gcc-8.5.0
parisc                randconfig-2000-20261117    gcc-8.5.0
parisc                randconfig-2000-20261118    gcc-11.5.0
parisc                randconfig-2001-20261117    gcc-8.5.0
parisc                randconfig-2001-20261118    gcc-11.5.0
parisc                randconfig-2200-20261117    gcc-8.5.0  smatch
parisc                randconfig-2200-20261118    gcc-11.5.0 smatch
parisc               randconfig-r2102-20261118    gcc-14.4.0 cocci
parisc               randconfig-r2103-20261118    clang-24   cocci
parisc               randconfig-r2107-20261117    gcc-16.2.0 cocci
parisc               randconfig-r2109-20261117    gcc-16.2.0 cocci
parisc               randconfig-r2110-20261117    gcc-8.5.0  cocci
parisc               randconfig-r2300-20261117    clang-22   sparse
parisc               randconfig-r2306-20261118    gcc-11.5.0 sparse
parisc               randconfig-r2308-20261117    gcc-8.5.0  sparse
parisc               randconfig-r2310-20261117    gcc-11.5.0 sparse
parisc               randconfig-r2310-20261118    gcc-8.5.0  sparse
parisc               randconfig-r2311-20261118    gcc-11.5.0 sparse
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
powerpc               randconfig-2000-20261117    gcc-8.5.0
powerpc               randconfig-2000-20261118    clang-21
powerpc               randconfig-2001-20261117    gcc-8.5.0
powerpc               randconfig-2001-20261118    clang-21
powerpc               randconfig-2002-20261117    gcc-8.5.0
powerpc               randconfig-2002-20261118    clang-21
powerpc               randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc               randconfig-2200-20261118    clang-24   smatch
powerpc              randconfig-r2102-20261117    gcc-13.5.0 cocci
powerpc              randconfig-r2102-20261118    clang-22   cocci
powerpc              randconfig-r2105-20261118    gcc-14     cocci
powerpc              randconfig-r2106-20261117    clang-24   cocci
powerpc              randconfig-r2108-20261118    clang-24   cocci
powerpc              randconfig-r2110-20261117    gcc-14     cocci
powerpc              randconfig-r2111-20261118    gcc-10.5.0 cocci
powerpc              randconfig-r2301-20261118    clang-24   sparse
powerpc              randconfig-r2308-20261117    clang-18   sparse
powerpc              randconfig-r2308-20261117    gcc-9.5.0  sparse
powerpc              randconfig-r2311-20261117    clang-18   sparse
powerpc              randconfig-r2311-20261118    clang-24   sparse
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261118    gcc-8.5.0
powerpc64             randconfig-1001-20261118    gcc-8.5.0
powerpc64             randconfig-2000-20261117    gcc-8.5.0
powerpc64             randconfig-2000-20261118    clang-21
powerpc64             randconfig-2001-20261117    gcc-8.5.0
powerpc64             randconfig-2001-20261118    clang-21
powerpc64             randconfig-2002-20261117    gcc-8.5.0
powerpc64             randconfig-2002-20261118    clang-21
powerpc64             randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc64             randconfig-2200-20261118    clang-24   smatch
powerpc64            randconfig-r2106-20261118    gcc-10.5.0 cocci
powerpc64            randconfig-r2107-20261117    gcc-16.2.0 cocci
powerpc64            randconfig-r2107-20261118    clang-24   cocci
powerpc64            randconfig-r2301-20261118    gcc-8.5.0  sparse
powerpc64            randconfig-r2303-20261118    gcc-12.5.0 sparse
powerpc64            randconfig-r2305-20261118    gcc-12.5.0 sparse
powerpc64            randconfig-r2306-20261118    gcc-8.5.0  sparse
powerpc64            randconfig-r2308-20261117    gcc-11.5.0 sparse
powerpc64            randconfig-r2310-20261117    gcc-16.2.0 sparse
powerpc64            randconfig-r2310-20261118    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261118    gcc-11.5.0
riscv                 randconfig-1001-20261118    gcc-11.5.0
riscv                 randconfig-2000-20261117    gcc-11.5.0
riscv                 randconfig-2000-20261118    gcc-8.5.0
riscv                 randconfig-2001-20261117    gcc-11.5.0
riscv                 randconfig-2001-20261118    gcc-8.5.0
riscv                 randconfig-2002-20261117    gcc-11.5.0
riscv                 randconfig-2002-20261118    gcc-8.5.0
riscv                 randconfig-2003-20261117    gcc-11.5.0
riscv                 randconfig-2003-20261118    gcc-8.5.0
riscv                 randconfig-2004-20261117    gcc-11.5.0
riscv                 randconfig-2004-20261118    gcc-8.5.0
riscv                 randconfig-2005-20261117    gcc-11.5.0
riscv                 randconfig-2005-20261118    gcc-8.5.0
riscv                 randconfig-2200-20261117    clang-24   smatch
riscv                 randconfig-2200-20261118    clang-24   smatch
riscv                randconfig-r2100-20261117    gcc-8.5.0  cocci
riscv                randconfig-r2103-20261118    clang-24   cocci
riscv                randconfig-r2106-20261118    gcc-13.5.0 cocci
riscv                randconfig-r2108-20261117    gcc-14     cocci
riscv                randconfig-r2108-20261117    gcc-16.2.0 cocci
riscv                randconfig-r2108-20261117    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261118    gcc-13.5.0 cocci
riscv                randconfig-r2108-20261118    gcc-14     cocci
riscv                randconfig-r2109-20261118    gcc-13.5.0 cocci
riscv                randconfig-r2110-20261118    clang-24   cocci
riscv                randconfig-r2110-20261118    gcc-10.5.0 cocci
riscv                randconfig-r2300-20261117    gcc-16.2.0 sparse
riscv                randconfig-r2302-20261118    gcc-16.2.0 sparse
riscv                randconfig-r2303-20261118    clang-24   sparse
riscv                randconfig-r2304-20261118    gcc-8.5.0  sparse
riscv                randconfig-r2309-20261117    gcc-16.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261118    gcc-11.5.0
s390                  randconfig-1001-20261118    gcc-11.5.0
s390                  randconfig-2000-20261117    gcc-15.3.0
s390                  randconfig-2000-20261118    clang-24
s390                  randconfig-2001-20261117    gcc-15.3.0
s390                  randconfig-2001-20261118    clang-24
s390                  randconfig-2002-20261117    gcc-15.3.0
s390                  randconfig-2002-20261118    clang-24
s390                  randconfig-2003-20261117    gcc-15.3.0
s390                  randconfig-2003-20261118    clang-24
s390                  randconfig-2004-20261117    gcc-15.3.0
s390                  randconfig-2004-20261118    clang-24
s390                  randconfig-2005-20261117    gcc-15.3.0
s390                  randconfig-2005-20261118    clang-24
s390                  randconfig-2200-20261117    gcc-11.5.0 smatch
s390                  randconfig-2200-20261118    gcc-8.5.0  smatch
s390                 randconfig-r2105-20261118    clang-24   cocci
s390                 randconfig-r2108-20261118    gcc-10.5.0 cocci
s390                 randconfig-r2111-20261118    clang-24   cocci
s390                 randconfig-r2304-20261117    gcc-16.2.0 sparse
s390                 randconfig-r2307-20261118    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    gcc-16.2.0
sh                              espt_defconfig    clang-17
sh                           polaris_defconfig    clang-17
sh                    randconfig-1000-20261118    gcc-11.5.0
sh                    randconfig-1001-20261118    gcc-11.5.0
sh                    randconfig-2000-20261117    gcc-14.4.0
sh                    randconfig-2000-20261118    gcc-9.5.0
sh                    randconfig-2001-20261117    gcc-14.4.0
sh                    randconfig-2001-20261118    gcc-9.5.0
sh                    randconfig-2002-20261117    gcc-14.4.0
sh                    randconfig-2002-20261118    gcc-9.5.0
sh                    randconfig-2003-20261117    gcc-14.4.0
sh                    randconfig-2003-20261118    gcc-9.5.0
sh                    randconfig-2004-20261117    gcc-14.4.0
sh                    randconfig-2004-20261118    gcc-9.5.0
sh                    randconfig-2005-20261117    gcc-14.4.0
sh                    randconfig-2005-20261118    gcc-9.5.0
sh                    randconfig-2200-20261117    gcc-16.2.0 smatch
sh                    randconfig-2200-20261118    gcc-13.5.0 smatch
sh                   randconfig-r2100-20261117    gcc-12     cocci
sh                   randconfig-r2100-20261118    clang-22   cocci
sh                   randconfig-r2102-20261118    gcc-11.5.0 cocci
sh                   randconfig-r2104-20261118    gcc-11.5.0 cocci
sh                   randconfig-r2106-20261117    gcc-16.2.0 cocci
sh                   randconfig-r2106-20261118    gcc-11.5.0 cocci
sh                   randconfig-r2107-20261118    gcc-13.5.0 cocci
sh                   randconfig-r2108-20261117    clang-24   cocci
sh                   randconfig-r2109-20261117    gcc-14     cocci
sh                   randconfig-r2111-20261117    gcc-13.5.0 cocci
sh                   randconfig-r2300-20261118    clang-24   sparse
sh                   randconfig-r2303-20261117    gcc-16.2.0 sparse
sh                   randconfig-r2304-20261117    gcc-8.5.0  sparse
sh                   randconfig-r2306-20261117    gcc-16.2.0 sparse
sh                    rts7751r2dplus_defconfig    clang-17
sh                            se7206_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-24
sh                   sh7785lcr_32bit_defconfig    clang-17
sh                             titan_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-2000-20261117    gcc-14
sparc                 randconfig-2000-20261118    clang-24
sparc                 randconfig-2001-20261117    gcc-14
sparc                 randconfig-2001-20261118    clang-24
sparc                 randconfig-2200-20261118    gcc-13.5.0 smatch
sparc                randconfig-r2100-20261118    gcc-11.5.0 cocci
sparc                randconfig-r2102-20261118    gcc-13.5.0 cocci
sparc                randconfig-r2105-20261117    gcc-8.5.0  cocci
sparc                randconfig-r2105-20261118    clang-24   cocci
sparc                randconfig-r2106-20261117    gcc-8.5.0  cocci
sparc                randconfig-r2110-20261118    gcc-11.5.0 cocci
sparc                randconfig-r2301-20261118    gcc-12.5.0 sparse
sparc                randconfig-r2304-20261117    clang-22   sparse
sparc                randconfig-r2304-20261118    gcc-9.5.0  sparse
sparc                randconfig-r2307-20261118    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261118    gcc-8.5.0  sparse
sparc                randconfig-r2311-20261117    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-2000-20261117    gcc-14
sparc64               randconfig-2000-20261118    clang-24
sparc64               randconfig-2001-20261117    gcc-14
sparc64               randconfig-2001-20261118    clang-24
sparc64               randconfig-2200-20261117    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261118    clang-22   smatch
sparc64              randconfig-r2101-20261118    clang-24   cocci
sparc64              randconfig-r2103-20261118    clang-24   cocci
sparc64              randconfig-r2103-20261118    gcc-14     cocci
sparc64              randconfig-r2106-20261117    gcc-8.5.0  cocci
sparc64              randconfig-r2108-20261117    gcc-13.5.0 cocci
sparc64              randconfig-r2109-20261118    gcc-11.5.0 cocci
sparc64              randconfig-r2302-20261118    clang-24   sparse
sparc64              randconfig-r2302-20261118    gcc-12.5.0 sparse
sparc64              randconfig-r2305-20261117    gcc-14.4.0 sparse
sparc64              randconfig-r2310-20261118    clang-24   sparse
sparc64              randconfig-r2311-20261118    gcc-16.2.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-2000-20261117    gcc-14
um                    randconfig-2000-20261118    clang-24
um                    randconfig-2001-20261117    gcc-14
um                    randconfig-2001-20261118    clang-24
um                    randconfig-2200-20261117    clang-21   smatch
um                    randconfig-2200-20261118    clang-24   smatch
um                   randconfig-r2100-20261118    clang-24   cocci
um                   randconfig-r2102-20261117    gcc-12     cocci
um                   randconfig-r2102-20261118    clang-24   cocci
um                   randconfig-r2103-20261118    gcc-14.4.0 cocci
um                   randconfig-r2105-20261118    gcc-11.5.0 cocci
um                   randconfig-r2107-20261117    gcc-14     cocci
um                   randconfig-r2301-20261118    gcc-16.2.0 sparse
um                   randconfig-r2303-20261117    gcc-8.5.0  sparse
um                   randconfig-r2305-20261118    gcc-16.2.0 sparse
um                   randconfig-r2306-20261118    clang-24   sparse
um                   randconfig-r2308-20261117    gcc-16.2.0 sparse
um                   randconfig-r2308-20261118    gcc-11.5.0 sparse
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
x86_64                randconfig-2000-20261117    gcc-14
x86_64                randconfig-2000-20261118    gcc-13
x86_64                randconfig-2001-20261117    gcc-14
x86_64                randconfig-2001-20261118    gcc-13
x86_64                randconfig-2002-20261117    gcc-14
x86_64                randconfig-2002-20261118    gcc-13
x86_64                randconfig-2003-20261117    gcc-14
x86_64                randconfig-2003-20261118    gcc-13
x86_64                randconfig-2004-20261117    gcc-14
x86_64                randconfig-2004-20261118    gcc-13
x86_64                randconfig-2005-20261117    gcc-14
x86_64                randconfig-2005-20261118    gcc-13
x86_64                randconfig-2100-20261117    gcc-14     cocci
x86_64                randconfig-2100-20261118    clang-22   cocci
x86_64                randconfig-2101-20261117    gcc-14     cocci
x86_64                randconfig-2101-20261118    clang-22   cocci
x86_64                randconfig-2102-20261117    gcc-14     cocci
x86_64                randconfig-2102-20261118    clang-22   cocci
x86_64                randconfig-2103-20261117    gcc-14     cocci
x86_64                randconfig-2103-20261118    clang-22   cocci
x86_64                randconfig-2104-20261117    gcc-14     cocci
x86_64                randconfig-2104-20261118    clang-22   cocci
x86_64                randconfig-2105-20261117    gcc-14     cocci
x86_64                randconfig-2105-20261118    clang-22   cocci
x86_64                randconfig-2200-20261117    gcc-14     smatch
x86_64                randconfig-2200-20261118    clang-22   smatch
x86_64                randconfig-2300-20261117    clang-22   sparse
x86_64                randconfig-2300-20261118    gcc-14     sparse
x86_64                randconfig-2301-20261117    clang-22   sparse
x86_64                randconfig-2301-20261118    gcc-14     sparse
x86_64                randconfig-2302-20261117    clang-22   sparse
x86_64                randconfig-2302-20261118    gcc-14     sparse
x86_64               randconfig-r2104-20261118    clang-22   cocci
x86_64               randconfig-r2104-20261118    gcc-14     cocci
x86_64               randconfig-r2106-20261117    gcc-13.5.0 cocci
x86_64               randconfig-r2106-20261117    gcc-14     cocci
x86_64               randconfig-r2106-20261117    gcc-16.2.0 cocci
x86_64               randconfig-r2109-20261117    gcc-13.5.0 cocci
x86_64               randconfig-r2109-20261118    gcc-14     cocci
x86_64               randconfig-r2111-20261118    gcc-13.5.0 cocci
x86_64               randconfig-r2307-20261117    gcc-16.2.0 sparse
x86_64               randconfig-r2309-20261117    gcc-10.5.0 sparse
x86_64               randconfig-r2309-20261117    gcc-8.5.0  sparse
x86_64               randconfig-r2309-20261117    gcc-9.5.0  sparse
x86_64               randconfig-r2309-20261118    clang-24   sparse
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
xtensa                randconfig-2000-20261117    gcc-16.2.0
xtensa                randconfig-2000-20261118    gcc-16.2.0
xtensa                randconfig-2001-20261117    gcc-16.2.0
xtensa                randconfig-2001-20261118    gcc-16.2.0
xtensa                randconfig-2200-20261117    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261118    gcc-15.3.0 smatch
xtensa               randconfig-r2101-20261118    clang-22   cocci
xtensa               randconfig-r2103-20261118    clang-22   cocci
xtensa               randconfig-r2110-20261117    gcc-16.2.0 cocci
xtensa               randconfig-r2111-20261117    gcc-8.5.0  cocci
xtensa               randconfig-r2300-20261118    gcc-9.5.0  sparse
xtensa               randconfig-r2304-20261118    clang-24   sparse
xtensa               randconfig-r2304-20261118    gcc-12.5.0 sparse
xtensa               randconfig-r2305-20261117    gcc-16.2.0 sparse
xtensa               randconfig-r2305-20261117    gcc-8.5.0  sparse
xtensa               randconfig-r2306-20261117    gcc-8.5.0  sparse
xtensa               randconfig-r2307-20261117    gcc-8.5.0  sparse
xtensa               randconfig-r2308-20261118    gcc-8.5.0  sparse
xtensa               randconfig-r2309-20261118    gcc-11.5.0 sparse
xtensa               randconfig-r2309-20261118    gcc-16.2.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
