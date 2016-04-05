From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 44/63] gpio: wm8994: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:25 +0200
Message-ID: <1459877980-31872-5-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:54241 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759584AbcDERjr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:47 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
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
index ff4d3d40f60e..259592622dcb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -975,7 +975,7 @@ config GPIO_WM8350
 
 config GPIO_WM8994
 	tristate "WM8994 GPIOs"
-	depends on MFD_WM8994
+	depends on MFD_WM8994 || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of WM8994 audio hub
 	  CODECs from Wolfson Microelectronics.
-- 
2.8.0

