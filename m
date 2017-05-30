From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: xra1403: select REGMAP_SPI
Date: Tue, 30 May 2017 13:13:17 +0200
Message-ID: <20170530111332.3829080-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:52866 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750905AbdE3LNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 07:13:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nandor Han <nandor.han@ge.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Without the regmap code, we get a link error:

drivers/gpio/built-in.o: In function `xra1403_probe':
(.text+0x132e0): undefined reference to `__devm_regmap_init_spi'

Fixes: 5704520d7880 ("gpio: xra1403: Add EXAR XRA1403 SPI GPIO expander driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 66d1f353ca73..238fc231081a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1241,6 +1241,7 @@ config GPIO_PISOSR
 
 config GPIO_XRA1403
 	tristate "EXAR XRA1403 16-bit GPIO expander"
+	select REGMAP_SPI
 	help
 	  GPIO driver for EXAR XRA1403 16-bit SPI-based GPIO expander.
 
-- 
2.9.0

