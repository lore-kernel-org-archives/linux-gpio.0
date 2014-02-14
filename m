From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH 2/2] gpio-ts5500: Add dependency
Date: Fri, 14 Feb 2014 11:32:14 +0100
Message-ID: <20140214113214.70ed0b65@endymion.delvare>
References: <20140214112824.27b98f1d@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52422 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751517AbaBNKcT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 14 Feb 2014 05:32:19 -0500
In-Reply-To: <20140214112824.27b98f1d@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>

There is no point in displaying the TS5500-specific driver entries if
TS5500 board support itself isn't enabled.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
Note: a similar patch was sent for the TS5500-specific MTD driver.

 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-3.14-rc2.orig/drivers/gpio/Kconfig	2014-02-14 11:21:15.116363700 +0100
+++ linux-3.14-rc2/drivers/gpio/Kconfig	2014-02-14 11:21:51.126174491 +0100
@@ -277,6 +277,7 @@ config GPIO_STA2X11
 
 config GPIO_TS5500
 	tristate "TS-5500 DIO blocks and compatibles"
+	depends on TS5500 || COMPILE_TEST
 	help
 	  This driver supports Digital I/O exposed by pin blocks found on some
 	  Technologic Systems platforms. It includes, but is not limited to, 3

-- 
Jean Delvare
Suse L3 Support
