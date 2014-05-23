From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH]  gpio: Add run-time dependencies to R-Car driver
Date: Fri, 23 May 2014 13:42:14 +0200
Message-ID: <20140523134214.0f29c9e0@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57564 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751533AbaEWLmS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 23 May 2014 07:42:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Magnus Damm <damm@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The Renesas R-Car GPIO driver is only useful on shmobile unless build
testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Magnus Damm <damm@opensource.se>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
Simon, is it correct? I couldn't remove the dependency on ARM because
the driver uses set_irq_flags which is arm-specific.

 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.15-rc6.orig/drivers/gpio/Kconfig	2014-05-23 12:00:02.262995319 +0200
+++ linux-3.15-rc6/drivers/gpio/Kconfig	2014-05-23 13:29:01.773035079 +0200
@@ -259,7 +259,7 @@ config GPIO_PXA
 
 config GPIO_RCAR
 	tristate "Renesas R-Car GPIO"
-	depends on ARM
+	depends on ARM && (ARCH_SHMOBILE || COMPILE_TEST)
 	help
 	  Say yes here to support GPIO on Renesas R-Car SoCs.
 


-- 
Jean Delvare
SUSE L3 Support
