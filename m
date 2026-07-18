Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E1525B0AD
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342739; cv=none; b=YAkVZdbJb6BxJwA+ENzvY3K0aQGI1ouAYJ0xTtWPOJBzp6LBic8G/8PFEq26/3jr9lf8XyPU1hZrIKfZDPHW+Rah+sQEOm2RwFlwbzMe9J+LkzBV5TrZpLf0oTksIK5HJzUkhDjDZgsmD/IjDGujUY38XFdwCSw/o3SQDmfOfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342739; c=relaxed/simple;
	bh=pg9bddlaEe+AQxzoNPbsjYm/Sjc5l8Sf/cTRySJy7Ds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DhDFfNFzLQpRTk93JN4RqCRiBswjLOlDVpye6VmZJwcSHdFPK5+7kdAMv8zjvQj9lO23Fm3miQ1VZHSYPUFdIf0TRtubO6lGfPyDCnbIW/E+/n+pp+a+3A7myWALNrDcyfyNVRNOvntAM/FTOLrStU+tVtJMLy/mvFmv0l7vPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwMQGlOO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwMQGlOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784342735; x=1815878735;
  h=date:from:to:cc:subject:message-id;
  bh=pg9bddlaEe+AQxzoNPbsjYm/Sjc5l8Sf/cTRySJy7Ds=;
  b=hwMQGlOOU+l9MSW2p0V7cJK2UX54teNmSIbaKpGXFR6Qu74UIE7P1Z2J
   lnxBKqfm7kkXsnPfvWrS5p6qRgWAoFnpx7ZUyedJneEwQ4R/wzWS+X3KN
   iEd6Fehvr5c7qYx9YAASIQJxE9f7SvyavzO3w/JxlPcq0a7OWgaPzTByF
   OxyzrNyzQOr8cyYJrUfZwX5Yu/srg5cbSTvUHdwoUh40ZARu+mLcJ0mYS
   TIN29/Rt6eY2NXResRN7TLMAwEbYklBlz13OnfK7ygZuvQWEOyZx46FEy
   nEDcLEGdDD3uVszto/9Bu/PQfetAfxLbnIZKijCJmv/tpXnoQhO1vZ7vT
   Q==;
X-CSE-ConnectionGUID: YUzkcTcySRavn4URU1n8eg==
X-CSE-MsgGUID: Fv8tkuoGSji6+xjz0ytu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84963782"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84963782"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 19:45:34 -0700
X-CSE-ConnectionGUID: Zq80ID76SnCv8o1xWT1FZw==
X-CSE-MsgGUID: 8KdsPjeFSE2910YnVBDu9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260506426"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2026 19:45:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkv3S-00000000TOd-0Efi;
	Sat, 18 Jul 2026 02:45:30 +0000
Date: Sat, 18 Jul 2026 10:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom/for-next] BUILD SUCCESS
 82c3edf8701154e2768973ebd4c0d2f3bd29621e
Message-ID: <202607181021.L7ukOxqc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 82c3edf8701154e2768973ebd4c0d2f3bd29621e  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

elapsed time: 1985m

configs tested: 17
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
alpha            defconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
arm        u8500_defconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
i386          allmodconfig    gcc-14
loongarch        defconfig    clang-24
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    gcc-11.5.0
parisc        allmodconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
parisc           defconfig    gcc-16.1.0
sh               defconfig    gcc-16.1.0
x86_64               kexec    clang-22
x86_64        rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
