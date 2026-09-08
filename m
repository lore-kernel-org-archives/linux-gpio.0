Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1343246EB
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851887; cv=none; b=iGjI7s/QtSqeA/HqvEtn6w4/5FQLWcdG3tqdSMlpopFVt5Z51N6DQRJ8FNylAqnmElk06ZUfHzzVoCCQWA4f9NNH7aJGcEUYctCbs9Hp/Ml/MTUcZ3ny2BHkONADgE9X6XGzdr2ca4+zBnLulYQ0oqO9SoihTuUhXyIKuJMbsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851887; c=relaxed/simple;
	bh=x9ZZKc2fe4RqQS4/ZFmbxJlzkYm2N4tHyCzemh4wwKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EkZxc6wH9a7ANVGLykXl3Kc8tT3/KXFZhCqVQvsLtTOH8j8h2mSdb8jkIDtTGfdSyIZVzoL7DdcPaewAe2H8SGygdLcxZ9+buB13rNlxA0jnJBOKTxQNAweL/yDT0lcc1lQmjXnThACMTO7JT0RbOegz9zNtuwWeXmT9Y7Fdtwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMHf4Gis; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMHf4Gis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788851886; x=1820387886;
  h=date:from:to:cc:subject:message-id;
  bh=x9ZZKc2fe4RqQS4/ZFmbxJlzkYm2N4tHyCzemh4wwKc=;
  b=GMHf4GisQuXfAjv+RlZbZ6Mug6uey/wDQHzizkdpV7aBP6Run5aq2N3O
   j5MHiPFDdhgJrA6XMP6FiPOS1YLpiXfq4M7t+bDhQcicnhDC78z2EkYD3
   ojjSbo5N8rjd3moV1ykWCfuU9gnC1IffrfqfELDOq372bfIqTO5bzlJmD
   V96R9LL7XhuSJxoQxOYlEI/lD09UtHbfGzXqiKlJr88wMKSW2+GDLbmUu
   yPoI+ThXz7SelYoNBRgvvtZyQbKXOWLkf4ErnFbGlJ+yCWgXLTsKBvUAZ
   wDEWnnwN6V1LANeF6XWoCwPSGq0hotXe5mtKvHbB1a+8JBuZiFbSM1x/H
   Q==;
X-CSE-ConnectionGUID: 6HdNFUw9QZC258KeifUsiw==
X-CSE-MsgGUID: EeHoogtwS0OK9ZuaWaFcvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89170076"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89170076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:18:05 -0700
X-CSE-ConnectionGUID: 2A8K5Gr1SQ+Yv+NH+7uRrA==
X-CSE-MsgGUID: zxJcEsnvR8eM7nWosBsttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267668935"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 00:18:04 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3q5h-000000001nx-3Xc1;
	Tue, 08 Sep 2026 07:18:01 +0000
Date: Tue, 08 Sep 2026 15:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 4d305c2273123119c27d6e4c822215e650c451e3
Message-ID: <202609081513.hIfcnbPw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 4d305c2273123119c27d6e4c822215e650c451e3  gpio: mvebu: name regmaps to fix debugfs collisions

elapsed time: 1332m

configs tested: 77
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
