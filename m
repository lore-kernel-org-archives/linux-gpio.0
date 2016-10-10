From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: mockup: add sysfs dependency
Date: Mon, 10 Oct 2016 14:42:46 +0200
Message-ID: <20161010124259.1556137-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:54396 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751635AbcJJMnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 08:43:06 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Arnd Bergmann <arnd@arndb.de>, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Building the gpio-mockup driver without SYSFS results in a harmless Kconfig
warning:

warning: (GPIO_MOCKUP) selects GPIO_SYSFS which has unmet direct dependencies (GPIOLIB && SYSFS)

We can easily avoid that warning by adding a dependency on SYSFS.

Fixes: 0f98dd1b27d2 ("gpio/mockup: add virtual gpio device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 26ee00f6bd58..d011cb89d25e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -284,7 +284,7 @@ config GPIO_MM_LANTIQ
 
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
-	depends on GPIOLIB
+	depends on GPIOLIB && SYSFS
 	select GPIO_SYSFS
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
-- 
2.9.0

