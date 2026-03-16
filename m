Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F1226A0C7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663784; cv=none; b=WKp0V5ZgZIiV388sXQ3gTnCXtPcAtq2exQGxsna7tURj65rhmKLLuocXo1TK06kURuqtwLuEmdruBeJk3CzaZYgMjLaB/dh9ovttIZyrcaQkRdX1M6eWd3Ryh+yYcsqIVZeMOHJ8jNVL02V2ZwnCvqwXBzwTdGaGALae+09EO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663784; c=relaxed/simple;
	bh=ee9mcvjsKDMNJSDrjdCRK4iF5zD9JpiraU31g4vsD8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oXNN9BWBDPJXEN9JQcKqX+lkmtcB100CD528Tp9XVgQTLEUOjK4K8TTIWE7tP3Up3zBshzqrNmfvlsWJw0/0KWgnEz1VTZixNhXYG+DN13ZqS/QLnMcHqy4w1INSRit+10G0x4a5b5dbOa24xDkSm1kZzGucRA08gHBQqb4qScI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljQGM4V/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljQGM4V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773663782; x=1805199782;
  h=date:from:to:cc:subject:message-id;
  bh=ee9mcvjsKDMNJSDrjdCRK4iF5zD9JpiraU31g4vsD8Q=;
  b=ljQGM4V/5Pf5yD5b9MkQLNnBk2geOEcmj+grGZAQTele8/jhwcBFHOX1
   4E1WGqKVkbIkSssXgQJKvipr085MhSFNixUcFy/JJLcwCxdOJIlIk0SSH
   4Jbx1t7cWuIHDxqIociRrGHOX2uUWaWsQ5MNMq3d2GzHVJgskjGWhV2LT
   2afQIRCTCqZ/QPHjgydkOO/ZjKoAajpvW6nWbqXfcSzD/1M7mj39gnFcV
   e4QUCi3c2/uwHqJqm+DZbZZRWJL6j+ZQIWfmx2sZkOUNvbxGUZIZFd8XU
   WjWaepWSVaurnd23RZXyv1xpXHXqAKngp/PdGCKsQKlNdVomGp1Z52IPb
   w==;
X-CSE-ConnectionGUID: h6ftnU2STXalvGvpzRb6tg==
X-CSE-MsgGUID: ajyogBywTii7WpgmX9KqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85758216"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85758216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 05:23:01 -0700
X-CSE-ConnectionGUID: JsXzaT0PTouHjWITsqNiPw==
X-CSE-MsgGUID: HYuJrm2hQ5es++k+0i2xow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="219106278"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2026 05:22:59 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w26yH-000000000eG-0gws;
	Mon, 16 Mar 2026 12:22:57 +0000
Date: Mon, 16 Mar 2026 20:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linusw-gpio:b4/descriptors-wireless 2/2]
 drivers/gpio/gpio-ath79.c:264:1: warning: no return statement in function
 returning non-void
Message-ID: <202603162011.BYf9zG1R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
head:   f498eb811e7dd7b968743a9bba20710a5070c0be
commit: f498eb811e7dd7b968743a9bba20710a5070c0be [2/2] wifi: ath9k: Obtain system GPIOS from descriptors
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260316/202603162011.BYf9zG1R-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603162011.BYf9zG1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603162011.BYf9zG1R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-ath79.c: In function 'ath79_gpio_register_wifi_descriptors':
>> drivers/gpio/gpio-ath79.c:264:1: warning: no return statement in function returning non-void [-Wreturn-type]
     264 | }
         | ^


vim +264 drivers/gpio/gpio-ath79.c

   217	
   218	#if IS_ENABLED(CONFIG_ATH9K_AHB)
   219	/*
   220	 * This registers all of the ath79k GPIOs as descriptors to be picked
   221	 * directly from the ATH79K wifi driver if the two are jitted together
   222	 * in the same SoC.
   223	 */
   224	#define ATH79K_WIFI_DESCS 32
   225	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   226							const char *label)
   227	{
   228		struct gpiod_lookup_table *lookup;
   229		int i;
   230	
   231		/* Create a gpiod lookup using gpiochip-local offsets + 1 for NULL */
   232		lookup = devm_kzalloc(dev,
   233				      struct_size(lookup, table, ATH79K_WIFI_DESCS + 1),
   234				      GFP_KERNEL);
   235		if (!lookup)
   236			return -ENOMEM;
   237	
   238		/*
   239		 * Ugly system-wide lookup for the NULL device: we know this
   240		 * is already NULL but explicitly assign it here for people to
   241		 * know what is going on. (Yes this is an ugly legacy hack, live
   242		 * with it.)
   243		 */
   244		lookup->dev_id = NULL;
   245	
   246		for (i = 0; i < ATH79K_WIFI_DESCS; i++) {
   247			lookup->table[i] =
   248				/*
   249				 * Set the HW offset on the chip and the lookup
   250				 * index to the same value, so looking up index 0
   251				 * will get HW offset 0, index 1 HW offset 1 etc.
   252				 */
   253				GPIO_LOOKUP_IDX(label, i, "ath9k", i, GPIO_ACTIVE_HIGH);
   254		}
   255	
   256		gpiod_add_lookup_table(lookup);
   257	
   258		return 0;
   259	}
   260	#else
   261	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   262							const char *label)
   263	{
 > 264	}
   265	#endif
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
