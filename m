Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76F25F994
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502278; cv=none; b=cLCyz12qzlhw0B0Mfz4Y4EzHl6kHFDwSuo5R0wHAL6waX57Tz2BIVk21YdC2zT1hO8ARHnTdvzYHzgtpz2kNKgrBz9jeQDlBHTkjJ5Y6zZRqVFC2HBMtU1hGKhR433lfAumEq5RnkKoSmUuLIXJwrBhy51ucAVG/tJ72ZRwPrBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502278; c=relaxed/simple;
	bh=0xzDdtivaCG7q89sL+7LJjhdwcX9viAV9ymPZ9vIWGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dd9ReBujIhog/MUvNDn8apEmriSkvGp2tPLoGo/tNyI69o6cIAHj7rQD7ZozFHb8DzgGw8QLk8N94ctCmCp/BwtLBlG+9tZsu9bE6r8HTCnnTKjYLuBvFeAmc3MN4ClHQHrsy5V8uPYc6KgbxD7WeWJq4ah47eXe6u95Zkhq/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfbHi1Yr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfbHi1Yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772502276; x=1804038276;
  h=date:from:to:cc:subject:message-id;
  bh=0xzDdtivaCG7q89sL+7LJjhdwcX9viAV9ymPZ9vIWGU=;
  b=nfbHi1YrjCeD9yMRquSLr3GGXnn7HLKT//lyelus1AEFlrFu6QzEewaO
   hgNb8AEzJ/nBOFnkJrWVYKLLHCNjeZ2GODbUq3Sc0A6taS3bJpAveINNd
   xrMmy/mDLAc0YcxtwIdDZyvydrNFRTilUBksyaRTuN8F8KiTlOZzRMbBm
   fMZzh3PmynmHRExijc4iCII94bzLS09c7bblZAsaEU/m3Yh/w2374+P7q
   0Xr1dG4OC6q0EqAfwSQenq1oDlhHwgZFZpEyEIx6AordAkmtUadP2rxRH
   yMIa/WiG3UnG62mqtiqqjBY2zLz3cvOthksc9tLLTtSYJKDpN/zXqZhlJ
   A==;
X-CSE-ConnectionGUID: h1FWcSZmRKq/E21n1P+jhw==
X-CSE-MsgGUID: L773A9+sS1yXTV4mOOSKFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73567726"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73567726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:44:35 -0800
X-CSE-ConnectionGUID: mlK7INUMR1e3RlfDi6JiDw==
X-CSE-MsgGUID: oYCCFbTzTnGzTtizfpfWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222822708"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2026 17:44:34 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxEoJ-000000001cL-0tZE;
	Tue, 03 Mar 2026 01:44:31 +0000
Date: Tue, 03 Mar 2026 09:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 f08061d267d2061f64d514c1ecbe441a063a6fad
Message-ID: <202603030909.VbGjDp08-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: f08061d267d2061f64d514c1ecbe441a063a6fad  pinctrl: pinctrl-pic32: Use devres version of gpiochip_add_data()

elapsed time: 918m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
