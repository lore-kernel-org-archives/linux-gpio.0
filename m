Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699E372661
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375474; cv=none; b=lZWqugDcPmFrQwbGqQsFDGsLq6iRnwBiIHVuD/6QB+kds16SKxOgOnScsV8QecyABes40J1nN37LFPXyoWYbqedtSkCM5JccIMusPu7Ia7EL1hkyCDD6lsx3b2L2ND7tvjOWYQIY4KfXfBOeqvoJc+WLRixLeyQ5yKML0YhcNoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375474; c=relaxed/simple;
	bh=qmspGa3TKRNiQ8K+qDB/qB6I1/Fh/j26StECOpev51Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jl5svGO/t7y4D0d94iO58oL6x7m/4I4XDLDSlQiXmhSJTdDjX2+SSz4TLvXNjjy53Gtlri9iyY7So9BaFjuNVUQN2G0WT7E/XiKYvsMi5QOtnLNgJRltXt1eTCxG5U8465hR/eWX2UIBGmjsdgcVYMtFfBbdXb/G0k+r9NuZK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4XedjCx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4XedjCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788375473; x=1819911473;
  h=date:from:to:cc:subject:message-id;
  bh=qmspGa3TKRNiQ8K+qDB/qB6I1/Fh/j26StECOpev51Q=;
  b=J4XedjCxbrQPd9DPNT3qA6Tx8VeaDH67XGGdHM5byqkSnSWQPLjvtP8/
   VTarINiYqISrGYJ+H6WpBCO61VQbJ5F1IHdqp9cBXCr4BeWkEkqJge19j
   gXCpo0KWs1r4C0AiYx1E51Ar6wZ07Py7c1QrRcsqB8wRCc/MftVahGNeD
   MKNYGvFYW1gx5NoY3w12KMnqpy6Lb80luo8dMYjKFge91D+SKtvOlkrHI
   97CnaUaTYnBkNYv+2rNt7s6aM46dTlxWwiJW7mTbzfOFkfR3U31IRVblx
   iQU56xKQpgYYLEgB2v3eE3CiTHGT1Si+upNTkv4EwA7mjE7ctJCMbKhOL
   w==;
X-CSE-ConnectionGUID: HmMfA5VJQZiqvFKM51nGBw==
X-CSE-MsgGUID: d5b0ZlQ/RNuutU9F+abOEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92712801"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92712801"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:57:50 -0700
X-CSE-ConnectionGUID: 9tRxU0oURVuwgK6AQr/iXg==
X-CSE-MsgGUID: UdJSlMiARg+WbAkNqveZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266894886"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 11:57:48 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1q9Z-000000003Am-3SYt;
	Wed, 02 Sep 2026 18:57:45 +0000
Date: Thu, 03 Sep 2026 02:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom:for-next] BUILD SUCCESS
 6f168dea0db7bf35089a7fe942f1df6214464fcc
Message-ID: <202609030253.huHqEfK7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 6f168dea0db7bf35089a7fe942f1df6214464fcc  pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

elapsed time: 1585m

configs tested: 65
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
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
