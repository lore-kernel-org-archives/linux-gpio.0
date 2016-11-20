From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] gpio: zx: depend on ARCH_ZX
Date: Sun, 20 Nov 2016 17:44:48 +0000
Message-ID: <20161120174448.692-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36164 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752411AbcKTRow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Nov 2016 12:44:52 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so20620635wma.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Nov 2016 09:44:52 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>

Set GPIO_ZX to depend on ARCH_ZX as it's SOC specific.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

v1->v2:
        - Add COMPILE_TEST

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d011cb8..fa78a0b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -524,6 +524,7 @@ config GPIO_ZYNQ
 
 config GPIO_ZX
 	bool "ZTE ZX GPIO support"
+	depends on ARCH_ZX || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO device on ZTE ZX SoCs.
-- 
2.9.3

