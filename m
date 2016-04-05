From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 28/63] gpio: jantz-ttl: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:58 +0200
Message-ID: <1459877949-29889-9-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:55652 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758906AbcDERj1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:27 -0400
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
index 36d64f87b3b1..c8fde6e7953e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -834,7 +834,7 @@ config GPIO_DLN2
 
 config GPIO_JANZ_TTL
 	tristate "Janz VMOD-TTL Digital IO Module"
-	depends on MFD_JANZ_CMODIO
+	depends on MFD_JANZ_CMODIO || COMPILE_TEST
 	help
 	  This enables support for the Janz VMOD-TTL Digital IO module.
 	  This driver provides support for driving the pins in output
-- 
2.8.0

