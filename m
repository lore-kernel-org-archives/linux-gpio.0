Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1424B049A
	for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 00:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838604; cv=none; b=Ytjc4bLPOyWjzH/BKcOdfArPomdDCzN48DUDKc3uE6cTbhuwJprCC1qLoqCCafnJFC2rRDrmNgmlWuFrPNrXlZVDRCU2+2wjgzxXFeskLLQKMY6HBJDWvMk9+nZS6tOyIrqNZx/gO4+XyekOPocU7EV7o1LmlvG9VQt2sqKm114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838604; c=relaxed/simple;
	bh=FlxI8kH8NFHwq4zSxJwn0F2HVGrpIY689kXtA9TPW0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlTZFjVGUC00XHv+cs/g7+Hc0uUIG3/9YhNbixUYRRTVaEAODrmHcFMDPAzRIkn4PKsDuP9mcQwSVe7flkEMAH+ch+YvKl09hLhL7sp0Oo0u1ICcU5bWlfQVipwmX0/0b2ujKjIWbOesR4lqepwyMTyJbBq91ZSR9zqbEYFZyVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKHDws4p; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKHDws4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786838603; x=1818374603;
  h=date:from:to:cc:subject:message-id;
  bh=FlxI8kH8NFHwq4zSxJwn0F2HVGrpIY689kXtA9TPW0k=;
  b=gKHDws4pZmCaIoHQn4ajmlf/9xIXo+JdNJd9hNzhm4wZkJRe1NE1iXVM
   s1FFHHFmRL+jgKA1D2ElPab5v+rXN9hAA0X6ykvIXdN+C3i4nP9TAj/6M
   dK/9uoV4YrMGO3Hv6WlDK4bPUyuHkjWM6i7aVcZd5JH5fkQ2MGRQAlj29
   ImXxf6lYDmuzmM5LXNqdyOBL1VA6eac2ECN6il0bHY63o3AAsPbnu9EtZ
   3G5G9cu8zcEly9qeh5YKvAaZqLUg1BStgCxAG5PrE2am6RyExX5kkI+Bl
   IxFPWu8Tza9/QhMJLV3JGAIza02D/14inm0/bZ12IBpGah86oJ4uH81Zu
   w==;
X-CSE-ConnectionGUID: iUDfxCD4T5e9R90Q0/++VQ==
X-CSE-MsgGUID: Rm5zAIfGQli/18y+jVY0NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87576676"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87576676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 17:03:23 -0700
X-CSE-ConnectionGUID: QBBXQ1jfS6WRAj06/toxRA==
X-CSE-MsgGUID: CbuVZaLeR0Krb0I0sALi7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="261283950"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2026 17:03:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvOLP-00000000cYQ-0vcz;
	Sun, 16 Aug 2026 00:03:19 +0000
Date: Sun, 16 Aug 2026 08:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 efbf4eca423d6aeecc54f63636f6faa93efb95c5
Message-ID: <202608160853.4pPFUIYi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: efbf4eca423d6aeecc54f63636f6faa93efb95c5  Merge branch 'devel' into for-next

elapsed time: 773m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-16.1.0
alpha           allyesconfig    gcc-16.1.0
alpha              defconfig    gcc-16.1.0
arc             allmodconfig    gcc-16.1.0
arc             allyesconfig    gcc-16.1.0
csky            allmodconfig    gcc-16.1.0
i386            allmodconfig    gcc-14
loongarch          defconfig    clang-24
m68k       stmark2_defconfig    gcc-16.1.0
nios2           allmodconfig    gcc-11.5.0
nios2            allnoconfig    gcc-11.5.0
parisc          allmodconfig    gcc-16.1.0
parisc          allyesconfig    gcc-16.1.0
parisc             defconfig    gcc-16.1.0
sh                 defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
