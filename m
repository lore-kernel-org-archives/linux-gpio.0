From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 10/63] gpio: mxc: Allow compile testing
Date: Fri, 26 Feb 2016 14:17:19 +0100
Message-ID: <1456492692-21592-11-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:62764 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751449AbcBZNSU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:20 -0500
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
index 60e18597cd43..0b46dc009a82 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -308,7 +308,7 @@ config GPIO_MVEBU
 
 config GPIO_MXC
 	def_bool y
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
-- 
2.7.2

