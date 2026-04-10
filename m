Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553198C1F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828505; cv=none; b=eImvtdgw77a67lrFftVPQF5t7oe8jh7ZUDc1YFw9FuSuXRZMT6kpp76Dgp/JysHsBNvXIrrHpMtYeELfObjJ6+6vvzhxEbrHBK04IIv+dt7lHPQtATtTt3hXmgHjMNUGVoNqZmKn2vEuuWxAQbslDo7TxfWOTPLeuQOSD2zCAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828505; c=relaxed/simple;
	bh=7P6nz2nAQUJtRRr3bL1WPs6uOzDtXpVigTEJZIKHnV0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sWJfm0subhuhjWWqiTtlG1SRp623JmOIosCY6wnmtZEwKaOQQCl4immueNPSaoL9U1fzNjltO0GdV2+mOAjrCeT8hfsRQmCElFWYnhfOmn4iUcro2idTw9wCoIYDadsrSA6i/FcFo/30bciP1DtEPTa/jU6ffoPNLLK8rnR1gNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Er9zLfS0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Er9zLfS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775828504; x=1807364504;
  h=date:from:to:cc:subject:message-id;
  bh=7P6nz2nAQUJtRRr3bL1WPs6uOzDtXpVigTEJZIKHnV0=;
  b=Er9zLfS0oanEImVswiezyxTz+GQySPKxBShQjx5++wmIlemv3e2LdhHk
   UeE9SMlKGV7Ty9E/t9092ErCZj5BAC2JYGJmjhJQraz1YgDQnQPqG5zF6
   Ck8gN5Bl4MmP+hzlwoyGrsXnMplh68h5uIMdVHSKa5ee3nDvVQBRddqHt
   eXWnObH8pyFWRaUlwvCkhZMRqX1kvt6nSZPm+8XbeEdM9qe5hZ0FAbhS3
   p+pRD6BG9SozXzrZWyTVsn51Ck2qexClLZq9XEB8Ea9R4PGuj8RC/CFyU
   9uvoLQbv4YpF/86YGHVZOfx7kfTpEsBQeW0bMa5F80n4idZiyOCFA0jT3
   A==;
X-CSE-ConnectionGUID: j6ehntYPQiaoJZcwRkmpKA==
X-CSE-MsgGUID: /vULy8jCSqys0w+SHkOmxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102304393"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="102304393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:41:43 -0700
X-CSE-ConnectionGUID: NprA7rynQAurl9RUnLzcIA==
X-CSE-MsgGUID: Uqd0NApuQV67PK31iG94HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230812275"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 06:41:42 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBC79-000000003mf-34d4;
	Fri, 10 Apr 2026 13:41:39 +0000
Date: Fri, 10 Apr 2026 21:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 5/5] ERROR: modpost:
 "pinctrl_generic_to_map" [drivers/pinctrl/pinctrl-generic-mux.ko] undefined!
Message-ID: <202604102148.hRtBBCXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   62f97854fd4bf56e5eb15970787aa4125ea912cd
commit: 62f97854fd4bf56e5eb15970787aa4125ea912cd [5/5] pinctrl: add generic board-level pinctrl driver using mux framework
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260410/202604102148.hRtBBCXr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102148.hRtBBCXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102148.hRtBBCXr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pinctrl_generic_to_map" [drivers/pinctrl/pinctrl-generic-mux.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
