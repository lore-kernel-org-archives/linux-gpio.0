Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636FD31AAA7
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701901; cv=none; b=RuH3ulfBS6UoqeJG3ARFesaemYTcBTMb0UObIrgw02Bv/xqzwkUz+Qq6I4bmtAZwo58tBvfmvYJOjqxvxyWRaWGmjL7Xt+feYOArwu6EniiWFgvXiNzKRx8qPgW8PW6G+wOM7JK8gkW0FW2GlBkryXUxSMCNTae4vF9+RPeolOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701901; c=relaxed/simple;
	bh=xVk1JZZszOfsCZNUm+dOyc8xFQrApE/NEWNEfFr5dSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAo9N3iK6894ECOe2KJUDMhO53nCGo6wlvoXBgUXEEg9r9CbtW+L6LVFp4JAXd0mS2vqb+SXSOUKoXvLGtNPR83LRP3FB9wN+dVRi2vcU1kaCYBFD/O9lL/ePfBwwqYDe/P0YCWIgcZmjKOQvCUtoTGnK8aVvexaB9A+TggFReE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzUu/h8w; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzUu/h8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769701898; x=1801237898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xVk1JZZszOfsCZNUm+dOyc8xFQrApE/NEWNEfFr5dSI=;
  b=OzUu/h8w+FSQj/a2qsVDUItaZ7wTWeSsxhJl+IpIDd0R3ZOUWux8MgWy
   sQmJ+ZL3xiUehzl66Ly/LOZ8M0lE+sxm1HlV9ejvers4d1nmbiSFqSe8n
   y7E9anTqVRgm/Y5EUBGub77t1LgFDAguxurwi2odNawdlOpZHbraSPWKN
   yKVPkEffpQwc/L/Db6Exr09WoW615BDrrfCWP6yxASoCSgtItJMh/2+HU
   XKsnsg0bdyrm2m6P5B8e0Nc9QvXiteka717x/E4mJhlRZ7vgHILl4oA+F
   DFb0V2Fup1UdQWVji2riuOKNym4gzJMdSfcFs0t7JMvHzLFGFNP0RwD1l
   g==;
X-CSE-ConnectionGUID: m7X6tAELThSeHsyNzWFXvA==
X-CSE-MsgGUID: LCvqhERPQBKAVbEf4bWRvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82053830"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="82053830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 07:51:37 -0800
X-CSE-ConnectionGUID: cSx7fQ6vREepfjY7PsuwLA==
X-CSE-MsgGUID: jZC7SxhIRcSqyIA3CUr3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="212696725"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2026 07:51:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E4F4A98; Thu, 29 Jan 2026 16:51:33 +0100 (CET)
Date: Thu, 29 Jan 2026 16:51:33 +0100
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-pinctrl for 6.20-2
Message-ID: <aXuCBWOfVRpieHR1@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux pin control  maintainers,

A few more Intel pin control cleanups. They are simple and still happened to be
a couple of days in Linux Next without issues. Please, pull for v6.20-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.20-2

for you to fetch changes up to 8e03e6ecc23537531ddae6488c9dd67546486a7b:

  pinctrl: tangier: Join tng_pinctrl_probe() into its wrapper (2026-01-28 14:32:23 +0100)

----------------------------------------------------------------
intel-pinctrl for v6.20-2

* Remove duplicate error messages when registering pin control
* Miscellaneous changes

----------------------------------------------------------------
Andy Shevchenko (9):
      pinctrl: baytrail: Convert to use intel_gpio_add_pin_ranges()
      pinctrl: lynxpoint: Convert to use intel_gpio_add_pin_ranges()
      pinctrl: intel: platform: Add Nova Lake to the list of supported
      pinctrl: intel: Remove duplicate error messages
      pinctrl: baytrail: Remove duplicate error messages
      pinctrl: cherryview: Remove duplicate error messages
      pinctrl: lynxpoint: Remove duplicate error messages
      pinctrl: tangier: Remove duplicate error messages
      pinctrl: tangier: Join tng_pinctrl_probe() into its wrapper

Raag Jadav (1):
      pinctrl: intel: Add code name documentation

 drivers/pinctrl/intel/Kconfig              | 22 ++++++++++-----
 drivers/pinctrl/intel/pinctrl-baytrail.c   | 43 +++++++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-cherryview.c |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c      |  2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  | 29 +++++++++-----------
 drivers/pinctrl/intel/pinctrl-tangier.c    | 21 +++++----------
 6 files changed, 61 insertions(+), 58 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


