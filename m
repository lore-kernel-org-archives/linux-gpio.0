From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] gpio: ts4900: Add hardware dependencies
Date: Fri, 14 Oct 2016 14:24:09 +0200
Message-ID: <20161014142409.411f6948@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51715 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754351AbcJNMYc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Oct 2016 08:24:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lucile Quirion <lucile.quirion@savoirfairelinux.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

All the boards supported by the gpio-ts4900 driver are i.MX6 boards,
so only offer the driver for building on this platform, unless
build-testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-4.9-rc0.orig/drivers/gpio/Kconfig	2016-10-13 11:39:40.453107279 +0200
+++ linux-4.9-rc0/drivers/gpio/Kconfig	2016-10-14 14:12:02.568268351 +0200
@@ -802,6 +802,7 @@ config GPIO_TPIC2810
 
 config GPIO_TS4900
 	tristate "Technologic Systems FPGA I2C GPIO"
+	depends on SOC_IMX6 || COMPILE_TEST
 	select REGMAP_I2C
 	help
 	  Say yes here to enabled the GPIO driver for Technologic's FPGA core.


-- 
Jean Delvare
SUSE L3 Support
