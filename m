From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 29/63] gpio: da9055: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:28 +0100
Message-ID: <1456492778-21711-10-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:59877 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754102AbcBZNTw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:52 -0500
In-Reply-To: <1456492778-21711-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Lower dependencies for compile testing.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 65a6ce68da8e..3a1bb26dcce8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -801,7 +801,7 @@ config GPIO_DA9052
 
 config GPIO_DA9055
 	tristate "Dialog Semiconductor DA9055 GPIO"
-	depends on MFD_DA9055
+	depends on MFD_DA9055 || COMPILE_TEST
 	help
 	  Say yes here to enable the GPIO driver for the DA9055 chip.
 
-- 
2.7.2

