From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Thu, 11 Feb 2016 12:05:51 +0100
Message-ID: <20160211120551.4d8224a4@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41343 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751212AbcBKLFy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 11 Feb 2016 06:05:54 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>

The pinctrl-baytrail driver builds just fine as a module so give
users this option.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-4.5-rc3.orig/drivers/pinctrl/intel/Kconfig	2016-01-11 00:01:32.000000000 +0100
+++ linux-4.5-rc3/drivers/pinctrl/intel/Kconfig	2016-02-11 10:55:54.817711599 +0100
@@ -3,7 +3,7 @@
 #
 
 config PINCTRL_BAYTRAIL
-	bool "Intel Baytrail GPIO pin control"
+	tristate "Intel Baytrail GPIO pin control"
 	depends on GPIOLIB && ACPI
 	select GPIOLIB_IRQCHIP
 	help


-- 
Jean Delvare
SUSE L3 Support
