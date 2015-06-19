From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] gpio: altera: kill bogus dependency on GPIO_GENERIC
Date: Fri, 19 Jun 2015 20:31:02 +0900
Message-ID: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:46927 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750983AbbFSLb1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2015 07:31:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

The driver gpio-altera.c does not depend on gpio-generic.c at all.
Drop unneeded "select GPIO_GENERIC".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index caefe80..25c232e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -113,7 +113,6 @@ config GPIO_74XX_MMIO
 config GPIO_ALTERA
 	tristate "Altera GPIO"
 	depends on OF_GPIO
-	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y or M here to build support for the Altera PIO device.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
