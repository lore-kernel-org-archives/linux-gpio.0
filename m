From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] gpio: zx: depend on ARCH_ZX
Date: Sun,  6 Nov 2016 18:29:31 +0000
Message-ID: <20161106182931.20381-1-pbrobinson@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33673 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750859AbcKFS3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2016 13:29:38 -0500
Received: by mail-wm0-f68.google.com with SMTP id u144so12809900wmu.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2016 10:29:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>

Set GPIO_ZX to depend on ARCH_ZX as it's SOC specific.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d011cb8..2c458c8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -524,6 +524,7 @@ config GPIO_ZYNQ
 
 config GPIO_ZX
 	bool "ZTE ZX GPIO support"
+	depends on ARCH_ZX
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO device on ZTE ZX SoCs.
-- 
2.9.3

