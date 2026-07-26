Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320B31E820
	for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785050433; cv=none; b=PfvlpZw/rJtUnWXfz3Hflwqqklz/F2kWWjYzfBPTIYDnet3Lpyb+ZJopZLyb/hgQj5iAPqo2ekfcFdGRSQWamlospnxqTuFQDvQ6t8kJnP5iu0Suh4kYpmH9nqehc+Wetm7g6ymFhBByvEet7RviqZ4rFs4hOAQJQwjI/seKHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785050433; c=relaxed/simple;
	bh=Ur5PxJP/TUXEarCi9o/CoFoXpiUeStuwi9SbZgR55Z0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YnhkS25xU9X3CJe56Yi7sPcBXjS69rg1i+dgjaYX/iuDcl+HyonATcM0QhhRzZlVbAZ3rXT5vJsbcCHg7pg9J7hv7TlGQ1MmpYPexeBE/wsfnTrEsitQVQrNkBMHGGsOvRAYfzC41vA+cIsQY7mK2+sAFqduug3Nenn8qbOwSvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFcnRkD0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFcnRkD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785050430; x=1816586430;
  h=date:from:to:cc:subject:message-id;
  bh=Ur5PxJP/TUXEarCi9o/CoFoXpiUeStuwi9SbZgR55Z0=;
  b=SFcnRkD0s2vCR4mVkGkRkVZhutsDmwc132uwz4USn9V0SjaOkTwI3Qux
   VEBKtTqr+sQt0absxIrdSwSeOLWUcS0Re0h5hG6JUij/dAud6ubfQUWLC
   jKqVBp2PPFDXgR7VViOBK7nMY5Sk/O6R/j49+LBeFjzsWKKH341kjaMGe
   /aV4SqC2J6qGyyEMoc0ZrjPpxaDLqq+8lhxBOmzjPyR4mnbhIMCZBZRv3
   r+kTRIXHsUrAA9pfUk7AH33/jirtZ3DfTTHg3oOtqHkMNQjmLxnJojjgC
   fzU3Wz+qYWeo6hK2Rgnsnn8JWyltEpb8xcV2DW4WyS3XQFfNojwHB9KM5
   g==;
X-CSE-ConnectionGUID: QxYvR5dLTQWBB+wJJMxPVw==
X-CSE-MsgGUID: liyH3uVuQIywFNgNcGOvZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89542333"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="89542333"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 00:20:29 -0700
X-CSE-ConnectionGUID: yJoHbRMKQTiPLVjTARbrPw==
X-CSE-MsgGUID: 8GmGsw3DQ226qrLMbkFzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="257335334"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Jul 2026 00:20:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnt9u-00000000cND-0jMk;
	Sun, 26 Jul 2026 07:20:26 +0000
Date: Sun, 26 Jul 2026 15:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 478bdc3ad3a2cadd9446ee6500aa93b529185ba5
Message-ID: <202607261526.KwJzDjb6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 478bdc3ad3a2cadd9446ee6500aa93b529185ba5  Merge branch 'devel' into for-next

elapsed time: 802m

configs tested: 27
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc               axs101_defconfig    gcc-16.1.0
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
loongarch  randconfig-002-20260726    gcc-14.3.0
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
s390       randconfig-002-20260726    clang-24
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260726    gcc-16.1.0
sh         randconfig-002-20260726    gcc-16.1.0
sparc      randconfig-001-20260726    gcc-8.5.0
sparc      randconfig-002-20260726    gcc-8.5.0
sparc64    randconfig-001-20260726    gcc-8.5.0
sparc64    randconfig-002-20260726    clang-24
um         randconfig-001-20260726    clang-24
um         randconfig-002-20260726    gcc-14
xtensa     randconfig-001-20260726    gcc-8.5.0
xtensa     randconfig-002-20260726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
