From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: intel-mid: Make it depend to X86_INTEL_MID
Date: Thu,  7 Jul 2016 23:45:08 +0300
Message-ID: <1467924308-137452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:22750 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751206AbcGGUpU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 7 Jul 2016 16:45:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This GPIO controller is a part of Intel MID platforms which are somehow
different to pure PCs. Thus, there is no need that driver is compiled for them.

Replace dependency to X86_INTEL_MID.

While here, fix capitalization of MID abbreviation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c9e9e55..98dd47a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1038,11 +1038,11 @@ config GPIO_BT8XX
 	  If unsure, say N.
 
 config GPIO_INTEL_MID
-	bool "Intel Mid GPIO support"
-	depends on X86
+	bool "Intel MID GPIO support"
+	depends on X86_INTEL_MID
 	select GPIOLIB_IRQCHIP
 	help
-	  Say Y here to support Intel Mid GPIO.
+	  Say Y here to support Intel MID GPIO.
 
 config GPIO_MERRIFIELD
 	tristate "Intel Merrifield GPIO support"
-- 
2.8.1

