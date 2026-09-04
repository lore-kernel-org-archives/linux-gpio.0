Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62B3876B2
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562572; cv=none; b=cb8d4fy8UIDGXk468X4b8htOi4hpjHm01JHJrZzV7y8puRrCt3pu+uVl/9s+tQ0amFDp37M+sRbpNUnLC4nmJdWTJwa4IQukiq6FRWV4ZOwzuJnfC94XUPDWcMLh6ssL/3RW7FlMP0j817vuM3GMvavP5Azh6ViAlSj6gli77Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562572; c=relaxed/simple;
	bh=VZI3LzYpzT3/6+/FLGZho79dXt/Qq/2a40qtUT0mQOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wgu+ehFf3NVfxTmpv+5vNtgPk4zPDacTUGKRJWWj/guZPtLrfCPqUWrGA45PQ4UYm6x7ZIIFlyvrkVB4ytvjUCxWr4ksEkG4dwxJMn7KEO8AlyWHm1mrWQvjPlu3bpehPw9Smw7YS3jk2J1EVQvGH1jVxXINpijW/wWlQTRPPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTzBp/JI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTzBp/JI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562571; x=1820098571;
  h=date:from:to:cc:subject:message-id;
  bh=VZI3LzYpzT3/6+/FLGZho79dXt/Qq/2a40qtUT0mQOA=;
  b=OTzBp/JIlX7BOr/RhYXZjTXNenyi4VbChAgjgOxofmFfZ2zGxvzcdoK+
   2wHkuchBMOEK8QR9S7Bv/+4bizYITzjivkF5SMp/7jolEkEZmbgkgAZ/F
   zQSO59opQwID9IN7v2pSAkU5FQu9LNOokdvG7vdF476k0rfAbgD0/5439
   ndZzSu2fIWcjzY30Nb/smKoNqO9p7Ch8pD3OZqV9Q43J9YCPMhBrteoOl
   mKM5jm/uoM9kvh81Kq/OIAfYTOJU3rg/vHj23B729UmQlpbHYu+7aDqRd
   l8vCasaHHQj7x4zmgbNBvYa3Sq/0N3wbEpcKX6HynGLqVjg4qSBChYOEx
   g==;
X-CSE-ConnectionGUID: 8Cd8DpIaQBCxnVlNtRMtqw==
X-CSE-MsgGUID: TuxJKSdXSpWRVLimj1/B9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88007284"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88007284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:56:07 -0700
X-CSE-ConnectionGUID: qScyOugPRs6jahg9EWhudw==
X-CSE-MsgGUID: LPOB8LbRQ1+FObAUt02OGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="293659239"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2026 15:56:06 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2cpI-00000000AEW-0p6W;
	Fri, 04 Sep 2026 22:56:04 +0000
Date: Sat, 05 Sep 2026 06:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq:for-current] BUILD SUCCESS
 3b54dbd119805361695cb50ca6a875f4c7518b74
Message-ID: <202609050634.B0rY2elX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: 3b54dbd119805361695cb50ca6a875f4c7518b74  power: sequencing: Fix build issue with COMPILE_TEST

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
