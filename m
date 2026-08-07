Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990AF42CB18
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786100606; cv=none; b=GN7zotSc8aka9xyf0QMwHxJr/59Pb8EPzVDyjcIFEPOgmCfY8xjNkUg0thWBVKgfImN2CWsWUpV1hZhC5Xnb/lBg7eXJVW1bXJu9e8AxuOKsoXEDw01HFI/saDxUaQ/B+MG3ZoouO/M1uUaXlTPVfPGySnS1A6c/Y6tLyrl7EDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786100606; c=relaxed/simple;
	bh=psDZqfW/eRrBXSKXUpYLi89rM4Jg69S8hqArA7KJl/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O1J7VqbGV+IxxitYoKgjVWPlLty/Uij5vNNawGNKgtcHdNCwQai3VxUozxAusMhS5bUAoOCpX8naCLZ2YuLzZFbU6e3n+YqfMLXpY4wHlDHc1S7/sfl3Yt4ElJdyauLm7w6mhJMVjh7ZCswQoUnB7L2VpuqRz2ESOLyTU1Oi+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg69n+P0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg69n+P0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786100605; x=1817636605;
  h=date:from:to:cc:subject:message-id;
  bh=psDZqfW/eRrBXSKXUpYLi89rM4Jg69S8hqArA7KJl/Q=;
  b=gg69n+P0OrjnxoGDAecRQlFXMrI1c0WNMnf4IHwuAVREtQJTswH3J7+T
   o7+/S1AVTyFoS5X1JwktBW/r048h6htNu9tb2+BhLq6obRkcplkO0CQaK
   DYo5aWPIVKesuaah7N0FsKaC+uJoqnvUlAzxE/mNi/pZPvdQs7A9yp58i
   j7mv7AA6vxF1vDLvvJjIySunHvVo/Xq99a9JmpmRGdxC7orzlhIYMo/6r
   TqlOG+TOph4yKoJ7iTuBgneZrjRLxsN4xXn0WWgAh8cznRr7nOQKy6waf
   E3BPC133M9ALjf/QRb97lbEii3nfe37cx1IPVj9Tp32Ig+ufbN/LhAwuU
   g==;
X-CSE-ConnectionGUID: F66/q2x7RciLgQi/vAvlDA==
X-CSE-MsgGUID: WKFHf0a7ShSNiueChDykEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86470090"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86470090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:03:22 -0700
X-CSE-ConnectionGUID: PszWBXymQA+ecut8bQERcQ==
X-CSE-MsgGUID: E0gJob+sTEKabuI9+TqNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259762783"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2026 04:03:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsIMA-00000000HyO-0dIh;
	Fri, 07 Aug 2026 11:03:18 +0000
Date: Fri, 07 Aug 2026 19:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 35ff52e54b38b01914be62ece27899665a46af56
Message-ID: <202608071909.ATvS8SQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 35ff52e54b38b01914be62ece27899665a46af56  pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2

elapsed time: 760m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha       allnoconfig    gcc-16.1.0
alpha      allyesconfig    gcc-16.1.0
alpha         defconfig    gcc-16.1.0
arc        allmodconfig    gcc-16.1.0
arc        allyesconfig    gcc-16.1.0
arm64      alldefconfig    gcc-16.1.0
csky       allmodconfig    gcc-16.1.0
i386       allmodconfig    gcc-14
loongarch     defconfig    clang-24
nios2      allmodconfig    gcc-11.5.0
nios2       allnoconfig    gcc-11.5.0
parisc     allmodconfig    gcc-16.1.0
parisc     allyesconfig    gcc-16.1.0
parisc        defconfig    gcc-16.1.0
sh            defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
