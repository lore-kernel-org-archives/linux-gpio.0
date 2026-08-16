Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660D4B0481
	for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2026 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838543; cv=none; b=gNRshYOhedQcOtEsd+cDCnc/4jKk+Oz1XcAtWuAkrJhDDTl5W/w+O/QRRbv3ctWXaPTwnTYx8QBoYs2vFQ/szM9KjSzA+mVW7D7/VhzgT+g71T0VmyICmxQ5Iq2Fkc4FO25xTlDoktmeWD66UNWpCvl7P4bSKFADoafE/3w7QmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838543; c=relaxed/simple;
	bh=CVa+j+IJ09j70+vG4LbPecVZXajH6UGCzwuMOo9R2nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JEwbWRHY+Gr7YLKm7WPFvJuvjL9zO15+ODQ8jSQ/VqRNGWtS/qz2yrAfpqz38DZJmEiqn0sgOsy8mxfeHt522sDqU2qh1pBjk/3WaWJTU7uddVKQxUvi4iAMlv6KCTCosqspjVrowYUAZPHUpcur42Ohi15bY2XB6Lt6r4UHR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAY9s9R5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAY9s9R5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786838542; x=1818374542;
  h=date:from:to:cc:subject:message-id;
  bh=CVa+j+IJ09j70+vG4LbPecVZXajH6UGCzwuMOo9R2nk=;
  b=fAY9s9R55DfebNtz5GqfErwP+ehl8l9JFPuDEC2QcW5ms+/RYrssat1w
   AdaWWnnklyXNKxmqYJ4gho7h4KD35TjZJDJutF9S2cKUO1WKS9HU5c3R8
   4LCKaG4f0EnwUp5L2n+cnK/meBmF7h+ekDnO04Uh3aaiKf/eihPENkWDX
   8SObpCPRs2AfiRDBMUkIjsHTY48aNMfpleCY7/Aq2m5KZ6Ov+58V//TBR
   aVBsap9TDLN9yfuCTmRjMkcls6je9ko1pBniinxbgg+AzdQNHYbRR0FSD
   VZ8q/wX8D97a1+FX+qwhj/Z3iOGjjo7pfWb1jL9ZNNw2GbM1jwju0998R
   A==;
X-CSE-ConnectionGUID: XijAN5gdSt6peJS1wXOzow==
X-CSE-MsgGUID: bWUZO0SvQDSpH6jucwbFIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98727547"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="98727547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 17:02:22 -0700
X-CSE-ConnectionGUID: Ef6gKi9YSRaWVWMKC4PLfw==
X-CSE-MsgGUID: nx2SjradSbWgIdroRqyaTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="302795201"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2026 17:02:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvOKQ-00000000cYE-3BHp;
	Sun, 16 Aug 2026 00:02:18 +0000
Date: Sun, 16 Aug 2026 08:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 fc301955cf09564ab52af81e6aca14ed2a2ce335
Message-ID: <202608160837.wTFBntDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: fc301955cf09564ab52af81e6aca14ed2a2ce335  dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema

elapsed time: 772m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha             allnoconfig    gcc-16.1.0
alpha            allyesconfig    gcc-16.1.0
alpha               defconfig    gcc-16.1.0
arc              allmodconfig    gcc-16.1.0
arc              allyesconfig    gcc-16.1.0
arm        multi_v7_defconfig    gcc-16.1.0
csky             allmodconfig    gcc-16.1.0
i386             allmodconfig    gcc-14
loongarch           defconfig    clang-24
nios2            allmodconfig    gcc-11.5.0
nios2             allnoconfig    gcc-11.5.0
parisc           allmodconfig    gcc-16.1.0
parisc           allyesconfig    gcc-16.1.0
parisc              defconfig    gcc-16.1.0
sh                  defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
