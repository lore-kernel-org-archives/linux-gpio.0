From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 52/63] gpio: vx855: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:33 +0200
Message-ID: <1459877980-31872-13-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:57082 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759595AbcDERjw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:52 -0400
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
index 28fb53c544d3..799f46cb8b46 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -444,7 +444,7 @@ config GPIO_VR41XX
 
 config GPIO_VX855
 	tristate "VIA VX855/VX875 GPIO"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 	select MFD_CORE
 	select MFD_VX855
 	help
-- 
2.8.0

