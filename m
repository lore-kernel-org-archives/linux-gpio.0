Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DC9495504;
	Wed, 15 Jul 2026 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141494; cv=none; b=KsMaDd+9uF3Kcy9VmIRr2mHMDOAFJ/XvSe7JcBoYbMPB13y8oQFGtaABeXexzUtaUSEv3xOP4Gcb1siIGC+8NREtnzfyXg2q40evW9VbiqyLBRSrJcjk7SIj4EfFSW+JMPuCSfxxDS/f8LmfcN2iHiSTd7tviY6ZFeTY7sT0yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141494; c=relaxed/simple;
	bh=vqPRf1eRLI2wPMZNTTk55tYgoCASIBKcTfPQxTtD05k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcMMykQ1DsYQLMOBvcmBIxcE3Wlk7C3GexMGclMxy1hD5y1qBp7LO9pCIr/fjFItPxqb/4/XRGmB+EuLaUQUhoZu3ihVJGHWhIphMV5xNu7T8+btcxDt+ArNdo/BGCZQCzylUJsGPqGCgl87s+vNjRx5hIkE7bP3ETLHQgA93i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEiYf2qB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEiYf2qB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141492; x=1815677492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vqPRf1eRLI2wPMZNTTk55tYgoCASIBKcTfPQxTtD05k=;
  b=ZEiYf2qBhuXo4Z+rrbNBhVM/tAVbcD4KaFW0AIsrCNuZUrIeCKTNrfuE
   UwQPIrLYxTCpC2X1h98ipHJaFfRnB3tbfOflINfx1/nM87Za6tXCWQPUB
   1UBmuyY2xKexUz7+UUTq5ph7qEJnTefiu6kKvVrI485NYiirkBEh2ExBe
   Ag2VarZSQhiSLi+QJhHqJYVMP9KIO5Ee4XoTCqYWclqZFzLOh+WMFryYn
   rR1L74wpphuAUk7EKLoDYgzH3mXRpfmavM3Sd1857bjTpqFAxdM0WMF9B
   v30coAp8jBVj60EPBF3/HoEYe30o3rUmYAoWDXo2jtusCcbuzO1y0zmcW
   A==;
X-CSE-ConnectionGUID: dw5886ZcSQqWjlEjbWy8iw==
X-CSE-MsgGUID: Gj6XNr2TQ+O4TgYoLYslsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887526"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887526"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:25 -0700
X-CSE-ConnectionGUID: 0sRMWxKpQ8aMtUHksXYmvQ==
X-CSE-MsgGUID: XwfBQ5UwRna3c2sKskrJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700299"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0811F9E; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
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
Subject: [PATCH v1 5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
Date: Wed, 15 Jul 2026 20:46:45 +0200
Message-ID: <20260715185112.1323510-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ephy_reset_gpio_flags exists solely to supply polarity to the reset GPIO.
But in practice it's kept all the same and currently only a single user
present. Drop the member and use hard coded GPIO flags instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c           | 7 +++----
 arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 3 ---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index c5617b889b1c..57e916c06792 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -42,7 +42,7 @@ static struct board_info __initdata board_cvg834g = {
 	.expected_cpu_id = 0x3368,
 
 	.ephy_reset_gpio = 36,
-	.ephy_reset_gpio_flags = GPIOF_OUT_INIT_HIGH,
+
 	.has_pci = 1,
 	.has_uart0 = 1,
 	.has_uart1 = 1,
@@ -903,9 +903,8 @@ int __init board_register_devices(void)
 
 	platform_device_register(&bcm63xx_gpio_leds);
 
-	if (board.ephy_reset_gpio && board.ephy_reset_gpio_flags)
-		gpio_request_one(board.ephy_reset_gpio,
-				board.ephy_reset_gpio_flags, "ephy-reset");
+	if (board.ephy_reset_gpio)
+		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
 
 	return 0;
 }
diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
index 830f53f28e3f..018a56cbc328 100644
--- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
+++ b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
@@ -46,9 +46,6 @@ struct board_info {
 
 	/* External PHY reset GPIO */
 	unsigned int ephy_reset_gpio;
-
-	/* External PHY reset GPIO flags from gpio.h */
-	unsigned long ephy_reset_gpio_flags;
 };
 
 #endif /* ! BOARD_BCM963XX_H_ */
-- 
2.50.1

