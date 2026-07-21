Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39874582C8
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 23:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675627; cv=none; b=LZdZrnEHh7J6GceIBBX78u1Xa21LLX2XtC7HJtNIAn7BllBZwGrCbSeag60S4bO8ak2YZb4HV5hJ1bChLHKUd94lkCxZCb/q6L8B61tkqfdSq3HzzJ1CsT2tUbDQxOwsAItBzwW+jdfJonWmSNzjdIjXMNErOdV4ZDIpvXV9evI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675627; c=relaxed/simple;
	bh=xdz6KXDFzyiD1ZM0Pw7xwgOjXuwQIl9y2vTpm+fLvhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=njDhQ9OxfNHu927yHYMRiEU8i8ipJ69jdCDNeMn5Z+mSrVgzbncj7l9z64aTVqREtQH/+DUHtuJ6WkPnuIKUcInIJuVGKYdiRuOr1nZOSWzU8XAfLeUnrcXYCaXIM5NxJkJ1FbvwmM2k2NjcGYdFyRPUqiJEZRBZY4CBYvQz06A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htWAE9wC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htWAE9wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784675624; x=1816211624;
  h=date:from:to:cc:subject:message-id;
  bh=xdz6KXDFzyiD1ZM0Pw7xwgOjXuwQIl9y2vTpm+fLvhg=;
  b=htWAE9wCXi6P8WeJL+Ro/6ktveoZB0cdhBVvQKVV84XDGAnjHNN2f+XM
   A8a5IxUTb6BvDS4ggxD0RC6IBKj+/1DCS1BE9Kzk5tHrwqAxWdGYnoZ7+
   vcge+SgA2UGbM8rFPGQ7xcz/RsaIwNjWauxk0D/ExP0yaYOeqmZTeABWN
   1EVkCVASi2TdQGuBXJEdVGMzy6CnsxIPKsPKjQcZ8jxskIyKSpPttKJ9o
   fvwB1+xvjTGszaiQkiK9yhLRkLekbqnDmwosgHk+SbSGm7faM6RPNl+Dr
   avv9ZKlOzN2poKQwk0HIvQEcM5wjn5Dlsins6JXCDGGrMf0AjsG4lpd8N
   A==;
X-CSE-ConnectionGUID: SCSVhUdARI6LZ/gFRyaS5A==
X-CSE-MsgGUID: c8X3SqyjQ1SOpP5N0ADcNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85169936"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85169936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 16:13:43 -0700
X-CSE-ConnectionGUID: ESIueY2jRi6k1hVqOaHaPQ==
X-CSE-MsgGUID: FgDa2HGBQAS+FBWx7Hqt/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="281179513"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2026 16:13:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmJed-00000000Y97-21IN;
	Tue, 21 Jul 2026 23:13:39 +0000
Date: Wed, 22 Jul 2026 07:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 9672edf75bc7ba3fb5b7d529936548de38b5908e
Message-ID: <202607220740.e8uLmRmo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 9672edf75bc7ba3fb5b7d529936548de38b5908e  gpio: kunit: add test cases verifying swnode devlink support

elapsed time: 1835m

configs tested: 15
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-16.1.0
alpha       allyesconfig    gcc-16.1.0
alpha          defconfig    gcc-16.1.0
arc         allmodconfig    gcc-16.1.0
arc         allyesconfig    gcc-16.1.0
arm     ep93xx_defconfig    clang-24
csky        allmodconfig    gcc-16.1.0
i386        allmodconfig    gcc-14
nios2       allmodconfig    gcc-11.5.0
nios2        allnoconfig    gcc-11.5.0
parisc      allmodconfig    gcc-16.1.0
parisc      allyesconfig    gcc-16.1.0
parisc         defconfig    gcc-16.1.0
sh             defconfig    gcc-16.1.0
x86_64      rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
