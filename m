Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25C3955F7
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851888; cv=none; b=X1LF85LONbsXTbxxKuvS4XhJYf7YDOnTPjXrVuH0KI+SmVAkyKD6Sy1YwHeC9MULLtnHhdbTzeGGdl6z89rO1185tga+ghS4T95n0w9fH7sbErmCDncMw9SCZ/Fp7CaQHElkjsC/8nYijcIYUaV9q8vIJmDvXLQQtKQXajnhTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851888; c=relaxed/simple;
	bh=3QiS82f6Ur+791gWlzVpkZWkkzc8VycPqJKZd0Fprfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BV0bI1h8SqEx0tR371C3+cn6dcgAOY6ih0mQX9ectQPqKY7NKFn0sQ+eAEhSa6fYa1rBn9Wu7FQ9e+cWCt1fHaLdNFhDPODmgWyjz0E5rJKox4Wcj00S7DY0cPBPm65x9F3Jn4S9kG7ujBeQt2tp8pm9g5jjGAsMKaXBg81wdx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCrHBBHJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCrHBBHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788851886; x=1820387886;
  h=date:from:to:cc:subject:message-id;
  bh=3QiS82f6Ur+791gWlzVpkZWkkzc8VycPqJKZd0Fprfg=;
  b=mCrHBBHJBi+VROhMav9b9D1Dihzj2rQvzhRbZwVDz44N1J+qVmFLzGvN
   KgMqXNXQGRyxkg6OLtwvoU4CM+RxAQKvKc6Lq7DjxhdH4OsuVXF+MRtNI
   +ME7s0QR3kIHHGzP7nlcqE7w8QODATpAaAjCm+h9krZl6wQ/sQ5uyri9V
   NSbzQzGLUCfQJrj5YX+Ix/M2AgVJR3rHvjI3GMBVvSHzbQfZQUWUscauh
   i+T8V4KsNFR/UiZb2sgyXkHzLjCP8KH3VPF4OJqlQZym2gUJSE41uVpXH
   0PBb0G2HZjPZDmL14cdgIH9a3XfUlDNRCIeHBJXisjt5n507fmPYDA0ks
   g==;
X-CSE-ConnectionGUID: Fv/czQzeQnaUf+QdI3G2HA==
X-CSE-MsgGUID: kijH1QdrQ9a65djLybJ09w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89262599"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89262599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:18:05 -0700
X-CSE-ConnectionGUID: wiBDUhhYRlm3HFRUFAoL7Q==
X-CSE-MsgGUID: 79nSxwBRR4Cf45Kmc/G8bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268338464"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 00:18:04 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3q5i-000000001nz-0ACQ;
	Tue, 08 Sep 2026 07:18:02 +0000
Date: Tue, 08 Sep 2026 15:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-current] BUILD SUCCESS
 818103dc7f5998a0d7957fb71d4deecdf4d579e1
Message-ID: <202609081540.CxKHS6Fv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: 818103dc7f5998a0d7957fb71d4deecdf4d579e1  pinctrl: qcom: ipq5210: Publish the OF module alias

elapsed time: 1332m

configs tested: 77
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
