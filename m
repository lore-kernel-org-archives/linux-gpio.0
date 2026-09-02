Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C53372661
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375471; cv=none; b=mGGWY5Izouc/G0gnxJXM78nFsTwkilEnX7hEwVoW/F/WE9G1Gof0qRxLmgx1gl9Z5jcRIStKSexu/HnR4zhtK7jPKoS2yEo0K185fIOTi+J8/mC2sMGPTpeB17RIDSCZQEejAwcfto0srURlz2i974W+VR7O3HV5+BvJZ6aohAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375471; c=relaxed/simple;
	bh=2SbpxfydiP5k8oDBH8RDAUx+CqDaMzqQfoh4SHMZJsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rml4KbUBn8p1R1eXJ/YAAb99J+hkURqwjiYCV7Y2ckV8As3wUCKedbkzXy/FfTorU2PXAWvroOHD5FjnuDjuDWqNssfeKdHfsBk91b5U0hJ7sri5Jt9VU9BMgnEyq60ZmVQmLtEyKFuhD8syovR5CvI6jBDVBWjA4FQUakFXWU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7IyCdhr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7IyCdhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788375470; x=1819911470;
  h=date:from:to:cc:subject:message-id;
  bh=2SbpxfydiP5k8oDBH8RDAUx+CqDaMzqQfoh4SHMZJsA=;
  b=l7IyCdhrF4iqU1xMkMTOiPF10OdGJohA7mBhtcr4zT34/gctGgQaYWc2
   M74Ctes+6bm0X/VxLUOuH81AuN1Lz9w2xevVBClYYD+62Jx/00rF47fLM
   NSjZWd87anXAI/WBKrq2Lt/b3Oe7MwiIehG3yK9Md5ctVC1w4Ne/JuS+7
   YTJg6Vp/XeGv0sS2j7uS0lroxK6W5gEiK61fCiL159y1KK89f/jUPDaVR
   qwe1pOqMc1sN2vXNPc2TcVIeA7Mm6EJ1Os8ylSnJoIOCjAS7Ny+gRu0OM
   tJiyrndiYgaa/UVoxODWkX1uJgLub6JsU0o5GmqWjXLY7t2laEIzfRC0I
   A==;
X-CSE-ConnectionGUID: F4rlOashQs+oMH8xdakP/A==
X-CSE-MsgGUID: ILz5VSk6R7qYF2b4oUmX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92712799"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92712799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:57:50 -0700
X-CSE-ConnectionGUID: EOpAzwSNSbGs0e2bwFF8ug==
X-CSE-MsgGUID: 0owHkPPSTdO304bHzBEh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266894884"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 11:57:48 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1q9Z-000000003Ak-3N0v;
	Wed, 02 Sep 2026 18:57:45 +0000
Date: Thu, 03 Sep 2026 02:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-current] BUILD SUCCESS
 1f1d0812f6a8ab8e6f709c599f137c99646512cc
Message-ID: <202609030218.pQGymF4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 1f1d0812f6a8ab8e6f709c599f137c99646512cc  gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found

elapsed time: 1586m

configs tested: 55
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
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
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
