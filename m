Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8D37DE83
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 03:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407149; cv=none; b=ltsdvkJs/NMid6OT6joYSXwMw68sX8Agj2YdUbjLCCoppasR8Us4RV6EAQFhjONi+SdD9I4ui5ayxxWj8fYf3SvF4l96P2+2SrD7fcQRazSPPkeKfo5Zd7WOparXEb8BKmnKPyG5rUqWgVG+dpm1Tz4F1V5R5c2vvZqLzWd5fww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407149; c=relaxed/simple;
	bh=rW1S7/DaY7K210qpLTmrIcJw6cQxD/Kgl8ksLxcl6sg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=piyL3UgfA5DaCLbcEsva1jm8aQVA8frVXZhcYJGM013oElFP/nAxrbgXxaRTLigNJEhNy5sVz/nyZp+PVNF9PKKOSSkd5mFC7/TU+QuojXh8ckXXt5giMxHRZJsC5mbWAPzEjzgd6P6qBzgwPiwwCgbcyEmmBoKLOgR9RrY4bww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlMwcz0D; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlMwcz0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788407146; x=1819943146;
  h=date:from:to:cc:subject:message-id;
  bh=rW1S7/DaY7K210qpLTmrIcJw6cQxD/Kgl8ksLxcl6sg=;
  b=jlMwcz0DV8Y3ul0UiTFRRbecc6YXn8R/TN73skB4Om7lnNs2PzwifQFS
   yYbi5v1reUc2iMF6H94vDvcGlG/asqXrFWqAdf9PvQdAI/rh8yjtSL819
   ggTHugKXhFEnUNoboYsPN8vegFtLELTF4pdSJ27sBXc+H894Vlp66MBz2
   HUbz3lKDIuK4Y8Wxh+SAbXUMDtnZdaDkJ0YgHtZToRiOH792XyqbYds29
   SxO7hwBW9U47JlDX+sV5zkw5NXMh2TmE7KQYHcZarkijQXDlrIX5cYADH
   MmHH8yAyYlnWbCxVLrUcUPbY8hF9XQVNCc0CuxaY3CCxOVo5wT9Ptucz1
   Q==;
X-CSE-ConnectionGUID: xQVZ1HizTIOAF6BcYCV2CQ==
X-CSE-MsgGUID: Ey6J41tLSgSXhByZelpG1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100392397"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100392397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:45:45 -0700
X-CSE-ConnectionGUID: nj781B3LSPOuFGw60C+JKw==
X-CSE-MsgGUID: eKqHzHIpSIytqMajbMIX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273750680"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2026 20:45:44 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1yOT-000000003w2-1kxb;
	Thu, 03 Sep 2026 03:45:41 +0000
Date: Thu, 03 Sep 2026 11:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 6f168dea0db7bf35089a7fe942f1df6214464fcc
Message-ID: <202609031143.RQT6gSf0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 6f168dea0db7bf35089a7fe942f1df6214464fcc  pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

elapsed time: 2113m

configs tested: 65
configs skipped: 0

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
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
