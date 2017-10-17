From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Cut old SX150X Kconfig option
Date: Tue, 17 Oct 2017 11:28:21 +0200
Message-ID: <20171017092821.4440-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:51008 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753154AbdJQJ21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2017 05:28:27 -0400
Received: by mail-lf0-f53.google.com with SMTP id a132so1208454lfa.7
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2017 02:28:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The SX150X driver was moved over to pin control a while back.
The GPIO Kconfig symbol creates a circular dependency since
it requires GPIOLIB and the pin control driver selects GPIOLIB
so get rid of the old annoying Kconfig option.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3388d54ba114..e3f93d2d645b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -817,15 +817,6 @@ config GPIO_PCF857X
 	  This driver provides an in-kernel interface to those GPIOs using
 	  platform-neutral GPIO calls.
 
-config GPIO_SX150X
-	bool "Semtech SX150x I2C GPIO expander (deprecated)"
-	depends on PINCTRL && I2C=y
-	select PINCTRL_SX150X
-	default n
-	help
-	  Say yes here to provide support for Semtech SX150x-series I2C
-	  GPIO expanders. The GPIO driver was replaced by a Pinctrl version.
-
 config GPIO_TPIC2810
 	tristate "TPIC2810 8-Bit I2C GPO expander"
 	help
-- 
2.13.5

