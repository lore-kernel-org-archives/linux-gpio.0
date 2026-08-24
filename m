Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C623A0E8B;
	Mon, 24 Aug 2026 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557606; cv=none; b=iuUpIowtoxQHufmLwKplfhjsf/tA2pvDR1F0VlOOJUYz4pwmWb8LrGkbgpQACMTH04SR//Mm+0LTQWtfIeJG6mlwmiBgjUAXTjB18x3IdUCzUNmyvByweLMJcNjJo5vekDGEJ2lLoOHmCEd4zd8M4rZAnFdeT3R5Rf62b7Assa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557606; c=relaxed/simple;
	bh=1jPPNsW4oFGQFaKxN1afqS1h40V2DKd4Sm0m0DbDESM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmFtsG5HtKq6aRnsWWn4lCVRfxJ0nRjC7D38PMoo3Edph/hsOEq/PQrVUpWP9DTyb7vGrrjBcs1T5GPQtTx0w1/qpNqbXNSnD0oE1oOIPRyuXEPgY2BK938lBfbCzGN201MiwJW3+kJP53Vymg9/qtbSB/JeI6/pIG/QZXsSoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPEMVCmY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPEMVCmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557605; x=1819093605;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1jPPNsW4oFGQFaKxN1afqS1h40V2DKd4Sm0m0DbDESM=;
  b=hPEMVCmYjUTf40S1IwtH0YNMYv1kCjG4bDsC7PfWKyolpKwQphhXXKHN
   j05XKJTF0qozC4Gs9DmVG54hqL8ftAj+5HoWDdmO1FftNB2be5/BfzqTQ
   7J/67B2N5lvJhKVBKuwMjOhH/81/CEaV4AzDePieTjPjdPDZ4wZUVBAjY
   Jnjxjh58PkSYVUoLhATKHslYp7X1owkLtct4xznNFE2FBJp5HjGvDs/u5
   Mdnw2oLe1rks9tWM21oIwGIfRkh0ahObMHC3InDjCSc0mFPrNJNTFrID7
   F1qPVdg2G/A62D4QKEul5g0S3aLvW8bgRq6plhr9/HCNlFeCizauIoFfP
   Q==;
X-CSE-ConnectionGUID: YNACeLcJSLyrbgnOpavUag==
X-CSE-MsgGUID: iOIH7tILSqWuzrO9DvTCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203154"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: x3U5ERFEQ/2TgBaCjyxWUw==
X-CSE-MsgGUID: /Exfe8I1Qpim+Ale8Ryd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887916"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BDF7E99; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: [PATCH v1 0/4] gpio: Unify the GPIO controller node check
Date: Mon, 24 Aug 2026 09:42:31 +0200
Message-ID: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are handful of drivers perform the same check in different variations
over and over with a potential to make subtle mistakes. Unify the check by
providing a new helper and convert a few users as an example.

Andy Shevchenko (4):
  gpio: Split fwnode_is_gpiochip() helper
  gpio: shared: Replace open coded fwnode_is_gpiochip()
  pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
  pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()

 drivers/gpio/gpiolib-shared.c          | 6 ++----
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
 drivers/pinctrl/pinctrl-pistachio.c    | 2 +-
 include/linux/gpio/driver.h            | 7 ++++++-
 4 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.50.1

