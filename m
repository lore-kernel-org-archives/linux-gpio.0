From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 55/63] gpio: vx855: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:31 +0100
Message-ID: <1456492895-21835-16-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:63974 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754076AbcBZNVr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:47 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
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
index 4bfacf1d4137..db5e571c7fb9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -435,7 +435,7 @@ config GPIO_VR41XX
 
 config GPIO_VX855
 	tristate "VIA VX855/VX875 GPIO"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 	select MFD_CORE
 	select MFD_VX855
 	help
-- 
2.7.2

