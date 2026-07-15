Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753003AFD0C;
	Wed, 15 Jul 2026 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141487; cv=none; b=B8/sKBfTPOAh0W0TOtExhL4ziAeO1dE9DyOHw4n4FvEPjxMixB9Epri1E1bA3jsUIxDfC6l0Ibs/0glnd3X2372QSmgwwNy5qFtsSS1q07+gx51zZiF5DciZzltyFgLetC9qEE5YaoOwlY4D2iqIU58/9EyNIYjpXNqk5ZVlxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141487; c=relaxed/simple;
	bh=Zozgi4pBBMqS2Yp01Az5VMEBFWGBtzfkxrZ3zQRkYTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuPVU7RaPT2vrvz379rJLteSlQWvDe+Od7WCJgcbapE/LFLj/yv46hIz5UMntS70HJfobtKVHDvfGjlYA5ZNjOf+eedND1Pl4bV5VDo9IAkO9xAski/cioSLBnjQ8D+1xSSTQRE3Bf9+SXwaqjpaPza8apGDoMH7fmVMivBcQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POTBnIsQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POTBnIsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141483; x=1815677483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zozgi4pBBMqS2Yp01Az5VMEBFWGBtzfkxrZ3zQRkYTg=;
  b=POTBnIsQUc4eFoBGE/b8m/GTTmgKxwoM3QwwQzoSj03xVbd+91XuOrOa
   AN1LbpSyKYhkQu770f0Ivx6YxxEGj8U4BkHIL57eitKR9+HdtJoS+WK90
   78qs4z92EjoPvfUygHVfaHglWODQHiZUoTXpMfiwjZoATa4/PDwGecCsK
   wv7WjS/gie3oy2kEscR2pTHCFo3q9L7D/wkeKR10Ax/Z2WrEoOONAbby3
   ro8R55coCk+NKhmrwPau5EJz4uboJIdVur8NgfPnxS55i6+/Stq3wGcMJ
   VJPLy+x4g4A2akVFGsMSLiWkAi1xqzvEiY6jVOPDEFpepLtwr+pixfTKf
   g==;
X-CSE-ConnectionGUID: iALh1x0wTdWdryLeHJHPDQ==
X-CSE-MsgGUID: YEjsPHyDTL6P+gY/3NuOJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96308564"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96308564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: 3IOviV9PSNC7VoDv77PcIg==
X-CSE-MsgGUID: 4JN2UDn6R4aIjFHo+IYNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294491648"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E712D95; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:40 +0200
Message-ID: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the finilazation of the work announced in the commit 61e1fd2abca4
("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
small series we kill gpio_request_one() and leave only two legacy calls
devm_gpio_request_one() and gpio_request(), where the managed one has only
a few users and high chances to be killed soon as well.

The series is supposed to go via GPIO tree (due to nature of the last patch)
with possible immutable branch for others. Please, ack.

Andy Shevchenko (7):
  ARM: pxa: spitz: Open code gpio_request_one()
  media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
  media: em28xx: Open code gpio_request_one()
  MIPS: BCM47XX: Open code gpio_request_one()
  MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
  MIPS: BCM63XX: Open code gpio_request_one()
  gpiolib: Get rid of not used anymore gpio_request_one()

 Documentation/driver-api/gpio/consumer.rst    |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                  |  3 +-
 arch/mips/bcm47xx/workarounds.c               |  8 ++-
 arch/mips/bcm63xx/boards/board_bcm963xx.c     | 10 ++--
 .../include/asm/mach-bcm63xx/board_bcm963xx.h |  3 -
 drivers/gpio/gpiolib-legacy.c                 | 31 ----------
 drivers/media/usb/em28xx/em28xx-dvb.c         | 57 ++++++++-----------
 include/linux/gpio/legacy.h                   |  8 ---
 8 files changed, 39 insertions(+), 83 deletions(-)

-- 
2.50.1

