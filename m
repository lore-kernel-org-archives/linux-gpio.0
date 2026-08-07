Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C83E0C75
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786100604; cv=none; b=hOxL5gDhX+ufD3FZTI4qO9yvfD3tXwrV4brSqq44KAXd39oBTkzFXkMzCoWEq7n6bHDev3d2DrfTKVQKLRubDtDRQR0mLzsVCu8/N4/l/nBZ3F9DBGmc+jN4nlApKz9X67bjQpmpuBzRrVXBjDCovh0E3pwdihRlzgMPeXblaMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786100604; c=relaxed/simple;
	bh=LbTogPuqipWMcCwOqxhNNCXzKvryMVjaHDE68JpBxcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lmh++YE7cvuVcAGhJNy/pn96ofDrXqXGBVWFRLz1PD/rILA1uHjmaTAaQ1eG/N4/ziwNHCgh8xHjq9W5B5iKrebmVnLk7dqRShnZ/0DPgwGLUK5TtF/+bnK+rf/QR3uu11rJXiDV0zumbZHcgr2l5bvOhf1xsVqBrcXiiXnRnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljABfy3S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljABfy3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786100602; x=1817636602;
  h=date:from:to:cc:subject:message-id;
  bh=LbTogPuqipWMcCwOqxhNNCXzKvryMVjaHDE68JpBxcU=;
  b=ljABfy3SB/tkvbfPBPjuXrZrHYOWsYW3eDBu9q3x/sG4BhvZY4XZ5a7/
   N91/Srwz3Dj1qwaEwSIJ8r3/6ahbCLSLnNAkN7Q5EorQ7QVMdFCoUMvYP
   WGYUmmOEtHnQcm0BSvHdYwPXLyh/AZE/XfbV3XhkMl9aTBFPEKxNfz39Y
   t9+EO+KarxIXhqlUOOQmFzS1nld9IcgDEn2o7mcTO33k/tV+k5I4v3QBq
   ajbSxteKotQt7H3uyKhsVm2QQrx7Fyf616bc2DH399LbY2tdRiDKTtbju
   gYFciG/bgKOGrur5zguXmqdvSfzKp+wjvuahcf64TiF4J6oN3ELdQM320
   g==;
X-CSE-ConnectionGUID: rscLmvHwTsmMx3dLQ0ntPA==
X-CSE-MsgGUID: rt6fxmnqR8SNV/hnLHcdCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86470088"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86470088"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:03:22 -0700
X-CSE-ConnectionGUID: hYR9tut5QhOns9+pzObYUA==
X-CSE-MsgGUID: 1qgA5IKyQXOPlqHqszuzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259762781"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2026 04:03:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsIMA-00000000HyQ-0jwM;
	Fri, 07 Aug 2026 11:03:18 +0000
Date: Fri, 07 Aug 2026 19:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6eee1dfebcd52938ffc6668327e1d2fe8eb299c5
Message-ID: <202608071925.PAJPIJLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6eee1dfebcd52938ffc6668327e1d2fe8eb299c5  Merge branch 'devel' into for-next

elapsed time: 760m

configs tested: 14
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
alpha            defconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
arm        sama5_defconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
i386          allmodconfig    gcc-14
loongarch        defconfig    clang-24
nios2          allnoconfig    gcc-11.5.0
parisc        allmodconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
parisc           defconfig    gcc-16.1.0
sh               defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
