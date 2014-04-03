From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] gpio: timberdale: simplify dependencies
Date: Thu, 3 Apr 2014 11:33:31 +0200
Message-ID: <20140403113331.60ec9d4b@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59468 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751834AbaDCJdd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 3 Apr 2014 05:33:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

GPIO_TIMBERDALE doesn't need an explicit dependency on HAS_IOMEM,
because it depends on MFD_TIMBERDALE which itself depends on
HAS_IOMEM already.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.14.orig/drivers/gpio/Kconfig	2014-04-03 09:20:58.831297480 +0200
+++ linux-3.14/drivers/gpio/Kconfig	2014-04-03 09:36:37.245359318 +0200
@@ -710,7 +710,7 @@ config GPIO_SODAVILLE
 
 config GPIO_TIMBERDALE
 	bool "Support for timberdale GPIO IP"
-	depends on MFD_TIMBERDALE && HAS_IOMEM
+	depends on MFD_TIMBERDALE
 	---help---
 	Add support for the GPIO IP in the timberdale FPGA.
 


-- 
Jean Delvare
SUSE L3 Support
