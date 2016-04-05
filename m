From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 34/63] gpio: timberdale: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:04 +0200
Message-ID: <1459877949-29889-15-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:57345 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759475AbcDERj3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:29 -0400
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
index c5e8016cd25e..327cc857f3ad 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -901,7 +901,7 @@ config GPIO_TC3589X
 
 config GPIO_TIMBERDALE
 	bool "Support for timberdale GPIO IP"
-	depends on MFD_TIMBERDALE
+	depends on MFD_TIMBERDALE || COMPILE_TEST
 	---help---
 	Add support for the GPIO IP in the timberdale FPGA.
 
-- 
2.8.0

