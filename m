Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937198;
	b=HpabHSI8BQBDjcOL7Nk4/kuEl+3BSBA1G4iVSvZDMkg6lF4DyWt5TAxvEzfI+Zwbz1hB
	 Bec7RDT9onTNI7jfqrh1swZudI62tUE7CkKV5wC7ZYrCt9yYFA5A8UQLixzzEewVj87P/
	 Y9tk6se7ST0GVV+UkmxtnzG6Uv0sYN/dhOWaCqf2vSl8eVQtkNg/i5iifWai6yqYv1xzI
	 NOnAtQNZXKwyZloTXZsscKMEXys1p+VRYckRbSrJM8Xp9xQJHxnflSLPkyA7qBUntLXBv
	 wlyNESGTSrYlmgXJgUuNt7Hni6SlD85l56k+lP5junm0XwbbL1l+otzfd9IBg0UNSrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937198;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=++wa9BUnoCwS7oPBuResrcQMiocCb3nc6ViqqEr0vzs=;
	b=jzqS6j/2MPBTR890J+0AvwVZ4ClvVGg8RaoVeh/hVWBwrIytHZh3zWgTblEtUBURbF47
	 +A3Hj5nN6nPsKR1DGth8khZS9eo4P0TzBddXW1k2HaULy9FrLEIfB+jazOgyLFwzvk4jQ
	 d9fGEsioqQSpkkfoL7hJKUb6qamT5Ouq+4/QhArQanknuvFqWwoFu9cUI1qWnoot7CfuI
	 bHLRNYc37ApK32yBCqLJ+6f3/Vi8/0A/J7yQ9XUowszsV1uGKZQpW1nFUFimJAF93fZDX
	 47UP1FaC3rfmm/J5+Ux9YyOGaalCvxjrOn1vTq33WUHXpieE9EWRhoyrIuPL5rgWjow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUNbfhmY;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551D606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 14:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D551D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUNbfhmY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792937195; x=1824473195;
  h=date:from:to:cc:subject:message-id;
  bh=/R/PDAjcr9tauRr5xaxRU/OfWMkMSOtNre7CLsKBNxA=;
  b=RUNbfhmYMXf9If1dqJSMAsBSqcNGkGySPftVfgo9mwIYHFteEXOE7vQj
   i2eZoib4rSXEIWrfRN4kYXuFj7+nExdxyMeciVR2qj6fstAG/EvAjEvAt
   dUf+WJOHlpLwKr/dDxck9HTMklC2mjXbvCNJz05X3UhK0NY8vKzOG9QWP
   DOmiomaBxDAdkjn/9bO8pwWfVExpFTyNScoE8IB1pN59xcOkqgUZ1qDYP
   0HfeNTEL0wk8Ax58l82mFdpZ+2Bv0UkFAdtk+HgjBz/XtHqXWh/t+6htc
   4WUGU05NHULL7qJIvzzTVuIenTbC9rY52Z3yF+TGzAOFYpWzFXaKeAzAB
   g==;
X-CSE-ConnectionGUID: 4Ny1cjflSlO89wgLj9bS6Q==
X-CSE-MsgGUID: /1dfNziRS/a8TE51h22dIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1496817"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1496817"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:06:34 -0700
X-CSE-ConnectionGUID: cbIOmCOfQtK13vsPBbTLLg==
X-CSE-MsgGUID: NSNQ1RFZRle3pJGXZ5jKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3996469"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2026 07:06:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKyrn-00000000UqA-09Il;
	Sun, 25 Oct 2026 14:06:31 +0000
Date: Sun, 25 Oct 2026 22:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio:for-next] BUILD SUCCESS
 dbc9f76c3ce301c76991574e1944a0d2a8717062
Message-ID: <202610252238.J8KxnNNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: dbc9f76c3ce301c76991574e1944a0d2a8717062  gpiolib: Get rid of not used anymore gpio_request_one()

elapsed time: 3028m

configs tested: 76
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.2.0
alpha                   allyesconfig    gcc-16.2.0
arc                     allmodconfig    clang-24
arc                     allmodconfig    gcc-16.2.0
arc                      allnoconfig    gcc-16.2.0
arc                     allyesconfig    clang-24
arc                     allyesconfig    gcc-16.2.0
arm                      allnoconfig    gcc-16.2.0
arm                     allyesconfig    clang-24
arm                     allyesconfig    gcc-16.2.0
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.2.0
arm64       randconfig-1000-20261024    gcc-10.5.0
arm64       randconfig-1001-20261024    gcc-10.5.0
arm64       randconfig-1002-20261024    gcc-10.5.0
arm64       randconfig-1003-20261024    gcc-10.5.0
csky                    allmodconfig    gcc-16.2.0
csky                     allnoconfig    gcc-16.2.0
csky        randconfig-1000-20261024    gcc-10.5.0
csky        randconfig-1001-20261024    gcc-10.5.0
hexagon                 allmodconfig    clang-24
hexagon                  allnoconfig    gcc-16.2.0
i386                    allmodconfig    clang-22
i386                     allnoconfig    gcc-16.2.0
i386                    allyesconfig    clang-22
loongarch               allmodconfig    clang-19
loongarch               allmodconfig    clang-24
loongarch                allnoconfig    gcc-16.2.0
m68k                    allmodconfig    gcc-16.2.0
m68k                     allnoconfig    gcc-16.2.0
m68k                    allyesconfig    clang-24
m68k                    allyesconfig    gcc-16.2.0
microblaze               allnoconfig    gcc-16.2.0
microblaze              allyesconfig    gcc-16.2.0
mips                    allmodconfig    gcc-16.2.0
mips                     allnoconfig    gcc-16.2.0
mips                    allyesconfig    gcc-16.2.0
nios2                   allmodconfig    clang-20
nios2                   allmodconfig    gcc-11.5.0
nios2                    allnoconfig    clang-24
openrisc                allmodconfig    clang-20
openrisc                allmodconfig    gcc-16.2.0
openrisc                 allnoconfig    clang-24
parisc                  allmodconfig    gcc-16.2.0
parisc                   allnoconfig    clang-24
parisc                  allyesconfig    clang-17
parisc                  allyesconfig    gcc-16.2.0
powerpc                 allmodconfig    gcc-16.2.0
powerpc                  allnoconfig    clang-24
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    clang-24
riscv                   allyesconfig    clang-24
s390                    allmodconfig    clang-24
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.2.0
sh                      allmodconfig    gcc-16.2.0
sh                       allnoconfig    clang-24
sh                      allyesconfig    clang-17
sh                      allyesconfig    gcc-16.2.0
sparc                    allnoconfig    clang-24
sparc64                 allmodconfig    clang-20
um                      allmodconfig    clang-17
um                       allnoconfig    clang-24
um                      allyesconfig    gcc-14
x86_64                   allnoconfig    clang-24
x86_64                         kexec    clang-22
x86_64                      rhel-9.4    clang-22
x86_64                  rhel-9.4-bpf    gcc-14
x86_64                 rhel-9.4-func    clang-22
x86_64           rhel-9.4-kselftests    clang-22
x86_64                rhel-9.4-kunit    gcc-14
x86_64                  rhel-9.4-ltp    gcc-14
x86_64                 rhel-9.4-rust    clang-22
xtensa                   allnoconfig    clang-24
xtensa                  allyesconfig    clang-20
xtensa                  allyesconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
