Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CCC3BFE2A
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024554; cv=none; b=NcRcD0ef7cZDZAw4PLkx9wuBgQFynLAGOaRQROvNTEOMTjwyEEaAr/THSDeIjAWLLhM7fB9lKd22IEUddOnvZk+Ll6s3CyGbkT+FDYsuB7v3g935giFfwU6SVF7OOmET2j+3Bd5ORqoyeviHFLWyRfH91eUitzmmdlkmwDOm3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024554; c=relaxed/simple;
	bh=FQjGMXEAlp4fBFo5DS3c4VcSQMVEUCBLB3hyb1NW4eE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X4/01tw9EqUUoZVFESCbSFlZnG/znFqu7aAxCGL1QWn7XtKUiVzdYVV4Uy3h2eeY0p1EROAhK2/XnO7aMZrv7/vb1makRqmWn/0xQHsMeheAAEYeTVPa7L7GK3q1s8ct1qh14vB7VFG0orgtP0rf8/spWLqVGODs9hKt2jvjGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjD3GQXi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjD3GQXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789024553; x=1820560553;
  h=date:from:to:cc:subject:message-id;
  bh=FQjGMXEAlp4fBFo5DS3c4VcSQMVEUCBLB3hyb1NW4eE=;
  b=GjD3GQXiD0AZ4ij1GjnSOK3v+SHtW5eESjhF/O6oQZNrsswp2c6kEIP+
   /Ujbe86Ipce93TlKLAjsFA4zlSzij4NiKEr12aZHRp4w8cwgdnlurN0Ta
   ICaZOhm4EvZF8msJ6O1B4Fa7f8PTeIu4UcNPCVTwsRxfXKy44Yxw8gZEm
   P6YuXi1lo3127GfDsCXwJEkLiw5kzRYd1F0Te5N03aBaGB+K10R88O5iC
   zZ4c7ekk0u5ixyDB3qEukZ9PUNBY+5UVeJLlySH5yJ+/TEMjzJFCIB3Ae
   04LbZL50rdMt4+iEAiCCnGUqKPlmGVUoYRm6U0D/205B/hwIB6HPdaHoc
   Q==;
X-CSE-ConnectionGUID: 15iDtjPsT2mgqEsnG0smlg==
X-CSE-MsgGUID: Ru2pnB9wTj6xmlr4VqSi/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93156323"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="93156323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:15:51 -0700
X-CSE-ConnectionGUID: zYAWJzf5TxWOsHoDwbLgqw==
X-CSE-MsgGUID: e9ZlqHARSMyhCWJuldlKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="295046251"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 00:15:49 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Z0c-000000001WI-3Qci;
	Thu, 10 Sep 2026 07:15:46 +0000
Date: Thu, 10 Sep 2026 15:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq:for-next] BUILD SUCCESS
 935ecc5c86c5ae2693b2fbff83fc1bd086a9c915
Message-ID: <202609101520.OBAmqtKJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: 935ecc5c86c5ae2693b2fbff83fc1bd086a9c915  power: sequencing: pwrseq-pcie-m2: Support PCIe switch topologies

elapsed time: 1097m

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
