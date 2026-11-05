Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880877;
	b=ml3mn7EA20eQMmA2dgXH7POWzdfcUt7wHd58RhY1HElvKKX/pyjhP0SpADeAFpybLO08
	 QdTZGHQ+FUM7P/Kx7bnEJxzsWfy/Dp5Kvb9yJ0ZJubuT1qRnrBArfVj1NM2o/MwW2wWKB
	 2FzvJvAQyhr/uun5/cQWApJfyaBzTMt66p5OF09ZZXqoSEwrLj9PhPDws8E1Abe5bRDCs
	 ldsp9URC5gel4lv2vftsVqZ5KgDmp9vqPowBN5229qaQBh0rmi1tUSPB8LaTuQh7uap0Q
	 yLrHF07+grSGnIZ+5MjbIAO8AHYN0rzXhnEEaetLIh4PAoZ6mPc3mC8TndCx7XQQjww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880877;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cTd/aCD8n7satCSyRDFgmIwkqHciLz6XNniMaYZWJ00=;
	b=xmwKgHjDpm7MBoAK4EJQJnqHYD3SKMfpajesesVN1fhpsnjgLUYTFgR/iHdrPenJZktc
	 13pdsQ+XySkb5n//dXPgqv19/nQa9LiKha3lcWAML75cX5497pS19mZ2iZbFlclheBlya
	 BurMMF3FOIo6D0xT/Mw1/jPuX2pykkjFyUcMrzfR7s0/3jVWKSSLpsGFnPjOqewRSDKR0
	 e6hbKwV02WiUxgqpP3duMAvcEXLLomv6b07vNMA7GlXWSe6vWLiZX2JllpTi6iidhxfCz
	 aPI05eJHd855YszMqIdCOAr0q9tvwAModQKk7k+THF3QDK3xWxL2zRI6sAzQ5WK9vPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a+3MIwoB;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821AC606D803;
	Thu,  5 Nov 2026 12:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821AC606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a+3MIwoB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793880875; x=1825416875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cIAkWqEIjMGJJrbeOsRo5KIwsMYsIhRUxLBRYpp9Soo=;
  b=a+3MIwoBS17K8q1QcstoAbahaz5+QmkJ3PPomjaJ+2VLQjDTzizG4pm7
   z/lWyCo1r486kIICOGVk5TC18v0Fs6lfrUTYinvreM3nMyNlbEhxlRUwL
   j3k5+JmPIyrxe2jBGhpTRkkiePeXLb5L1qrDN8FQmx07z6g8Oaev/oTQ1
   fdv4i7kpWjC1wns1keem/GaunPlWt8oicSxEzV4F+5P+8Fc9xLoN4cLR+
   0YE369kWl9SXddRIPSrl9XwqKeYKlGKRsQhX4YVBc6Isx3YqZLFe7fawL
   npPkoLlEMBzg749VhQE0dE00Z079syaMhF/LNhxQVOpycGFTojNcXVA4L
   w==;
X-CSE-ConnectionGUID: doYFyXDSSBeRB0ghcXwhYQ==
X-CSE-MsgGUID: +3wgAKxVT9OVoFFERyxJkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2659723"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659723"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 04:14:34 -0800
X-CSE-ConnectionGUID: W7qSl4yRT/OB42cZPsJTzw==
X-CSE-MsgGUID: P/khoYopQTGJsBFL41dZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7401164"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2026 04:14:32 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOwMP-00000000mAV-31db;
	Thu, 05 Nov 2026 12:14:29 +0000
Date: Thu, 5 Nov 2026 20:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuanhong Guo <gch981213@gmail.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
Message-ID: <202611052240.0EkLv6im-lkp@intel.com>
References: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
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
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>

Hi Joseph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f33a24cc012d34f25bb9942681bd478a1757b806]

url:    https://github.com/intel-lab-lkp/linux/commits/Joseph-Telaak-via-B4-Relay/dt-bindings-pinctrl-Add-Siflower-SF19A2890-pin-controller/20261104-022117
base:   f33a24cc012d34f25bb9942681bd478a1757b806
patch link:    https://lore.kernel.org/r/20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf%40telaak.dev
patch subject: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611052240.0EkLv6im-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052240.0EkLv6im-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052240.0EkLv6im-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-sf19a2890.c:27:9: warning: 'REG_PC' redefined
      27 | #define REG_PC(pin)             ((pin) * 0x8)
         |         ^~~~~~
   In file included from arch/sh/include/asm/ptrace_32.h:5,
                    from arch/sh/include/uapi/asm/ptrace.h:28,
                    from arch/sh/include/asm/ptrace.h:14,
                    from arch/sh/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from drivers/pinctrl/pinctrl-sf19a2890.c:15:
   arch/sh/include/uapi/asm/ptrace_32.h:23:9: note: this is the location of the previous definition
      23 | #define REG_PC          16
         |         ^~~~~~


vim +/REG_PC +27 drivers/pinctrl/pinctrl-sf19a2890.c

    25	
    26	/* Pad configuration */
  > 27	#define REG_PC(pin)		((pin) * 0x8)
    28	#define  PC_OEN			BIT(7)
    29	#define  PC_ST			BIT(6)
    30	#define  PC_IE			BIT(5)
    31	#define  PC_PD			BIT(4)
    32	#define  PC_PU			BIT(3)
    33	#define  PC_DS			GENMASK(2, 0)
    34	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
