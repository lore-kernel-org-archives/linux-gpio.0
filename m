Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4449E207A38;
	Thu, 19 Feb 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508813; cv=none; b=FCrxjNvqZ540qNF8yLKDWjGno5Qdk5Au6acJHMZJzDVL7Cr0UMcajMQrs18P/Ty2dr3DqrCsdWahwlzkeTTUo0pIVRzj6W6/nWLVQD1nKHg9CMGCell8sfl142NmmCHSQQ1+9ff7TrdEQ8S+4aAImwqogoJEdtpfgEftyWn67/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508813; c=relaxed/simple;
	bh=QLF2Ygncs5ZoYH/o+PKirXnMQzTafnq6MLQr7T0zqEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C3BRQw2vSVl2b338lTzB5XRcyYknNesUMnMZtaTCo0AuceL/YY+95Tw+CnsodOEFrBDUT0cidfhWim1gSCTqxqGyZNX8w0czBDDOPI/H86sYZttonJPucUE10NQAm8LtExHYeAAspUWBROdealEsFni3sWC0i+kAC6aaIJ4THds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GboPOWYa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GboPOWYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771508811; x=1803044811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QLF2Ygncs5ZoYH/o+PKirXnMQzTafnq6MLQr7T0zqEE=;
  b=GboPOWYaroLvfDPWIJxMJYuOenpopla3e7a9dqbk5mvqGoGNFJ8A3EX+
   2+hBbuyHvfIXa2FSxtfRUMuQFzqsvQbePAdurs11aetjcsVQbZVR6Wn1a
   HTWkmD0p7xGNgBZ7Yg5Sdf/CJG1w2q4aAln7e5C0ecYd6zaDmNvtI+JGv
   VSx734PgtXrmO4QbkmoyroQ5F5k8gB2XT7hy89MewRrpet9rVQau/4Yec
   nAR+ocq9HFHe41dMoN8MOUg6/ZbbOzzo2izdF2E2a1JKNuQumi7aFwnUM
   S1TauJyqt6QWd7V7iRZmRW+2SDkuDdGN3MPhmtKvYLqjJGhry0iST++zF
   A==;
X-CSE-ConnectionGUID: 0k3/2TRDQCK7GOimp6/jKw==
X-CSE-MsgGUID: 1mRSJLRORNydHoZjJOp0SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="95210642"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="95210642"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 05:46:50 -0800
X-CSE-ConnectionGUID: eQcl1MzrRKKACrrA0acgag==
X-CSE-MsgGUID: W5NmJKoHRZilYmFPnqsMtA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2026 05:46:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2407195; Thu, 19 Feb 2026 14:46:48 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: ts4800: Remove duplicate code to handle 'ngpios' property
Date: Thu, 19 Feb 2026 14:46:47 +0100
Message-ID: <20260219134647.2258593-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio_generic_chip_init() handles the 'ngpios' property and
assigns the respective field in struct gpio_chip either with
the value of it, or, if not found, with the default based on
the register size. There is no need to repeat this in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-ts4800.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 992ee231db9f..0207c2b813f4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -11,7 +11,6 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
-#define DEFAULT_PIN_NUMBER      16
 #define INPUT_REG_OFFSET        0x00
 #define OUTPUT_REG_OFFSET       0x02
 #define DIRECTION_REG_OFFSET    0x04
@@ -23,7 +22,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	struct gpio_generic_chip *chip;
 	void __iomem *base_addr;
 	int retval;
-	u32 ngpios;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -33,12 +31,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base_addr))
 		return PTR_ERR(base_addr);
 
-	retval = device_property_read_u32(dev, "ngpios", &ngpios);
-	if (retval == -EINVAL)
-		ngpios = DEFAULT_PIN_NUMBER;
-	else if (retval)
-		return retval;
-
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 2,
@@ -52,8 +44,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, retval,
 				     "failed to initialize the generic GPIO chip\n");
 
-	chip->gc.ngpio = ngpios;
-
 	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
 }
 
-- 
2.50.1

