From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] gpio-cs5535: Simplify dependencies
Date: Fri, 7 Mar 2014 22:02:02 +0100
Message-ID: <20140307220202.65de4967@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54944 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753459AbaCGVCE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 7 Mar 2014 16:02:04 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The architecture dependencies are already on MFD_CS5535, so there is
no need to repeat them here.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.14-rc5.orig/drivers/gpio/Kconfig	2014-03-07 21:43:13.739818995 +0100
+++ linux-3.14-rc5/drivers/gpio/Kconfig	2014-03-07 21:50:41.049327536 +0100
@@ -631,7 +631,7 @@ comment "PCI GPIO expanders:"
 
 config GPIO_CS5535
 	tristate "AMD CS5535/CS5536 GPIO support"
-	depends on PCI && X86 && MFD_CS5535
+	depends on PCI && MFD_CS5535
 	help
 	  The AMD CS5535 and CS5536 southbridges support 28 GPIO pins that
 	  can be used for quite a number of things.  The CS5535/6 is found on


-- 
Jean Delvare
SUSE L3 Support
