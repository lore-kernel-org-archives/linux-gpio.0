From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] pinctrl: Turn AMD support to tristate
Date: Thu, 11 Feb 2016 12:06:37 +0100
Message-ID: <20160211120637.0e11fe28@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41401 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751407AbcBKLGk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 11 Feb 2016 06:06:40 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The pinctrl-amd driver builds just fine as a module so give
users this option.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-4.5-rc3.orig/drivers/pinctrl/Kconfig	2016-02-02 09:02:08.803929724 +0100
+++ linux-4.5-rc3/drivers/pinctrl/Kconfig	2016-02-11 11:15:17.030298649 +0100
@@ -79,7 +79,7 @@ config PINCTRL_AT91PIO4
 	  controller available on sama5d2 SoC.
 
 config PINCTRL_AMD
-	bool "AMD GPIO pin control"
+	tristate "AMD GPIO pin control"
 	depends on GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINCONF


-- 
Jean Delvare
SUSE L3 Support
