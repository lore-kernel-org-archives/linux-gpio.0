From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: mb86s7x: Allow compile test build
Date: Thu, 25 Feb 2016 13:41:30 +0800
Message-ID: <1456378890.27479.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:34831 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070AbcBYFlh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 00:41:37 -0500
Received: by mail-pf0-f179.google.com with SMTP id c10so27463382pfc.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Feb 2016 21:41:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

There is no build dependency for this driver, so enable COMPILE_TEST to get
better build coverage.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9ee9fa7..1c31a14 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -266,7 +266,7 @@ config GPIO_LYNXPOINT
 
 config GPIO_MB86S7X
 	bool "GPIO support for Fujitsu MB86S7x Platforms"
-	depends on ARCH_MB86S7X
+	depends on ARCH_MB86S7X || COMPILE_TEST
 	help
 	  Say yes here to support the GPIO controller in Fujitsu MB86S70 SoCs.
 
-- 
2.1.4



