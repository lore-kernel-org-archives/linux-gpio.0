Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F2625B0B8
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562569; cv=none; b=nrtAWq6Dx4Knlo79XrkbYuS00zdB/kau24ZsTMawjrgyGSXrow5eS6si6U5yYrq54gU6RwBXnm3fRs8tc6bNpYcTLJhOA83Hdw9RPNqkqDXyeAIR0rQrB8cNPPCwwEcNMl1rYlQL5LPz2EwRmxtLzclvQJMXGmX3EGpITMhvAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562569; c=relaxed/simple;
	bh=wQbOZlOCfdfFx4A4KwoO3NXyqVWU8K47akLZ9fvLAA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UXv3WpcBl5+4C+CtuPrFlN3RffcRY3u0YziGpt8NtJsTaR5q+yq35HotlwqBXf9DcjgMDu18TTa9AZCjyMbR8enGizzVYmIdReK68xNtaTO45Jy9M+FsGTuczjQKXOCzfpYVuYrmQirNTcHNZt4vb0vVXtVxuCEGVQX3ZWp907E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJh6sM+f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJh6sM+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562568; x=1820098568;
  h=date:from:to:cc:subject:message-id;
  bh=wQbOZlOCfdfFx4A4KwoO3NXyqVWU8K47akLZ9fvLAA4=;
  b=EJh6sM+fahpGMRpDTL1DGOt2aM0IeDkUktTHQRZ+x0Dkip4g+FCpUDIt
   YCG1T3a/UxC8Jz20qI1PtJAKc3Tl3Uo93eDL/eI7krpipgl9edI0e2JVH
   4FEUJXT9LGiK9qJEgx0CalgzXM7fXm91+yPkkGNQcubixSGjjrcc2ivF0
   BXIHLFH8ksMobqev1FffeNUaAl2Ulg4IyQN2rEVmBhniZXMfszWg+KL/y
   k8x6KWunJj58aL8TSS4MWDlv/MaMnmCornmbtfhXG9RyYPoezTT4hdr9o
   L8fTr9DDFCOfDd7dyTfbwPkctZ4LY+lc1ry3fdLQMjOOz4nE/+qjW9WLB
   Q==;
X-CSE-ConnectionGUID: t8s6e/d0QfKh8MI04Ar/pw==
X-CSE-MsgGUID: 7rUt8i9VT2axmhdok1pxUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99665399"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99665399"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:56:08 -0700
X-CSE-ConnectionGUID: m3/bm0GpT+mvoRfoHuVg2A==
X-CSE-MsgGUID: /XYsxaXYQ9uxQ8UochDVgw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2026 15:56:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2cpI-00000000AEY-11P7;
	Fri, 04 Sep 2026 22:56:04 +0000
Date: Sat, 05 Sep 2026 06:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq:for-next] BUILD SUCCESS
 3b04e9b8056e868c3e9a04cc74168c7c9a18746a
Message-ID: <202609050644.DAHeahsg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: 3b04e9b8056e868c3e9a04cc74168c7c9a18746a  power: sequencing: Add Renesas RZ/G3L Power Ready driver

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
