Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EAC20DD51
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562570; cv=none; b=r5L4KY1bBJaeXfBEVtRSF9UxSF/9LJuy6RZl4bUbHbnAEIcTYwtlVV2BSeePpCsp6lZqM+F/5V5kguQU37H5bZnWu/OKPCof91tEJeSe3yYhb3PbfzIaBMb1LxcEyDR0gRQZn0hEbDRCQ+Of8cUfQ3JfSswy6KxTDTaDdx7W2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562570; c=relaxed/simple;
	bh=islfIfaPCpJJVlPeF7hNFZdkv46SFG5LPv0jNQxUtvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F6uT0PU4CrFGr28dUBwM89hg2rMkeg6lWjH4KSg/VFaaknSy1iXFOV0Amqf65MQJxbEcKNRgMqm8Xv49AG+qU7GV6uHUAIRWU+LRuXH/ZrHuFLhZfafhuy4+gaVxkz/QiKWOoKMBeBwjCeeNXN5xh1VVo0OpbrNZKmSdYydOEKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwFHHL3+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwFHHL3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562568; x=1820098568;
  h=date:from:to:cc:subject:message-id;
  bh=islfIfaPCpJJVlPeF7hNFZdkv46SFG5LPv0jNQxUtvw=;
  b=LwFHHL3+efqx/qoTif8YdmJkUu+LMpraMDht8v3HyP2hTFB4KNNzM2sf
   q4u6rNnwB4bo6aB+GnGBhgZOxwWzY2Jd3RzhOYOdXRnkCy4dzbrQhvdSk
   WAcLYS+pt7RIht+mpzX+037xfGogVErnO8aQPiSt8e+a9PD7sc7nDY/RD
   3n26A+vZIiXmR0MoM4S71tSv6C92HoxZN6fnTe0sF2DAYH63n3eyctH9V
   d7rgAqki3UIFxAwBbfoW2e9yzCyzvphpleIKJMT1YJECrV1CrGpGJUCde
   XJmHgazTn/5lZeljKe9TJ33kRLwXb0KQoWmO5lAlXNkvOBzaEbfE+2V3x
   Q==;
X-CSE-ConnectionGUID: wwP8F+Q5SfOGwKdvANEKqw==
X-CSE-MsgGUID: Xp8lDMb2RbuIDJn0uhEurg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88007282"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88007282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:56:07 -0700
X-CSE-ConnectionGUID: 4haObHcwTgqgGLoLGQ0AaQ==
X-CSE-MsgGUID: qdEXFSUeSlOcx7k148TieQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="293659237"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2026 15:56:06 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2cpI-00000000AEU-0WwR;
	Fri, 04 Sep 2026 22:56:04 +0000
Date: Sat, 05 Sep 2026 06:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 d0344c6510d050ee79c6aa3997f2c641168ebf08
Message-ID: <202609050623.UcvzxIyU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: d0344c6510d050ee79c6aa3997f2c641168ebf08  pinctrl: qcom: Add Kuno pinctrl driver

elapsed time: 2369m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
