Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445515;
	b=TDEsZpkki95+bTLx60A75s9upW9c8t4rt3iaxQHXhP2sgfw0PTvDIGtE5DaAZZa1oJ8W
	 WGPbQmS80Pjnz2K8/DP9Om0UDdPk3OWFP9J4qINqzyjfaZKp82ntBcSZCvxFjWU87RH38
	 YvxgnsB12LyeKADAgZ4YlgbsC6MgvoE8pqa05TPMjpnhFt77N64ahYPMMQjakhiyt/iXD
	 eVFdzFQu7A/lC8C9BjKwzmSvsBRqPSdGyecOJVdbGfyFL9VMg7QX8E8Zi5ft9l8srTo9/
	 a/uyH4YuXhT2yOrqEiPEkHH/5skaucUjeIY8g3BJV85O1orxlwCKUfT+rDYlPeAZOFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445515;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3NyGS3nOA7Lvp0Dw4Wzv0Za4txVRrYi8SUex8d0oBv8=;
	b=0aknn5FlnW3Yy/SoLp8NXB2aA6WL0PDTD9J7JuF2eJNFQ4flvCLS/l8Aeqq1TccEmdFF
	 pFMbsVOwp+KuAmREE29rPYSu/jOgRvFmuJi60ieojHkN/6038SzxbIoBa6WCCzOTrABiX
	 EnCawBxj2wqNLHmACJ1BeDkD64tcIlLpvU3xNM+1tFaLixp6ZEARhbxQpEaM7j6mfHOyG
	 6zb4HhxMOZx9UxxWWiyuq9kNI3Nr3tmfI2amRVIwTb0HxJ0FDjeD1xmAC6fw6lvNidqFu
	 zwDZkweEIviwT12uzYS2YN/7zRhIN4lRYYoQnJ4Z+i6yqyfPOr5dJ/Wv7Y3v1vdHlNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nhmrq2zN;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACC2606A323;
	Thu, 12 Nov 2026 01:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACC2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nhmrq2zN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794445514; x=1825981514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjVKd2HNubXo7z2nDE7+efXnFFvj/HoSmdrw3jQ7lOY=;
  b=Nhmrq2zNQ8m8V5Ks6RtNZflHVuUvZ82drTCn5WucV0Ok5WriYNuEd56h
   H6Dj9sepI7sFKLt1/Kvygghsvi78QpqSphtGjLNlGac/GzsVaDcb5411p
   BDuGW5+7jmnrXlLe55B7y3sCLSMgi42mKiLHX68o4NqQrh1ARQPdONP1w
   o+ZA/C1FlcB6T7GuG77EGrIFxf/ISeua5Fr+ZOnXZbQQ0G74kJXjclnq6
   wW1n7D5NJaS3S5DKzsveLBxkQ0NkQrf9GVqZZJwnnLxT0TbP8s9D/HCo7
   07QsPu33g3JxR4KdyozBUo0ngyV3prCWPaM5MPUetTJjJiGj2OaPpSm0W
   g==;
X-CSE-ConnectionGUID: +gwLcJOAQQCD/80GZpj+AA==
X-CSE-MsgGUID: +bzCoUBoQGihivaHvklpvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3250440"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3250440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 17:05:14 -0800
X-CSE-ConnectionGUID: Nb54U2MRT1WGe+6rLMXOJA==
X-CSE-MsgGUID: nrchI3L6SZCJX5FwlKD0Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8866983"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2026 17:05:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRJFV-0000000109X-0oVM;
	Thu, 12 Nov 2026 01:05:09 +0000
Date: Thu, 12 Nov 2026 09:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] pinctrl: amd: Steer GPIO interrupt to low
 power/efficiency cores
Message-ID: <202611120840.VN9Z8N3s-lkp@intel.com>
References: <20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7475ea8b58616b33c04afb976cf0fbaad9dd63fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/pinctrl-amd-Steer-GPIO-interrupt-to-low-power-efficiency-cores/20261111-100708
base:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
patch link:    https://lore.kernel.org/r/20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8%40amd.com
patch subject: [PATCH] pinctrl: amd: Steer GPIO interrupt to low power/efficiency cores
config: um-randconfig-1000-20261112 (https://download.01.org/0day-ci/archive/20261112/202611120840.VN9Z8N3s-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120840.VN9Z8N3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120840.VN9Z8N3s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/pinctrl-amd.c:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/pinctrl/pinctrl-amd.c:1285:47: error: array has incomplete element type 'const enum x86_topology_cpu_type'
    1285 |         static const enum x86_topology_cpu_type types[] = {
         |                                                      ^
   drivers/pinctrl/pinctrl-amd.c:1285:20: note: forward declaration of 'enum x86_topology_cpu_type'
    1285 |         static const enum x86_topology_cpu_type types[] = {
         |                           ^
>> drivers/pinctrl/pinctrl-amd.c:1286:3: error: use of undeclared identifier 'TOPO_CPU_TYPE_LOW_POWER'
    1286 |                 TOPO_CPU_TYPE_LOW_POWER,
         |                 ^
>> drivers/pinctrl/pinctrl-amd.c:1287:3: error: use of undeclared identifier 'TOPO_CPU_TYPE_EFFICIENCY'
    1287 |                 TOPO_CPU_TYPE_EFFICIENCY,
         |                 ^
>> drivers/pinctrl/pinctrl-amd.c:1297:8: error: call to undeclared function 'cpu_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1297 |                         if (cpu_data(cpu).topo.cpu_type == types[i])
         |                             ^
>> drivers/pinctrl/pinctrl-amd.c:1297:21: error: member reference base type 'int' is not a structure or union
    1297 |                         if (cpu_data(cpu).topo.cpu_type == types[i])
         |                             ~~~~~~~~~~~~~^~~~~
   1 warning and 5 errors generated.


vim +1285 drivers/pinctrl/pinctrl-amd.c

  1276	
  1277	#ifdef CONFIG_X86_64
  1278	/*
  1279	 * On hybrid systems prefer to service the GPIO interrupt on low power cores,
  1280	 * then on efficiency (dense) cores to save power.  Userspace can still
  1281	 * override the placement.  Do nothing if neither core type exists.
  1282	 */
  1283	static void amd_gpio_set_irq_affinity(struct amd_gpio *gpio_dev)
  1284	{
> 1285		static const enum x86_topology_cpu_type types[] = {
> 1286			TOPO_CPU_TYPE_LOW_POWER,
> 1287			TOPO_CPU_TYPE_EFFICIENCY,
  1288		};
  1289		cpumask_var_t mask;
  1290		int cpu, i;
  1291	
  1292		if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
  1293			return;
  1294	
  1295		for (i = 0; i < ARRAY_SIZE(types); i++) {
  1296			for_each_possible_cpu(cpu) {
> 1297				if (cpu_data(cpu).topo.cpu_type == types[i])
  1298					cpumask_set_cpu(cpu, mask);
  1299			}
  1300			if (!cpumask_empty(mask)) {
  1301				irq_set_affinity(gpio_dev->irq, mask);
  1302				break;
  1303			}
  1304		}
  1305	
  1306		free_cpumask_var(mask);
  1307	}
  1308	#else
  1309	static void amd_gpio_set_irq_affinity(struct amd_gpio *gpio_dev) {}
  1310	#endif
  1311	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
